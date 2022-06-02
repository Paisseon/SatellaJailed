#!/bin/sh

println() {
    printf '%s\n' "$*"
}

# Read arguments

while getopts ":v:i:o:" args; do
    case "${args}" in
        v)
            case "${OPTARG}" in
                12)
                    println "[*] Unzipping Orion 12-13 framework..."
                    unzip -o -qq "Orion_12-13.zip"
                    vers=12
                    ;;
                13)
                    println "[*] Unzipping Orion 12-13 framework..."
                    unzip -o -qq "Orion_12-13.zip"
                    vers=13
                    ;;
                14)
                    println "[*] Unzipping Orion 14-15 framework..."
                    unzip -o -qq "Orion_14-15.zip"
                    vers=14
                    ;;
                15)
                    println "[*] Unzipping Orion 14-15 framework..."
                    unzip -o -qq "Orion_14-15.zip"
                    vers=15
                    ;;
                *)
                    println "[*] Error: Version invalid. Valid versions are: 12, 13, 14, and 15."
                    exit
                    ;;
            esac
            ;;
        i)
            println "[*] Setting input file as ${OPTARG}"
            ipa="${OPTARG}"
            ;;
        o)
            println "[*] Setting output file as ${OPTARG}"
            output="${OPTARG}"
            ;;
        *)
            println "[*] Error: Invalid argument: ${OPTARG}. Satella Jailed patcher accepts only -v, -i, and -o arguments"
            exit
            ;;
    esac
done

# Ensure that -v is set

if test -z "$vers"; then
    println "[*] Error: iOS version is not set with argument flag -v"
    exit
fi

# Install dependencies if they don't exist already

println "[*] Checking dependencies..."

case "$OSTYPE" in
    darwin*)
        println "[*] OS detected as macOS"
        println "[*] Installing dependencies..."
        xcode-select --install
        println "[*] Finished installing dependencies"
        ;;
    linux-gnu*)
        println "[*] OS detected as Linux or WSL"
        
        if test $(/usr/bin/id -u) -ne 0; then
            println "[*] Error: Needs sudo to run properly on Linux"
            exit
        fi
        
        println "[*] Installing dependencies..."
        apt install jq git curl rsync xz-utils unzip zip libxml2 libc++abi-dev
        println "[*] Finished installing dependencies"
        ;;
    *)
        println "[*] Error: OS is unknown or unsupported"
        exit
        ;;
esac

# Install Azule if it doesn't exist already

if test ! -L "/usr/local/bin/azule"; then
    println "[*] Installing Azule..."
    
    git clone https://github.com/Al4ise/Azule ~/Azule
    sudo ln -sf ~/Azule/azule /usr/local/bin/azule
fi

# Check if an .ipa file exists in the directory above us

if test -z "$ipa"; then
    files="../*"
    
    for file in $files; do
        if test "${file: -4}" == ".ipa"; then
            ipa="$file"
        fi
    done
fi

# Check if an .ipa file exists in this directory

if test -z "$ipa"; then
    files="*"
    
    for file in $files; do
        if test "${file: -4}" == ".ipa"; then
            ipa="$file"
        fi
    done
fi

# Exit if the $ipa variable is not set

if test -z "$ipa"; then
    println "[*] Error: Couldn't find .ipa file"
    exit
fi

# Ensure that the $output variable is set

if test -z "$output"; then
    output="Output"
fi

# Do stuff in Azule

azule -n tmp -i "$ipa" -o ./ -f ./Orion.framework
azule -n "$output" -i ./tmp.ipa -o ./ -f ./Satella.dylib

# Remove the .ipa with only Orion

rm -rf tmp.ipa

# We are done!

println "[*] Done!"
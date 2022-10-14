#!/bin/sh
# Made by Paisseon and Sudo

println() {
    printf '%s\n' "$*"
}

# Read arguments. If you're not me, ignore the -x flag

while getopts ":v:i:o:x" args; do
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
        x)
            println "[*] Set to transfer file to device after patching"
            transfer=true
            ;;
        *)
            println "[*] Error: Invalid argument: ${OPTARG}. Satella Jailed patcher accepts only -v, -i, and -o arguments"
            exit
            ;;
    esac
done

# Ensure that $vers is set

if test -z "$vers"; then
    println "[*] Target iOS version is undefined; assuming iOS 15"
    println "[*] Unzipping Orion 14-15 framework..."
    unzip -o -qq "Orion_14-15.zip"
    vers=15
fi

# Install dependencies if they don't exist already

println "[*] Checking dependencies..."

case "$(uname -s)" in
    *Darwin*)
        if test ! -f /usr/lib/libsubstrate.dylib; then
            println "[*] OS detected as macOS"
            
            if type xcode-select >&- && xpath="$(xcode-select --print-path)" && test -d "$xpath" && test -x "$xpath"; then
                println "[*] Xcode CLI already installed"
            else
                println "[*] Installing dependencies..."
                xcode-select --install
            fi
        fi
        ;;
    *Linux*)
        println "[*] OS detected as Linux or WSL"
        
        if test "$(/usr/bin/id -u)" -ne 0; then
            println "[*] Error: Needs sudo to run properly on Linux"
            exit
        fi
        
        println "[*] Installing dependencies..."
        apt install jq git curl rsync xz-utils unzip zip libxml2 libc++abi-dev
        ;;
    *)
        println "[*] Error: OS detected as $(uname -s), which is not supported"
        exit
        ;;
esac

println "[*] Finished installing dependencies"

# Install Azule if it doesn't exist already

if test ! -L "/usr/local/bin/azule"; then
    println "[*] Please install Azule from https://github.com/Al4ise/Azule/wiki to continue"
    exit
fi

# Fix pathing issues (fuck me if this still crashes)

if test -f /usr/bin/install_name_tool; then
    println "[*] Redirecting root framework calls to sandbox..."

    install_name_tool -change /Library/Frameworks/CydiaSubstrate.framework/CydiaSubstrate @executable_path/Frameworks/CydiaSubstrate.framework/CydiaSubstrate Orion.framework/Orion 2>/dev/null
    install_name_tool -change /Library/Frameworks/CydiaSubstrate.framework/CydiaSubstrate @executable_path/Frameworks/CydiaSubstrate.framework/CydiaSubstrate Satella.dylib 2>/dev/null
    install_name_tool -change /Library/Frameworks/Orion.framework/Orion @executable_path/Frameworks/Orion.framework/Orion Satella.dylib 2>/dev/null
else
    println "[*] install_name_tool not found. If you experience crash on launch, use the manual patching method"
fi

# Check if an .ipa file exists nearby

if test -z "$ipa"; then
    files="../*"
    
    for file in $files; do
        if test "$(echo "$file" | sed 's/.ipa//')" != "$file" && test "$(echo "$file" | sed 's/_Patched.ipa//')" == "$file"; then
            ipa="$file"
        fi
    done

    files="*"
    
    for file in $files; do
        if test "$(echo "$file" | sed 's/.ipa//')" != "$file" && test "$(echo "$file" | sed 's/_Patched.ipa//')" == "$file"; then
            ipa="$file"
        fi
    done
fi

# Exit if the $ipa variable is not set

if test -z "$ipa"; then
    println "[*] Error: Couldn't find .ipa file"
    exit
fi

# Ensure that the $output variable is set and there are no spaces

if test -z "$output"; then
    output="$(echo "$ipa" | sed 's/\ /_/g' | sed 's/.ipa/_Patched/')"
fi

# Log for debug purposes

println "[*] Input: $ipa"
println "[*] Output: $output.ipa"

# Weakly inject Orion.framework, Satella.dylib, and Libhooker

azule -n "$output" -i "$ipa" -o ./ -f ./Orion.framework ./Satella.dylib -v -u -w

# Transfer to device if the -x flag is enabled

if test $transfer; then
    if test -f /usr/local/bin/xenon; then
        println "[*] Transferring to device"
        xenon "$output.ipa"
    else
        println "[*] Transfer not initiated as xenon doesn't exist"
    fi
fi

# Finish up

rm -rf Orion.framework
println "[*] Done!"

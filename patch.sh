#!/bin/sh
# Made by Paisseon and Sudo

println() {
    printf '%s\n' "$*"
}

# Read arguments. If you're not me, ignore the -x flag

while getopts ":v:i:o:xy" args; do
    case "${args}" in
        v)
            println "[*] The -v flag no longer does anything"
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
            println "[*] Set to transfer file to iPad after patching"
            transfer=true
            device=0
            ;;
        y)
            println "[*] Set to transfer file to iPhone after patching"
            transfer=true
            device=1
            ;;
        *)
            println "[*] Error: Invalid argument: ${OPTARG}. Satella Jailed patcher accepts only -i, and -o arguments"
            exit
            ;;
    esac
done

# Say to install Azule if it doesn't exist already

if [ ! -f "$(which azule)" ]; then
    println "[*] Please install Azule from https://github.com/Al4ise/Azule/wiki to continue"
    exit
fi

# Check if an .ipa file exists nearby

if [ -z "$ipa" ]; then
    files="../*"
    
    for file in $files; do
        if [ "$(echo "$file" | sed 's/.ipa//')" != "$file" ] && [ "$(echo "$file" | sed 's/_Patched.ipa//')" == "$file" ]; then
            ipa="$file"
        fi
    done

    files="*"
    
    for file in $files; do
        if [ "$(echo "$file" | sed 's/.ipa//')" != "$file" ] && [ "$(echo "$file" | sed 's/_Patched.ipa//')" == "$file" ]; then
            ipa="$file"
        fi
    done
fi

# Exit if the $ipa variable is not set

if [ -z "$ipa" ]; then
    println "[*] Error: Couldn't find .ipa file"
    exit
fi

# Ensure that the $output variable is set and there are no spaces

if [ -z "$output" ]; then
    output="$(echo "$ipa" | sed 's/\ /_/g' | sed 's/.ipa/_Patched/')"
fi

# Log for debug purposes

println "[*] Input: $ipa"
println "[*] Output: $output.ipa"

# Inject SatellaJailed to the app using Azule

azule -n "$output" -i "$ipa" -o ./ -f ./SatellaJailed.dylib -muvw

# Transfer to device if the -x flag is enabled

if [ $transfer ]; then
    if [ -f /usr/local/bin/xenon ]; then
        println "[*] Transferring to device"
        xenon "$output.ipa" "$device"
    else
        println "[*] Transfer not initiated as xenon doesn't exist"
    fi
fi

# Finish up

println "[*] Done!"

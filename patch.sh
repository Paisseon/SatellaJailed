#!/bin/sh
# Made by Paisseon and Sudo

# Fancy colors, courtesy of ja1dan

reset="\033[0m"
faint="\033[38;5;249m"
red="\033[38;5;196m"
black="\033[38;5;244m"
green="\033[38;5;46m"
yellow="\033[38;5;226m"

info="${black}${faint}[${reset}${green}*${reset}${black}${faint}]${reset}"
error="${black}${faint}[${reset}${red}!${reset}${black}${faint}]${reset}"
warn="${black}${faint}[${reset}${yellow}!${reset}${black}${faint}]${reset}"

# Read arguments. If you're not me, ignore the -x flag

while getopts ":v:i:o:x" args; do
    case "${args}" in
        v)
            echo "$warn The -v flag no longer does anything"
            ;;
        i)
            echo "$info Setting input file as ${OPTARG}"
            ipa="${OPTARG}"
            ;;
        o)
            echo "$info Setting output file as ${OPTARG}"
            output="${OPTARG}"
            ;;
        x)
            echo "$info Set to transfer file after patching"
            transfer=true
            device=0
            ;;
        *)
            echo "$error Invalid argument: ${OPTARG}. Satella Jailed patcher accepts only -i, and -o arguments"
            exit
            ;;
    esac
done

# Say to install Azule if it doesn't exist already

if [ ! -f "$(which azule)" ]; then
    echo "$error Please install Azule from https://github.com/Al4ise/Azule/wiki to continue"
    echo "$error If you already have Azule, try typing 'azule -h' and send me the output"
    exit
fi

# Check if an .ipa file exists nearby

if [ -z "$ipa" ]; then
    files="*"

    for file in $files; do
        if [ "${file#${file%????}}" = ".ipa" ]; then
            name="${file%????}"
            
            if [ "${name#${name%????????}}" != "_Patched" ]; then
                echo "$info Setting input file as $file"
                ipa="$file"
                break
            fi
        fi
    done
fi

# Exit if the $ipa variable is not set

if [ -z "$ipa" ]; then
    echo "$error Couldn't find .ipa file"
    exit
fi

# Ensure that the $output variable is set and there are no spaces

if [ -z "$output" ]; then
    output="$(echo "$ipa" | sed 's/\ /_/g' | sed 's/.ipa/_Patched/')"
    echo "$info Setting output file as $output.ipa"
fi

# Inject SatellaJailed to the app using Azule

azule -n "$output" -i "$ipa" -o ./ -f "$PWD/SatellaJailed.dylib" -muvwz | sed -u -r "s/(\[\*\])/$(echo $info)/g"

# Transfer to device if the -x flag is enabled

if [ "$transfer" ]; then
    if [ -f /usr/local/bin/xenon ]; then
        echo "$info Transferring to device"
        xenon "$output.ipa" "$device"
    else
        echo "$warn Transfer not initiated as xenon isn't installed"
    fi
fi

# Finish up

echo "$info Done!"

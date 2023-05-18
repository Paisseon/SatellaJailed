#!/bin/sh
# Made by Paisseon and Sudo

ipa=$1

# Check if an IPA file exists in the current directory

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
    echo "[!] Couldn't find IPA file"
    exit
fi

# Inject Satella Jailed to the app using Azula

if [ ! -z "$(which azula)"]; then
    azula_path="$(which azula)"
elif [ -f "$PWD/azula" ]; then
    azula_path="$PWD/azula"
else
    echo "[!] Couldn't find Azula binary"
    exit
fi

echo "Azula located at $azula_path"

"$azula_path" "$ipa" -d "$PWD/SatellaJailed.dylib" --ipa

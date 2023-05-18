# Satella Jailed
*Free in-app purchases for jailed devices on iOS 12-16*

Satella Jailed is provided for educational purposes only and I am not responsible for any illegal actions taken with the use of this tool. No copyright material is distributed on this repo. Lawyer with a DMCA can stick it up their ass.

# Installation
There are currently three official methods of installing Satella Jailed, but it should work with other patching tools.

## Script (Computer Required)
1. Run `git clone https://github.com/Paisseon/SatellaJailed.git && cd SatellaJailed` in terminal
2. Move the IPA file to the resultant SatellaJailed folder
3. `sh patch-mac.sh` for macOS *or* `sh patch-linux.sh` for Linux and WSL
4. Sideload the patched IPA to your jailed device

## Azula (Mac *or* On-Device)
If you use TrollStore, make sure that the URL scheme is enabled, and turn on code signature slicing. Or just jailbreak with Dopamine and use the tweak version 🙃

1. Download SatellaJailed.dylib from this repo
2. Move SatellaJailed.dylib and the target IPA to the Azula folder in files app
3. Select them in Azula
4. Tap the Patch button

## Esign (On-Device)
1. Download SatellaJailed.dylib from this repo
2. In Signature -\> More Settings, import SatellaJailed.dylib
3. Make sure to use “@executable\_path” and “Frameworks”
4. Sign and install the patched IPA

# Usage
Just attempt to make a purchase, then cancel the confirmation popup (the one with your Apple ID on it) so you don't pay.

By default, core functionality is enabled. If it doesn't work, and you are on iOS 15+, you can try enabling advanced features by tapping the purple star.

Please note that Satella Jailed doesn’t work on every app. If various combinations of settings fail to crack the purchase, you’re out of luck.
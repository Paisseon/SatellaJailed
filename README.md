# Satella Jailed
*Free in-app purchases for jailed devices on iOS 12-16*

Satella Jailed is provided for educational purposes only and I am not responsible for any illegal actions taken with the use of this tool. No copyright material is distributed on this repo. Lawyer with a DMCA can stick it up their ass.

# Installation
There are currently two official methods of installing Satella Jailed, but it should work with other methods just like any tweak.

## Azule Script (Computer or Jailbreak Required)
1. Get a *decrypted* .ipa for the app you want to modify
2. `git clone https://github.com/Paisseon/SatellaJailed.git && cd SatellaJailed`
3. Move the .ipa into the SatellaJailed folder
4. `sh patch.sh`
5. Sideload the patched app to your jailed device

## Esign (On-Device)
If you don’t already have it, Esign can be installed from [this website](https://esign.yyyue.xyz/)

1. Get a *decrypted* .ipa for the app you want to modify
2. Download SatellaJailed.dylib from this repo
3. In Signature -> More Settings, import SatellaJailed.dylib
4. In Signature -> More Settings, make sure to use “@executable\_path” and “Frameworks”
5. Sign and install the patched .ipa

## Other .ipa Patchers
I haven’t personally tested any other .ipa patcher, but they should work just as well as the two tested methods.

1. Get a *decrypted* .ipa for the app you want to modify
2. Download SatellaJailed.dylib from this repo
3. Inject SatellaJailed.dylib into the .ipa
4. Sideload the patched app to your jailed device

# Usage
Just attempt to make a purchase, then cancel the confirmation popup (the one with your Apple ID on it) so you don't pay.

By default, core functionality is enabled. If it doesn't work, and you are on iOS 14+, you can try enabling features such as receipt spoofer, observer, etc. by tapping the purple star. If the purple star doesn't show up, try tapping with 3 fingers. If that doesn't work, the app has a weird issue with UIWindow and idk how to fix those 🤷‍♀️

# Satella Jailed
*Free in-app purchases for jailed devices on iOS 12-16*

Satella Jailed is provided for educational purposes only and I am not responsible for any illegal actions taken with the use of this tool. No copyright material is distributed on this repo. Lawyer with a DMCA can stick it up their ass.

I am also not responsible for Satella Jailed not working on any given app. Try the app “Fight Club 5” before contacting me or making an issue. I also recommend trying several configurations.

Devices on a version earlier than iOS 14.0 will not have the floating preferences menu. If you are on 12-13 there is no reason to be using this as Satella works better for jailbroken devices.

# Installation
There are currently two official methods of installing Satella Jailed, but it should work with other methods just like any tweak.

## Azule Script (Computer or Jailbreak Required)
1. Get a *decrypted* .ipa for the app you want to modify
2. `git clone https://github.com/Paisseon/SatellaJailed.git && cd SatellaJailed`
3. Move the .ipa into the SatellaJailed folder
4. `sh patch.sh`
5. Sideload the patched app to your jailed device

## Esign (On-Device)
If you don’t already have it, Esign can be installed from [this website]

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


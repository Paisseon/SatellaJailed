# Satella Jailed
*Free in-app purchases for jailed devices on iOS 12-16*

Satella Jailed is provided for educational purposes only and I am not responsible for any illegal actions taken with the use of this tool. No copyright material is distributed on this repo. Lawyer with a DMCA can stick it up their ass.

I am also not responsible for Satella Jailed not working on any given app. Try the app “Fight Club 5” before contacting me or making an issue. I also recommend trying several configurations.

Devices on a version earlier than iOS 14.0 will not have the floating preferences menu. If you are on 12-13 there is no reason to be using this as Satella works better for jailbroken devices.

1. Obtain a **decrypted** .ipa of your target app
2. Clone this repo to your PC
3. Run the patch.sh script. Optional arguments are:
	- -v for version, i.e., 15
	- -i for input, i.e., App.ipa
	- -o for output, i.e., App\_Satella
4. Sideload the patched .ipa

## Azule Script (Computer or Jailbreak Required)
1. Get a *decrypted* .ipa for the app you want to modify
2. `git clone https://github.com/Paisseon/SatellaJailed.git && cd SatellaJailed`
3. Move the .ipa into the SatellaJailed folder
4. `sh patch.sh`
5. Sideload the patched app to your jailed device

1. Obtain a **decrypted** .ipa of your target app
2. Clone this repo to your PC
3. Extract the Orion zip for your iOS version
4. Inject Satella.dylib and Orion.framework into the target .ipa
5. Ensure that Orion.framework and CydiaSubstrate.framework are located in @executable\_path/Frameworks
6. Sideload the patched .ipa
## Esign (On-Device)
If you don’t already have it, Esign can be installed from [this website]

1. Get a *decrypted* .ipa for the app you want to modify
2. Download SatellaJailed.dylib from this repo
3. In Signature -> More Settings, import SatellaJailed.dylib
4. In Signature -> More Settings, make sure to use “@executable\_path” and “Frameworks”
5. Sign and install the patched .ipa

1. Obtain a **decrypted** .ipa of your target app
2. Download the .zip of this repo and open in E-Sign
3. Unzip your desired Orion\_\*.zip and CydiaSubstrate.zip
4. In Signature -\> More Settings, import Orion.framework, Satella.dylib, and CydiaSubstrate.framework
5. In Signature -\> More Settings, make sure it uses @executable\_path and Frameworks
6. Sign and install the patched .ipa

1. Get a *decrypted* .ipa for the app you want to modify
2. Download SatellaJailed.dylib from this repo
3. Inject SatellaJailed.dylib into the .ipa
4. Sideload the patched app to your jailed device

1. Link your device to [AppDB][2]
2. Enable the in-app purchase patch
3. Install an app that has in-app purchases

## AppDB Method (MyAppStore)
1. Obtain a **decrypted** .ipa of your target app
2. Upload the **decrypted** .ipa to https://appdb.to/my/store
3. Once the app is done uploading enable in-app purchase patch
4. Install the app that has in-app purchases

\#\# 

Now you can make fake purchases without a jailbreak! Just attempt to purchase something and cancel on the popup. 

You can also access Satella Jailed’s preferences through a floating button with the Satella logo. This only works on iOS 14-15.

The configurable options are:
- Enabled: Enable or disable all features of Satella Jailed.
- Receipt: Spoof receipts for purchases. This works well on iOS 12-13, not so much on 14-15.
- Observer: Replace the app’s transaction observer with a hacked one
- Hide Forever: Hide the Satella button until you delete/reinstall the app
- Apply: Gives options to hide the Satella logo, close the app (i.e., apply your changes), or view Satella Jailed’s source code.

[1]:	https://github.com/Paisseon/Satella2
[2]:	https://appdb.to/?ref=cb9904cc802fa5380a7aa4c35fe0d0c1

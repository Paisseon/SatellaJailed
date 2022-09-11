# Satella Jailed

For, um, educational purposes only or something. Definitely *don't* use this to pirate in-app purchases in apps to which you don't have legal rights to do security testing 🙃

A modern in-app purchase cracker built for sideloaded applications, especially on unjailbroken devices. If you want to crack in-app purchases on jailbroken devices, including for sideloaded apps, try [Satella 2][1]

## Script Method

1. Obtain a *decrypted* .ipa of your target app
2. Clone this repo to your PC
3. Run the patch.sh script. Optional arguments are:
	- -v for version, i.e., 15
	- -i for input, i.e., App.ipa
	- -o for output, i.e., App\_Satella
4. Sideload the patched .ipa

## Manual Method

1. Obtain a *decrypted* .ipa of your target app
2. Clone this repo to your PC
3. Extract the Orion zip for your iOS version
4. Inject Satella.dylib and Orion.framework into the target .ipa
5. Ensure that Orion.framework and CydiaSubstrate.framework are located in @executable\_path/Frameworks
6. Sideload the patched .ipa

## E-Sign Method

1. Obtain a *decrypted* .ipa of your target app
2. Download the .zip of this repo and open in E-Sign
3. Unzip your desired Orion\_\*.zip and CydiaSubstrate.zip
4. In Signature -\> More Settings, import Orion.framework, Satella.dylib, and CydiaSubstrate.framework
5. In Signature -\> More Settings, make sure it uses @executable\_path and Frameworks
6. Sign and install the patched .ipa

## AppDB Method

1. Link your device to [AppDB][2]
2. Enable the in-app purchase patch
3. Install an app that has in-app purchases

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

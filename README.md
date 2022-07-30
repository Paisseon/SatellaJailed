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
4. Move Emilia directory to Orion.framework
5. Inject Satella.dylib and Orion.framework into the target .ipa
6. Ensure that Orion.framework and CydiaSubstrate.framework are located in @executable\_path/Frameworks
7. Sideload the patched .ipa

## E-Sign Method

**If you are using the E-Sign method make sure the `Orion.framework` has the Emilia folder inside otherwise it will crash.** 

**The `Orion.framework` with the Emilia folder already applied can be downloaded [here](https://filecrypt.cc/Container/33A5857079.html) or download the `Orion.zip` with the Emilia name in this repo.**

1. Obtain a *decrypted* .ipa of your target app
2. Download the .zip of this repo and open in E-Sign
3. Unzip your desired Orion_\*.zip and CydiaSubstrate.zip
4. Move Emilia directory to Orion.framework
5. In Signature -\> More Settings, import Orion.framework, Satella.dylib, and CydiaSubstrate.framework
6. In Signature -\> More Settings, make sure it uses @executable_path and Frameworks
7. Sign and install the patched .ipa

## AppDB Method

1. Link your device to [AppDB][2] 
2. Enable the in-app purchase patch
3. Install an app that has in-app purchases

## 

Now you can make fake purchases without a jailbreak! Just attempt to purchase something and cancel on the popup. 

You can also access Satella Jailed’s preferences by long-pressing with two fingers inside an app if you are on iOS 13 or higher.

The configurable options are:
- Emilia chibi: SwiftUI is fun
- Little x in the corner: Close the preferences. You can also swipe down from the top
- Enabled: Just what it says on the tin :p
- Receipt: Spoof receipts for purchases. This works well on iOS 12-13, not so much on 14-15.
- Observer: Replace the app’s transaction observer with a hacked one. Fixes some apps, breaks others.
- RevenueCat: Hack apps using the RevenueCat framework for purchases and subscriptions.
- Touches: The number of fingers required to activate the preferences, per request. Default is two, maximum is five.
- Apply: Press this to apply whatever prefs changes you make. This closes the app— it’s intended behaviour, not a crash. Just open the app again.

[1]:	https://github.com/Paisseon/Satella2
[2]:	https://appdb.to/?ref=cb9904cc802fa5380a7aa4c35fe0d0c1

# Satella Jailed

## Note: This tweak is currently under development. It *should* be fixed eta son™️, but the version on the repo rn may or may not cause crashes.

For, um, educational purposes only or something. Definitely *don't* use this to pirate in-app purchases in apps to which you don't have legal rights.

A modern in-app purchase cracker built for sideloaded applications, especially on unjailbroken devices. If you want to crack in-app purchases on jailbroken devices, including for sideloaded apps, try [Satella 2][1]

## Script Method

1. Obtain a *decrypted* .ipa of your target app
2. Clone this repo to your PC
3. Run the patch.sh script. Optional arguments are  -v for version (e.g., 15), -i for input (e.g., Test.ipa),  and -o for output (e.g., TestPatched).
4. Sideload the patched .ipa

## Manual Method

1. Obtain a *decrypted* .ipa of your target app
2. Clone this repo to your PC
3. Extract the Orion zip for your iOS version
4. Redirect Satella.dylib’s import of `/Library/Frameworks/Orion.framework/Orion` to `@executable_path/Frameworks/Orion.framework/Orion`
5. Redirect Satella.dylib’s import of `/Library/Frameworks/CydiaSubstrate.framework/CydiaSubstrate ` to `@executable_path/Frameworks/CydiaSubstrate.framework/CydiaSubstrate `
6. Redirect Orion.framework/Orion’s import of `/Library/Frameworks/CydiaSubstrate.framework/CydiaSubstrate ` to `@executable_path/Frameworks/CydiaSubstrate.framework/CydiaSubstrate `
7. Inject Satella.dylib and Orion.framework into the target .ipa
8. Ensure that Orion.framework and CydiaSubstrate.framework are located in @executable\_path/Frameworks
9. Sideload the patched .ipa

## AppDB Method

1. Link your device to [AppDB][2] 
2. Enable the in-app purchase patch
3. Install an app that has in-app purchases

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
# Satella Jailed

For, um, educational purposes only or something. Definitely *don't* use this to pirate in-app purchases in apps to which you don't have legal rights.

A modern in-app purchase cracker built for sideloaded applications, especially on unjailbroken devices. If you want to crack in-app purchases on jailbroken devices, including for sideloaded apps, try [Satella 2][1]

## Manual Method

1. Obtain a *decrypted* .ipa of your target app
2. Clone this repo to your PC
3. Run the patch.sh script like so: `sh patch.sh -v 14`. Obviously change 14 to 12 if you use iOS 12, etc. Optional arguments are `-i` to manually set the .ipa to be patched (otherwise it will attempt to find the nearest) and `-o` to set the name of the output.
4. Sideload the patched .ipa

## AppDB Method

1. Link your device to [AppDB][2] 
2. Enable the in-app purchase patch
3. Install an app that has in-app purchases

Now you can make fake purchases without a jailbreak! Just attempt a purchase and cancel on the popup. You can also access Satella Jailed’s preferences by long-pressing with two fingers inside an app if you are on iOS 13 or higher.

[1]:	https://github.com/Paisseon/Satella2
[2]:	https://appdb.to/?ref=cb9904cc802fa5380a7aa4c35fe0d0c1

## Sideloadly method

1. Download the latest version of Sideloadly for Windows or MacOS from [here](https://sideloadly.io/#:~:text=download%20link.-,Download%20Sideloadly,-Windows%2064%2Dbit)
2. Download the decrypted IPA you want to add the SatellaJailed tweak from [here](https://armconverter.com/decryptedappstore/) **(to download from armconverter you need to have a iOSGods account, if you do not have a iOSGods account, you can download the IPA from appdb)**
3. Once you have the decrypted IPA you want to add SatellaJailed to, download SatellaJailed from the recent [releases](https://github.com/Aholicknight/SatellaJailed/releases/tag/Satellajailed-dylib) 
---
### Sideloadly: Windows 
1. Before starting, make sure you sign in with your AppleID, once you have signed into your AppleID, your connected iPhone will show up in the iDevice tab. Make sure you also have "Advanced options" enabled.
* ![sideloadly1](https://user-images.githubusercontent.com/7843719/173176702-17ef8679-e467-4bbe-8f5f-f7381a3ca7f2.png)
2. Drag and drop the IPA you downloaded from armconverter, appdb, or any other site. **make sure the IPA file ends in .ipa** 
* ![sideloadlyvideotut](https://user-images.githubusercontent.com/7843719/173177755-487eea8a-db93-418a-b21b-c93a5165c722.gif)
3. Checkmark "Inject dylibs/frameworks" at the bottom of "Advanced options". Once "inject dylibs/frameworks" is checkmarked, drag Satella-jailed.dylib into the white box. If you can't drag the file, you can also click the button "+dylib/deb" 
* ![sideloadly2](https://user-images.githubusercontent.com/7843719/173177914-a2da842a-9639-4a53-9380-20f9da5698d6.png)
4. Once you have the IPA you want to add satella-jailed + the tweak satella-jailed applied in "Inject dylibs/frameworks" press the start button on the bottom of sideloadly and wait for the install to complete. 
---
### Sideloadly: macOS
1. Basically the same steps as Windows, just in a macOS environment. 

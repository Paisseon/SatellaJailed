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
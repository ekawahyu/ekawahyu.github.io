---
layout: post
title:  Nu-Link Firmware Update under Virtualbox
author: eka
tags:
- Nuvoton
- Nu-Link
- Nano130
- Keil
- Virtualbox
- Mac OS X
---

I ran into a minor issue when trying to program NuTiny-EVB-Nano130 on Mac OS X. I don't use native Windows on my machine, so Virtualbox is the only way to run Keil on it. The very first time I plugged in NuTiny-EVB-Nano130 into the USB port, I could not plug the ICE debugger as Virtualbox's USB device. AppleUSBCDC seemed holding and enumerated the board on the host, so it was grayed out on guest OS. The solution was to put device filter on Virtualbox (details follow).

<img class="img-responsive" src="/images/nulink_virtualbox.jpg" />

<!--more-->

When USB devices are grayed out on Virtualbox, it means that it gets enumerated by the host OS. If you are keen with command line, you could see what driver is holding your USB device by typing <code>sudo dmesg</code> on terminal application. At this point, you could unload the driver with <code>kextunload</code> command.

But wait, there is a simpler solution than loading and unloading USB devices manually for Virtualbox. It is called USB Device Filtering! On Virtualbox Manager, choose your virtual machine and scroll down to USB Devices. Click to modify it and add any USB devices Virtualbox should take over whenever it gets plugged in. On my machine, Nu-Link-Me was called <code>USB2.0ICE USB ICE [0100]</code> (as seen in the picture). Voila! The next time I booted up my Windows, I got it recognized right away!

You might have asked why there are two USB ICE(s) seen in the picture while I have only one? What is Nuvoton WPM USB? Well, Keil IDE performes firmware update automatically the first time it detects an outdated one before flashing session begins. It was not easy to perform firmware update since it required frequent attach/detach. There was also a slight chance that I might have bricked my USB ICE. Anyway, here are steps I did for your reference:

1. Programming your newly bought NuTiny-EVB-Nano130 with Nu-Link-Me on it will pop up a firmware update dialog on Keil IDE. You may choose to do it or not. If you choose not to, the next time around the message will pop up again. So, the best decision is to do it once and no pop up message anymore until next firmware update available.

2. When you choose to update the firmware, Nu-Link-Me will reboot and enter into bootloading mode. On my machine it got enumerated as Nuvoton WPM USB by the host and was grayed out on the guest. My Keil IDE got stuck and I had to shutdown my virtual machine. So, shutdown your virtual machine when this happens to you.

3. Before firing up the virtual machine, add the Nuvoton WPM USB in the USB device filtering. Start the virtual machine and wait until you see the desktop. Repeat again point (1) above, but this time it should be able to continue with firmware update without any problem. But hold on, it gets stuck again, right? Your new <code>USB2.0ICE USB ICE [0100]</code> is grayed out. Once again, the new device gets enumerated by the host. Shutdown your virtual machine and add the new USB ICE under USB Device Filtering. That is why you see two USB ICE(s) in the picture.

4. Start your virtual machine and try to program the board. This time it should works just fine. The next time, when a new firmware update available, you need to keep adding new USB ICE into USB Device Filtering. You might want to remove the old ones from the list because they are not used anymore.

That's all folks. Hope this post useful for you all!

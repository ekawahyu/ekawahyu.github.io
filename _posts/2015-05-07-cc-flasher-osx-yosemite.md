---
layout: post
title:  Building cc_flasher on Mac OS X Yosemite
author: eka
tags:
- cc_flasher
- CC2430
- Macports
- Mac OS X
---

I have been working with TI CC2530 lately with Contiki OS. Since I don't work on Windows environment, [cc-tool](https://github.com/dashesy/cc-tool) is my tool to flash CC2530 binary. It should work for TI CC2430 as well, but for some reason it does not flash the chip properly. So, I remembered there was another open source tool I used to program CC2430 with. It was called [cc_flasher](http://sourceforge.net/projects/ccflasher/). Unfortunately, the project seems to be abandoned by now. I just wanted to share what I did to make it build on OS X Yosemite in [here](https://github.com/ekawahyu/cc_flasher).

<img class="img-responsive" src="/images/thumb_IMG_3665_1024.jpg" />

<!--more-->

The repository I have is a copy of the legacy cc_flasher software by Modula.d.o.o., a Slovenian company. It includes minor fixes to build on OS X (Yosemite) with macports. The original project seems to be abandoned because TI came out with a cheaper solution to flash its entire line of 802.15.4 SoC using [CC Debugger](http://www.ti.com/tool/cc-debugger).

TI provides only software support for Windows. The only hardware programmer available on that time was the SmartRF04EB. It was too expensive to buy for hobbyists, therefore cc_flasher project was born. It came with a USB dongle programmer as you can see in the picture.

The USB dongle schematic is available, but the source code for the chip (AT902313S) is not available as open source. This is very unfortunate since someone might learn the knowledge of programming CC2430 without having to go through building the firmware from scratch. Anyway, the CC2430 is not recommended for new product design by now. Releasing the firmware source code would not hurt anyone :P

Visit my [github](https://github.com/ekawahyu/cc_flasher) repository to learn more about it.

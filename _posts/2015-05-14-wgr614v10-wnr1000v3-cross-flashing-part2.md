---
layout: post
title:  WGR614v10 and WNR1000v3 Cross-Flashing Firmware Update - part 2
author: eka
tags:
- WGR614v10
- WNR1000v3
- Netgear
- Wifi Router
- OpenWrt
---

You might want to read [Part 1](/2015/05/14/wgr614v10-wnr1000v3-cross-flashing-part1.html) before continuing. If you reach this page, meaning that you don't have backdoor telnet available, or for some reason <code>telnetenable</code> doesn't work on your WGR614v10, or you want to experiment further with your router. There is possibility (not tested) that you can also flash WGR614v10 firmware onto WNR1000v3. You might be able to go back and forth between both firmware versions. Everything is possible, all you need to do is try!

<img class="img-responsive" src="/images/wgr614v10_wnr1000v3.jpg" />

<!--more-->

In [Cross-Flashing Part 1](/2015/05/14/wgr614v10-wnr1000v3-cross-flashing-part1.html), we tricked WGR614v10 to accept WNR1000v3 firmware update by burning WNR1000v3 board ID onto WGR614v10. Then, we can use the web interface to upgrade the firmware. This trick is trying to fool the firmware to see and validate the wrong hardware for the right firmware. Now, we could actually do the opposite. If we hack the firmware to include the right signature for the right hardware, then we could upgrade a wrong firmware onto the right hardware. To do this, we need to know the board ID.

Download latest firmware upgrades for WGR614v10 and WNR1000v3 from [Netgear Download Center](http://downloadcenter.netgear.com/). Open both *.chk file using a hex editor. Windows users can use [HexEdit](http://hexedit.com/), Linux and OS X users can use hexedit command line from macports or brew.

WGR614v10 - WGR614v10-V1.0.2.60_60.0.85NA.chk - U12H139T01_NETGEAR is the board ID.

<img class="img-responsive" src="/images/wgr614v10_board_id.jpg" />

WNR1000v3 - WNR1000v3-V1.0.2.68_60.0.93NA.chk - U12H139T00_NETGEAR is the board ID.

<img class="img-responsive" src="/images/wnr1000v3_board_id.jpg" />

Swap those board IDs and save the firmware as new files. Now the WGR614v10 firmware can be flashed onto WNR1000v3 device and vice versa.

<code>DO NOT UPDATE FIRMWARE OVER WIRELESS CONNECTION. DO IT THROUGH AN ETHERNET CABLE. DO IT AT YOUR OWN RISK! THERE IS NO WARRANTY THIS METHOD WILL WORK FOR YOU. YOU'VE BEEN WARNED!</code>

<code>PLEASE MAKE SURE YOU CHECK HARDWARE COMPATIBILITY BEFORE FLASHING ANY FIRMWARE. THE STEPS PROVIDED HERE MIGHT BRICK YOUR ROUTER AND VOID ANY WARRANTY FROM VENDORS. DO IT AT YOUR OWN RISK! THERE IS NO WARRANTY THIS METHOD WILL WORK FOR YOU. YOU'VE BEEN WARNED!</code>


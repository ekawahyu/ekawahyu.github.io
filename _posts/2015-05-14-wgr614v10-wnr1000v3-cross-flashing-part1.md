---
layout: post
title:  WGR614v10 and WNR1000v3 Cross-Flashing Firmware Update - part 1
author: eka
tags:
- WGR614v10
- WNR1000v3
- Netgear
- Wifi Router
- OpenWrt
---

Our SOHO DSL internet connection is pretty stable, PPPoE through Netgear WGR614v10, covering almost 200 square meters of the area with concrete walls. Everyone was happy, no connection dropping, until recently. I needed to share the internet connection over Wifi to another wireless router, but it didn't work no matter what. When I swapped both routers, it worked. But that is not the point. The point is, no matter what router installed as internet gateway, it should be able to share its internet connection. So I guess, it is time for this WGR614v10 to get a firmware upgrade.

<img class="img-responsive" src="/images/wgr614v10.jpg" />

I wanted to flash WGR614v10 with OpenWrt. Unfortunately, it is not yet supported, maybe next time. But I found an intriguing blog posts, [here](http://lukewarmlogic.blogspot.com/2010/06/hacking-wgr614.html) and [here](http://lukewarmlogic.blogspot.com/2010/06/hacking-wgr614v10-part-2.html), saying that WGR614v10 can be updated with WNR1000v3 firmware. Interesting! <!--more--> Both routers might have a similar configuration in order to make it work! Googling around for hardware comparison, it turned out that both routers look so identical. According to [Wikidev WGR614v10](https://wikidevi.com/wiki/Netgear_WGR614v10) and [Wikidev WNR1000v3](https://wikidevi.com/wiki/Netgear_WNR1000v3), both have the same type of Broadcom chip. So, why WGR614v10 was marketed as Wireless-G and the latter as Wireless-N? Below are pictures showing board layout of WGR614v10(left) and WNR1000v3(right). 

<img class="img-responsive" src="/images/teardown_wgr614v10_wnr1000v3.jpg" />

What is more interesting about old Netgear routers, is that there is an unprotected backdoor telnet console. But it needs to be activated, which is described [here](http://wiki.openwrt.org/toh/netgear/telnet.console) in detail. There are a lot of build platforms and versions for different Netgear routers, for mine I used this [telnetenable](https://github.com/davejagoda/NetgearTelnetEnable). We need telnet access to replace WGR614v10 board ID with the one of WNR1000v3. This is actually to fool WGR614v10 to think that it is WNR1000v3 to allow WNR1000v3 firmware upload. Below you may find commands over <code>telnet</code> to burn the board ID. Parameters for <code>telnetenable</code> is router's IP address, MAC address, username, and password. The <code>U12H139T00_NETGEAR</code> is WNR1000v3 board ID.

<pre><code>NetgearTelnetEnable nodino$./telnetenable 10.0.0.1 C03F0E56945C Gearguy Geardog

NetgearTelnetEnable nodino$ telnet 10.0.0.1
Trying 10.0.0.1...
Connected to 10.0.0.1.
Escape character is '^]'.

BusyBox v0.60.0 (2010.07.24-08:33+0000) Built-in shell (msh)
Enter 'help' for a list of built-in commands.

# burnboardid U12H139T00_NETGEAR
Board ID - U12H139T00_NETGEAR
BurnBoardId OK
# </code></pre>

Now that the hardware is faked to think that it is WNR1000v3, it is time to fire the web interface and update the firmware. <code>DO NOT UPDATE FIRMWARE OVER WIRELESS CONNECTION. DO IT THROUGH AN ETHERNET CABLE. DO IT AT YOUR OWN RISK! THERE IS NO WARRANTY THIS METHOD WILL WORK FOR YOU. YOU'VE BEEN WARNED!</code> Our Wifi router's address is <code>10.0.0.1</code>, yours might be different. Download WNR1000v3 firmware from [Netgear Download Center](http://downloadcenter.netgear.com/).

<img class="img-responsive" src="/images/wgr614v10_firmware_upload.jpg" />

<img class="img-responsive" src="/images/wgr614v10_router_upgrade.jpg" />

Don't turn off the device until the process is done. Don't interrupt the upgrade process or you might brick your device. After it is done, voila! The new look of your WGR614v10 is now WNR1000v3!

<img class="img-responsive" src="/images/wgr614v10_upgraded_to_wnr1000v3.jpg" />

Wait a minute! There is even more! It seems that there is a new firmware already from Netgear repository. Let's update it one more time. This the good thing of having WNR1003v3 firmware with longer support from Netgear. At least we need it until OpenWrt is fully supported on WGR614v10 or WNR1000v3.

<img class="img-responsive" src="/images/wnr1000v3_firmware_upgrade_available.jpg" />
<img class="img-responsive" src="/images/wnr1000v3_downloading_new_firmware.jpg" />
<img class="img-responsive" src="/images/wnr1000v3_upgrading_new_firmware.jpg" />
<img class="img-responsive" src="/images/wnr1000v3_rebooting.jpg" />

This is the final look of WNR1000v3 with nicer background and theme.

<img class="img-responsive" src="/images/wnr1000v3_latest_firmware.jpg" />

Is there another way to do it without backdoor telnet? Let's say you have already upgraded your WGR614v10 with the latest firmware from Netgear Download Center, the backdoor access might not be there anymore. Fortunately, there is another way! Follow [Cross-Flashing Part 2](/2015/05/14/wgr614v10-wnr1000v3-cross-flashing-part2.html) to see how.

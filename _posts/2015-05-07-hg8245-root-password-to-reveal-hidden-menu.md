---
layout: post
title:  HG8245 Root Password to Reveal Hidden Menu
author: eka
tags:
- HG8245
- Huawei
- ONT
- Wifi Router
---

I managed to hook a USB to serial cable to get access to HG8245's console from [this post](/2015/05/05/a-look-into-huawei-hg8245-ont.html). Then, I stumbled across a [blog post](http://www.cnblogs.com/craftor/archive/2012/10/25/2740130.html) explaining how to get root access. Surprisingly, this root access can be used to revealed a hidden menu within the web interface.

<!--more-->

This is how to get the telecomadmin's password:

<pre><code>WAP(Dopra Linux) # grep telecomadmin /mnt/jffs2/hw_ctree.xml
&lt;X_HW_WebUserInfoInstance InstanceID="2" UserName="telecomadmin" Password="telecomadmin35198845" UserLevel="0" Enable="1"/&gt;
WAP(Dopra Linux) # </code></pre>

This is how to get the useradmin's password:

<pre><code>WAP(Dopra Linux) # grep useradmin /mnt/jffs2/hw_ctree.xml
&lt;X_HW_WebUserInfoInstance InstanceID="1" UserName="useradmin" Password="ssn2q" UserLevel="1" Enable="1"/&gt;
WAP(Dopra Linux) # </code></pre>

When you login into the web interface using useradmin, this is what you get:

<img class="img-responsive" src="/images/hg8245_useradmin.jpg" />

But when you login into the web interface using telecomadmin, there is one additional menu showing up:

<img class="img-responsive" src="/images/hg8245_telecomadmin.jpg" />

What if we try to grep admin keyword? This is what you will get:

<pre><code>WAP(Dopra Linux) # grep admin /mnt/jffs2/hw_ctree.xml
&lt;X_HW_WebUserInfoInstance InstanceID="1" UserName="useradmin" Password="ssn2q" UserLevel="1" Enable="1"/&gt;
&lt;X_HW_WebUserInfoInstance InstanceID="2" UserName="telecomadmin" Password="nE7jA%5m" UserLevel="0" Enable="1"/&gt;
&lt;X_HW_ServiceManage FtpEnable="0" FtpUserName="root" FtpPassword="admin" FtpPort="21" FtpRoorDir="/mnt/usb1_1/" FtpUserNum="0"/&gt;
WAP(Dopra Linux) # </code></pre>

It turned out that this ONT has a built-in FTP server running, with default root directory at <code>/mnt/usb1_1</code>. If you hook up a USB storage on its USB port, this ONT can be used as a file server, that can be accessed from anywhere. Cool stuff! Why don't you copy <code>hw_ctree.xml</code> to a USB flash and analyze it further? I bet you would find a lot more hidden stuff in there. Let me know if you find anything interesting.
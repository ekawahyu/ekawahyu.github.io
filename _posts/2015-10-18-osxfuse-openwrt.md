---
layout: post
title:  Accessing OpenWRT Filesystem as a Remote Drive with OSXFUSE
author: eka
tags:
- OpenWRT
- OSXFuse
- Mac OS X
---

[OpenWRT](http://www.openwrt.org) is an open source wireless router software based-on Linux system. As with the rest of other Unix systems, it supports ext2/3/4 file system. Transferring files between different file system is not an issue as long as an SFTP server is installed on OpenWRT and SFTP client is installed on your desktop computer. However, recently, I found a better way to drag-n-drop or copy-n-paste files on the OpenWRT file system mounted as a remote drive on my Mac through OSXFUSE and SSHFS. Read on if you want to know how to do it. This guide should also work on any Linux/Unix other than OpenWRT.

<img class="img-responsive" src="/images/osxfuse-openwrt.jpg" />

<!--more-->
FUSE for OS X allows you to extend OS X's native file handling capabilities via third-party file systems. OSXFUSE is a successor to [MacFUSE](https://code.google.com/p/macfuse/), which has been used as a software building block by dozens of products, but is no longer being maintained. In more technical terms, OSXFUSE implements a mechanism that makes it possible to implement a fully functional file system in a user-space program on OS X. It provides multiple APIs, one of which is a superset of the FUSE API (file system in user space) that originated on Linux. Therefore, many existing FUSE file systems become readily usable on OS X. OSXFUSE can be downloaded from [here](http://sourceforge.net/projects/osxfuse/files/).

SSHFS (SSH Filesystem) is a filesystem client to mount and interact with directories and files located on a remote server or workstation over a normal ssh connection. The client interacts with the remote file system via the SSH File Transfer Protocol (SFTP), a network protocol providing file access, file transfer, and file management functionality over any reliable data stream that was designed as an extension of the Secure Shell protocol (SSH) version 2.0. You can download SSHFS for Mac OS X from [here](https://github.com/osxfuse/sshfs/releases). If you don't like to use Terminal to login to remote drives, you might also want to download the GUI from [here](https://code.google.com/p/sshfs-gui/) or [here](https://adamstech.wordpress.com/2014/05/10/how-to-mount-an-ssh-location-using-a-gui-on-mac-os-x-10-9/).

Alternatively, if you have Macports installed, you can do <code>sudo macport install osxfuse sshfs sshfs-gui</code>. This will install OSXFUSE and SSHFS version of Macports and also a simple GUI. To mount a remote drive, do these from Terminal app:
<pre><code>mkdir /path/to/mountpoint
sshfs username@server:/path/to/remote/location /path/to/mountpoint
</code></pre>

Mounting point can be anywhere, but I do love to follow the convention where every mounted drive on OS X stays under <code>/Volumes</code>. Everytime remote drive is ejected/unmounted, the mount point <code>/path/to/mountpoint</code> has to be recreated the next time you want to work with it. If you use sshfs-gui, it will help you create temporary mount point automatically. That's all folks. Hope this post useful for you all!

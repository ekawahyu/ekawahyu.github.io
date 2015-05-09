---
layout: post
title:  Enabling TFTP Server on Mac OS X Yosemite
author: eka
tags:
- TFTP Server
- Mac OS X
---
Based on article posted by mlc: [http://hints.macworld.com/article.php?story=20070218233806794](http://hints.macworld.com/article.php?story=20070218233806794)

Many network devices are able to upload and download firmware and configurations via the TFTP protocol. Intel based Mac OS X comes with tftpd preinstalled. On OS X Server, tftpd service is running, but on standard OS X, it is disabled by default. However, it can be activated. In order to activate a service, you have to be administrator with <code>sudo</code> privilege.

<!--more-->

Since Mac OS X Tiger, most services that were previously configured using xinetd have been migrated to launchd. The new launchd service consults the settings located in <code>/System/Library/LaunchDaemons</code> and <code>/Library/LaunchDaemons</code> directories. By default, Yosemite has tftp.plist installed, however, this should be modified to suit your needs.

First, back up the default tftp.plist as below:

<pre><code>cp /System/Library/LaunchDaemons/tftp.plist ~/Desktop/tftp.plist</code></pre>

The tftp.plist includes only one program argument: <code>-i</code>. This flag prohibits usage with realpath, which will translate relative links to a full path. I would recommend using this as well as the <code>-s</code> flag, which essentially chroots the environment. The entire contents of this modified file is as follows:

<pre><code>&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" 
        "http://www.apple.com/DTDs/PropertyList-1.0.dtd"&gt;
&lt;plist version="1.0"&gt;
&lt;dict&gt;
    &lt;key&gt;InitGroups&lt;/key&gt;
    &lt;true/&gt;
    &lt;key&gt;Label&lt;/key&gt;
    &lt;string&gt;com.apple.tftpd&lt;/string&gt;
    &lt;key&gt;ProgramArguments&lt;/key&gt;
    &lt;array&gt;
        &lt;string&gt;/usr/libexec/tftpd&lt;/string&gt;
        &lt;string&gt;-i&lt;/string&gt;
        &lt;string&gt;-s&lt;/string&gt;
        &lt;string&gt;/private/tftpboot&lt;/string&gt;
    &lt;/array&gt;
    &lt;key&gt;Sockets&lt;/key&gt;
    &lt;dict&gt;
        &lt;key&gt;Listeners&lt;/key&gt;
        &lt;dict&gt;
            &lt;key&gt;SockServiceName&lt;/key&gt;
            &lt;string&gt;tftp&lt;/string&gt;
            &lt;key&gt;SockType&lt;/key&gt;
            &lt;string&gt;dgram&lt;/string&gt;
        &lt;/dict&gt;
    &lt;/dict&gt;
    &lt;key&gt;inetdCompatibility&lt;/key&gt;
    &lt;dict&gt;
        &lt;key&gt;Wait&lt;/key&gt;
        &lt;true/&gt;
    &lt;/dict&gt;
&lt;/dict&gt;
&lt;/plist&gt;</code></pre>

You may also wish to add the <code>-l</code> flag in the <code>ProgramArguments</code> block to enable logging requests to syslog. Consult the <code>man tftpd</code> pages for additional arguments. In Yosemite, the <code>/private/tftpboot</code> directory already exists, so no other changes are necessary. The service may be started with the following command:

<pre><code>&#36; sudo launchctl load -w /System/Library/LaunchDaemons/tftp.plist</code></pre>

And stopped with:

<pre><code>sudo launchctl unload -w /System/Library/LaunchDaemons/tftp.plist</code></pre>

You may also wish to add the <code>-l</code> flag in the <code>ProgramArguments</code> block to enable logging requests to syslog. Consult the tftpd man pages for additional arguments.

The TFTP protocol allows any user to read and write to files on your system, so keep this in mind when choosing the storage directory. As a minimal security measure, the files must already exist before writing to them, and must have write access by all users. In general usage, I will store firmware upgrades with read-only access. When capturing someone's firmware configuration, I then perform the following:

<pre><code>$ cd /private/tftpboot
$ sudo touch test.txt
$ sudo chmod 666 test.txt</code></pre>

At this point, you're ready to start using the service to store configurations as needed. For testing, you can perform the following:

<pre><code>$ cd ~/Desktop
$ echo "THIS IS A TEST" > test.txt
$ tftp localhost</code></pre>

This will open a tftp connection and switch to an interactive tftp session. Now perform the following:

<pre><code>tftp>verbose
tftp>put test.txt
tftp>quit</code></pre>

If there are no errors returned, all is working correctly. If not, check your firewall settings to ensure that UDP port 69 is open. Other issues may be due to syntax errors in the tftp.plist file. Check also <code>/private/tftpboot/test.txt</code>, it should be overwritten by <code>THIS IS A TEST</code>.

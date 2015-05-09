---
layout: post
title:  A Look Into Huawei HG8245 ONT Wifi Router
author: eka
tags:
- HG8245
- Huawei
- ONT
- Wifi Router
- OpenWrt
---

I got an ONT router from China Telecom. It served well for SOHO internet connection back then in 2012. However, it has been collecting dust since I moved to a new place with no fiber optic internet. When things start to collect dust at one corner of my place, my curiosity quickly flies to pry it open and see if I could use it for something. At least I can see that it has one USB port on its side.

<!--more-->

<img class="img-responsive" src="/images/thumb_IMG_3657_1024.jpg" />

Prying it open was easy. Note also that there are hidden screws underneath those two rubber legs close to the front part. The device is Huawei HG8245 rebranded as China Telecom ONT.

<img class="img-responsive" src="/images/thumb_IMG_3660_1024.jpg" />

Two Atheros chips mounted on the board, AR9227 for the wireless 802.11b/g/n and AR8316 for wired WAN/LAN. Not sure what SD5113 is, most likely for the fiber optic interface?

<img class="img-responsive" src="/images/thumb_IMG_3640_1024.jpg" />

The top right unpopulated footprint, marked as J8, is probably a UART connection for console. Digging deeper into the web to see if someone posted anything similar and I found this: [http://linuxforum.ru/topic/34526](http://linuxforum.ru/topic/34526). It is in Russian, but you can use an online translator to read it. Headers J8 is a console at 115200 bps! We are in business!

<img class="img-responsive" src="/images/thumb_IMG_3641_1024.jpg" />

With a bit of soldering skill, I solder a single line headers, 5 pin, 2.54 mm pitch. Now J8 is accessible to external world. You could also solder some wires directly without headers onto the mainboard if you'd like.

<img class="img-responsive" src="/images/thumb_IMG_3664_1024.jpg" />

Any USB to serial converter should work just fine as long as it has 3.3V voltage level. On the PC side, picocom is the terminal being used to get the read out below.

<pre><code>U-Boot 1.1.4 (May  8 2012 - 20:01:15)

U-Boot code: 90500000 -> 9051E7AC  BSS: -> 90555094
RAM Configuration:
Bank #0: 90000000 64 MB
Flash: 16 MB
*** Warning - bad CRC, using default environment

In:    serial
Out:   serial
Err:   serial

Extend LSW IS AR8316
Initialize broadcast table ... ok
CPURTx Driver For Pilot <Board-A>!
### JFFS2 loading 'fsok' to 0x904bfe34
Scanning JFFS2 FS: . done.
### JFFS2 load complete: 2 bytes loaded to 0x904bfe34
No board type file!
ui_board_id = 1
[main.c__2900]::Magic1:0x5a5a5a5a, magic2 0x25a5a4a5, count 0, flag 0, MainAreaOK 0, slaveAreaOK 0
Start from normal system!
Magic1:0x5a5a5a5a, magic2 0xa5a5a5a5, count 0, flag 0
Addr[0]:0x0,Addr[1]:0x40000,Addr[2]:0x41000,Addr[3]:0x60000,Addr[4]:0x1e0000,Addr[5]:0xae0000,Addr[6]:0xe60000
Start copy data from 0x201e0054 to 0x91000000 with sizeof 0x0087c040 ....................Done!
Start system with ram disk and set bootcmd to 
BootArgs:noalign mem=50M console=ttyAMA0,115200 root=/dev/ram0 rootfstype=squashfs mtdparts=hisilicon:0x40000(boot)ro,0x1000(flashcfg)ro,0x1f000(syspara)ro,0x180000(krnl)ro,0x8fffac@0x1e0054(rootfs)ro,0x248fd8@0xc17028(minisystem)ro,0x180000(jffs2cfg),-(reserved) user_debug=0x1f panic=1
Press d key to abort autoboot: 10 
## Booting image at 20060054 ...
   Image Name:   Linux-2.6.21.7-hrt1
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    1484128 Bytes =  1.4 MB
   Load Address: 90008000
   Entry Point:  90008000
   Loading Kernel Image ... OK
## Loading Ramdisk Image at 91000000 ...
   Image Name:   squashfs
   Image Type:   ARM Linux RAMDisk Image (uncompressed)
   Data Size:    8896512 Bytes =  8.5 MB
   Load Address: 00000000
   Entry Point:  00000000

Starting kernel ...

Uncompressing Linux............................................................................................. done, booting the kernel.
Kernel Early-Debug on Level 0 
iotable information:
 virtual: 4093640704physical: 262144  length: 4096    type: 0
 virtual: 4145283072physical: 90432  length: 4096    type: 0
 virtual: 4145295360physical: 90435  length: 4096    type: 0
 virtual: 4145340416physical: 90446  length: 4096    type: 0
 virtual: 4145344512physical: 90447  length: 4096    type: 0
 virtual: 4093706240physical: 262160  length: 4096    type: 0
 virtual: 4093771776physical: 262176  length: 4096    type: 0
 virtual: 4145307648physical: 90438  length: 32768    type: 0
 virtual: 4145287168physical: 90433  length: 4096    type: 0
 virtual: 4145348608physical: 90448  length: 4096    type: 0
 virtual: 4076863488physical: 196608  length: 4096    type: 0
 virtual: 4145291264physical: 90434  length: 4096    type: 0
 virtual: 4145299456physical: 90436  length: 4096    type: 0
 virtual: 4145303552physical: 90437  length: 4096    type: 0
hisilicon_map_io	281	[arch/arm/mach-sd5113_v100_p01/core.c]
hisilicon_init_irq	108	[arch/arm/mach-sd5113_v100_p01/core.c]
hisilicon_timer_init	228	[arch/arm/mach-sd5113_v100_p01/systimer.c]
hi_kernel_wdt_init	216	[arch/arm/mach-sd5113_v100_p01/hi_drv_wdt.c]
hisilicon_init_machine	175	[arch/arm/mach-sd5113_v100_p01/core.c]
hi_kernel_pci_preinit	390	[arch/arm/mach-sd5113_v100_p01/hi_pci.c]
pci clock is on!
hi_kernel_pci_postinit	488	[arch/arm/mach-sd5113_v100_p01/hi_pci.c]
hi_kernel_pci_postinit on!
hi_kernel_pci_map_irq	367	[arch/arm/mach-sd5113_v100_p01/hi_pci.c]
Linux version 2.6.21.7-hrt1 (lulong@suse-ssmp-server) (gcc version 4.1.2 (Wind River Linux Sourcery G++ 4.1-84)) #4 Sat Apr 14 16:36:05 HKT 2012
CPU: ARMv6-compatible processor [410fb767] revision 7 (ARMv6TEJ), cr=00c5387f
Machine: SD5113-V100-PILOT-B01
Memory policy: ECC disabled, Data cache writeback
Get mem size 0x3200000;
CPU0: D VIPT write-back cache
CPU0: I cache: 16384 bytes, associativity 4, 32 byte lines, 128 sets
CPU0: D cache: 16384 bytes, associativity 4, 32 byte lines, 128 sets
Built 1 zonelists.  Total pages: 12700
Kernel command line: noalign mem=50M console=ttyAMA0,115200 root=/dev/ram0 rootfstype=squashfs mtdparts=hisilicon:0x40000(boot)ro,0x1000(flashcfg)ro,0x1f000(syspara)ro,0x180000(krnl)ro,0x8fffac@0x1e0054(rootfs)ro,0x248fd8@0xc17028(minisystem)ro,0x180000(jffs2cfg),-(reserved) user_debug=0x1f panic=1
PID hash table entries: 256 (order: 8, 1024 bytes)
Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)
Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
Memory: 50MB = 50MB total
Memory: 38912KB available (2676K code, 233K data, 108K init)
Security Framework v1.0.0 initialized
Capability LSM initialized
Mount-cache hash table entries: 512
CPU: Testing write buffer coherency: ok
NET: Registered protocol family 16
Hisilicon clock system V0.01
[clk_register, 244]	AHBCLK
[clk_register, 244]	ARMCORECLK
[clk_register, 244]	UARTCLK
PCI: device 0000:00:03.0 has unknown header type 1c, ignoring.
PCI: device 0000:00:04.0 has unknown header type 1c, ignoring.
PCI: device 0000:00:05.0 has unknown header type 1c, ignoring.
PCI: device 0000:00:06.0 has unknown header type 1c, ignoring.
PCI: device 0000:00:07.0 has unknown header type 1c, ignoring.
PCI: device 0000:00:08.0 has unknown header type 1c, ignoring.
PCI: device 0000:00:09.0 has unknown header type 1c, ignoring.
PCI: device 0000:00:0a.0 has unknown header type 1c, ignoring.
PCI: device 0000:00:0b.0 has unknown header type 1c, ignoring.
PCI: device 0000:00:0c.0 has unknown header type 1c, ignoring.
PCI: device 0000:00:0d.0 has unknown header type 1c, ignoring.
PCI: device 0000:00:0e.0 has unknown header type 1c, ignoring.
PCI: device 0000:00:0f.0 has unknown header type 1c, ignoring.
PCI: device 0000:00:10.0 has unknown header type 1c, ignoring.
PCI: device 0000:00:11.0 has unknown header type 1c, ignoring.
PCI: device 0000:00:12.0 has unknown header type 1c, ignoring.
PCI: device 0000:00:13.0 has unknown header type 1c, ignoring.
PCI: device 0000:00:14.0 has unknown header type 1c, ignoring.
PCI: device 0000:00:15.0 has unknown header type 1c, ignoring.
PCI: device 0000:00:16.0 has unknown header type 1c, ignoring.
PCI: device 0000:00:17.0 has unknown header type 1c, ignoring.
PCI: device 0000:00:18.0 has unknown header type 1c, ignoring.
PCI: device 0000:00:19.0 has unknown header type 1c, ignoring.
PCI: device 0000:00:1a.0 has unknown header type 1c, ignoring.
PCI: device 0000:00:1b.0 has unknown header type 1c, ignoring.
PCI: device 0000:00:1c.0 has unknown header type 1c, ignoring.
PCI: device 0000:00:1d.0 has unknown header type 1c, ignoring.
PCI: device 0000:00:1e.0 has unknown header type 1c, ignoring.
PCI: device 0000:00:1f.0 has unknown header type 1c, ignoring.
PCI: bus0: Fast back to back transfers enabled
istatus and imask 16777216 
istatus and imask 0 
map irq: slot 0, pin 1, devslot 2, irq: 21
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
NET: Registered protocol family 2
IP route cache hash table entries: 1024 (order: 0, 4096 bytes)
TCP established hash table entries: 2048 (order: 2, 16384 bytes)
TCP bind hash table entries: 2048 (order: 1, 8192 bytes)
TCP: Hash tables configured (established 2048 bind 2048)
TCP reno registered
checking if image is initramfs...it isn't (bad gzip magic numbers); looks like an initrd
Freeing initrd memory: 8688K
Registering GDB sysrq handler
squashfs: version 3.4 (2008/08/26) Phillip Lougher
squashfs: LZMA suppport for slax.org by jro
JFFS2 version 2.2. (NAND) (C) 2001-2006 Red Hat, Inc.
io scheduler noop registered
io scheduler anticipatory registered
io scheduler deadline registered
io scheduler cfq registered (default)
Serial: dw  uart driver
dev:f2: ttyAMA0 at MMIO map 0x1614f000 mem 0xf714f000 (irq = 17) is a AMBA/DW
dev:f1: ttyAMA1 at MMIO map 0x1614e000 mem 0xf714e000 (irq = 16) is a AMBA/DW
RAMDISK driver initialized: 4 RAM disks of 23000K size 1024 blocksize
PPP generic driver version 2.4.2
PPP Deflate Compression module registered
PPP BSD Compression module registered
PPP MPPE Compression module registered
NET: Registered protocol family 24
SLIP: version 0.8.4-NET3.019-NEWTTY (dynamic channels, max=256) (6 bit encapsulation enabled).
CSLIP: code copyright 1989 Regents of the University of California.
SLIP linefill/keepalive option.
netconsole: not configured, aborting
Start to set chip MaxBufWriteSize.
!Not find NUMONYX JS28F128M29EWHA chip.
hisilicon: Found 1 x16 devices at 0x0 in 16-bit bank
 Amd/Fujitsu Extended Query Table at 0x0040
hisilicon: CFI does not contain boot bank location. Assuming top.
number of CFI chips: 1
cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
Hisilicon flash: registering whole flash at once as master MTD
8 cmdlinepart partitions found on MTD device hisilicon
Creating 8 MTD partitions on "hisilicon":
0x00000000-0x00040000 : "boot"
0x00040000-0x00041000 : "flashcfg"
0x00041000-0x00060000 : "syspara"
0x00060000-0x001e0000 : "krnl"
0x001e0054-0x00ae0000 : "rootfs"
0x00c17028-0x00e60000 : "minisystem"
0x00e60000-0x00fe0000 : "jffs2cfg"
0x00fe0000-0x01000000 : "reserved"
usb clock is on!
h2v100-ehci h2v100-ehci.0: h2v100-ehci
h2v100-ehci h2v100-ehci.0: new USB bus registered, assigned bus number 1
h2v100-ehci h2v100-ehci.0: irq 23, io mem 0x40010000
h2v100-ehci h2v100-ehci.0: USB 0.0 started, EHCI 1.00, driver 10 Dec 2004
usb usb1: configuration #1 chosen from 1 choice
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 2 ports detected
h2v100-ohci h2v100-ohci.0: h2v100-ohci
h2v100-ohci h2v100-ohci.0: new USB bus registered, assigned bus number 2
h2v100-ohci h2v100-ohci.0: irq 24, io mem 0x40020000
usb usb2: configuration #1 chosen from 1 choice
hub 2-0:1.0: USB hub found
hub 2-0:1.0: 2 ports detected
Netfilter messages via NETLINK v0.30.
ip_tables: (C) 2000-2006 Netfilter Core Team
arp_tables: (C) 2002 David S. Miller
TCP cubic registered
NET: Registered protocol family 1
NET: Registered protocol family 17
ieee80211: 802.11 data/management/control stack, git-1.1.13
ieee80211: Copyright (C) 2004-2005 Intel Corporation <jketreno@linux.intel.com>
RAMDISK: squashfs filesystem found at block 0, block number 8687 
RAMDISK: Loading 8687KiB [1 disk] into ram disk... done.
VFS: Mounted root (squashfs filesystem) readonly.
Freeing init memory: 108K

			-=#  DOPRA LINUX 1.0  #=-
			-=#  EchoLife WAP 0.1  #=-
			-=#  Huawei Technologies Co., Ltd #=-

mount file system
Loading the kernel modules: 
Loading module: nf_conntrack

  nf_conntrack_init new nf_conntrack version 0.5.0 (400 buckets, 3200 max)
Loading module: nf_conntrack_ftp
Loading module: nf_conntrack_tftp
Loading module: nf_nat
Loading module: nf_nat_ftp
Loading module: nf_nat_tftp
Making device instances:
Setting console log message level: 
Setting hostname: 
Settingup the sysctl configurations:
Setting up interface lo: 
Running local startup scripts.

*******************************************
--==      Welcome To EchoLife WAP      ==--
--==   Huawei Technologies Co., Ltd.   ==--
*******************************************
WAP Ver:V100R003C00SPC108B183
WAP Timestamp:2012/05/17 21:12:38
*******************************************

Start lunch kmsgread ... 
Set kmsgread process pid to:196;
Pid of kmsgrread is: 196
Rootfs time stamp:2012-05-17_21:18:23
Mount the JFFS2 file system: 
<5>SCSI subsystem initialized
Initializing USB Mass Storage driver...
usbcore: registered new interface driver usb-storage
USB Mass Storage support registered.
fuse init (API version 7.8)
User init start......
Loading the SD5113V100 modules: 
ETH install success!
request_irq hi_dp!!!!

 SD511X  DP  V1.0 is installed !

 SD511x IOCTL_DP  V1.0 is installed 

 SD511x MDIO ID V1.0 is installed 

 SD511x GPIO VERSION 1.0 is installed

 SD511x GPIO_INT ID 1.0 is installed 

 SD511x I2C ID V1.0 is installed 

 SD511x TIMER ID V1.0 is installed 

 SD511X SPI ID v1.0 is installed 

 SD511X  SYSCTL  V1.0 is installed 

 SD511x UART ID V1.0 is installed 

 SD5113 DMA ID V1.0 is installed 
<6>
 SD511X HW  ID v1.0 is installed 

 SD511x EXT_INT ID 1.0 is installed 

 SD511x IOCTL_SYSCTL  V1.0 is installed 
ifconfig eth0 hw ether 08:19:A6:4F:25:AD
<6>device eth0 entered promiscuous mode
br0: port 1(eth0) entering learning state
Loading the EchoLife WAP modules: LDSP
SSP For LDSP Install Successfully...
HLP For LDSP Install Successfully...
CHIPADP-PHY For LDSP Install Successfully...
Get version through hardware!
CHIPADP-SD5113 For LDSP Install Successfully...
GPIO For LDSP Install Successfully...
HIGHWAY For LDSP Install Successfully...
I2C For LDSP Install Successfully...
MDIO For LDSP Install Successfully...
CHIPADP-AR8316 LSW For LDSP Install Successfully...
SPI For LDSP Install Successfully...
UART For LDSP Install Successfully...
BATTERY For LDSP Install Successfully...
PLOAM For LDSP Install Successfully...
GMAC For LDSP Install Successfully...
KEY For LDSP Install Successfully...
LSW For LDSP Install Successfully...
LED For LDSP Install Successfully...
OPTIC For LDSP Install Successfully...
RF For LDSP Install Successfully...
le88226 For LDSP install successfully...
DEV For LDSP Install Successfully...
USB For LDSP Install Successfully...
HW_KER_BBSP_COMMON_HLE_SET_DEBUG_E:13Common HLP For BBSP Install Successfully...
topo For BBSP Install Successfully...
FLOW For BBSP Install Successfully...
VETH For LDSP Install Successfully...
hw_pkt_tunnel Install Successfully...
WIFI For BBSP Install Successfully...
Dosflt For BBSP Install Successfully...
EMAC For LDSP Install Successfully...
MPCP For LDSP Install Successfully...
Loading DSP temporary modules: 
linux kernel dopra is installed!

 dsp sdk  insmod success!
DSP For LDSP Install Successfully...
Loading the EchoLife WAP modules: BBSP
ipv6 Install Successfully...
hw_acl init success
hw_acl_cmd_init OK!
hw_dhcp Install Successfully...
napt register conntrack_handler
NAPT For BBSP Install Successfully...
hw_igmp_kernel Install Successfully...

_init_session SUCCESS
table_size =3040 hash_size = 380
ffwd register conntrack_handler
hw_ker_ffwd_core  install
hw_ker_ffwd_ipv4  install
CODEC For LDSP Install Successfully...
hw_ringchk_kernel Install Successfully...
hw_ethoam_kernel Install Successfully...
hw_pppoe Install Successfully...
Portal For BBSP Install Successfully...

 install success
mfw Install Successfully...
hw_bind_init...
KARP Install Successfully...
ssmp bbsp vspa igmp amp apm clid&
Start start pid=518; uiProcNum=7;
Start ldsp_user...0

<LDSP>Ldsp cfg start at 12, Line: 804  
HW_LdspCfg_XponProc uiPonAbility = 2
<LDSP>HW_LdspCfg_XponProc start from epon, uiUpMode=2.
<LDSP cfg>Set uiUpMode=2.
<LDSP>Hardware board id is 1 !
<LDSP>Hardware pcb id is 2 !
SD5113 test self OK
Lsw test self OK
Optic vendor_pn LTB34D3-CC+    
Optic input vendor_pn LTB34D3-CC+
Optic calMode 0
 EPON opened success ! 
usb1 gpio clock open

<LDSP>Ldsp cfg  end at 13, Line: 848  
HW_LdspUser_XponProc uiPonAbility = 2
<LDSP>HW_LdspUser_XponProc start from epon, uiUpMode=2.
<LDSP User>Set uiUpMode=2.
<LDSP>HW_LdspUser_NetLink_Init initial success.
<LDSP>HW_LdspUser_InitNetlink initial success.
hw_quickcfg_resume.c <74>     uiRet=0x00000000 arg=0x00000000

 system not enable the restore flag!
Start VSPA ...InitFrame get next state igmp; PID=540; state=0; Sec=14;
InitFrame get next state igmp; PID=540; state=0; Sec=14;
InitFrame get next state ssmp; PID=537; state=0; Sec=15;
InitFrame get next state ssmp; PID=537; state=0; Sec=15;
InitFrame get next state amp; PID=539; state=0; Sec=15;
InitFrame get next state amp; PID=539; state=0; Sec=15;
HW_DIA_InitHmem success;
HW_Shell_InitFuncReg.uiReturn=0x00000000;
InitFrame get next state clid; PID=554; state=0; Sec=15;
InitFrame get next state clid; PID=554; state=0; Sec=15;
  PID  Uid     VmSize Stat Command
InitFrame get next state apm; PID=553; state=0; Sec=15;
InitFrame get next state apm; PID=553; state=0; Sec=15;
HW_DIA_InitHmem success;
HW_DIA_InitHmem success;
HW_Shell_InitFuncReg.uiReturn=0x00000000;

[HMEM]Start Times uiStartNum = 0x1.

[HMEM]HMEM initial success.

 HW_XML_DBMain HW_XML_DBConfFileInit OK 
InitFrame get next state bbsp; PID=538; state=0; Sec=15;
HW_DIA_InitHmem success;
HW_Shell_InitFuncReg.uiReturn=0x00000000;
HW_DIA_InitHmem success;
HW_Shell_InitFuncReg.uiReturn=0x00000000;
    1 root        608 S   init       
    2 root            SWN [ksoftirqd/0]
    3 root            SW  [watchdog/0]
    4 root            SW< [events/0]
    5 root            SW< [khelper]
    6 root            SW< [kthread]
   30 root            SW< [kblockd/0]
   33 root            SW< [khubd]
   47 root            SW  [pdflush]
   48 root            SW  [pdflush]
   49 root            SW< [kswapd0]
   50 root            SW< [aio/0]
   65 root            SW  [mtdblockd]
  113 root        256 S   init       
  114 root        572 S   /bin/sh /etc/rc.d/rc.sysinit 
  191 root            DW< [wap_lastword]
  192 root            DW< [wap_ktrace]
  196 root        580 S   kmsgread 
  203 root        600 S   /bin/sh /etc/rc.d/rc.start/1.sdk_init.sh start 
  218 root            SWN [jffs2_gcd_mtd7]
VSPA pri from 0 to 10
InitFrame get next state vspa_h248; PID=548; state=0; Sec=15;
InitFrame get next state vspa_h248; PID=548; state=0; Sec=15;
HW_Shell_InitFuncReg.uiReturn=0x00000000;
WAP Loaded Custom Configuration <Msg>: 0x00000000;
ProcMax=30          ModuleMax=20      
GroupMax=2          TraceMax=8       
StatMax=16          MqLenMax=4096    
uiMqNumMax=1024             
InitFrame get next state bbsp; PID=538; state=0; Sec=15;
HW_DIA_InitHmem success;
HW_Shell_InitFuncReg.uiReturn=0x00000000;
  456 root            SW  [mpcp]
  465 root            SW< [kTimerTask]
  490 root            SW  [cpucar]
  518 root        628 S   start ssmp bbsp vspa igmp amp apm clid 
  534 root        848 S   hw_ldsp_user 
  537 root       1356 R   ssmp 
  538 root       1332 R   bbsp 
  539 root        972 R   amp 
  540 root       1124 R   igmp 
  543 root        560 S   /bin/sh /bin/watchproc.sh vspa_h248 
  548 root       1244 R N vspa_h248 
  549 root        380 S   sleep 60 
  551 root        824 S   smp_usb 
  553 root        872 R N apm 
  554 root        792 R   clid 
  555 root        240 S   /bin/sh /etc/rc.d/rc.start/1.sdk_init.sh start 
  556 root        380 S   sleep 30 
  557 root        240 S   /bin/sh /etc/rc.d/rc.start/1.sdk_init.sh start 
  558 root        380 S   sleep 30 
  559 root        240 S   /bin/sh /etc/rc.d/rc.start/1.sdk_init.sh start 
  560 root        380 S   sleep 40 
  561 root        604 R   ps 
HW_DIA_InitHmem success;
HW_Shell_InitFuncReg.uiReturn=0x00000000;


BusyBox v1.4.1 (2011-07-29 10:25:20 HKT) Built-in shell (ash)
Enter 'help' for a list of built-in commands.

Read line cwmp cwmp 1
;
Load auto start conig:0 cwmp cwmp 1
Read line ethoam ethoam 1
;
Load auto start conig:1 ethoam ethoam 1
WAP Loaded Custom Configuration <Db>: 0x00000000;
uiEnable=1            MsgWaitTime=10000   
WAP(Dopra Linux) #
</code></pre>

As you can see, even though the web-based interface is in Mandarin (mine is), the console output is in English :P I am looking forward to see if I could change the firmware to OpenWrt. Or, at least to change the default language to English. Stay tuned...
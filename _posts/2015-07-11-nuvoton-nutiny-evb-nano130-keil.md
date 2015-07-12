---
layout: post
title:  Nuvoton NuTiny-EVB-Nano130 Keil Setup
author: eka
tags:
- Nuvoton
- Nano130
- Keil
---

I just got a Nuvoton [NuTiny-EVB-Nano130](http://www.nuvoton.com/hq/products/microcontrollers/arm-cortex-m0-mcus/nano130-advanced-series) powered by the ARM Cortex-M0 core runs up to 42 MHz. The Nano130 series on-board (NANO130KE3BN) integrates LCD Controller 4x40 & 6x38 COM/SEG, USB 2.0 FS, Real Time Counter (RTC) , 12-bit SAR ADC, 12-bit DAC, UART, SPI, I²C, I²S, PWM/Capture, ISO-7816-3, Watchdog Timer, Brown-out Detector, and fast wake-up via many interfaces, and supports 96-bit Unique ID and 128-bit Unique Customer ID. I wanted to get my hands on it quickly, so I decided to try it with Keil <code>LCD_Demo</code> project example.

<img class="img-responsive" src="/images/nutiny_sdk_nano130.jpg" />

<!--more-->

The Keil setup was pretty straightforward. Download the [NuTiny-SDK-Nano130_User_Manual](http://www.nuvoton.com/opencms/resource-download.jsp?tp_GUID=UG0120121031133423) from Nuvoton's website. I am providing you with list of things, with links, to download:

1. NuTiny-EVB-Nano130 includes on-board programmer/debugger. It is called Nu-Link-Me. Download [Nu-Link_Keil_Driver](http://www.nuvoton.com/hq/products/microcontrollers/arm-cortex-m0-mcus/nano130-advanced-series/Software) driver from [http://www.nuvoton.com/hq/products/microcontrollers/arm-cortex-m0-mcus/nano130-advanced-series/Software](http://www.nuvoton.com/hq/products/microcontrollers/arm-cortex-m0-mcus/nano130-advanced-series/Software)

2. The <code>LCD_Demo</code> example is in [Nano100BSeriesBSP](http://www.nuvoton.com/hq/products/microcontrollers/arm-cortex-m0-mcus/nano130-advanced-series/Software). Download it from [http://www.nuvoton.com/hq/products/microcontrollers/arm-cortex-m0-mcus/nano130-advanced-series/Software](http://www.nuvoton.com/hq/products/microcontrollers/arm-cortex-m0-mcus/nano130-advanced-series/Software)

Once you installed Nu-Link Keil Driver, plug in the USB port, and Windows will do the rest of driver installation. If you get a warning saying that the driver is not signed or certified, just go ahead installing it. I have not seen any issue so far on my setup.

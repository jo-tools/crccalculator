# CRCCalculator
**Cyclic Redundancy Check: CRC8, CRC16, CRC32**  
Xojo example project

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

## Description
This example Xojo project shows how CRC Calculations can be implemented in pure Xojo Code.
Because CRC classes are not available in the Xojo Framework, one has to either use a 3rd Party Plugin - or calculate the Algorithm(s) manually.

### Cyclic Redundancy Check Algorithm
This example is based on this documentation: [Understanding CRC](http://www.sunshine2k.de/articles/coding/crc/understanding_crc.html).  
That article is also included as a [PDF](./docs/crc/Understanding_CRC.pdf).

### ScreenShots
Built Desktop application running on macOS:  
![ScreenShot: CRC16CalculatorDesktop](screenshots/CRC16Calculator.png?raw=true)

Built Desktop application running on Windows:  
![ScreenShot: CRC16CalculatorDesktop](screenshots/CRC32Calculator.png?raw=true)

Built Web application running on macOS:  
![ScreenShot: CRC16CalculatorWeb](screenshots/CRCCalculatorWeb.png?raw=true)

## Xojo
### Requirements
[Xojo](https://www.xojo.com/) is a rapid application development for Desktop, Web, Mobile & Raspberry Pi.  

The Desktop application Xojo example project `CRCCalculatorDesktop.xojo_project` and the Web application Xojo example project `CRCCalculatorWeb.xojo_project` are using:
- Xojo 2024r4.2
- API 2

### How to use in your own Xojo project?
1. Copy/paste the required CRC Calculator Classes into your project
2. Create an instance of the Class
   - by using a predefined Algorithm: `CRC16Calculator.CreateByType(CRC16Type.MODBUS)`
   - or create a custom Calculator: `New CRC16Calculator("CRC-16/GENIBUS", &h1021, &hffff, false, false, &hffff)`
3. Get the result: `myCRCCalculatorInstance.Result("1234567890")`

### Xojo Web App 2 Docker
<a name="xojo2docker"></a>
This repository contains [Documentation](docs/xojo2docker/Xojo2Docker.pdf) about [how to package a Xojo built Web Application in a Docker Image](docs/xojo2docker/Xojo2Docker.pdf). The Web application Xojo example project `CRCCalculatorWeb.xojo_project` includes a Post Build Script which automates the task of building the Docker Image of the web application.

## About
Juerg Otter is a long term user of Xojo and working for [CM Informatik AG](https://cmiag.ch/). Their Application [CMI LehrerOffice](https://cmi-bildung.ch/) is a Xojo Design Award Winner 2018. In his leisure time Juerg provides some [bits and pieces for Xojo Developers](https://www.jo-tools.ch/).

### Contact
[![E-Mail](https://img.shields.io/static/v1?style=social&label=E-Mail&message=xojo@jo-tools.ch)](mailto:xojo@jo-tools.ch)
&emsp;&emsp;
[![Follow on Facebook](https://img.shields.io/static/v1?style=social&logo=facebook&label=Facebook&message=juerg.otter)](https://www.facebook.com/juerg.otter)
&emsp;&emsp;
[![Follow on Twitter](https://img.shields.io/twitter/follow/juergotter?style=social)](https://twitter.com/juergotter)

### Donation
Do you like this project? Does it help you? Has it saved you time and money?  
You're welcome - it's free... If you want to say thanks I'd appreciate a [message](mailto:xojo@jo-tools.ch) or a small [donation via PayPal](https://paypal.me/jotools).  

[![PayPal Dontation to jotools](https://img.shields.io/static/v1?style=social&logo=paypal&label=PayPal&message=jotools)](https://paypal.me/jotools)

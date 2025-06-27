# <img src="https://github.com/esternin/boss/blob/main/logo.png" alt="[boss logo]" width="64" height="64"> Brock Optical Spectroscopy Software 

A typical optical spectrometer consists of both mechanical and optical parts that are quite robust.  It is not unusual to find multi-decade-old spectrometers still in daily use. The one component that ages and usually causes the spectrometer to be replaced is the detector, as the light sensor technology has been developing at great speed ever since the high-resolution digital cameras came into being in the 1990s, and it shows no sign of slowing down.

This project is dedicated to creating a reasonably universal software that allows one to upgrade the older spectrometer by mating it with a new high-resolution digital detector. Not a "webcam"-level detector (for those simple spectrometers a basic web-cam spectroscopy interface is available at https://www.physics.brocku.ca/Labs/WebCamSpectroscopy/, but a high-end astrophotography cameras which offer high quantum efficiency of the sensors and typically have built-in Peltier cooling of the sensor backing, to reduce the dark currents and their associated image noise.

This software is being tested on two such cameras from ZWO (https://zwoastro.com):
  - ZWO ASI294MM Pro, and
  - ZWO ASI2600MM Pro

The Pro designation indicates built-in active cooling, and MM type employs monochrome sensors of the highest sensitivity and dynamic range (the corresponding type MC cameras are the colour versions of the same, and typically have lower dynamic range but three colour channels).

**boss** software is written in tcl/tk which makes it completely platform independent, but it only gets tested under Linux (xubuntu/Debian are the primary distributions in use). For fast i/o and large image processing, critical parts are written in C using **critcl** (https://andreas-kupries.github.io/critcl/), and a pre-compiled low-level C library provided by the manufacturer ZWO (https://www.zwoastro.com/software/).

In simple spectrometers the slit sizes and grating angles are controlled by hand. More sophisticated devices may have GPIB or serial-line controls. Since the protocols vary, each spectrometer may need to be treated differently.  For GPIB-controlled devices, **linux-gpib** (https://github.com/coolshou/linux-gpib or https://gpib-tcl.sourceforge.net/GPIB-Tcl.html) is used to provide the kernel modules (it is rumoured to be included in the mainline Linux kernel soon) and **tcl-gpib** (https://github.com/slazav/tcl-gpib) which provides a tcl/tk interface to that library.

To install all prerequisite pieces on a typical (x)ubuntu/debian installation, try:
```
  sudo apt-get build-essential tcl-dev tk-dev blt-dev critcl bwidget tklib libtk-img
  sudo install -m 644 99-zwo.rules /etc/udev/rules
```
and be sure to download and untar into `/opt/ASI_linux_mac_SDK_V1.37` (or similar, but then adjust the pointers in the main file) the libraries provided by ZWO.

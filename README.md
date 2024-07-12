# MING stack for Seeed Studio ReComputer R1000 

This is a reference architecture to run on your Seeed Studio ReComputer R1000 based on Raspberry Pi CM4 with the MING stack on balena. 

## Disclaimer

This project is for educational purposes only. Do not deploy it into your premises without understanding what you are doing. USE THE SOFTWARE AT YOUR OWN RISK. THE AUTHORS AND ALL AFFILIATES ASSUME NO RESPONSIBILITY FOR YOUR SECURITY.

We strongly recommend you to have some coding and networking knowledge. Do not hesitate to read the source code and understand the mechanism of this project or contact the authors.


## Deploy the code

Running this project is as simple as deploying it to a balenaCloud application. You can do it in just one click by using the button below:

[![](https://www.balena.io/deploy.png)](https://dashboard.balena-cloud.com/deploy?repoUrl=https://github.com/mpous/seeed-recomputer-r100x)

Follow instructions, click Add a Device and flash an SD card with that OS image dowloaded from balenaCloud. Enjoy the magic 🌟Over-The-Air🌟!


## Add a device

Once the release is successfully built on your fleet in balenaCloud, click `Add device`.

And select the device type `Raspberry Pi 4 (using 64bit OS)` balenaOS version. Add the Wi-Fi credentials if needed, and click `Flash` or `Download` the balenaOS image.

Use balenaEtcher to flash the SD card with the balenaOS image.


### Add the custom dtbo 

Download the `dtbo` overlay file on your computer.

Once the device is flashed, connect the device in boot mode to your computer to add an extra `dtbo` file into the `overlays` folder of the balenaOS. The unit is called `resin-boot`.

![Add dtbo in the overlay filesystem](https://github.com/user-attachments/assets/91d7a038-4211-4432-a818-f93c4b9f9f71)

Once the file is properly saved on the device, disconnect the device, change the boot mode and power it up.


### Configure the DT Overlay

Define the DT Overlays to enable all the I/O capabilities of the reComputer R1000.

* Edit the `Define DT overlays` field and introduce these device tree overlays: `"dwc2,dr_mode=host","vc4-kms-v3d","audremap,pins_18_19","i2c1,pins_44_45","i2c3,pins_2_3","i2c6,pins_22_23","reComputer-R100x,uart2"`.

* Edit the `Define DT parameters for the default overlay` with: `"spi=on","i2c_arm=on"`.


If you are running a fleet of devices, you should do this from the Fleet level in the Fleet `Configuration` section. Then all the devices from your fleet will inherit the DT overlays and parameters.


# Umblamp
A 3D printable, Umbraco infused, WiFi enabled smart light powered by [WLED](https://kno.wled.ge/) and compatible with [Home Assistant](https://www.home-assistant.io/)

<img src="images/umblamp.jpg" alt="Picture of a fully constructed Umblamp" width="600" />

### Components

To build the Umblamp, you'll need access to a 3D printer, soldering iron and the following components:

- [Black PLA Filament](https://amzn.to/3CTo54W) (for the base) - [[US](https://amzn.to/3CTo54W)] [[UK](https://amzn.to/3w7fCXX)]
- [White PLA Filament](https://amzn.to/3GKObIz) (for the reflector and lense) - [[US](https://amzn.to/3GKObIz)] [[UK](https://amzn.to/3XBNVSM)]
- WS2812B LED Strip, 60 LEDs per meter, just under 2m worth but usually sold in spools of 5m - [[US](https://amzn.to/3XwWnCT)] [[UK](https://amzn.to/3QKIzm6)]
- ESP8266 NodeMCU D1 Mini Module (or similar clone or other WLED compatible device) - [[US](https://amzn.to/3koQwS0)] [[UK](https://amzn.to/3kmp473)]
- USB lead (Micro or Type-C depending on the model of D1 Mini you have purchased, usually Micro-USB) [[US](https://amzn.to/3CTpqsl)] [[UK](https://amzn.to/3XxulY2)]

If you are looking for recommended links to buy these somewhere locally then please see [Purchasing Links](#purchasing-links) below.

Assuming you already have the PLA filament and a spare USB lead, the construction cost for the electrical components works out at <$20 per lamp.

### Instructions

The lamp itself consists of 3 printable parts, printed in regular PLA on a printer with greater than a 210mmx210mm print bed (the popular [Ender 3](https://amzn.to/3CRwSUQ) or [Prusa i3](https://amzn.to/3ZxlHdI) should both work, this was tested with an [Bambu Lab X1 Carbon(https://uk.store.bambulab.com/products/x1-carbon-3d-printer)

All models are designed to be printed without supports.

The 3 components are:
- [Black base](models/umbraco_lamp_base.stl)
- [White reflector](models/umbraco_lamp_reflector.stl)
- [White lense](models/umbraco_lamp_lense.stl)

When constructed they snap-fit together, with the reflector sandwiched between the base and the lense:

When you have printed your parts you can begin contruction.

<img src="images/components.jpg" alt="Component parts for the Umblamp build" width="600">

#### Step 1 - Install WLED

First, you'll want to flash your D1 Mini device with [WLED](https://kno.wled.ge/) and then configure it to connect to your WiFi network. the [WLED project](https://kno.wled.ge/) is an open source firmware for many embedded devices that allow you to create beautiful LED displays and network them together. There are controller apps for iOS and Android and it is also fully compatible with the popular [Home Assistant](https://www.home-assistant.io/) software meaning that once built you can control your lamp from anywhere and build any number of automations so that it flashes when someone stars your GitHub repo, changes color when your build breaks or switches on and off with your office lights. 

Note that for large LED displays you can need significant power, you'll also likely want a controller that has a level shifter to send a reliable 5v signal for data to your LED strip. However as we're only powering 100 or so LEDs you can get away with pulling the power and data directly from the pins of an inexpensive D1 Mini.

The quickest and easiest way to install WLED on your D1 Mini is to plug it into the USB socket on your computer and then visit the [WLED web installer site](https://install.wled.me/).

- [https://install.wled.me/](https://install.wled.me/)

Flash the device with the latest build of WLED, configure the device to connect to your WiFi network and then you are ready to go.

#### Step 2 - Stick the LED Strip to the White Inner

The White Inner component acts as the guide for the flexible LED strip as well as the diffuser for the lights which are stuck to the side. You only need the +5v, G and Data pins so snip off any additional power lines that might come with your strip or solder on new wires to the strip if yours didn't come with pre-soldered wires.  Remove the plastic from the adhesive backing and start sticking at the top middle, looping around the outside to the bottom, then up and around the 'U' and finally back down and around around the other outer wall. Cut at the marked lines when you are finally done. 

<img src="images/led_strip_install.jpg" alt="Path of the LED strip" width="600">

When finished you should have around 100 LEDs in your lamp, but it's worth counting at this point as you'll need the exact number later.

#### Step 3 - Solder LED Strip to D1 Mini
Rather than use plugs, I solder my strip directly to my D1 Mini, but you can use connectors if you wish.  Connect the +5v and G lines to the corresponding pins on the D1 Mini and the data line to D4 (just above the +5v and G pins).

<img src="images/IMG_9125.jpg" alt="The wires from the LED strip soldered to the D1 Mini" width="600">

#### Step 4 - Add the Reflector
Next, feed the D1 Mini through the hole in the reflector.

#### Step 5 - Assemble
Next up, feed your USB lead through the back of the black outer body and seat in the channel to the top and connect it to your D1 Mini.  Place the D1 Mini in the small inlaid portion in the center of the lamp. Then drop in the reflector and finally place the white lense onto it, and snap fit into the black outer body. This should force the white reflector down which then also secures the electronics in place.  Power up your device and at this point about half of your LEDs should be glowing orange.

#### Step 6 - Connect to WLED and configure display
All the rest of the configuration is configuring WLED for your device.  Connect using the IP address from installation time, then go to Config, LED Preferences and update the Length of the LED strip to be the number of LEDs you installed in Step 2 (for me that's typically between 99 - 105).  When you press Save the rest of your LEDs should be glowing orange.

You can now configure your light display with the amazing flexibility of WLED. Once you have your favorite setting, store it as a preset and then go back to the LED Preferences and scroll down to Defaults where you can set which preset it displayed when the lamp is powered on (i.e. Preset 1 instead of the default orange in Preset 0)

#### Step 7 - Share your makes!
That's it!  You are now done but I'd love to see pictures of your built and assembled lamps.  Feel free to share pictures of them on Mastodon and tag me on them [matt@umbracocommunity.social](https://umbracocommunity.social]/@matt).

### Notes

The copyright for the Umbraco logo belongs to Umbraco A/S. For acceptable use of that logo see the [Umbraco logo usage guidelines](https://umbraco.com/about-us/press/).

### Purchasing Links
The fun part of this project is making it yourself, the lamp isn't officially sold pre-assembled (and the license is non-commercial use only so they shouldn't be doing that).  But if you want to buy the components to make this them then the following components have been used and recommended by community members. Note some of these links make use of affiliate programs but they should always be linking to components the community trust.

#### United States
- [Black PLA Filament](https://amzn.to/3CTo54W) (for the base)
- [White PLA Filament](https://amzn.to/3GKObIz) (for the inner body and reflector)
- [WS2812B LED Strip, 60 LEDs per meter](https://amzn.to/3XwWnCT), just under 2m worth but usually sold in spools of 5m 
- [ESP8266 NodeMCU D1 Mini Module](https://amzn.to/3koQwS0) (or similar clone or other WLED compatible device)
- [Ender 3](https://amzn.to/3YjmLkD) S1 3D Printer

#### United Kingdom
- [Black PLA Filament](https://amzn.to/3w7fCXX) (for the base)
- [White PLA Filament](https://amzn.to/3XBNVSM) (for the inner body and reflector)
- [WS2812B LED Strip, 60 LEDs per meter](https://amzn.to/3QKIzm6), just under 2m worth but usually sold in spools of 5m 
- [ESP8266 NodeMCU D1 Mini Module](https://amzn.to/3kmp473) (or similar clone or other WLED compatible device)
- [Ender 3](https://amzn.to/3xcwoW9) S1 3D Printer

#### Singapore
- [WS2812B LED Strip, 60 LEDs per meter](https://s.lazada.sg/s.0zKLk), just under 2m worth but usually sold in spools of 5m 
- [ESP8266 NodeMCU D1 Mini Module](https://shp.ee/9gxtxxn) (or similar clone or other WLED compatible device)

#### Australia
- [WS2812B LED Strip, 60 LEDs per meter](https://www.jaycar.com.au/duinotech-arduino-compatible-w2812b-rgb-led-strip-2m/p/XC4390?pos=4&queryId=b30e6ae5bc3d42e01187110f655e4608) contains 2m, with 120 LEDs with connectors installed at ends and wires with connector for soldering to board
- [ESP8266 Wi-Fi D1 Mini Module](https://www.jaycar.com.au/duinotech-wi-fi-mini-esp8266-main-board/p/XC3802) or similar clone or other WLED compatible device. Note: This option has pre-installed IO header strips so some desoldering may be required


### Credits

This built, and most of the instruction above are based on the [Ocotolamp 3D printable smart lamp by Martin Woodward](https://github.com/martinwoodward/octolamp). A hat tip to Martin for his work on the Octolamp project that made creating an Umblamp so much easier to do.

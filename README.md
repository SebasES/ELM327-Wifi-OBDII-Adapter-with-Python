# ELM327-Wifi-OBDII-Excel-Logger-with-Python 2.7

This a first draft of a ELM327 Wifi OBDII Logger which logs into excel.

The communication to the device is established with Sockets.

## Getting Started

1.You need a Wifi ELM327 Adapter. (can be found cheap online)
2.Connect to its Wifi and run ELM327.py
3.If it doesnt connect check ports & IP of the Dongle via putty and change them in the script.
(Mine has:host = '192.168.0.10' # needs to be in quote
port = 35000)



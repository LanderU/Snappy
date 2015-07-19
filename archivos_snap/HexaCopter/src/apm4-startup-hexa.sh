#!/bin/bash

#This script is launched automatically in Erle-Brain
#on every boot and loads the Hexa version of the autopilot
#
# Victor Mayoral Vilches - Erle Robotics [victor@erlerobot.com]

APM_BIN_DIR="/apps/erle-hexa/current/src"
Flag="-l /home/ubuntu/APM/logs -t /home/ubuntu/APM/terrain/"
date
while :; do
	# Start Hexa, modify if other vehicle is needed
	#./ArduHexaCopter.elf -A /dev/ttyUSB0 -B /dev/ttyO5 -C udp:10.0.0.2:7000 $Flag
	#./ArduHexaCopter.elf -A udp:192.168.7.1:6000 -B /dev/ttyO5 $Flag
	#./ArduHexaCopter.elf -A udp:10.0.0.2:7000 -B /dev/ttyO5 $Flag
	#./ArduHexaCopter.elf -A udp:10.0.0.2:7000 -B /dev/ttyO5 $Flag
	#./ArduHexaCopter.elf -A udp:10.0.0.2:7000 -B /dev/ttyO5 -C /dev/ttyO4 $Flag
        #./ArduHexaCopter.elf -A /dev/ttyO0 -B /dev/ttyO5 $Flag
	#./ArduHexaCopter.elf -A tcp:*:6000:wait -B /dev/ttyO5 $Flag
	#./ArduHexaCopter.elf -B /dev/ttyO5 $Flag
	#./ArduHexaCopter.elf -A udp:10.0.0.2:7000 -B /dev/ttyO5 -C udp:127.0.0.1:6001 $Flag
	#./ArduHexaCopter.elf -A udp:10.0.0.2:7000 -B /dev/ttyO5 -C udp:127.0.0.1:6001 $Flag

	# Hexa with WiFi and GPS
	#$APM_BIN_DIR/ArduHexaCopter.elf -A udp:10.0.0.2:7000 -B /dev/ttyO5 $Flag 

	# Hexa with WiFi, GPS and mavros
	#  apparently, launching mavros this way causes trouble with the autopilot and only one of the channels
	#  gets the information. Use gcs_bridge in mavros instead, or review the code of the autopilot
	$APM_BIN_DIR/ArduHexaCopter.elf -A udp:10.0.0.2:7000 -B /dev/ttyO5 -C udp:127.0.0.1:6001 $Flag

done >> /home/ubuntu/log/hexa.log 2>&1



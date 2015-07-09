#!/bin/bash

#This script is launched automatically in Erle-Brain
#on every boot and loads the copter version of the autopilot
#
# Victor Mayoral Vilches - Erle Robotics [victor@erlerobot.com]

# Wait for capes to be loaded correctly
sleep 5

APM_BIN_DIR="/apps/erle-snap-copter/current/src"
Flag="-l /home/ubuntu/APM/logs -t /home/ubuntu/terrain/"

date
while :; do
	# USB Debug
	# $APM_BIN_DIR/ArduCopter.elf -A udp:192.168.7.1:6000 -B /dev/ttyO5

	# TCP
	#./ArduCopter.elf -A tcp:*:6000:wait -B /dev/ttyO5

	# copter with WiFi and GPS
	#$APM_BIN_DIR/ArduCopter.elf -A udp:10.0.0.2:6000 -B /dev/ttyO5 
	#./ArduCopter.elf -A /dev/ttyUSB0 -B /dev/ttyO5 -C udp:11.0.0.2:6000

	# copter with WiFi, GPS and mavros
	#  apparently, launching mavros this way causes trouble with the autopilot and only one of the channels
	#  gets the information. Use gcs_bridge in mavros instead, or review the code of the autopilot
	#$APM_BIN_DIR/ArduCopter.elf -A udp:10.0.0.2:6000 -B /dev/ttyO5 -C udp:127.0.0.1:6001
	#$APM_BIN_DIR/ArduCopter.elf -A udp:192.168.7.1:6000 -B /dev/ttyO5 -C udp:127.0.0.1:6001

	# mavros and GPS
	$APM_BIN_DIR/ArduCopter.elf -A udp:127.0.0.1:6001 -B /dev/ttyO5 $Flag 

done >>/home/ubuntu/logs/copter.log 2>&1


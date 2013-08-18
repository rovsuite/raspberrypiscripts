#!/bin/bash
#/etc/init.d/automatedsender.sh
#this automates the sending of the current temperature and uptime of the raspberry pi

while [ true ]; do

	PACKET=`(echo -n "$(/home/pi/bin/packetbuilder.sh)")`
	/home/pi/bin/sendudp.sh "$PACKET"

	sleep 0.5
done

#!/bin/bash
#This script configures the UDP packet to be sent by automatedsender.sh
TEMPC=`(echo -n "$(/home/pi/bin/measuretemp.sh)")`
TIME=`(cat /proc/uptime | cut -d " " -f1)`
USEDMEM=`(echo -n "$(/home/pi/bin/usedmem.sh)")`
USEDCPU=`(echo -n "$(/home/pi/bin/usedcpu.sh)")`
DELIM=' '
PACKET="$TEMPC"
PACKET+="$DELIM"
PACKET+="$TIME"
PACKET+="$DELIM"
PACKET+="$USEDMEM"
PACKET+="$DELIM"
PACKET+="$USEDCPU"

echo "$PACKET"
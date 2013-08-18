#!/bin/bash

COLOR='\e[0;36m'
NC='\e[0m'	#No color
echo -e "${COLOR}Welcome to the ROV-Suite setup script, version 0.1.${NC}"
echo -e "${COLOR}This script will install software on your raspberry pi needed to run an ROV.${NC}"
echo -e "${COLOR}An internet connection is required!${NC}"

distro=`egrep -w "ID" /etc/os-release`
distro=`echo $distro | cut -f2 -d"="`
echo -e "${COLOR}Distro is: $distro${NC}"

if [ $distro="debian" ]; then
	echo -e "${COLOR}Downloading and installing packages...${NC}"
	sudo apt-get update
	sudo apt-get -y install avrdude htop sendip subversion libjpeg8-dev imagemagick socat sysstat
else
	#add code to install everything for pacman
	echo -e "${COLOR}Arch code not complete!${NC}"
fi

echo -e "${COLOR}Compiling and installing mjpg-streamer...${NC}"
svn co https://mjpg-streamer.svn.sourceforge.net/svnroot/mjpg-streamer /home/pi/mjpg-streamer/
make -C /home/pi/mjpg-streamer/mjpg-streamer/
echo -e "${COLOR}Finished compiling and installing mjpg-streamer!${NC}"

#Add code to install scripts and functions
mkdir /home/pi/bin

#Video streaming script
VIDEO='/home/pi/bin/videostreaming.sh'
mv videostreaming.sh $VIDEO
chmod +x $VIDEO

if [ $distro="debian" ]; then
	sudo mv videostart.sh /etc/init.d/videostart.sh
	sudo chmod 755 /etc/init.d/videostart.sh
	sudo update-rc.d videostart.sh defaults
else
	#add code for Arch
	echo -e "${COLOR}Arch code not complete!${NC}"
fi

#Measure temperature script
TEMP='/home/pi/bin/measuretemp.sh'
mv measuretemp.sh $TEMP
chmod +x $TEMP

#Uptime script
TIME='/home/pi/bin/uptime.sh'
mv uptime.sh $TIME
chmod +x $TIME

#UsedMemory script
MEM='/home/pi/bin/usedmem.sh'
mv usedmem.sh $MEM
chmod +x $MEM

#UsedCPU script
CPU='/home/pi/bin/usedcpu.sh'
mv usedcpu.sh $CPU
chmod +x $CPU

#PacketBuilder script
PACKETBUILDER='/home/pi/bin/packetbuilder.sh'
mv packetbuilder.sh $PACKETBUILDER
chmod +x $PACKETBUILDER

#SendUDP script
SENDUDP='/home/pi/bin/sendudp.sh'
mv sendudp.sh $SENDUDP
chmod +x $SENDUDP

#Automated sender script
if [ $distro="debian" ]; then
	sudo mv automatedsender.sh /etc/init.d/automatedsender.sh
	sudo chmod 755 /etc/init.d/automatedsender.sh
	sudo update-rc.d automatedsender.sh defaults
else
	#add code for Arch
	echo -e "${COLOR}Arch code not complete!${NC}"
fi

#Everything installed!
echo -e "${COLOR}Everything installed!  Please restart your Raspberry Pi!${NC}"

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
svn co https://mjpg-streamer.svn.sourceforge.net/svnroot/mjpg-streamer ~/mjpg-streamer/
make -C ~/mjpg-streamer/mjpg-streamer/
echo -e "${COLOR}Finished compiling and installing mjpg-streamer!${NC}"

#Add code to install scripts and functions
mkdir ~/bin

#Video streaming script
mv videostreaming.sh bin/videostreaming.sh
chmod +x bin/videostreaming.sh

if [ $distro="debian" ]; then
	sudo mv videostart.sh /etc/init.d/videostart.sh
	sudo chmod 755 /etc/init.d/videostart.sh
	sudo update-rc.d videostart.sh defaults
else
	#add code for Arch
	echo -e "${COLOR}Arch code not complete!${NC}"
fi

#Measure temperature script
mv measuretemp.sh bin/measuretemp.sh
chmod +x bin/measuretemp.sh

#Uptime script
mv uptime.sh bin/uptime.sh
chmod +x bin/uptime.sh

#UsedMemory script
mv usedmem.sh bin/usedmem.sh
chmod +x bin/usedmem.sh

#UsedCPU script
mv usedcpu.sh bin/usedcpu.sh
chmod +x bin/usedcpu.sh

#PacketBuilder script
mv packetbuilder.sh bin/packetbuilder.sh
chmod +x bin/packetbuilder.sh

#SendUDP script
mv sendudp.sh bin/sendudp.sh
chmod +x bin/sendudp.sh

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

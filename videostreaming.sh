#!/bin/bash

COLOR='\e[0;36m'
NC='\e[0m'
echo -e "${COLOR}Video streaming starting!${NC}"

(cd ~/mjpg-streamer/mjpg-streamer && ./mjpg_streamer -i "./input_uvc.so" -o "./output_http.so -w ./www")

echo -e "${COLOR}Video streaming started!${NC}"

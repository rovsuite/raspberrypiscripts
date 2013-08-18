#!/bin/bash
#prints the temperature of the CPU in degrees celcius
/opt/vc/bin/vcgencmd measure_temp | cut -d"=" -f 2 | cut -d"'" -f 1

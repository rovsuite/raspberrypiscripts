#!/bin/bash
#give system uptime in seconds

cat /proc/uptime | cut -d " " -f1

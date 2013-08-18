#!/bin/bash
#sends a broadcast UDP packet on port 5060
echo "$1" | socat - UDP-DATAGRAM:255.255.255.255:5060,broadcast,sp=5060

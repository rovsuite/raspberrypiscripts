#!/bin/bash
#prints the percentage of the CPU that is being utilized
#taken from StackOverflow user Peter Liljenberg

mpstat | grep -A 5 "%idle" | tail -n 1 | awk -F " " '{print 100 - $11}'

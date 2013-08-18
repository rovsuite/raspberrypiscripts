#!/bin/bash
#prints the percentage of memory used
#taken from StackOverflow user Levon
free | grep Mem | awk '{print $3/$2 * 100.0}'
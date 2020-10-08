#!/bin/bash
# File: TrueLayer_test.sh
# Author: Liam Williamson
# Description: TrueLayer Senior IT Engineer Challenge
# Usage: ./true_layer.sh

# Creates a folder in your home directory called TrueLayer
mkdir -p ~/TrueLayer
cd ~/TrueLayer

# Creates a file in the TrueLayer folder called TLTest.txt and dumps into the file:
#   The time when the script has been run
date >> TLTest.txt

#   The name of the script file
script_name=$(basename -- "$0")
echo "Script filename: ${script_name}" >> TLTest.txt
echo " " >> ~/TrueLayer/TLTest.txt

#   The full list of every file and folder name present in the running folder
echo "Directory listing: " >> TLTest.txt
ls -lA >> TLTest.txt
echo " " >> TLTest.txt

#   The public IP the machine uses to reach internet
#my_ip=$(curl ipecho.net/plain ; echo)
my_ip=$(dig +short myip.opendns.com @resolver1.opendns.com)
echo "My public IP: ${my_ip}" >> TLTest.txt

#   The ram available in MB
hwmemsize=$(sysctl -n hw.memsize)
ramsize=$(expr $hwmemsize / $((1024**2)))
echo "System Memory: ${ramsize} MB" >> TLTest.txt

#   The PID and the name of the user that is executing the script
user=$(whoami)
echo "PID: $$" >> TLTest.txt
echo "Current User: ${user}" >> TLTest.txt

# Line to separate each run
echo "----------------------------------------------------------------" >> TLTest.txt

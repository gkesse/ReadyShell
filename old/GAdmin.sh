#!/usr/bin/bash
#================================================
source ./GProcess.sh
source ./GSetting.sh
#================================================
echo
GSetting_Load "data/config/config.txt"
GProcess_Run
echo
#================================================

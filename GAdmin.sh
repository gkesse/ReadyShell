#!/usr/bin/bash
#================================================
source ./GProcess.sh
source ./GConfig.sh
source ./GSetting.sh
#================================================
echo
#GConfig_SetData "PROCESS" "SED"
GSetting_Load "data/config/config.txt"
#GProcess_Run
echo
#================================================

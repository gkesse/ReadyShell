#!/usr/bin/bash
#================================================
source ./GProcess.sh
source ./GConfig.sh
source ./GSetting.sh
#================================================
GConfig_SetData "PROCESS" "CONFIG"
GProcess_Run
#================================================

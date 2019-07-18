#!/usr/bin/bash
#================================================
source ./GConfig.sh
#================================================
function GProcess_Run() {
    local lKey=$(GConfig_GetData "PROCESS")
    if [ $lKey = "PRINT" ]
    then 
        echo PRINT
    elif [ $lKey = "CONFIG" ]
    then
        echo CONFIG
    else 
        echo PRINT
    fi
}
#================================================

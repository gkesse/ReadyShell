#!/bin/bash
#================================================
source ./GFile.sh
source ./GConfig.sh
#================================================
function GSetting_Load() {
    local lFile=$1
    GFile_Exist $lFile
    while IFS= read -r lLine
    do
        local lTrim=$(echo $lLine | awk '{$1=$1;print}')
        local lFirstChar=${lTrim:0:1}
        if [ "$lFirstChar" = "#" ] ; then continue ; fi
        local lKeyTmp=$(echo $lTrim | awk -F"=" '{print $1}')
        local lValueTmp=$(echo $lTrim | awk -F"=" '{print $2}')
        local lKey=$(echo $lKeyTmp | awk '{$1=$1;print}')
        local lValue=$(echo $lValueTmp | awk '{$1=$1;print}')
        GConfig_SetData "$lKey" "$lValue"
    done < "$lFile"
    local lConfigShow=$(GConfig_GetData "CONFIG_SHOW")
    if [ "$lConfigShow" = "TRUE" ] ; then GConfig_ShowData ; echo ; fi
}
#================================================

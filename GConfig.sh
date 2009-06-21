#!/bin/bash
#================================================
source ./GConsole.sh
source ./GString.sh
#================================================
declare -A GConfigDataMap
#================================================
function GConfig_SetData() {
    local lKey=$1
    local lValue=$2
    GConfigDataMap[$lKey]=$lValue
}
#================================================
function GConfig_GetData() {
    local lKey=$1
    local lValue=${GConfigDataMap[$lKey]}
    echo $lValue
}
#================================================
function GConfig_ShowData() {
    for lKey in "${!GConfigDataMap[@]}" ; do
        local lValue=${GConfigDataMap[$lKey]}
        lKey=$(GString_ColorFg "$lKey" "$GColorYellow")
        lValue=$(GString_ColorFg "$lValue" "$GColorCyan")
        echo "$lKey = $lValue"
    done
}
#================================================

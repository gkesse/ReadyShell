#!/usr/bin/bash
#================================================
source ./GColor.sh
#================================================
function GString_Length() {
    local lData=$1
    local lLength=${#lData}
    echo "$lLength"
}
#================================================
function GString_ColorFg() {
    local lData=$1
    local lColor=$2
    echo -e "\e[1;${lColor}m${lData}\e[0m"
}
#================================================
function GString_ColorBg() {
    local lData=$1
    local lColor=$2
    let "lColor+=10"
    echo -e "\e[1;${lColor}m${lData}\e[0m"
}
#================================================

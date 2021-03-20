#!/usr/bin/bash
#================================================
function GIFS_SplitData() {
    local lDataMap=$1
    local lSep=$2
    IFS=$lSep
    for lData in $lDataMap ; do 
        echo $lData
    done
}
#================================================

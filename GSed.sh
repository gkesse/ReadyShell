#!/usr/bin/bash
#================================================
source ./GFile.sh
#================================================
function GSed_SubstrFile() {
    local lFile=$1
    local lExpr=$2
    local lReplace=$3
    GFile_Exist $lFile
    sed "s/$lExpr/$lReplace/g" $lFile
}
#================================================
function GSed_SubstrData() {
    local lData=$1
    local lExpr=$2
    local lReplace=$3
    echo $lData | sed "s/$lExpr/$lReplace/g" 
}
#================================================
function GSed_SkipLineFile() {
    local lFile=$1
    local lStart=$2
    local lEnd=$3
    GFile_Exist $lFile
    sed "$lStart,${lEnd}d" $lFile
}
#================================================
function GSed_KeepLineFile() {
    local lFile=$1
    local lExpr=$2
    GFile_Exist $lFile
    sed "/$lExpr/!d" $lFile
}
#================================================

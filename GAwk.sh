#!/bin/bash
#================================================
source ./GFile.sh
#================================================
function GAwk_Print() {
    local lFile=$1
    GFile_Exist $lFile
    awk '{print $0}' $lFile
}
#================================================
function GAwk_PrintNum() {
    local lFile=$1
    GFile_Exist $lFile
    awk '{print "[ " NR " ]: " $0}' $lFile
}
#================================================
function GAwk_Ref() {
    local lFile=$1
    local lRef=$2
    local lCase=$3
    GFile_Exist $lFile
    awk 'BEGIN{IGNORECASE='$lCase'} /'$lRef'/ {print $0}' $lFile
}
#================================================
function GAwk_RefCol() {
    local lFile=$1
    local lRef=$2
    local lCol=$3
    local lCase=$4
    GFile_Exist $lFile
    awk 'BEGIN{IGNORECASE='$lCase'} $'$lCol'~/'$lRef'/ {print $0}' $lFile
}
#================================================
function GAwk_GetCol() {
    local lFile=$1
    local lSep=$2
    local lCol=$3
    local lCase=$4
    GFile_Exist $lFile
    awk -F"$lSep" 'BEGIN{IGNORECASE='$lCase'} {print $'$lCol'}' $lFile
}
#================================================
function GAwk_SumCol() {
    local lFile=$1
    local lSep=$2
    local lCol=$3
    local lCase=$4
    GFile_Exist $lFile
    awk -F"$lSep" 'BEGIN{IGNORECASE='$lCase'} {s=s+$'$lCol'} END {print s}' $lFile
}
#================================================

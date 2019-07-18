#!/bin/bash
#================================================
source ./GFile.sh
source ./GAwk.sh
#================================================
function GSetting_Load() {
    local lFile=$1
    GFile_Exist $lFile
    GAwk_Print $lFile
    GAwk_Ref $lFile "PROCESS"
}
#================================================

#!/usr/bin/bash
#================================================
source ./GAwk.sh
#================================================
function GProcessAwk_Run() {
    echo "### GAwk_Print :"
    GAwk_Print "data/awk/awk.txt" ; echo
    
    echo "### GAwk_PrintNum :"
    GAwk_PrintNum "data/awk/awk.txt" ; echo
    
    echo "### GAwk_Ref :"
    GAwk_Ref "data/awk/awk.txt" "es" "1" ; echo
    
    echo "### GAwk_RefCol :"
    GAwk_RefCol "data/awk/awk.txt" "es" "3" "1" ; echo
    
    echo "### GAwk_GetCol :"
    GAwk_GetCol "data/awk/awk.txt" "=" "1" "0"; echo
    
    echo "### GAwk_SumCol :"
    GAwk_SumCol "data/awk/awk2.txt" ";" "2" "1"; echo
}
#================================================

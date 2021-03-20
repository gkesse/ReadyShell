#!/usr/bin/bash
#================================================
source ./GSed.sh
#================================================
function GProcessSed_Run() {
    GSed_SubstrFile \
    "data/sed/sed.txt" \
    "DONNEES" "DATA"
    echo
    
    GSed_SkipLineFile \
    "data/sed/sed.txt" \
    "1" "5"
    echo
    
    GSed_KeepLineFile \
    "data/sed/sed.txt" \
    "\(Bonus\)"
    echo
}
#================================================

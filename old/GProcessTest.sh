#!/usr/bin/bash
#================================================
source ./GConsole.sh
source ./GString.sh
#================================================
function GProcessTest_Run() {
    local lData=
    local lData2=
    echo "================================================"
    echo -e "1\t2\t3"
    echo -e "\e[1;31m This is red text \e[0m"
    echo -e "\e[1;42m Green Background \e[0m"
    echo "================================================"
    lData="Bonjour tout le monde"
    lData=$(GString_ColorBg "$lData" "$GColorBlue")
    lData=$(GString_ColorFg "$lData" "$GColorGreen")
    lData2="Tout va bien ici"
    lData2=$(GString_ColorFg "$lData2" "$GColorYellow")
    echo "$lData : $lData2"
    echo "================================================"
}
#================================================

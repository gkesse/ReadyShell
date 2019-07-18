#!/usr/bin/bash
#================================================
source ./GConsole.sh
#================================================
function GFile_Exist() {
    local lFile=$1
    if [ ! -f $lFile ] ; then GConsole_Echo "[ GFile ] Error GFile_Exist: $lFile" ; echo ; exit ; fi
}
#================================================
function GFile_Read() {
    local lFile=$1
    GFile_Exist $lFile
    while IFS="=" read -r key value; do
        case "$key" in
            '#'*) ;;
            *)
                eval "$key=\"$value\""
        esac
    done < "$lFile"
}
#================================================

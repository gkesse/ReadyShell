#!/usr/bin/bash
#================================================
source ./GConsole.sh
#================================================
function GProcessConsole_Run() {
    GConsole_Print "Bonjour tout le monde" ; echo
    GConsole_Print2 "Bonjour %s tout le monde\n" "Monsieur" ; echo
    GConsole_Print3 ; echo
}
#================================================

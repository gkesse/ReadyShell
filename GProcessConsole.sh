#!/usr/bin/bash
#================================================
source ./GConsole.sh
#================================================
function GProcessConsole_Run() {
    GConsole_Echo "Bonjour tout le monde"
    ${GConsole_Printf} "Bonjour %s tout le monde\n" "Monsieur"
}
#================================================

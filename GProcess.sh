#!/usr/bin/bash
#================================================
source ./GProcessConsole.sh
source ./GProcessConfig.sh
source ./GProcessAwk.sh
source ./GProcessGit.sh
source ./GConfig.sh
#================================================
function GProcess_Run() {
    local lKey=$(GConfig_GetData "PROCESS")
    if [ $lKey = "CONSOLE" ] ; then GProcessConsole_Run
    elif [ $lKey = "CONFIG" ] ; then GProcessConfig_Run
    elif [ $lKey = "AWK" ] ; then GProcessAwk_Run
    elif [ $lKey = "GIT" ] ; then GProcessGit_Run
    else GProcessConsole_Run ; fi
}
#================================================

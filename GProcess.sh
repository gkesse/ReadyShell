#!/usr/bin/bash
#================================================
source ./GProcessConsole.sh
source ./GProcessConfig.sh
source ./GProcessAwk.sh
source ./GProcessGit.sh
source ./GProcessFile.sh
source ./GProcessIFS.sh
source ./GProcessSed.sh
source ./GConfig.sh
source ./GString.sh
#================================================
function GProcess_Run() {
    local lKey=$(GConfig_GetData "PROCESS")
    if [ "$lKey" = "CONSOLE" ] ; then GProcessConsole_Run
    elif [ "$lKey" = "CONFIG" ] ; then GProcessConfig_Run
    elif [ "$lKey" = "AWK" ] ; then GProcessAwk_Run
    elif [ "$lKey" = "GIT" ] ; then GProcessGit_Run
    elif [ "$lKey" = "FILE" ] ; then GProcessFile_Run
    elif [ "$lKey" = "IFS" ] ; then GProcessIFS_Run
    elif [ "$lKey" = "SED" ] ; then GProcessSed_Run
    else GProcessConsole_Run ; fi
}
#================================================

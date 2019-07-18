#!/usr/bin/bash
#================================================
source ./GGit.sh
#================================================
function GProcessGit_Run() {
    echo "### GGit_SetGlobalConfig :"
    GGit_SetGlobalConfig "core.editor" "nano"; echo
    
    echo "### GGit_ShowConfig :"
    GGit_ShowConfig "core.editor"; echo
    
    echo "### GGit_ShowGlobalConfig :"
    GGit_ShowGlobalConfig ; echo
    
    echo "### GGit_ShowLocalConfig :"
    GGit_ShowLocalConfig ; echo
    
    echo "### GGit_ShowAllConfig :"
    GGit_ShowAllConfig ; echo
    
    echo "### GGit_AmendCommit :"
    GGit_AmendCommit ; echo
}
#================================================

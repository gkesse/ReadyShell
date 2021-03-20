#!/bin/bash
#================================================
source ./GFile.sh
#================================================
function GGit_SetGlobalConfig() {
    local lKey=$1
    local lValue=$2
    git config --global $lKey $lValue
}
#================================================
function GGit_ShowConfig() {
    local lKey=$1
    echo "[ $lKey ]:"
    git config --global $lKey
}
#================================================
function GGit_ShowLocalConfig() {
    git config --local --list
}
#================================================
function GGit_ShowGlobalConfig() {
    git config --global --list
}
#================================================
function GGit_ShowAllConfig() {
    git config --list
}
#================================================
function GGit_AmendCommit() {
    git commit --amend
}
#================================================

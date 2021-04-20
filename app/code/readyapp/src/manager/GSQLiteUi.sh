#================================================
. manager/GSQLite.sh
#================================================
G_STATE=""
#================================================
function GSQLiteUi_Run() {
    G_STATE="S_INIT"
    while [ 1 ] ; do
        if [ "$G_STATE" = "S_ADMIN" ] ; then GSQLiteUi_ADMIN $@
        elif [ "$G_STATE" = "S_INIT" ] ; then GSQLiteUi_INIT $@
        elif [ "$G_STATE" = "S_METHOD" ] ; then GSQLiteUi_METHOD $@
        elif [ "$G_STATE" = "S_CHOICE" ] ; then GSQLiteUi_CHOICE $@
        #
        elif [ "$G_STATE" = "S_SHOW_VERSION" ] ; then GSQLiteUi_SHOW_VERSION $@
        elif [ "$G_STATE" = "S_SHOW_TABLES" ] ; then GSQLiteUi_SHOW_TABLES $@
        elif [ "$G_STATE" = "S_CONFIG_DATA_SHOW_DATA" ] ; then GSQLiteUi_CONFIG_DATA_SHOW_DATA $@
        #
        elif [ "$G_STATE" = "S_SAVE" ] ; then GSQLiteUi_SAVE $@
        elif [ "$G_STATE" = "S_LOAD" ] ; then GSQLiteUi_LOAD $@
        elif [ "$G_STATE" = "S_QUIT" ] ; then GSQLiteUi_QUIT $@
        else break
        fi
    done
}
#================================================
function GSQLiteUi_ADMIN() {
    GProcessUi_Run $@
    G_STATE="S_END"
}
#================================================
function GSQLiteUi_INIT() {
    printf "\n"
    printf "SQLITE !!!\n"
    printf "\t%-2s : %s\n" "-q" "quitter l'application"
    printf "\n"
    G_STATE="S_LOAD"
}
#================================================
function GSQLiteUi_METHOD() {
    printf "SQLITE :\n"
    printf "\t%-2s : %s\n" "1" "afficher la version"
    printf "\t%-2s : %s\n" "2" "afficher les tables"
    printf "\t%-2s : %s\n" "3" "afficher la table config_data"
    printf "\n"
    G_STATE="S_CHOICE"
}
#================================================
function GSQLiteUi_CHOICE() {
    local lAnswer=""
    read -p "SQLITE ($G_SQLITE_ID) ? " lAnswer
    if [ "$lAnswer" = "" ] ; then lAnswer="$G_SQLITE_ID" ; fi
    if [ "$lAnswer" = "-q" ] ; then G_STATE="S_END"
    #
    elif [ "$lAnswer" = "1" ] ; then G_STATE="S_SHOW_VERSION" ; G_SQLITE_ID="$lAnswer"
    elif [ "$lAnswer" = "2" ] ; then G_STATE="S_SHOW_TABLES" ; G_SQLITE_ID="$lAnswer"
    elif [ "$lAnswer" = "3" ] ; then G_STATE="S_CONFIG_DATA_SHOW_DATA" ; G_SQLITE_ID="$lAnswer"
    #
    fi
}
#================================================
function GSQLiteUi_SHOW_VERSION() {
    printf "\n"
    GSQLite_Version
    G_STATE="S_SAVE"
}
#================================================
function GSQLiteUi_SHOW_TABLES() {
    printf "\n"
    GSQLite_Show "
    select name from sqlite_master
    where type = 'table'
    "
    G_STATE="S_SAVE"
}
#================================================
function GSQLiteUi_CONFIG_DATA_SHOW_DATA() {
    printf "\n"
    GSQLite_Show "
    select * from config_data
    "
    G_STATE="S_SAVE"
}
#================================================
function GSQLiteUi_SAVE() {
    GConfig_SaveData "G_SQLITE_ID" "$G_SQLITE_ID"
    G_STATE="S_QUIT"
}
#================================================
function GSQLiteUi_LOAD() {
    G_SQLITE_ID=$(GConfig_LoadData "G_SQLITE_ID")
    G_STATE="S_METHOD"
}
#================================================
function GSQLiteUi_QUIT() {
    local lAnswer=""
    printf "\n"
    read -p "SHELL_QUIT (Oui/[N]on) ? " lAnswer
    if [ "$lAnswer" = "-q" ] ; then G_STATE="S_END"
    elif [ "$lAnswer" = "o" ] ; then G_STATE="S_END"
    elif [ "$lAnswer" = "-i" ] ; then G_STATE="S_INIT"
    elif [ "$lAnswer" = "n" ] ; then G_STATE="S_INIT"
    elif [ "$lAnswer" = "" ] ; then G_STATE="S_INIT"
    elif [ "$lAnswer" = "-a" ] ; then G_STATE="S_ADMIN"
    fi
}
#================================================

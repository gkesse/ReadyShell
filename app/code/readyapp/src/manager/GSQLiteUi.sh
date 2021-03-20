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
        elif [ "$G_STATE" = "S_SHOW_TABLES" ] ; then GSQLiteUi_SHOW_TABLES $@
        elif [ "$G_STATE" = "S_CREATE_TABLE" ] ; then GSQLiteUi_CREATE_TABLE $@
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
    printf "\t%-2s : %s\n" "1" "S_SHOW_TABLES"
    printf "\t%-2s : %s\n" "2" "S_CREATE_TABLE"
    printf "\n"
    G_STATE="S_CHOICE"
}
#================================================
function GSQLiteUi_CHOICE() {
    local lAnswer=""
    read -p "SQLITE ($G_SALITE_ID) ? " lAnswer
    if [ "$lAnswer" = "" ] ; then lAnswer="$G_SALITE_ID" ; fi
    if [ "$lAnswer" = "-q" ] ; then G_STATE="S_END"
    #
    elif [ "$lAnswer" = "1" ] ; then G_STATE="S_SHOW_TABLES" ; G_SALITE_ID="$lAnswer"
    elif [ "$lAnswer" = "2" ] ; then G_STATE="S_CREATE_TABLE" ; G_SALITE_ID="$lAnswer"
    #
    fi
}
#================================================
function GSQLiteUi_SHOW_TABLES() {
    printf "\n"
    printf "GSQLiteUi_SHOW_TABLES\n"
    G_STATE="S_SAVE"
}
#================================================
function GSQLiteUi_CREATE_TABLE() {
    printf "\n"
    printf "GSQLiteUi_CREATE_TABLE\n"
    G_STATE="S_SAVE"
}
#================================================
function GSQLiteUi_SAVE() {
    G_STATE="S_QUIT"
}
#================================================
function GSQLiteUi_LOAD() {
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

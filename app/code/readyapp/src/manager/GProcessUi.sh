#================================================
. manager/GSQLiteUi.sh
#================================================
G_STATE=""
#================================================
function GProcessUi_Run() {
    G_STATE="S_INIT"
    while [ 1 ] ; do
        if [ "$G_STATE" = "S_INIT" ] ; then GProcessUi_INIT $@
        elif [ "$G_STATE" = "S_METHOD" ] ; then GProcessUi_METHOD $@
        elif [ "$G_STATE" = "S_CHOICE" ] ; then GProcessUi_CHOICE $@
        #
        elif [ "$G_STATE" = "S_SQLITE" ] ; then GProcessUi_SQLITE $@
        elif [ "$G_STATE" = "S_STRING" ] ; then GProcessUi_STRING $@
        #
        elif [ "$G_STATE" = "S_SAVE" ] ; then GProcessUi_SAVE $@
        elif [ "$G_STATE" = "S_LOAD" ] ; then GProcessUi_LOAD $@
        else break
        fi
    done
}
#================================================
function GProcessUi_INIT() {
    printf "\n"
    printf "ADMIN !!!\n"
    printf "\t%-2s : %s\n" "-q" "quitter l'application"
    printf "\n"
    G_STATE="S_LOAD"
}
#================================================
function GProcessUi_METHOD() {
    printf "ADMIN :\n"
    printf "\t%-2s : %s\n" "1" "S_SQLITE"
    printf "\t%-2s : %s\n" "2" "S_STRING"
    printf "\n"
    G_STATE="S_CHOICE"
}
#================================================
function GProcessUi_CHOICE() {
    local lAnswer=""
    read -p "ADMIN ($G_ADMIN_ID) ? " lAnswer
    if [ "$lAnswer" = "" ] ; then lAnswer="$G_ADMIN_ID" ; fi
    if [ "$lAnswer" = "-q" ] ; then G_STATE="S_END"
    #
    elif [ "$lAnswer" = "1" ] ; then G_STATE="S_SQLITE" ; G_ADMIN_ID="$lAnswer"
    elif [ "$lAnswer" = "2" ] ; then G_STATE="S_STRING" ; G_ADMIN_ID="$lAnswer"
    #
    fi
}
#================================================
function GProcessUi_SQLITE() {
    GSQLiteUi_Run $@
    G_STATE="S_SAVE"
}
#================================================
function GProcessUi_STRING() {
    printf "\n"
    printf "GProcessUi_STRING\n"
    G_STATE="S_SAVE"
}
#================================================
function GProcessUi_SAVE() {
    G_STATE="S_END"
}
#================================================
function GProcessUi_LOAD() {
    G_STATE="S_METHOD"
}
#================================================

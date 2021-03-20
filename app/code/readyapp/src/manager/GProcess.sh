#================================================
. manager/GProcessUi.sh
#================================================
function GProcess_Run() {
    local lKey=$1
    if [ "$lKey" = "" ] ; then lKey="test" ; fi
    if [ "$lKey" = "test" ] ; then GProcess_Test $@
    elif [ "$lKey" = "ui" ] ; then GProcess_Ui $@
    else GProcess_Test $@
    fi
}
#================================================
function GProcess_Test() {
    printf "GProcess_Test"
}
#================================================
function GProcess_Ui() {
    GProcessUi_Run $@
}
#================================================

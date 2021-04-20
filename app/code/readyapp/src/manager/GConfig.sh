#================================================
. manager/GSQLite.sh
#================================================
function GConfig_Init() {
    echo "[$FUNCNAME]"
}
#================================================
function GConfig_LoadData() {
    lData=$(GSQLite_Query "
    select config_value from config_data
    where config_key = '$1'
    ")
    printf "$lData"
}
#================================================
function GConfig_SaveData() {
    lCount=$(GConfig_CountData $@)
    if [ "$lCount" = "0" ] ; then GConfig_InsertData $@
    else GConfig_UpdateData $@
    fi
}
#================================================
function GConfig_CountData() {
    lData=$(GSQLite_Query "
    select count(*) from config_data
    where config_key = '$1'
    ")
    printf "$lData"
}
#================================================
function GConfig_InsertData() {
    GSQLite_Query "
    insert into config_data (config_key, config_value)
    values ('$1', '$2');
    "
}
#================================================
function GConfig_UpdateData() {
    GSQLite_Query "
    update config_data
    set config_value = '$2'
    where config_key = '$1' 
    "
}
#================================================

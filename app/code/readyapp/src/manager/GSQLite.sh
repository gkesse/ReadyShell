#================================================
function GSQLite_Init() {
    # drop
    GSQLite_Query "
    drop table if exists config_data_o
    "
    # config_data
    GSQLite_Query "
    create table if not exists config_data (
    config_key text,
    config_value text
    )"
}
#================================================
function GSQLite_Version() {
    sqlite3 --version
}
#================================================
function GSQLite_Query() {
    sqlite3 ${GSQLITE_DB_PATH} "$@"
}
#================================================

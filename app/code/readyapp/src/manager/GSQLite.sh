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
function GSQLite_Show() {
    GSQLite_Query "$@" | awk -F "|" '
    {
        # sep
        printf("+-")
        for(i = 1; i <= NF; i++) {
            if(i != 1) {printf("-+-")}
            for(j = 1; j <= 20; j++) {
                printf("-")    
            }
        }
        printf("-+")
        printf("\n")
        # data
        printf("| ")
        for(i = 1; i <= NF; i++) {
            if(i != 1) {printf(" | ")}
            printf("%-20s", $i)    
        }
        printf(" |")
        printf("\n")
    }END{
        # sep
        printf("+-")
        for(i = 1; i <= NF; i++) {
            if(i != 1) {printf("-+-")}
            for(j = 1; j <= 20; j++) {
                printf("-")    
            }
        }
        printf("-+")
        printf("\n")
    }'
}
#================================================

#!/usr/bin/bash
#================================================
source ./GConfig.sh
#================================================
function GProcessConfig_Run() {
    GConfig_SetData "Nom" "KESSE" 
    GConfig_SetData "Prenom" "Gerard" 
    GConfig_SetData "Email" "gerard.kesse@readydev.com" 
    GConfig_SetData "Diplome" "Ingenieur" 
    GConfig_SetData "Formation" "Informatique Industrielle" 
    GConfig_SetData "Ecole" "Polytech'Montpellier"
    GConfig_ShowData
}
#================================================

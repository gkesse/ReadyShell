#!/bin/sh
#================================================
function GConsole_Print() {
    local lMessage=$1
    echo $lMessage
}
#================================================
function GConsole_Print2() {
    printf "$@"
}
#================================================
function GConsole_Print3() {
cat <<- _EOF_
Il s'agit d'une syntaxe permettant dans Bash de définir des documents en ligne, 
c'est-à-dire saisir plusieurs lignes simultanément sur l'entrée standard. 
Tant que le mot "EOF" n'est pas lu, la commande va "gober" les lignes 
que tu lui fournis sur l'entrée standard. 
Une fois arrivé au mot-stop "EOF" (traditionnellement "end of file"), 
la lecture sur l'entrée standard est terminée 
et ta commande s'exécute avec les données fournies sur l'entrée standard.
_EOF_
}
#================================================
function GConsole_BgColor() {
    local lColor=$1
    tput setab $lColor
}
#================================================
function GConsole_FgColor() {
    local lColor=$1
    tput setaf $lColor
}
#================================================
function GConsole_ShowColorMap() {
    printf '\e[48;5;%dm ' {0..255}; printf '\e[0m \n'
}
#================================================

#!/bin/sh

if test $# -ne 1
then
    echo "argomenti passati insufficienti"
fi

#check se è una directory e assoluta
DIR=$1
DIRHOME=$(pwd)
if [ ! -d "$DIR" ]; then
echo "L'argomento passato non è una directory"
exit 1

fi

#case "$DIR" in
 #   /*)
  #      echo "Il percorso è relativo"
   #     exit 1;
     #   ;;
#esac


#controllo che warning o errori .txt esistano altrimenti li creo
[ -f "$HOME/warning.txt" ] || touch "$HOME/warning.txt"
[ -f "$HOME/error.txt" ] || touch "$HOME/error.txt"

errlog="$HOME/error.txt"
# shellcheck disable=SC2317
warnlog="$HOME/warning.txt"

cd "$DIR" || exit 0

for file in *; do
    if [ -d "$file" ];then
    (
        cd $DIRHOME || exit 0
        ./trova_errori.sh "$DIR/$file"
    )
    elif [ -f "$file" ] && [ -r "$file" ]; then
     case "$file" in
        *".log")
        #main.c,Progetto1,2026-10-26 09:00,error,15,Variabile non dichiarata,altre informazioni
        #suppenendo che i file di log siano scritti così
        grep ',error,' "$file" | cut -d ',' -f 1,2,6 >> $errlog
        grep ',warning,' "$file" | cut -d ',' -f 1,2,6 >> $warnlog
        ;;
     esac
    fi
done

#!/bin/bash

#controllo argomenti
#reparto anno(path relativo, solo num)
if [ "$#" -ne 2 ]; then
echo "Il numero di argomenti non è valido"
exit 1
fi

reparto=$1
shift
anno=$1
shift

case "$reparto" in
*![A-Za-z]*)
echo "la stringa non è valida/ha numeri"
;;
esac

case "$anno" in 
*![0-9]*)
    echo "l'anno inserito non è valido"
;;
esac

case "$anno" in 
/*)
    echo "il path è assoluto"
    exit 1
    ;;
*)
;;
esac

if [ ! -d "$anno" -a ! -x "$anno" ]; then
    echo "Non hai inserito una dir/non hai i permessi"
    exit 6
fi

PATH=$(pwd):$PATH
export PATH

RIEPILOGO="$HOME/ricoveri.txt"
if [ ! -f "$RIEPILOGO" ]; then
    > "$RIEPILOGO"
fi
export RIEPILOGO

MAX_COUNT=/tmp/max_count.txt
echo '0' > "$MAX_COUNT"
export MAX_COUNT
MAX_RIC=/tmp/max_ric.txt
> "$MAX_RIC"
export MAX_RIC

ospedale_ric.sh "$reparto" "$anno"

echo "Il numero più alto di ricoveri è stato: $(cat "$MAX_RIC")"
rm "$MAX_COUNT"
rm "$MAX_RIC"






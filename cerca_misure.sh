#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Numero di argomenti invalido"
    exit 1
fi

dir=$1
shift
header=$1
shift

if [ ! -d "$dir" -a ! -x "$anno" ]; then

    echo " '$dir' non è una dir"
    exit 1
fi

case "$dir" in 
/*)
;;
*)
echo " non è una dir assoluta"
exit 2
;;
esac

PATH=$(pwd):$PATH
export PATH

RIEPILOGO="$HOME/ricoveri.txt"
if [ ! -f "$RIEPILOGO" ]; then
    > "$RIEPILOGO"
fi
export RIEPILOGO

MAX_COUNT=/tmp/max_count.txt
echo '0'> "$MAX_COUNT"
export MAX_COUNT

MAX_SUB=/tmp/max_sub.txt
>"$MAX_SUB"
export MAX_SUB

cerca_misure_ric.sh "$dir" "$header"

echo "Il numero più alto di ricoveri è stato: $(cat "$MAX_COUNT") nella subdirectory $(cat "$MAX_SUB")"

rm $MAX_COUNT
rm $MAX_SUB

#!/bin/bash

# tungtung sahur 6769104

#officina categoria anno
if [ $# -ne 2 ]; then
    echo "Errore:numero di parametri errati"
    exit 1;
fi

categoria="$1"
shift
anno="$1"
shift

#categoria stringa alfanumerica
case "$categoria" in
    *[!0-9A-Za-z]*)
    echo "Errore la stringa non è alfanumerica"
    exit 1
    ;;
esac
#verifico anno sia un path assoluto
case "$anno" in 
/*);;
*)
    echo "$anno non è un path assoluto"
    exit 3
;;
esac

if [ ! -d "$anno" -a ! -x "$anno" ]; then
    echo "$anno non è una dir/ non hai il permesso di accesso"
    exit 4
fi

PATH=$(pwd):$PATH
export PATH

RIEPILOGO="$HOME/riepilogo.log"
if [ ! -f "$RIEPILOGO" ]; then
    > "$RIEPILOGO"
fi
export RIEPILOGO

MAX_COUNT=/tmp/max_count.txt
echo '0' > "$MAX_COUNT"
export MAX_COUNT

MAX_CAT=/tmp/max_cat.txt
> "$MAX_CAT"
export MAX_CAT
#chiamata file ricorsivo
offcina_ric.sh "$categoria" "$anno"

rm "$MAX_CAT"
rm "$MAX_COUNT"


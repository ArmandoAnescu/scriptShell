#!/bin/bash

DIR=$1
id_cliente=$2


cd "$DIR" || exit 1

for f in *; do
    if [ -d "$f" ]; then
        gelateria_ric.sh "$DIR/$f" "$id_cliente"
    elif [ -f "$f" ] && [ -r "$f" ]; then
        case "$f" in
                *".gel")
                    grep "$id_cliente" "$f" | cut -f2,3 -d "-" >> $RIEPILOGO

                    # conto il numero di registrazioni del cliente nel file
                    # shellcheck disable=SC2126
                    count="$(grep "$id_cliente" "$f" | wc -l)"

                    # aggiorno il massimo solo se il cliente compare almeno una volta
                # shellcheck disable=SC2166
                if [ "$count" -gt "$(cat "$MAX_COUNT")" -a "$count" -gt 0 ] ;then
                    echo "$count" > "$MAX_COUNT"
                    echo "$f" > "$MAX_SEDE"
                fi
                ;;
        esac
    fi
done
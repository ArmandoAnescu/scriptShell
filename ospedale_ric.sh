#!/bin/bash

reparto=$1
shift
anno=$1
shift

cd "$anno" || exit 1

for f in *.txt; do
    if [ -f "$f" -a -r "$f" ]; then
        mese=$(echo "$f" | cut -f1 -d ".")
        #data n stanza nome paz
        grep "$reparto" "$f" | cut -f2,4,5 -d " " >> "$RIEPILOGO"
        n_ricoveri=$(wc -l < "$f")
        max_count=$(cat "$MAX_COUNT")
        if [ "$n_ricoveri" -gt "$max_count" ];then
            echo "$n_ricoveri" > "$MAX_COUNT"
            echo "$mese $anno">  "$MAX_RIC"
        fi
    fi
done

for d in *; do 
    if [ -d "$d" -a -x "$d" ]; then
        ospedale_ric.sh "$reparto" "$d"
    fi
done

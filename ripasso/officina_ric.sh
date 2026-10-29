#!/bin/bash
#assegnamento
categoria=$1
shift
anno=$1
shift

cd "$anno" || exit 0

#ciclo
for f in *.txt; do

    if [ -f "$f" -a -r "$f" ]; then
        mese=$(echo "$f" | cur -f1 -d ".")
        num_int=$(grep "$categoria" "$f" | cut -f1 -d ' ')
        if [ ! -z "$num_int" ]; then
            echo "$mese $num_int" >> "$RIEPILOGO"
        fi
    fi

    riga_max=$(sort -n "$f" | tail -n 1)

    if [ ! -z "$riga_max" ]; then
        val=$(echo "$riga_max" | cut -f1 -d ' ')
        if [ "$val" -gt "$(cat "$MAX_COUNT")" ]; then
            echo "$val" > "$MAX_COUNT"
            echo "$riga_max" | cut -f2 -d ' ' > "$MAX_CAT"
        fi
    fi

done

for i in *; do
    if [ -d "$i" -a -x "$i" ]; then
        officina_ric "$categoria" "$anno"
    fi
done
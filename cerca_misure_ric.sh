#!/bin/bash

dir=$1
shift
header=$1
shift

counter=0
cd "$dir" || exit 1

for f in *.log ; do
    if [ -r "$f" -a -w "$f" ]; then
        if [ "$(head -n 1 "$f" | grep -c "$header" "$f")" -ge 1 ]; then
            echo "$(pwd)/'$f'" >> "$RIEPILOGO"

            counter=$((counter+1))
        fi
    fi
done

max_count="$(cat "$MAX_COUNT")"
if [ "$counter" -g "$max_count" ];then
    echo "$counter" > "$MAX_COUNT"
    echo "$(pwd)" > "$MAX_SUB"
fi

for d in *; do 
    if [ -d "$d" -a -x "$d" ]; then
        cerca_misure_ric.sh "$(pwd)/$d" "$header"
    fi
done
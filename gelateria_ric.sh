#!/bin/bash

$DIR=$1
$id_cliente=$2


cd "$DIR"

for $f in *; do
    if [ -d $f ]; then
        gelateria_ric "$DIR/$f" "$id_cliente"
    elif [ -f $f -a -r $f ]; then
    case "$i" in
            *".gel")
                grep "$id_cliente" "$f" | cut -f2,3 -d "-" >> $RIEPILOGO

                # conto il numero di registrazioni del cliente nel file
                count=grep "$id_cliente" "$f" | wc -l

                # aggiorno il massimo solo se il cliente compare almeno una volta
            if [ $count -gt `cat $MAX_COUNT` -a $count -gt 0 ] ;then
                echo $count > $MAX_COUNT
                echo "$f" > $MAX_SEDE
            fi
            ;;
    esac

done
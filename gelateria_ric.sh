#!/bin/bash

$DIR=$1
$id_cliente=$2

cd "$DIR"

for $f in *; do
    if [ -d $f ]; then
        gelateria_ric "$f" "$id_cliente"
    fi

done
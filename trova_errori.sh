#!/bin/sh

if test $# -ne 2
then
    echo "argomenti passati insufficienti"
fi

#check se è una directory e assoluta
DIR=$1

if [ ! -d "$DIR" ]; then
echo "L'argomento passato non è una directory"
exit 1

fi

case "$DIR" in
    *)
        echo "Il percorso è relativo"
        exit 1;
        ;;
esac

#!/bin/sh

if test $# != 2
then
echo "argomenti insuffiecienti"
exit 1
fi
DIR_SORG=$(cd "$1" && pwd)
DIR_DEST=$(cd "$2" && pwd)

DIR_DUP= "$DIR_DEST/duplicati"
if [ ! -d "$DIR_DUP"];then
    mkdir -p "$DIR_DUP"
fi

ext = ".jpg"
if test -d $DIR_SORG -a -d $DIR_DEST
then
    cd "$DIR_SORG"
    for i in *; do
    do 
        if test -d "$i"
        then
            riordina_foto.sh "$DIR_SORG/$i" "$DIR_DEST" #chiamata ric
        elif [-f "$i"] && [-r "$i"]; then
        
            if [[ "$i" == "*.$ext"]]
            then
                if [ -e "$DIR_DEST/$file" ]; then
                    echo "Duplicazione trovato: spostamento di '$file' in '$DIR_DUP'"
                    mv "$file" "$DIR_DUP/"
                else
                    mv "$i" "$DIR_DEST/"
                fi
            fi
        fi
else
echo "Non hai inserito abbastanza argomenti/argomenti invalidi"
fi

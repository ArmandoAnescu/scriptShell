#!/bin/sh

if test $# -ne 2
then
echo "argomenti insuffiecienti"
exit 1
fi

DIR_SORG=$(cd "$1" && pwd)
DIR_DEST=$(cd "$2" && pwd)

copiati=0

DIR_DUP="$DIR_DEST/duplicati"
if [ ! -d "$DIR_DUP" ];then
    mkdir -p "$DIR_DUP"
fi

ext=".jpg"

if test -d $DIR_SORG -a -d $DIR_DEST
then
    cd "$DIR_SORG" || exit 1
    pwd
    for i in *; do
        if test -d "$i"
        then
            riordina_foto.sh "$DIR_SORG/$i" "$DIR_DEST" #chiamata ric
        elif [ -f "$i" ] && [ -r "$i" ]; then
            case "$i" in
            *"$ext")
                if [ -e "$DIR_DEST/$i" ]; then
                    echo "Duplicazione trovato: spostamento di '$i' in '$DIR_DUP'"
                    n=1
                    nome="${i%.*}"
                    ext=".jpg"
                    while [ -e "$DIR_DUP/$nome-$n$ext" ]; do
                        n=$((n + 1))
                    done
                    mv "$i" "$DIR_DUP/$nome-$n$ext"
                else
                    mv "$i" "$DIR_DEST/"
                    copiati=$((copiati + 1))
                fi
                ;;
            esac
        fi
    done
    echo "Sono stati copiati: $copiati foto "
else        
    echo "Non hai inserito abbastanza argomenti/argomenti invalidi"
fi

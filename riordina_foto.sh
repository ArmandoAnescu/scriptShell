#!/bin/sh

if test $# != 2
then
echo "argomenti insuffiecienti"
exit 1
fi
DIR_SORG = $1
DIR_DEST = $2
ext = ".jpg"
if test -d $DIR_SORG a test -d $DIR_DEST
then
    cd "$DIR_SORG"
    for i in *
    do 
        if test -d "$i"
        then
            riordina_foto.sh "'pwd'"/"$i" "$DIR_DEST" #chiamata ric
        else
            if [[ "$i" == "*.$ext"]]
            then
                cp $i $DIR_DEST
            fi
        fi
else
echo "Non hai inserito abbastanza argomenti/argomenti invalidi"
fi

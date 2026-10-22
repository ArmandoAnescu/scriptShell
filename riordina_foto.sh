#!/bin/sh

if test $# != 2
then
echo "argomenti insuffiecienti"
exit 1
fi
DIR_SORG = $1
DIR_DEST = $2
ext = ".jpg"
if test -d DIR_SORG a test -d DIR_DEST
then
    cd "DIR_SORG"

else
echo "Non hai inserito abbastanza argomenti/argomenti invalidi"
fi

#!/bin/bash
#gelateria dir idcliente
if [ $# -ne 2 ]; then
echo "Non hai inserito gli argomenti corretti"
exit 1
fi

DIR=$1
shift
id_cliente=$1
shift

if [ ! -d "$DIR" ]; then
echo "L'argomento '$DIR' non è una directory"
fi

case "$DIR" in
    /*) ;;
    *)  echo "errore: '$DIR' non è un path assoluto"
        exit 2
        ;;
esac
case "$id_cliente" in
    *![A-Z0-9]*)
    echo "L'id non è alfanumerico "
    exit 3;
    ;;
esac

PATH="$(pwd):$PATH"
export PATH

# creo il file di output (sovrascritto se esiste)
RIEPILOGO=$HOME/"$id_cliente".log
> "$RIEPILOGO"
export RIEPILOGO

# file temporaneo per il massimo numero di registrazioni del cliente
MAX_COUNT=/tmp/max_count.txt
echo '0' > $MAX_COUNT
export MAX_COUNT

# file temporaneo per la sede corrispondente
MAX_SEDE=/tmp/max_sede.txt
> "$MAX_SEDE"
export MAX_SEDE

gelateria_ric.sh "$DIR" "$id_cliente"

# stampo il risultato
echo "sede con più registrazioni per il cliente: $(cat "$MAX_SEDE" | cut -d . -f 1) ($(cat $MAX_COUNT))"

# rimuovo i file temporanei
rm $MAX_COUNT
rm $MAX_SEDE

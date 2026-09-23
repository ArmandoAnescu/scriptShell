#!/bin/bash

while true
 do

	#chiedo il nome file/directory
	read -p "Inserisci il nome del fil/dir o fine per uscire" input


	#controllo
	if[ "$input" = "fine"]
	then
		echo "Fine programma"
		break
	fi

	if [-f "$input"]
	then
		echo"-> '$input' è un file nel dir locale"
	elif [-d "$input"]
	then
		echo "-> '$input'è una dir nel dir locale"
	else
		echo "-> '$input' non è un file/dir nella dir locale"
	fi
done

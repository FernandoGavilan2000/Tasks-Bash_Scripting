#!/bin/bash

USER_NAME=""

Login () {
    echo -e "\nVerificando Usuario..."
    sleep 3
    DATA_USERS=$(awk -F ':' '$3 > 999 {print $1}' /etc/passwd)
    CHECK_OUT=$( echo "$DATA_USERS" | grep "$1")
    if [ "$CHECK_OUT" == "$1" ]; then
	LOG_USER=$(date +"Login: %d-%B-%Y a las %X Hs  --> $1")
	echo $LOG_USER >> ./login/logUsers.txt
	echo -e "\nSuccessful login by $1"
    else
	echo -e "\nUsuario Incorrecto, intentelo de nuevo.."
    fi
}

read -p "Ingrese el nombre del usuario: " USER_NAME
if [[ $USER_NAME != "" ]]; then
    if [ -f "./login/logUsers.txt" ]; then
	Login $USER_NAME
    else
	mkdir login
	touch ./login/logUsers.txt
	Login $USER_NAME
    fi   
else
    echo "No se pudo leer el argumento ingresado"
fi





























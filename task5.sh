#!/bin/bash
#Transferir todos los archivos de un directorio usando rsync, la cual nos brinda la ventaja de pasar
#toda la informacion usando un metodo de compresion.

PATH_SOURCE=""
IP_HOST=""
NAME_HOST=""
PATH_FINAL=""

read -p "Ingrese path del directorio origen,for instance:(/home/user/files/) :" PATH_SOURCE
echo -e "\nConectando con SSH..."
sleep 2
read -p "Ingrese la Direccion IP (Dispositivo_Remoto): " IP_HOST
read -p "Ingrese el nombre del Usuario (Dispositivo_Remoto): " NAME_HOST
echo -e "\n"
read -p "Por favor Ingrese el path del directorio destinatario: " PATH_FINAL

if [ -d $PATH_SOURCE ]; then
    ENDING="$NAME_HOST@$IP_HOST:$PATH_FINAL"
    echo -e "\nSe copiara el contenido de $PATH_DIREC a $ENDING"
    read -p "Seguro de continuar? [y/N]: " CONFIRM
    if [ $CONFIRM=="y"]; then
	echo -e "\nDelivering..."
	rsync -azvP $PATH_SOURCE $ENDING && echo -e "\nProceso Terminado.." && sleep 2
    else
	echo -e "\nCancelando transferencia..."
        sleep 2
    fi
    sleep 3
else
    echo -e "\nEl directorio $PATH_SOURCE no existe"
    sleep 3
fi


<<<<<<< HEAD
=======
























>>>>>>> 01044e8f90d8e7a922502583b6439e18f0cfb395

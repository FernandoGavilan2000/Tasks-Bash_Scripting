#!/bin/bash
# Solicitar la información de cada uno de ustedes como nombres, apellidos, edad, dirección y números
# telefónicos; y posterior imprima toda la información.Al momento de correr el script se debera
# pasar como argumento el ID del usuario, recuerda los usurios del sistema empiezan desde el numero
# 1000.

NAMES_REGEX='^[A-Za-z]+\s?[A-Za-z]+$'
LASTNAMES_REGEX='^[A-Za-z]+\s?[A-Za-z]+$'
AGE_REGEX='^[0-9]{1,2}$'
ADDRES_REGEX='^.*$'
NUMBER_REGEX='^[0-9]{6,12}$'


echo -e "\nVerificando si es una ID valido"
if [ $1 -ge 1000 ]; then
#INGRESANDO LOS VALORES
    echo -e "\n<---- ID VALIDO ---->\n"
    read -p "Ingrese sus Nombres: " NAMES
    read -p "Ingrese su Apellidos: " LASTNAMES
    read -p "Ingrese su Edad: " AGE
    read -p "Ingrese su Direccion: " ADDRES
    read -p "Ingrese su Telefono(8 digitos): " NUMBER
#VALIDANDO LOS CAMPOS    
    echo -e "\nCAMPOS INGRESADOS CORRECTAMENTE:"
    
    if [[ $NAMES =~ $NAMES_REGEX ]]; then
	echo "Nombres: $NAMES --> OK"
    else
	echo "Nombres: $NAMES --> WRONG"
    fi

    if [[ $LASTNAMES =~ $LASTNAMES_REGEX ]]; then
	echo "Apellidos: $LASTNAMES --> OK"
    else
	echo "Apellidos: $LASTNAMES --> WRONG"
    fi

    if [[ $AGE =~ $AGE_REGEX ]]; then
	echo "Edad: $AGE --> OK"
    else
	echo "Edad: $AGE --> WRONG"
    fi

    if [[ $ADDRES =~ $ADDRES_REGEX ]]; then
	echo "Direccion: $ADDRES --> OK"
    else
	echo "Direccion: $ADDRES --> WRONG"
    fi

    if [[ $NUMBER =~ $NUMBER_REGEX ]]; then
	echo "Numero: $NUMBER --> OK"
    else
	echo "Numero: $NUMBER --> WRONG"
    fi
else
    echo -e "\nxxxx ID NO VALIDO xxxx"

fi



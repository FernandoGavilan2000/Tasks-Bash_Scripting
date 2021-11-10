#!/bin/bash
#Crear un menú con las siguientes opciones:

OPTION=8
while :
    do clear
       echo "++++++++++++++++++++++++++++++++++++++++++++"
       echo "+             MENU PRINCIPAL               +"
       echo "++++++++++++++++++++++++++++++++++++++++++++"
       echo "+  1 Procesos Actuales User                +"
       echo "+  2 Memoria Disponible                    +"
       echo "+  3 Espacio en Disco                      +"
       echo "+  4 Informacion de Red                    +"
       echo "+  5 Principales Variables de Entorno      +"
       echo "+  6 Informacion Programas                 +"
       echo "+  7 Realizar Backup                       +"
       echo "+  8 Salir                                 +"
       echo "++++++++++++++++++++++++++++++++++++++++++++"
       
       read -n1 -p 'Ingresar una opcion [1-8]: ' OPTION
       
       case $OPTION in
	    1)echo -e "\nProcesos Actuales del usuraio $USER ..."
	      sleep 2
	      top -u $USER
	      ;;
	    2)echo -e "\nMemoria Disponible..."
	      sleep 2
	      MEMORYRAM=$(free -m | awk '/Mem:/{print $2}')
	      MEMORYSWAP=$(free -m | awk '/Swap:/{print $2}')
	      echo '------------------------------------'
	      echo ' RAM INSTALADA  <---> SWAP INSTALADA'
	      echo " $MEMORYRAM _MB <---> $MEMORYSWAP _MB"
	      echo '------------------------------------'
	      sleep 5
	      ;;
	    3)echo -e "\nEspacio en Discos '/dev'..."
	      sleep 2
	      DISKS_HEADER=$(df -H | head -n 1)
	      DISKS_INFO=$(df -H | awk '/^\/dev/ {print $0}')
	      echo "$DISKS_HEADER"
	      echo "$DISKS_INFO"
	      sleep 5
	      ;;
	    4)echo -e "\nInformacion de Red ..."
	      sleep 2
	      ip address
	      sleep 5
	      ;;
	    5)echo -e "\nPrincipales Variables de Entorno.."
	      sleep 2
	      MAIN_VAR=("HOSTNAME" "USER" "HOME" "SHELL" "PATH")
	      for VARI in ${MAIN_VAR[*]}
		  do
		    INFO_VAR=$(env | grep "^$VARI=")
		    echo "$INFO_VAR"
		  done
	      sleep 3
	      ;;
	    6)echo -e "\nInformación Programa..."
	      #Fedora 34 DNF-Package Manager
	      dnf list installed | less
	      sleep 2
	      ;;
            7)echo -e "\nRealizar Backup..."
	      read -p "Ingresar el path absoluto del directorio: " PATH_DIREC
	      if [ -d $PATH_DIREC ]; then
                 echo -e "\nRealizando Backup..." 
                 tar cvzf /tmp/backup_script.tar.gz -C $PATH_DIREC . && sleep 2 && echo "Backup Listo --> OK"
                 sleep 3
	      else
		  echo -e "\nEl directorio no existe"
		  sleep 3
	      fi
	      ;;
	    8)echo -e "\nSaliendo..."
	      sleep 2
	      exit 0
	      ;;
	esac
    done


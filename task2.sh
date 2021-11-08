#!/bin/bash
echo -e "Ingresar uno de los valores correspondientes:\n"

echo "+++++++++++++ TABLERO +++++++++++++"
echo "+++++++++ 1.Check out Age +++++++++"
echo "++++++ 2.Check out Password +++++++"
echo "+++++++++ 3.Check out File ++++++++"

echo -e "\n"
read -p "Ingrese el codigo del juego : " CODE

EDAD_REGEX='^\d{1,3}$'
PATH_REGEX='^(/[a-zA-Z0-9._~#\-]+)+'

case $CODE in
    1)read -p "Ingrese su edad actual:" EDAD 
      
      if [[ $EDAD =~ $EDAD_REGEX ]]; then 
	echo "Ingrese una edad real, por favor" 
      else
	  if (( $EDAD < 18 )); then 
	    echo "Eres menor de Edad" 
	  else 
	    echo "Eres mayor de Edad" 
          fi   
      fi
      ;;
    2)read -sp "Ingresar el password del root:" PASSWD
      
      if [[ $PASSWD == "password" ]]; then
	  echo -e "\nPassword correcto OK"
      else
	  echo -e "\nPassword incorrecto"
      fi
      ;;
    3)read -p "Ingresar la ruta absoluta del fichero: " FILEPATH
      
      if [[ $FILEPATH =~ $PATH_REGEX ]]; then
	if [ -f $FILEPATH ]; then
	  echo "El fichero existe"
        else
	  echo "El fichero no existe"
        fi
      else
	  echo "La ruta no es valida"
      fi
      ;;
    *) echo "Opcion $CODE desconocida" ;;
esac



























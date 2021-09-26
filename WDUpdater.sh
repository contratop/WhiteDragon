clear

echo "Artemis WhiteDragon Updater"
echo ""


echo Que funcion vas a realizar
	PS3='Please enter your choice: '
options=("Actualizar/Reinstalar" "Actualizar-Dependencias" "Desinstalar" "Quit")
select opt in "${options[@]}"
do
    case $opt in






        "Actualizar/Reinstalar")
        clear
echo "Esto reinstalara por completo WhiteDragon instalando la ultima version disponible en GitHub"
echo ""
echo "ADVERTENCIA: todas las aplicaciones descargadas con WhiteDragon seran eliminadas"
echo "Incluyendo configuracion de dichas aplicaciones"
echo "Al momento de volver a ejecutar las aplicaciones, seran descargadas la ultima version disponible de GitHub"
echo ""
echo "para proceder, escriba 'reinstall'"
read -p "Presione cualquier tecla para abortar: " CONT
	if [ "$CONT" = "reinstall" ]; then
    clear
        echo "Actualizando Artemis WhiteDragon..."
        #Fase 1 - aprovisionar el sistema de archivos de WhiteDragon#
        echo "Progreso: 1/4 (Limpiando aplicaciones instaladas y Desinstalando WhiteDragon)"
                sleep 1
                cd $HOME
                rm -f -r WhiteDragon
                sleep 1
        #Fase 2 - Instalando WhiteDragon via GitHub#
        echo "Progreso: 2/4 (Descargando Artemis WhiteDragon)"
                sleep 1
                git clone https://github.com/contratop/WhiteDragon
                sleep 1
        #Fase 3 - Actualizando librerias
        echo "Progreso: 3/4 (Actualizando librerias necesarias)"
                #aqui se actualizan los paquetes existentes
             pkg update
             pkg upgrade
            #aqui se instalan paquetes via apt o pkg
             pkg install python3
             pkg install git
             #aqui se instalan paquetes de python
             pip install youtube-dl
             python -m pip install pyftpdlib
             echo sleep 1
        #Fase 4 - Actualizando de la lista de dependencias de System
        echo "Progreso: 4/4 (Actualizando Pack de librerias)"
             python3 -m pip install -r WhiteDragon/.system/dependency.txt
        #Fin de fase
        clear
        echo "WhiteDragon Actualizado"
        read -n 1 -s -r -p "Presiona cualquier tecla para salir"
        clear
        exit
    else
        echo ""
        echo "Operacion abortada"
        read -n 1 -s -r -p "Presiona cualquier tecla para salir"
        clear
        exit
    fi

		
				
            ;;


          "Actualizar-Dependencias")

          clear
          echo "Esto actualizara solo las dependencias necesarias para el correcto funcionamiento de WhiteDragon"
          while true; do
    read -p "Deseas actualizar las dependencias y instalar las que falten? [Y/N]" yn
    case $yn in
        [Yy]* ) 
        #aqui se actualizan los paquetes existentes
             pkg update
             pkg upgrade
            #aqui se instalan paquetes via apt o pkg
             pkg install python3
             pkg install git
             #aqui se instalan paquetes de python
             pip install youtube-dl
             python -m pip install pyftpdlib
        exit
        ;;
        [Nn]* ) exit;;
        * ) echo "Escribe Y o N";;
    esac
done

;;

        "Desinstalar")
        clear
          echo "Esto Desinstalara por completo WhiteDragon"
echo ""
echo "ADVERTENCIA: todas las aplicaciones descargadas con WhiteDragon seran eliminadas"
echo "Incluyendo configuracion de dichas aplicaciones"
echo ""
  read -p "Estas seguro que desea desinstalar WhiteDragon? [Y/N]" yn
    case $yn in
        [Yy]* ) 
        cd $HOME
        rm -r -f WhiteDragon
exit
        ;;
        [Nn]* ) exit;;
        * ) echo "Escribe Y o N";;
    esac
done
;;






        "Quit")
		clear
            exit
            
            ;;
        *) echo "invalid option $REPLY";;
    esac
done













################################################################################



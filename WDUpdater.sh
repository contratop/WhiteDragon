clear

echo "Artemis WhiteDragon Updater"
echo ""
echo "Esto reinstalara por completo WhiteDragon instalando la ultima version disponible en GitHub"
echo "para proceder, escriba 'reinstall'"
read -p "Presione cualquier tecla para abortar: " CONT
	if [ "$CONT" = "reinstall" ]; then
    clear
        echo "Actualizando Artemis WhiteDragon..."
        #Fase 1 - aprovisionar el sistema de archivos de WhiteDragon#
        echo "Progreso: 1/3"
        sleep 1
                cd $HOME
                rm -f -r WhiteDragon
        #Fase 2 - Instalando WhiteDragon via GitHub#
        echo "Progreso: 2/3"
        sleep 1
                git clone https://github.com/contratop/WhiteDragon
        #Fase 3 - Actualizando librerias
        echo "Progreso: 3/3"
        sleep 1
                pkg update 
                pkg upgrade
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


#Bash Script 

#First Run
clear

#Banner Print
 if [ -d ".simpleapp" ] 
    then
    cat banner.bn
    else
    cat WhiteDragon/banner.bn
    fi

echo ""

#Software info
echo "Artemis WhiteDragon"
echo "v0.8"
echo "for Android Termux"
echo ""

echo WhiteDragon Main Menu
  PS3='Elija una opcion: '
options=("Tools" "UpdateDependency" "Quit")
select opt in "${options[@]}"
do
    case $opt in



     "Tools")
        clear
        cd WhiteDragon
             echo "WhiteDragon Tools"
                PS3='Tools disponibles: '
             options=("Content-Extractor" "FTP-Server" "Exit")
             select opt in "${options[@]}"
             do
                case $opt in

                        "Content-Extractor")
                        clear
                         bash ".simpleapp/content_extractor.sh"
                        exit
                        ;;
        
                        "FTP-Server")
                        clear
                        #Check and prompt for Storage Acess
                           if [ -d "$HOME/storage" ] 
                            then
                                clear
                                sleep 1
                            else
                                clear
                                echo "Termux didn't find a way to your internal storage"
                                echo "Choose if you want to grant permission to access the internal memory"
                                sleep 3
                                termux-setup-storage
                            fi
    
                         python3 ".simpleapp/ftpserver.py"
                        exit
                        ;;




                        "Exit")
                        clear
                        exit
                        ;;
                        *) echo "Opcion invalida $REPLY";;
                        esac
                    done




            ;;


     "UpdateDependency")
      echo ""
      echo "Actualizar modulos WhiteDragon"
      echo ""
      echo "Se van a actualizar las aplicaciones base"
      echo "Y se van a instalar algunos modulos necesarios para el correcto funcionamiento de WhiteDragon"
      echo "Escriba 'update' para continuar"
        read -p "O escriba cualquier otra cosa para cancelar: " CONT
	    if [ "$CONT" = "update" ]; then
        clear
            #aqui se actualizan los paquetes existentes
             pkg update
             pkg upgrade
            #aqui se instalan paquetes via apt o pkg
             pkg install python3
             pkg install git
             #aqui se instalan paquetes de python
             pip install youtube-dl
             python -m pip install pyftpdlib


                echo ""
                echo "Los paquetes base han sido actualizados"
                read -n 1 -s -r -p "Presiona cualquier tecla para salir"
                clear
        exit
        

        else

                 echo ""
                 echo "No se ha detectado 'update', operacion abortada"
                 read -n 1 -s -r -p "Presiona cualquier tecla para salir"
                 clear
        exit

         fi
        exit
        
        
        ;;
     "Quit")
         clear
            exit
            ;;
        *) echo "Opcion invalida $REPLY";;
    esac
done
#Bash Script 

#First Run
clear

#Banner Print
 if [ -d ".simpleapp" ] 
    then
    echo "Execution Error"
    echo "Execute from bash WhiteDragon/WhiteDragon.sh"
    echo ""
    exit
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
             options=("Content-Extractor" "FTP-Server" "SocialSploit" "Sherlock" "Exit")
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
                        "SocialSploit")
                        
                            if [ -d "AppData/SocialSploit" ] 
                            then
                               cd AppData/SocialSploit
                               ./Sploit
                            else
                               git clone https://github.com/Cesar-Hack-Gray/SocialSploit AppData/SocialSploit
                               cd AppData/SocialSploit
                               bash install.sh
                               ./Sploit
                            fi

                        ;;

                        "Sherlock")

                            if [ -d "AppData/sherlock" ] 
                            then
                               echo ""
                            else
                               git clone https://github.com/sherlock-project/sherlock.git AppData/sherlock
                               cd 
                            fi
                            clear
                            cd AppData/sherlock
                            read -p "Escribe el Username que se va a buscar en Sherlock" sherk
                            clear
                            python3 sherlock $sherk
                            echo ""
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
      clear
      bash WhiteDragon/WDUpdater.sh
        ;;
     "Quit")
         clear
            exit
            ;;
        *) echo "Opcion invalida $REPLY";;
    esac
done
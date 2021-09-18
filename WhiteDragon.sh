#Bash Script 




echo "Artemis WhiteDragon"
echo "v0.8"
echo "for Linux Terminal (Bash)"

echo WhiteDragon Main Menu
  PS3='Please enter your choice: '
options=("HackTools" "UpdateBase" "Quit")
select opt in "${options[@]}"
do
    case $opt in



     "HackTools")
  clear

        
            ;;


     "UpdateBase")
      echo ""
        
        
        ;;
     "Quit")
    clear
            exit
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
cd $HOME
          echo "Vas a eliminar todos los datos guardados de WhiteDragon y desinstalarlo por completo"
          while true; do
    read -p "Deseas desinstalar WhiteDragon? [Y/N]" yn
    case $yn in
        [Yy]* ) 
        echo "Desinstalando WhiteDragon"
          rm -r -f WhiteDragon
          clear
          sleep 1
          echo "Desinstalado correctamente"
          echo ""
          exit
        ;;
        [Nn]* ) exit;;
        * ) echo "Escribe Y o N";;
        esac
    done

        
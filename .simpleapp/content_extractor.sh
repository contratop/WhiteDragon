## primera linea
clear
## Software Info

echo "Contratop's Content Extractor"
echo "youtube-dl core"
echo "for Termux"
echo ""

# STEP1 - Cofigure Termux Storage
    if [ -d "$HOME/storage" ] 
    then
    sleep 1
    else
    echo ""
    echo "Termux no tiene permisos de acceso al almacenamiento"
    sleep 1
    echo "Permite a continuacion el acceso al almacenamiento para guardar los archivos que extraigas"
    sleep 2
    termux-setup-storage
    sleep 3
    clear
    fi

#STEP2 - Aprovisionar youtube-dl
    cd storage/downloads
    clear
    echo "Contratop's Content Extractor"
    echo "youtube-dl core"
    echo "for Termux"
    echo ""
    sleep 1
        read -p "Escribe la URL del contenido que deseas extraer> " url
        echo ""
        youtube-dl --list-formats $url
        echo ""
        read -p "Escribe el codigo del formato que deseas descargar> " codeformat
        clear
#STEP3 - Descarga del contenido
        echo "Descargando el contenido"
        sleep 1
        youtube-dl -f $codeformat $url
        echo "Contenido guardado en Downloads"
exit











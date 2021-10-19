#! /bin/bash

#-- Actuelment ------------------
#ytdl conf URL --> Utilisation du fichier de configuration pour téléchargé une vidéo
#
#ytdl URL --> Télécharge la vidéo et l'enregistre dans le répertoire courant
#
#ytdl URL cheminAcces --> Télécharge la vidéo est l'enregistre dans le répétoire référencé Attention il faut ajouter le nom du fichier sortant.

#-- But -------------------------
# Pouvoir téléchargé toute les URL d'un fichier grace au -a
#        --> faire attention a convertir le fichier txt si on passe de windows à linux
# Regarder comment faire proprement des flag du genre "-c" --> utilise le fichier de configuration
#        --> implique de pouvoir lire les flag dans l'importe quel sens et n'importe quel placement 


source ytdlConfig.txt

function avecConfig()
{
if [ "$audio" = true ]; then 
    if [ "$format" = "" ]; then
        youtube-dl -o "$dest$name" -x "$1"
    else
        youtube-dl -o "${dest}${name}.${format}" -x --audio-format "$format" "$1"
    fi
else
     youtube-dl -o "$dest$name" "$1"
fi
}


function sansConfig()
{
echo -n "Juste dl audio ? y/n :"
read reponse
if [ "$reponse" = "y" ] || [ "$reponse" = "Y" ]; then
    echo -n "Indiquer le format :"
    read format
    if [ $# > 2 ]; then
        chemin=$2
        youtube-dl -o "$chemin" -x --audio-format "$format" "$1"
    
    else
        youtube-dl -x --audio-format "$format" "$1"
    fi
else
    if [ $# > 2 ]; then
        chemin=$2
        youtube-dl -o "$chemin" "$1"
    
    else
        youtube-dl "$1"
    fi
fi
}


if [ "$1" = "conf" ]; then
    URL="$2"
    avecConfig $URL
else
    URL="$1"
    sansConfig $URL
fi
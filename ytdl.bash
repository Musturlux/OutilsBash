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
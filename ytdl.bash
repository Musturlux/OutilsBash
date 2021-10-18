URL=$1

echo -n "Juste dl audio ? y/n :"
read reponse
if [ "$reponse" = "y" ] || [ "$reponse" = "Y" ]; then
    echo -n "Indiquer le format :"
    read format
    if [ $# > 2 ]; then
        chemin=$2
        youtube-dl -o "$chemin" -x --audio-format "$format" "$URL"
    
    else
        youtube-dl -x --audio-format "$format" "$URL"
    fi
else
    if [ $# > 2 ]; then
        chemin=$2
        youtube-dl -o "$chemin" "$URL"
    
    else
        youtube-dl "$URL"
    fi
fi
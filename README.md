# OutilsBash
Ce repertoire rassemble du code bash qui me sert d'outils.

# Premier Outils -youtube-dl- "ytdl" *WIP*

Context : Dans le cadre de l'utilisation de voicemeter banane et la découverte des bouton macro, il me faut créer une base de son à lancé.

Les outils en ligne pour convertir des vidéo youtube en mp3 ou wav, ne me satisfait pas car j'aimerai pouvoir telechager des playlists ou un ensemble de video dont l'URL est stocké dans un fichier texte.
Ce script bash est un de mes premiers. je risque de le refaire plusieur fois. 

Utilisation :

$bash ytdl.bash URL dossier

Pour utiliser le fichier de configuration
$dos2unix ytdlConfig.txt (converti le fichier text window en fiwhier text unix tres pratique !!!)
$bash ytdl.bash conf URL

Note : chmod +x nom_du_script -> rendre le script excutable
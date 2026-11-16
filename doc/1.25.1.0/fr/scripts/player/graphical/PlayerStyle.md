# player/graphical/PlayerStyle.lua

*[English version](../../../../scripts/player/graphical/PlayerStyle.md)*

Source: `dataS/scripts/player/graphical/PlayerStyle.lua` — FS25 1.25.1.0

✍ Contient l'apparence d'un avatar de joueur : une PlayerStyleConfig par emplacement (cheveux, lunettes, couvre-chef, visage, barbe, haut, gants, bas, chaussures, combinaison, etc.), plus les préréglages, points d'attache et parties du corps lus dans le XML du joueur. Il peut être copié entre instances et sérialisé pour le multijoueur. De larges parties du corps du fichier sont absentes du dump du SDK : seules les fonctions listées sont documentées ici.

- **PlayerStyle** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlayerStyle.new(customMt: any) → table` | 112 | ✍ Constructeur. Crée le style vide, enregistre toutes les configs avec leurs filtres, harmonise les couleurs de cheveux et démarre avec le visage 1 et la coiffure 2 sélectionnés. |
| `PlayerStyle:writeStream(streamId: integer, connection: table)` | 166 | ✍ Écrit le style dans un flux réseau : le nom de fichier XML converti pour le réseau, puis chaque config dans l'ordre. À relire avec readStream dans le même ordre. |
| `PlayerStyle:readStream(streamId: integer, connection: table)` | 178 | ✍ Lit le style depuis un flux réseau. Charge la configuration si nécessaire (les sélections sont transmises par nom), lit chaque config, met à jour les options désactivées et harmonise les couleurs de cheveux. |
| `PlayerStyle:copyFrom(other: PlayerStyle)` | 203 | ✍ Copie la configuration et la sélection d'un autre style. Si la source a sa configuration chargée, les tables partagées (préréglages, parties du corps, index de coiffure pour chapeau) sont référencées sans copie profonde ; sinon ce style est marqué non chargé. |
| `PlayerStyle:copyConfigurationFrom(other: PlayerStyle)` | 245 | ✍ Copie uniquement la configuration (noms de fichiers, points d'attache, parties du corps, préréglages, items des configs) d'un autre style, sans toucher à la sélection. Journalise une erreur et ne fait rien si la source n'est pas chargée. |
| `PlayerStyle:copySelectionFrom(other: PlayerStyle)` | 290 | ✍ Copie uniquement la sélection de chaque config depuis un autre style. La configuration reste marquée chargée seulement si les deux styles utilisent le même fichier XML. Les couleurs de cheveux sont harmonisées ensuite. |
| `PlayerStyle:loadConfigurationXML(xmlFilename: any)` | 320 | ✍ Charge le style depuis un XML de joueur (clés sous player.playerStyle : colors, attachPoints, configs, bodyParts, presets). Réutilise un style déjà chargé si possible, se rabat sur un fichier par défaut en cas d'échec et tente de conserver la sélection précédente par nom puis par index. Les préréglages invalides ou en double sont rejetés avec un message de log. |
| `PlayerStyle:debugDraw(x: number, y: number, textSize: number) → number` | 700 | ✍ Affiche du texte de débogage à l'écran : état de chargement de la configuration, nom du fichier XML, item et couleur sélectionnés de chaque config. Retourne la position y après la dernière ligne. |

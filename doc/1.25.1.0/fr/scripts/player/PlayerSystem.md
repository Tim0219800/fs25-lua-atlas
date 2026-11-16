# player/PlayerSystem.lua

*[English version](../../../scripts/player/PlayerSystem.md)*

Source: `dataS/scripts/player/PlayerSystem.lua` — FS25 1.25.1.0

✍ Registre de tous les joueurs d'une mission. Il tient des tables de recherche par index, identifiant utilisateur, identifiant unique, noeud racine et connexion réseau, ainsi que les données côté serveur des joueurs absents de la partie, et les écrit dans le XML de sauvegarde des joueurs. Les constantes `MAX_NUM_SAVED_PLAYERS` et `MAX_NUM_DAYS_OFFLINE` et le constructeur ne figurent pas dans ce dump (NON VÉRIFIÉ).

- **PlayerSystem** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlayerSystem:saveToXMLFile(xmlFilename: string) → boolean` | 118 | ✍ Serveur uniquement : crée le fichier XML des joueurs, y sauvegarde chaque joueur actif puis les joueurs déchargés (élagués si le nombre atteint le maximum), et écrit le fichier. Renvoie false si le fichier n'a pas pu être créé, sinon true. |
| `PlayerSystem:saveUnloadedPlayers(xmlFile: XMLFile, baseKey: string)` | 153 | ✍ Ajoute chaque entrée de données de joueur déchargé au XML après les joueurs actifs, sans aucun élagage. Utilisé tant que le total reste sous la limite de joueurs sauvegardés. |
| `PlayerSystem:saveHugeUnloadedPlayers(xmlFile: XMLFile, baseKey: string)` | 172 | ✍ Sauvegarde les joueurs déchargés triés par connexion la plus récente. Au-delà de la limite, s'arrête au premier joueur dont la dernière connexion dépasse le nombre de jours hors ligne autorisé et journalise combien ont été exclus. |
| `PlayerSystem:draw()` | 306 | ✍ Fonction de dessin à chaque image : appelle `drawUIInfo` sur chaque joueur non supprimé, et affiche des colonnes de debug d'animations ou de sons pour tous les joueurs si `DEBUG_ANIMATIONS` ou `DEBUG_SOUNDS` est actif. |
| `PlayerSystem:getHasPlayerWithUniqueId(uniqueId: string) → boolean` | 389 | ✍ Renvoie true si un joueur actif porte cet identifiant unique ; sur le serveur, les données de joueurs déchargés sont aussi vérifiées. Un identifiant nil donne false. |
| `PlayerSystem:getIsPlayerAdded(player: Player) → boolean` | 401 | ✍ Renvoie true si le joueur n'est pas nil, possède un identifiant utilisateur unique et est enregistré sous celui-ci comme joueur actif. |
| `PlayerSystem:getPlayerCount() → integer` | 408 | ✍ Renvoie le nombre de joueurs actifs, hors ceux qui n'existent que comme données déchargées. |
| `PlayerSystem:getPlayerByIndex(index: integer) → Player` | 416 | ✍ Renvoie le joueur actif à l'index donné de la liste, ou nil. |
| `PlayerSystem:getPlayerByUniqueId(uniqueId: string) → Player` | 424 | ✍ Renvoie le joueur actif enregistré sous cet identifiant utilisateur unique, ou nil. |
| `PlayerSystem:getPlayerByUserId(userId: string) → Player` | 432 | ✍ Renvoie le joueur actif ayant l'identifiant utilisateur de session donné, ou nil. |
| `PlayerSystem:getPlayerByRootNode(rootNode: integer) → Player` | 440 | ✍ Renvoie le joueur dont le noeud racine de scène est le noeud donné, ou nil. |
| `PlayerSystem:getPlayerByConnection(connection: Connection) → Player` | 448 | ✍ Renvoie le joueur associé à la connexion réseau donnée, ou nil. |
| `PlayerSystem:getPlayerDataByUniqueId(uniqueId: string) → table?` | 456 | ✍ Serveur uniquement : renvoie les données sauvegardées d'un joueur déchargé pour cet identifiant unique ; renvoie toujours nil sur les clients. |
| `PlayerSystem:addPlayer(player: Player) → boolean` | 502 | ✍ Enregistre un joueur dans la liste et les tables par identifiant utilisateur, noeud racine, connexion et identifiant unique, retire les données déchargées correspondantes sur le serveur, et le définit comme joueur local s'il en est le propriétaire. Renvoie false si l'identifiant existe déjà (erreur journalisée si c'est un autre objet). `setLocalPlayer` n'est pas dans ce dump. |
| `PlayerSystem:debugDrawAllPlayers(x: number, y: number, textSize: number)` | 623 | ✍ Outil de debug qui appelle `debugDraw` sur chaque joueur en décalant la position x de 0,2 à chaque fois. |

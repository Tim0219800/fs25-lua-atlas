# player/networking/PlayerServerNetworkComponent.lua

*[English version](../../../../scripts/player/networking/PlayerServerNetworkComponent.md)*

Source: `dataS/scripts/player/networking/PlayerServerNetworkComponent.lua` — FS25 1.25.1.0

✍ Composant réseau côté serveur qui reçoit les déplacements de chaque client, les met en file dans le système physique et renvoie l'état faisant autorité, le client contrôlant recevant son index de tick acquitté. Le suivi des ticks est ignoré pour le joueur qui héberge le processus serveur.

- **PlayerServerNetworkComponent** hérite de `PlayerNetworkComponent` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlayerServerNetworkComponent.new(player: Player) → PlayerServerNetworkComponent` | 18 | ✍ Constructeur. Crée le composant et, pour les joueurs non propriétaires, un historique de ticks et un compteur du prochain tick à envoyer. Initialise les indicateurs skip et première personne à false. |
| `PlayerServerNetworkComponent:update(dt: number)` | 52 | ✍ Point d'entrée vide appelé à chaque frame. |
| `PlayerServerNetworkComponent:updateTick(dt: number)` | 59 | ✍ Étape par tick : pour les non-propriétaires, retire les entrées d'historique dont l'index physique est déjà simulé, mémorise la dernière comme tick à envoyer et lève le dirty flag par défaut pour que les clients reçoivent une mise à jour. |
| `PlayerServerNetworkComponent:writeUpdateStream(streamId: integer, connection: Connection, dirtyMask: integer)` | 87 | ✍ Écrit l'état vers un client : le tick acquitté (client contrôlant seulement), les indicateurs et la position. Les autres clients reçoivent aussi le lacet, grounded (calculé par la capsule), la vue première personne, l'accroupissement et la visibilité graphique. |
| `PlayerServerNetworkComponent:readUpdateStream(streamId: integer, connection: Connection, timestamp: integer)` | 132 | ✍ Lit le tick, le mouvement, le lacet et les indicateurs première personne et accroupi d'un client (ignoré pour le joueur de l'hôte). Met le déplacement en file dans le contrôleur capsule, fixe lacet et accroupissement et enregistre l'index physique dans l'historique. |

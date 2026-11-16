# player/networking/PlayerLocalNetworkComponent.lua

*[English version](../../../../scripts/player/networking/PlayerLocalNetworkComponent.md)*

Source: `dataS/scripts/player/networking/PlayerLocalNetworkComponent.lua` — FS25 1.25.1.0

✍ Composant réseau côté client, présent uniquement pour le joueur contrôlé localement. Il enregistre l'historique de mouvement par tick afin que, lorsque le serveur renvoie une position faisant autorité, le client rejoue par-dessus le mouvement non encore acquitté (réconciliation).

- **PlayerLocalNetworkComponent** hérite de `PlayerNetworkComponent` (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlayerLocalNetworkComponent.new(player: Player) → PlayerLocalNetworkComponent` | 21 | ✍ Constructeur. Crée le composant pour le joueur donné avec un historique de ticks vide et un mouvement cumulé nul. |
| `PlayerLocalNetworkComponent:update(dt: number)` | 46 | ✍ Mise à jour à chaque frame. Ouvre une nouvelle entrée d'historique si un tick a été demandé (en limitant la taille de l'historique), puis cumule le delta de position du mover dans le total sortant et dans l'entrée courante. |
| `PlayerLocalNetworkComponent:updateTick(dt: number)` | 81 | ✍ Appelé à chaque tick. Se contente de signaler qu'une nouvelle entrée d'historique doit être créée à la prochaine mise à jour de frame. |
| `PlayerLocalNetworkComponent:writeUpdateStream(streamId: integer, connection: Connection, dirtyMask: integer)` | 91 | ✍ Envoie au serveur l'index de tick courant, le mouvement cumulé, le lacet compressé, l'indicateur de vue à la première personne et l'indicateur d'accroupissement, puis remet le mouvement cumulé à zéro. Valable uniquement pour le joueur propriétaire. |
| `PlayerLocalNetworkComponent:readUpdateStream(streamId: integer, connection: Connection, timestamp: integer)` | 116 | ✍ Lit la réponse du serveur (tick acquitté, indicateurs controlled/skip, position faisant autorité), fixe la position du mover, supprime l'historique acquitté et ré-applique le reste via le contrôleur capsule, regroupé en environ cinq étapes. |

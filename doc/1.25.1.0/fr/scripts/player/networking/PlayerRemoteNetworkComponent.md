# player/networking/PlayerRemoteNetworkComponent.lua

*[English version](../../../../scripts/player/networking/PlayerRemoteNetworkComponent.md)*

Source: `dataS/scripts/player/networking/PlayerRemoteNetworkComponent.lua` — FS25 1.25.1.0

✍ Composant réseau côté client pour les joueurs contrôlés par quelqu'un d'autre. Il lit la position, le lacet et les indicateurs d'état du serveur et les transmet à l'interpolateur de position pour que l'avatar distant bouge de façon fluide.

- **PlayerRemoteNetworkComponent** hérite de `PlayerNetworkComponent` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlayerRemoteNetworkComponent.new(player: Player) → PlayerRemoteNetworkComponent` | 18 | ✍ Constructeur. Crée le composant pour le joueur donné. |
| `PlayerRemoteNetworkComponent:readUpdateStream(streamId: integer, connection: Connection, timestamp: integer)` | 32 | ✍ Lit les indicateurs controlled/skip, la position, le lacet compressé, grounded, vue à la première personne, accroupi et visibilité. Applique la visibilité et l'accroupissement, fixe les cibles de l'interpolateur et démarre une nouvelle phase d'interpolation réseau. |

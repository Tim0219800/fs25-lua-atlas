# player/events/PlayerRequestStyleEvent.lua

*[English version](../../../../scripts/player/events/PlayerRequestStyleEvent.md)*

Source: `dataS/scripts/player/events/PlayerRequestStyleEvent.lua` — FS25 1.25.1.0

✍ Requête client vers serveur demandant l'apparence (style) actuelle d'un joueur donné. Le serveur répond par un `PlayerSetStyleEvent` envoyé uniquement à la connexion demandeuse.

- **PlayerRequestStyleEvent** hérite de `Event` (l.4)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlayerRequestStyleEvent.emptyNew() → table` | 11 | ✍ Crée une instance d'événement vide pour la lecture depuis un flux. |
| `PlayerRequestStyleEvent.new(playerObjectId: any)` | 18 | ✍ Construit la requête à partir de l'identifiant d'objet réseau du joueur dont le style est demandé. |
| `PlayerRequestStyleEvent:writeStream(streamId: integer, connection: table)` | 30 | ✍ Écrit l'identifiant d'objet réseau du joueur dans le flux. |
| `PlayerRequestStyleEvent:readStream(streamId: integer, connection: table)` | 38 | ✍ Lit l'identifiant de l'objet joueur, le résout en objet joueur via `NetworkUtil.getObject`, puis exécute l'événement. |
| `PlayerRequestStyleEvent:run(connection: table)` | 48 | ✍ Côté serveur uniquement : lit le style du joueur dans `graphicsComponent` et répond à l'expéditeur par un `PlayerSetStyleEvent`. Si le joueur est inconnu (déjà parti), seul un log d'information est écrit. |

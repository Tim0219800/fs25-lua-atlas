# player/events/PlayerSwitchedFarmEvent.lua

*[English version](../../../../scripts/player/events/PlayerSwitchedFarmEvent.md)*

Source: `dataS/scripts/player/events/PlayerSwitchedFarmEvent.lua` — FS25 1.25.1.0

✍ Notification serveur vers clients indiquant qu'un utilisateur est passé d'une ferme à une autre. Les clients mettent à jour les listes d'utilisateurs des fermes et publient `PLAYER_FARM_CHANGED`. Elle est diffusée par `PlayerSetFarmEvent` sur le serveur.

- **PlayerSwitchedFarmEvent** hérite de `Event` (l.6)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlayerSwitchedFarmEvent.emptyNew() → table` | 15 | ✍ Crée une instance d'événement vide pour la lecture depuis un flux. À noter : ce fichier ne définit pas de `new`, alors que `run` et `PlayerSetFarmEvent` appellent `PlayerSwitchedFarmEvent.new` (NON VÉRIFIÉ s'il est défini ailleurs). |
| `PlayerSwitchedFarmEvent:writeStream(streamId: integer, connection: table)` | 34 | ✍ Écrit l'identifiant de la nouvelle ferme, celui de l'ancienne et l'identifiant utilisateur. |
| `PlayerSwitchedFarmEvent:readStream(streamId: integer, connection: table)` | 44 | ✍ Lit l'identifiant de la nouvelle ferme, celui de l'ancienne et l'identifiant utilisateur, puis exécute l'événement. |
| `PlayerSwitchedFarmEvent:run(connection: table)` | 55 | ✍ Client : retire l'utilisateur de l'ancienne ferme et l'ajoute à la nouvelle (si valides et trouvées), puis publie `PLAYER_FARM_CHANGED` pour le joueur concerné. Serveur : rediffuse à tous les clients. À noter : la diffusion passe les identifiants dans un ordre différent de l'appel du constructeur dans `PlayerSetFarmEvent`. |

## Messages

- publie `MessageType.PLAYER_FARM_CHANGED` (l.72)

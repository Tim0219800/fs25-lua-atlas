# player/events/PlayerSetFarmEvent.lua

*[English version](../../../../scripts/player/events/PlayerSetFarmEvent.md)*

Source: `dataS/scripts/player/events/PlayerSetFarmEvent.lua` — FS25 1.25.1.0

✍ Événement servant à changer la ferme d'un joueur. Un client l'envoie au serveur, qui vérifie le mot de passe de la ferme (les utilisateurs maîtres l'ignorent), met à jour le joueur et les listes d'utilisateurs des fermes, puis répond par un `PlayerSetFarmAnswerEvent` et diffuse un `PlayerSwitchedFarmEvent`.

- **PlayerSetFarmEvent** hérite de `Event` (l.6)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlayerSetFarmEvent.emptyNew() → table` | 13 | ✍ Crée une instance d'événement vide pour la lecture depuis un flux. |
| `PlayerSetFarmEvent.new(player: table, farmId: integer, password: any) → table` | 23 | ✍ Construit l'événement avec le joueur, l'identifiant de la ferme cible et le mot de passe optionnel. |
| `PlayerSetFarmEvent:writeStream(streamId: integer, connection: table)` | 37 | ✍ Écrit l'objet joueur, l'identifiant de ferme et un mot de passe optionnel derrière un booléen. |
| `PlayerSetFarmEvent:readStream(streamId: integer, connection: table)` | 53 | ✍ Lit le joueur, l'identifiant de ferme et le mot de passe optionnel, puis exécute l'événement. |
| `PlayerSetFarmEvent:run(connection: table)` | 67 | ✍ Serveur : si la ferme existe et que l'utilisateur est maître ou que le mot de passe correspond (ou est absent), déplace l'utilisateur, met à jour le propriétaire du hotspot, publie `PLAYER_FARM_CHANGED`, remet à zéro le compteur de finances et répond OK ; sinon répond PASSWORD_REQUIRED. Client : applique l'identifiant de ferme localement et publie le message. À noter : le serveur ne vérifie pas que l'ancienne ferme existe. |
| `PlayerSetFarmEvent.sendEvent(player: table, farmId: integer, noEventSend: boolean?)` | 122 | ✍ Sauf si `noEventSend` est vrai, le serveur diffuse l'événement (hors connexion du joueur concerné) et un client l'envoie au serveur. Aucun mot de passe n'est transmis ici. |

## Messages

- publie `MessageType.PLAYER_FARM_CHANGED` (l.90)
- publie `MessageType.PLAYER_FARM_CHANGED` (l.113)

# player/events/PlayerSetStyleEvent.lua

*[English version](../../../../scripts/player/events/PlayerSetStyleEvent.md)*

Source: `dataS/scripts/player/events/PlayerSetStyleEvent.lua` — FS25 1.25.1.0

✍ Événement qui synchronise l'apparence (`PlayerStyle`) d'un joueur. Il sert aussi bien à un client annonçant son style au serveur, qui le relaie aux autres, qu'au serveur répondant à un `PlayerRequestStyleEvent`.

- **PlayerSetStyleEvent** hérite de `Event` (l.4)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlayerSetStyleEvent.emptyNew() → table` | 11 | ✍ Crée une instance d'événement vide pour la lecture depuis un flux. |
| `PlayerSetStyleEvent.new(player: any, style: any, playerObjectId: any)` | 18 | ✍ Construit l'événement avec un joueur, un objet style et éventuellement l'identifiant d'objet réseau du joueur (utilisé à la place du joueur s'il est défini). |
| `PlayerSetStyleEvent:writeStream(streamId: integer, connection: table)` | 32 | ✍ Écrit l'identifiant d'objet réseau du joueur (l'identifiant stocké s'il existe, sinon l'objet joueur) puis le style via son propre `writeStream`. |
| `PlayerSetStyleEvent:readStream(streamId: integer, connection: table)` | 48 | ✍ Lit l'identifiant de l'objet joueur, résout le joueur, crée un nouveau `PlayerStyle` et le lit depuis le flux, puis exécute l'événement. |
| `PlayerSetStyleEvent:run(connection: table)` | 65 | ✍ Sur le serveur, rediffuse aux autres clients. Puis applique le style via `player:setStyleAsync`, sans renvoi d'événement. Provoque une erreur si le joueur n'a pas pu être résolu (pas de test nil). |
| `PlayerSetStyleEvent.sendEvent(player: Player, style: PlayerStyle, playerObjectId: integer?, noEventSend: boolean?)` | 80 | ✍ Sauf si `noEventSend` est vrai, le serveur diffuse l'événement (hors connexion du joueur concerné) et un client l'envoie au serveur. |

# player/events/PlayerSetNicknameEvent.lua

*[English version](../../../../scripts/player/events/PlayerSetNicknameEvent.md)*

Source: `dataS/scripts/player/events/PlayerSetNicknameEvent.lua` — FS25 1.25.1.0

✍ Événement qui propage le changement de pseudo d'un joueur. Serveur et client transmettent simplement les données à `g_currentMission:setPlayerNickname` ; le client passe un indicateur supplémentaire, probablement pour éviter un renvoi (NON VÉRIFIÉ, la fonction est dans une classe absente du dump).

- **PlayerSetNicknameEvent** hérite de `Event` (l.4)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlayerSetNicknameEvent.emptyNew() → table` | 11 | ✍ Crée une instance d'événement vide pour la lecture depuis un flux. |
| `PlayerSetNicknameEvent.new(player: any, nickname: any, userId: any)` | 18 | ✍ Construit l'événement avec le joueur, le nouveau pseudo et l'identifiant utilisateur. |
| `PlayerSetNicknameEvent:writeStream(streamId: integer, connection: table)` | 32 | ✍ Écrit l'objet joueur, la chaîne du pseudo et l'identifiant utilisateur. |
| `PlayerSetNicknameEvent:readStream(streamId: integer, connection: table)` | 42 | ✍ Lit le joueur, le pseudo et l'identifiant utilisateur, puis exécute l'événement. |
| `PlayerSetNicknameEvent:run(connection: table)` | 53 | ✍ Appelle `g_currentMission:setPlayerNickname` avec les données ; côté client, un quatrième argument `true` est ajouté. Ses autres effets sont NON VÉRIFIÉS. |

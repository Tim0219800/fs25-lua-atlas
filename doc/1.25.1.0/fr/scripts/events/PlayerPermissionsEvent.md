# events/PlayerPermissionsEvent.lua

*[English version](../../../scripts/events/PlayerPermissionsEvent.md)*

Source: `dataS/scripts/events/PlayerPermissionsEvent.lua` — FS25 1.25.1.0

✍ Classe d'événement pour diffuser les permissions de ferme d'un joueur. Dans ce dump seule l'aide statique `sendEvent` est présente ; `new`, les méthodes de flux et `run` sont absents, donc le contenu de l'événement et son application sont NON VÉRIFIÉ.

- **PlayerPermissionsEvent** hérite de `Event` (l.4)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlayerPermissionsEvent.sendEvent(userId: integer, permissions: table, isFarmManager: boolean, noEventSend: boolean)` | 113 | ✍ Construit l'événement (sauf si `noEventSend` vaut true). Sur un serveur il le diffuse en passant le joueur trouvé via la ferme de l'utilisateur ; sur un client il l'envoie à la connexion serveur. Suppose que l'utilisateur appartient à une ferme. |

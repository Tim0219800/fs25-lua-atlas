# events/BaleUnpackEvent.lua

*[English version](../../../scripts/events/BaleUnpackEvent.md)*

Source: `dataS/scripts/events/BaleUnpackEvent.lua` — FS25 1.25.1.0

✍ Événement réseau demandant au serveur de déballer une balle (client vers serveur). Contrairement à des événements similaires, `run` n'est pas protégé : l'appel de déballage a lieu partout où l'événement s'exécute ; le comportement de `Bale:unpack` est NON VÉRIFIÉ (classe absente de ce fichier).

- **BaleUnpackEvent** hérite de `Event` (l.6)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `BaleUnpackEvent.emptyNew() → table` | 13 | ✍ Crée un événement vide, utilisé lors de la lecture d'un flux. |
| `BaleUnpackEvent.new(bale: table) → table` | 22 | ✍ Crée l'événement pour la balle donnée. |
| `BaleUnpackEvent:readStream(streamId: integer, connection: Connection)` | 32 | ✍ Côté serveur : lit l'objet node de la balle puis appelle `run`. Sur une connexion client rien n'est lu mais `run` est tout de même appelé. |
| `BaleUnpackEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Côté client : écrit l'objet node de la balle ; n'écrit rien quand l'envoi vient du serveur. |
| `BaleUnpackEvent:run(connection: Connection)` | 53 | ✍ Appelle `unpack()` sur la balle, sans test serveur/client. Échouerait sur une balle nil. |

# events/BaleOpenEvent.lua

*[English version](../../../scripts/events/BaleOpenEvent.md)*

Source: `dataS/scripts/events/BaleOpenEvent.lua` — FS25 1.25.1.0

✍ Événement réseau demandant au serveur d'ouvrir une balle (client vers serveur uniquement). Le serveur appelle `bale:open()` ; l'effet sur les autres clients est NON VÉRIFIÉ car `Bale` n'est pas dans ce fichier. La charge n'est écrite que par le client et lue que par le serveur.

- **BaleOpenEvent** hérite de `Event` (l.6)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `BaleOpenEvent.emptyNew() → table` | 13 | ✍ Crée un événement vide, utilisé lors de la lecture d'un flux. |
| `BaleOpenEvent.new(bale: table) → table` | 25 | ✍ Crée l'événement pour une balle. À noter : le commentaire de doc cite x, y, z mais la fonction ne prend que la balle. |
| `BaleOpenEvent:readStream(streamId: integer, connection: Connection)` | 35 | ✍ Côté serveur : lit l'objet node de la balle puis appelle `run`. Sur une connexion client rien n'est lu mais `run` est tout de même appelé. |
| `BaleOpenEvent:writeStream(streamId: integer, connection: Connection)` | 47 | ✍ Côté client : écrit l'objet node de la balle ; n'écrit rien quand l'envoi vient du serveur. |
| `BaleOpenEvent:run(connection: Connection)` | 56 | ✍ Serveur uniquement : appelle `open()` sur la balle. Ne fait rien côté client. |

# events/InlineBaleOpenEvent.lua

*[English version](../../../scripts/events/InlineBaleOpenEvent.md)*

Source: `dataS/scripts/events/InlineBaleOpenEvent.lua` — FS25 1.25.1.0

✍ Événement réseau demandant au serveur d'ouvrir une balle en ligne (balle d'une chaîne filmée) à une position monde. Envoyé par un client, appliqué sur le serveur via `openBaleAtPosition`, dont le comportement est NON VÉRIFIÉ (classe InlineBale absente de ce fichier).

- **InlineBaleOpenEvent** hérite de `Event` (l.6)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `InlineBaleOpenEvent.emptyNew() → table` | 13 | ✍ Crée un événement vide, utilisé lors de la lecture d'un flux. |
| `InlineBaleOpenEvent.new(inlineBale: table, x: number, y: number, z: number) → table` | 25 | ✍ Crée l'événement pour une balle en ligne et une position d'ouverture (x, y, z, coordonnées monde). |
| `InlineBaleOpenEvent:readStream(streamId: integer, connection: Connection)` | 38 | ✍ Côté serveur : lit l'objet node de la balle en ligne et trois coordonnées Float32, puis appelle `run`. |
| `InlineBaleOpenEvent:writeStream(streamId: integer, connection: Connection)` | 52 | ✍ Côté client : écrit l'objet node de la balle en ligne et les flottants x, y, z ; rien quand l'envoi vient du serveur. |
| `InlineBaleOpenEvent:run(connection: Connection)` | 64 | ✍ Serveur uniquement : appelle `openBaleAtPosition(x, y, z)` sur la balle en ligne. |

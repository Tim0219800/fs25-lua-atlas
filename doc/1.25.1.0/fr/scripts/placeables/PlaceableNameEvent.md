# placeables/PlaceableNameEvent.lua

*[English version](../../../scripts/placeables/PlaceableNameEvent.md)*

Source: `dataS/scripts/placeables/PlaceableNameEvent.lua` — FS25 1.25.1.0

✍ Événement réseau qui transporte un nom personnalisé pour un placeable. Un client l'envoie au serveur, qui applique le nom puis le rediffuse à tous les clients. Un nom nil signifie que le nom personnalisé est réinitialisé.

- **PlaceableNameEvent** hérite de `Event` (l.6)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableNameEvent.emptyNew()` | 12 | ✍ Crée une instance d'événement vide, utilisée par la couche réseau avant que `readStream` ne la remplisse. |
| `PlaceableNameEvent.new(placeable: any, name: any)` | 19 | ✍ Construit un événement pour un placeable et un nouveau nom. Passer nil comme nom marque l'événement comme une réinitialisation et stocke une chaîne vide. |
| `PlaceableNameEvent:readStream(streamId: any, connection: any)` | 31 | ✍ Lit depuis le flux l'objet placeable, un indicateur de réinitialisation et, hors réinitialisation, la chaîne du nom, puis appelle `run`. À noter : lors d'une réinitialisation, le champ du nom n'est pas affecté depuis le flux. |
| `PlaceableNameEvent:writeStream(streamId: any, connection: any)` | 43 | ✍ Écrit l'objet nœud du placeable et l'indicateur de réinitialisation, puis la chaîne du nom uniquement si l'événement n'est pas une réinitialisation. |
| `PlaceableNameEvent:run(connection: any)` | 52 | ✍ Applique le nom via `placeable:setName(name, true)` et l'écrit dans le log. Reçu côté serveur (la connexion n'est pas le serveur), il rediffuse l'événement aux clients. |
| `PlaceableNameEvent.sendEvent(placeable: any, name: any, noEventSend: any)` | 65 | ✍ Envoie un événement de nom sauf si `noEventSend` vaut true : le serveur le diffuse aux clients, un client l'envoie à la connexion du serveur. |

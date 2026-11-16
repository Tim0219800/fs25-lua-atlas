# placeables/specializations/events/PlaceableRiceFieldStateEvent.lua

*[English version](../../../../../scripts/placeables/specializations/events/PlaceableRiceFieldStateEvent.md)*

Source: `dataS/scripts/placeables/specializations/events/PlaceableRiceFieldStateEvent.lua` — FS25 1.25.1.0

✍ Événement réseau requête/réponse utilisé par le dialogue de rizière : un client demande au serveur l'état de culture d'un champ, et le serveur répond avec les index du type de culture et de l'état de croissance, que le client republie via le message center. Le sens est détecté avec `connection:getIsServer()`.

- **PlaceableRiceFieldStateEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableRiceFieldStateEvent.emptyNew() → table` | 14 | ✍ Crée un événement vide avec la métatable de la classe, sur le canal par défaut. |
| `PlaceableRiceFieldStateEvent.new(placeableRiceField: any, fieldIndex: any)` | 20 | ✍ Construit la requête client vers serveur : le placeable de rizière et l'index du champ dont l'état de culture est demandé. |
| `PlaceableRiceFieldStateEvent.newServerToClient(placeableRiceField: any, fieldIndex: any, fruitTypeIndex: any, growthStateIndex: any)` | 31 | ✍ Construit la réponse du serveur contenant l'index du champ, l'index du type de culture et l'index de l'état de croissance. |
| `PlaceableRiceFieldStateEvent:readStream(streamId: integer, connection: Connection)` | 47 | ✍ Lit la rizière et l'index du champ ; le type de culture (`FruitTypeManager.SEND_NUM_BITS` bits) et l'état de croissance ne sont lus que si les données viennent du serveur. Puis exécute l'événement. |
| `PlaceableRiceFieldStateEvent:writeStream(streamId: integer, connection: Connection)` | 63 | ✍ Écrit la rizière et l'index du champ ; lors d'un envoi vers un client, écrit aussi le type de culture et l'état de croissance. Miroir de `readStream`. |
| `PlaceableRiceFieldStateEvent:run(connection: Connection)` | 77 | ✍ Sur le serveur, interroge `getRiceFieldState` et répond à l'expéditeur par un événement serveur vers client ; sur un client, publie le type de culture et l'état de croissance sur `g_messageCenter` (utilisé par le dialogue de rizière). Ignoré si le champ n'est pas synchronisé. |

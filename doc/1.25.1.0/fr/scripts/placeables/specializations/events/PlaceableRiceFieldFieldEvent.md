# placeables/specializations/events/PlaceableRiceFieldFieldEvent.lua

*[English version](../../../../../scripts/placeables/specializations/events/PlaceableRiceFieldFieldEvent.md)*

Source: `dataS/scripts/placeables/specializations/events/PlaceableRiceFieldFieldEvent.lua` — FS25 1.25.1.0

✍ Événement réseau qui soumet une rizière nouvellement dessinée (polygone, hauteur, hauteur d'eau) au côté récepteur d'un PlaceableRiceField. Le récepteur construit le champ et le finalise, puis répond avec PlaceableRiceFieldFieldAnswerEvent. Il est prévu d'aller du client vers le serveur, mais ce fichier ne vérifie pas quel côté l'exécute.

- **PlaceableRiceFieldFieldEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableRiceFieldFieldEvent.emptyNew() → table` | 14 | ✍ Crée un événement vide lié au canal réseau principal (`NetworkNode.CHANNEL_MAIN`). |
| `PlaceableRiceFieldFieldEvent.new(placeableRiceField: any, field: any)` | 20 | ✍ Construit l'événement à partir du placeable de rizière et d'une table de champ contenant hauteur, polygone et hauteur d'eau. |
| `PlaceableRiceFieldFieldEvent:readStream(streamId: integer, connection: Connection)` | 33 | ✍ Lit la rizière, la hauteur, le nombre de sommets et les sommets 2D, puis la hauteur d'eau, en créant le champ via `createNewField` et un `Polygon2D`, puis exécute l'événement. À noter : la rizière n'est pas testée contre nil avant `createNewField`. |
| `PlaceableRiceFieldFieldEvent:writeStream(streamId: integer, connection: Connection)` | 57 | ✍ Écrit la rizière, la hauteur du champ, le nombre de sommets et chaque coordonnée de sommet du polygone en Float32, puis la hauteur d'eau. |
| `PlaceableRiceFieldFieldEvent:run(connection: Connection)` | 74 | ✍ Si la rizière est synchronisée, appelle `finalizeNewField` avec le nouveau champ et un indicateur à true ; son callback répond à l'expéditeur par un PlaceableRiceFieldFieldAnswerEvent contenant le code de statut. |

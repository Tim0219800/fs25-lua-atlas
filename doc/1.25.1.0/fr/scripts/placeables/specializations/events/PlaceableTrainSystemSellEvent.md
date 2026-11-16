# placeables/specializations/events/PlaceableTrainSystemSellEvent.lua

*[English version](../../../../../scripts/placeables/specializations/events/PlaceableTrainSystemSellEvent.md)*

Source: `dataS/scripts/placeables/specializations/events/PlaceableTrainSystemSellEvent.lua` — FS25 1.25.1.0

✍ Événement réseau client vers serveur demandant à un PlaceableTrainSystem de vendre ses marchandises. Le serveur exécute `sellGoods` ; les effets sur l'argent ou les niveaux sont implémentés ailleurs (NON VÉRIFIÉ).

- **PlaceableTrainSystemSellEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableTrainSystemSellEvent.emptyNew() → table` | 14 | ✍ Crée une instance d'événement vide avec la métatable de la classe, utilisée par la couche réseau avant la lecture d'un flux. |
| `PlaceableTrainSystemSellEvent.new(object: table) → PlaceableTrainSystemSellEvent` | 22 | ✍ Construit l'événement à partir de l'objet système ferroviaire. |
| `PlaceableTrainSystemSellEvent:readStream(streamId: integer, connection: Connection)` | 32 | ✍ Lit l'objet dans le flux et exécute l'événement. |
| `PlaceableTrainSystemSellEvent:writeStream(streamId: integer, connection: Connection)` | 41 | ✍ Écrit uniquement la référence de l'objet système ferroviaire. |
| `PlaceableTrainSystemSellEvent:run(connection: Connection)` | 48 | ✍ Agit uniquement côté serveur (quand la connexion n'est pas celle du serveur) : si l'objet est synchronisé, appelle `sellGoods` dessus. Aucune rediffusion. |

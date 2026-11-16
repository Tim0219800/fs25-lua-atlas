# placeables/specializations/events/PlaceableRiceFieldFieldAnswerEvent.lua

*[English version](../../../../../scripts/placeables/specializations/events/PlaceableRiceFieldFieldAnswerEvent.md)*

Source: `dataS/scripts/placeables/specializations/events/PlaceableRiceFieldFieldAnswerEvent.lua` — FS25 1.25.1.0

✍ Événement réseau envoyé par le serveur à un client pour signaler le résultat (code de statut) d'une demande de création de rizière faite avec PlaceableRiceFieldFieldEvent. Le client ne fait que republier le code sur le message center ; la signification des codes est définie ailleurs (NON VÉRIFIÉ).

- **PlaceableRiceFieldFieldAnswerEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableRiceFieldFieldAnswerEvent.emptyNew() → table` | 14 | ✍ Crée un événement vide lié au canal réseau principal (`NetworkNode.CHANNEL_MAIN`). |
| `PlaceableRiceFieldFieldAnswerEvent.new(placeableRiceField: any, statusCode: any)` | 20 | ✍ Construit l'événement de réponse à partir du placeable de rizière et d'un code de statut numérique. |
| `PlaceableRiceFieldFieldAnswerEvent:readStream(streamId: integer, connection: Connection)` | 33 | ✍ Lit l'objet rizière et un code de statut UInt8, puis exécute l'événement immédiatement. |
| `PlaceableRiceFieldFieldAnswerEvent:writeStream(streamId: integer, connection: Connection)` | 45 | ✍ Écrit l'objet rizière et le code de statut UInt8. |
| `PlaceableRiceFieldFieldAnswerEvent:run(connection: Connection)` | 54 | ✍ Si la rizière existe et est synchronisée, publie le code de statut sur `g_messageCenter` avec la classe de l'événement comme sujet. L'écouteur qui le consomme n'est pas dans ce fichier. |

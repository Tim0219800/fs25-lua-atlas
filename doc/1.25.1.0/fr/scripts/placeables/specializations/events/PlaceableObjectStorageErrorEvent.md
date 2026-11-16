# placeables/specializations/events/PlaceableObjectStorageErrorEvent.lua

*[English version](../../../../../scripts/placeables/specializations/events/PlaceableObjectStorageErrorEvent.md)*

Source: `dataS/scripts/placeables/specializations/events/PlaceableObjectStorageErrorEvent.lua` — FS25 1.25.1.0

✍ Événement réseau (sous-classe d'Event) envoyé du serveur à un client pour signaler l'échec d'une action de stockage d'objets. Le client n'affiche un avertissement clignotant que pour la ferme propriétaire et si le joueur est assez proche du stockage. Les identifiants d'erreur et les constantes de distance sont définis ailleurs dans cette classe.

- **PlaceableObjectStorageErrorEvent** hérite de `Event` (l.18)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableObjectStorageErrorEvent.emptyNew() → table` | 25 | ✍ Crée une instance d'événement vide pour la lecture de flux. |
| `PlaceableObjectStorageErrorEvent.new(placeable: table, errorId: integer)` | 33 | ✍ Crée l'événement avec le placeable de stockage et un identifiant d'erreur. |
| `PlaceableObjectStorageErrorEvent:readStream(streamId: integer, connection: Connection)` | 44 | ✍ Lit le placeable et l'identifiant d'erreur (`SEND_NUM_BITS` bits), puis appelle `run`. |
| `PlaceableObjectStorageErrorEvent:writeStream(streamId: integer, connection: Connection)` | 54 | ✍ Écrit le placeable et l'identifiant d'erreur (`SEND_NUM_BITS` bits). |
| `PlaceableObjectStorageErrorEvent:run(connection: Connection)` | 62 | ✍ Si le placeable est synchronisé, appartient à la ferme locale et se trouve à moins de `SHOW_WARNING_DISTANCE` (XZ) du client, affiche un avertissement clignotant selon l'erreur : pas assez de place, stockage plein, limite d'emplacements de balles ou de palettes, objet non pris en charge, ou quantité maximale atteinte. |

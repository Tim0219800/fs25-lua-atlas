# vehicles/specializations/events/TrailerToggleTipSideEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/TrailerToggleTipSideEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/TrailerToggleTipSideEvent.lua` — FS25 1.25.1.0

✍ Événement réseau qui synchronise le côté de bennage préféré d'une remorque entre serveur et clients. Fait partie des événements des spécialisations de véhicule ; le récepteur n'agit que si l'objet cible est synchronisé.

- **TrailerToggleTipSideEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `TrailerToggleTipSideEvent.emptyNew() → table` | 14 | ✍ Crée une instance d'événement vide avec la métatable de l'événement, utilisée quand la couche réseau reçoit cet événement. |
| `TrailerToggleTipSideEvent.new(object: table, tipSideIndex: integer)` | 25 | ✍ Construit l'événement avec les données à envoyer (un objet nœud et un indice de côté de bennage (Trailer.TIP_SIDE_NUM_BITS bits)) ; elles sont conservées sur l'instance pour `writeStream`. |
| `TrailerToggleTipSideEvent:readStream(streamId: integer, connection: Connection)` | 36 | ✍ Lit un objet nœud et un indice de côté de bennage (Trailer.TIP_SIDE_NUM_BITS bits) depuis le flux, puis appelle `run(connection)`. |
| `TrailerToggleTipSideEvent:writeStream(streamId: integer, connection: Connection)` | 47 | ✍ Écrit un objet nœud et un indice de côté de bennage (Trailer.TIP_SIDE_NUM_BITS bits) dans le flux (même ordre que `readStream`). |
| `TrailerToggleTipSideEvent:run(connection: Connection)` | 55 | ✍ Applique l'événement côté récepteur : sur le serveur, se retransmet, puis appelle `setPreferedTipSide(indice, true)` sur l'objet s'il est synchronisé. |

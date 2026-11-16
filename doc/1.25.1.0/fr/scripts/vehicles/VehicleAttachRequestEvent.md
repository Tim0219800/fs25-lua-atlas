# vehicles/VehicleAttachRequestEvent.lua

*[English version](../../../scripts/vehicles/VehicleAttachRequestEvent.md)*

Source: `dataS/scripts/vehicles/VehicleAttachRequestEvent.lua` — FS25 1.25.1.0

✍ Événement réseau qu'un client envoie au serveur pour demander l'attelage d'un outil. Il contient le véhicule porteur, l'outil attelable et les indices de description d'articulation des deux. Le serveur exécute alors `attachImplementFromInfo` ; l'attelage effectif est annoncé aux clients par `VehicleAttachEvent`.

- **VehicleAttachRequestEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `VehicleAttachRequestEvent.emptyNew() → table` | 14 | ✍ Crée une instance d'événement vide pour la désérialisation depuis un flux. |
| `VehicleAttachRequestEvent.new(info: table) → table` | 22 | ✍ Construit la demande à partir d'une table d'informations (`attacherVehicle`, `attachable`, `attacherVehicleJointDescIndex`, `attachableJointDescIndex`). |
| `VehicleAttachRequestEvent:readStream(streamId: integer, connection: Connection)` | 35 | ✍ Lit les deux objets et les deux indices de description d'articulation sur 7 bits, puis appelle `run`. |
| `VehicleAttachRequestEvent:writeStream(streamId: integer, connection: Connection)` | 47 | ✍ Écrit dans le flux les deux objets et les deux indices de description d'articulation (7 bits chacun). |
| `VehicleAttachRequestEvent:run(connection: Connection)` | 57 | ✍ Serveur uniquement : si le véhicule porteur est synchronisé, appelle `attachImplementFromInfo` avec cet événement comme informations. Ignoré côté client. |

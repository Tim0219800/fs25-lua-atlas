# vehicles/specializations/events/WearableRepaintEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/WearableRepaintEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/WearableRepaintEvent.lua` — FS25 1.25.1.0

✍ Événement réseau demandant la remise en peinture d'un véhicule soumis à l'usure. Après la peinture, le serveur le retransmet pour que les clients actualisent leur interface, et le message VEHICLE_REPAINTED est publié. Fait partie des événements des spécialisations de véhicule ; le récepteur n'agit que si l'objet cible est synchronisé.

- **WearableRepaintEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `WearableRepaintEvent.emptyNew() → table` | 14 | ✍ Crée une instance d'événement vide avec la métatable de l'événement, utilisée quand la couche réseau reçoit cet événement. |
| `WearableRepaintEvent.new(vehicle: table)` | 21 | ✍ Construit l'événement avec les données à envoyer (uniquement l'objet nœud du véhicule) ; elles sont conservées sur l'instance pour `writeStream`. |
| `WearableRepaintEvent:readStream(streamId: integer, connection: Connection)` | 31 | ✍ Lit uniquement l'objet nœud du véhicule depuis le flux, puis appelle `run(connection)`. |
| `WearableRepaintEvent:writeStream(streamId: integer, connection: Connection)` | 40 | ✍ Écrit uniquement l'objet nœud du véhicule dans le flux (même ordre que `readStream`). |
| `WearableRepaintEvent:run(connection: Connection)` | 47 | ✍ Applique l'événement côté récepteur : appelle `repaintVehicle()` si le véhicule l'a ; sur le serveur il retransmet l'événement, et publie MessageType.VEHICLE_REPAINTED dans le centre de messages. |

## Messages

- publie `MessageType.VEHICLE_REPAINTED` (l.56)

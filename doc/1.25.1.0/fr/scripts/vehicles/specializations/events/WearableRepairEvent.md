# vehicles/specializations/events/WearableRepairEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/WearableRepairEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/WearableRepairEvent.lua` — FS25 1.25.1.0

✍ Événement réseau demandant la réparation d'un véhicule soumis à l'usure, éventuellement indiquée comme faite à un point de vente. Le serveur le retransmet pour l'interface et VEHICLE_REPAIRED est publié. Fait partie des événements des spécialisations de véhicule ; le récepteur n'agit que si l'objet cible est synchronisé.

- **WearableRepairEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `WearableRepairEvent.emptyNew() → table` | 14 | ✍ Crée une instance d'événement vide avec la métatable de l'événement, utilisée quand la couche réseau reçoit cet événement. |
| `WearableRepairEvent.new(vehicle: table, atSellingPoint: any)` | 21 | ✍ Construit l'événement avec les données à envoyer (un objet nœud et un booléen « au point de vente ») ; elles sont conservées sur l'instance pour `writeStream`. |
| `WearableRepairEvent:readStream(streamId: integer, connection: Connection)` | 32 | ✍ Lit un objet nœud et un booléen « au point de vente » depuis le flux, puis appelle `run(connection)`. |
| `WearableRepairEvent:writeStream(streamId: integer, connection: Connection)` | 42 | ✍ Écrit un objet nœud et un booléen « au point de vente » dans le flux (même ordre que `readStream`). |
| `WearableRepairEvent:run(connection: Connection)` | 50 | ✍ Applique l'événement côté récepteur : appelle `repairVehicle(auPointDeVente)` si le véhicule l'a ; sur le serveur il retransmet l'événement, et publie MessageType.VEHICLE_REPAIRED avec l'indicateur. |

## Messages

- publie `MessageType.VEHICLE_REPAIRED` (l.59)

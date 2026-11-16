# vehicles/specializations/events/MountableSetMountTypeEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/MountableSetMountTypeEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/MountableSetMountTypeEvent.lua` — FS25 1.25.1.0

✍ Classe d'événement réseau `MountableSetMountTypeEvent` (hérite de `Event`) qui réplique le type de montage dynamique d'un objet montable. Elle transporte l'objet, un type de montage (`MountableObject.MOUNT_TYPE_SEND_NUM_BITS` bits) et un objet de montage optionnel. Elle fait partie des événements de spécialisations de véhicules et ne définit rien d'autre.

- **MountableSetMountTypeEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `MountableSetMountTypeEvent.emptyNew() → table` | 14 | ✍ Crée une instance vide de `MountableSetMountTypeEvent` sans données, utilisée quand l'événement est lu depuis un flux réseau. |
| `MountableSetMountTypeEvent.new(object: table, mountType: boolean, mountObject: any)` | 23 | ✍ Crée l'événement avec ses données : l'objet, un type de montage (`MountableObject.MOUNT_TYPE_SEND_NUM_BITS` bits) et un objet de montage optionnel. |
| `MountableSetMountTypeEvent:readStream(streamId: integer, connection: Connection)` | 35 | ✍ Lit les données de l'événement depuis le flux réseau (l'objet, un type de montage (`MountableObject.MOUNT_TYPE_SEND_NUM_BITS` bits) et un objet de montage optionnel), puis appelle `run`. |
| `MountableSetMountTypeEvent:writeStream(streamId: integer, connection: Connection)` | 50 | ✍ Écrit les données de l'événement dans le flux réseau (l'objet, un type de montage (`MountableObject.MOUNT_TYPE_SEND_NUM_BITS` bits) et un objet de montage optionnel). |
| `MountableSetMountTypeEvent:run(connection: Connection)` | 62 | ✍ Exécute l'événement côté réception : appelle `setDynamicMountType(mountType, mountObject, true)` sur l'objet. Sur le serveur, il retransmet aussi l'événement aux autres clients, sauf l'émetteur. |
| `MountableSetMountTypeEvent.sendEvent(vehicle: table, mountType: boolean, mountObject: boolean, noEventSend: boolean)` | 78 | ✍ Fonction utilitaire d'envoi : le serveur diffuse l'événement aux clients, un client l'envoie au serveur. Ignorée si `noEventSend` est activé. |

# vehicles/specializations/events/VehicleSetLightEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/VehicleSetLightEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/VehicleSetLightEvent.lua` — FS25 1.25.1.0

✍ Événement réseau qui synchronise le masque binaire des feux d'un véhicule. La largeur du masque est envoyée d'abord sur 5 bits, puis le masque lui-même. Fait partie des événements des spécialisations de véhicule ; le récepteur n'agit que si l'objet cible est synchronisé.

- **VehicleSetLightEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `VehicleSetLightEvent.emptyNew() → table` | 14 | ✍ Crée une instance d'événement vide avec la métatable de l'événement, utilisée quand la couche réseau reçoit cet événement. |
| `VehicleSetLightEvent.new(object: table, lightsTypesMask: integer, numBits: any)` | 23 | ✍ Construit l'événement avec les données à envoyer (un objet nœud, un nombre de bits (5 bits) et le masque de types de feux sur ce nombre de bits) ; elles sont conservées sur l'instance pour `writeStream`. |
| `VehicleSetLightEvent:readStream(streamId: integer, connection: Connection)` | 35 | ✍ Lit un objet nœud, un nombre de bits (5 bits) et le masque de types de feux sur ce nombre de bits depuis le flux, puis appelle `run(connection)`. |
| `VehicleSetLightEvent:writeStream(streamId: integer, connection: Connection)` | 46 | ✍ Écrit un objet nœud, un nombre de bits (5 bits) et le masque de types de feux sur ce nombre de bits dans le flux (même ordre que `readStream`). |
| `VehicleSetLightEvent:run(connection: Connection)` | 55 | ✍ Applique l'événement côté récepteur : appelle `setLightsTypesMask(masque, true, true)` sur l'objet s'il est synchronisé, puis le serveur retransmet aux autres clients. |

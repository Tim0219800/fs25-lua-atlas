# vehicles/specializations/events/VehicleSetBeaconLightEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/VehicleSetBeaconLightEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/VehicleSetBeaconLightEvent.lua` — FS25 1.25.1.0

✍ Événement réseau qui synchronise la visibilité du gyrophare d'un véhicule entre serveur et clients. Fait partie des événements des spécialisations de véhicule ; le récepteur n'agit que si l'objet cible est synchronisé.

- **VehicleSetBeaconLightEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `VehicleSetBeaconLightEvent.emptyNew() → table` | 14 | ✍ Crée une instance d'événement vide avec la métatable de l'événement, utilisée quand la couche réseau reçoit cet événement. |
| `VehicleSetBeaconLightEvent.new(object: table, active: boolean)` | 23 | ✍ Construit l'événement avec les données à envoyer (un objet nœud et un booléen d'activation) ; elles sont conservées sur l'instance pour `writeStream`. |
| `VehicleSetBeaconLightEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Lit un objet nœud et un booléen d'activation depuis le flux, puis appelle `run(connection)`. |
| `VehicleSetBeaconLightEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Écrit un objet nœud et un booléen d'activation dans le flux (même ordre que `readStream`). |
| `VehicleSetBeaconLightEvent:run(connection: Connection)` | 52 | ✍ Applique l'événement côté récepteur : appelle `setBeaconLightsVisibility(actif, true, true)` sur l'objet s'il est synchronisé, puis le serveur retransmet aux autres clients. |

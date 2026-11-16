# vehicles/VehicleDetachEvent.lua

*[English version](../../../scripts/vehicles/VehicleDetachEvent.md)*

Source: `dataS/scripts/vehicles/VehicleDetachEvent.lua` — FS25 1.25.1.0

✍ Événement réseau annonçant qu'un outil a été dételé d'un véhicule. Contrairement à la plupart des événements voisins, le traitement se fait directement dans `readStream` ; `run` est vide. L'argument passé à `detachImplementByObject` dépend de l'expéditeur (serveur ou non).

- **VehicleDetachEvent** hérite de `Event` (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `VehicleDetachEvent.emptyNew() → table` | 18 | ✍ Crée une instance d'événement vide pour la désérialisation depuis un flux. |
| `VehicleDetachEvent.new(vehicle: table, implement: table) → table` | 28 | ✍ Construit l'événement à partir du véhicule et de l'outil à dételer. |
| `VehicleDetachEvent:readStream(streamId: integer, connection: Connection)` | 39 | ✍ Lit le véhicule et l'outil puis, si le véhicule est synchronisé, appelle `detachImplementByObject` ; passe `true` en second argument seulement quand l'expéditeur est le serveur. |
| `VehicleDetachEvent:writeStream(streamId: integer, connection: Connection)` | 56 | ✍ Écrit dans le flux les objets véhicule et outil. |
| `VehicleDetachEvent:run(connection: any)` | 63 | ✍ Vide : tout le traitement est fait dans `readStream`. |

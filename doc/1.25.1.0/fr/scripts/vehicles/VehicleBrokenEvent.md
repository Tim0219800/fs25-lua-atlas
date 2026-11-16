# vehicles/VehicleBrokenEvent.lua

*[English version](../../../scripts/vehicles/VehicleBrokenEvent.md)*

Source: `dataS/scripts/vehicles/VehicleBrokenEvent.lua` — FS25 1.25.1.0

✍ Événement réseau minimal qui marque un véhicule comme cassé chez le destinataire. Il ne transporte que l'objet véhicule et appelle `setBroken` dessus.

- **VehicleBrokenEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `VehicleBrokenEvent.emptyNew() → table` | 14 | ✍ Crée une instance d'événement vide pour la désérialisation depuis un flux. |
| `VehicleBrokenEvent.new(object: table) → table` | 24 | ✍ Construit l'événement pour l'objet véhicule donné (stocké dans `self.object`). |
| `VehicleBrokenEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Lit l'objet véhicule depuis le flux et appelle `run`. |
| `VehicleBrokenEvent:writeStream(streamId: integer, connection: Connection)` | 43 | ✍ Écrit l'objet véhicule dans le flux. |
| `VehicleBrokenEvent:run(connection: Connection)` | 50 | ✍ Si l'objet existe et est synchronisé, appelle son `setBroken()`. Ne rediffuse pas. |

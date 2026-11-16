# vehicles/VehicleSetIsReconfiguratingEvent.lua

*[English version](../../../scripts/vehicles/VehicleSetIsReconfiguratingEvent.md)*

Source: `dataS/scripts/vehicles/VehicleSetIsReconfiguratingEvent.lua` — FS25 1.25.1.0

✍ Événement réseau envoyé à un client qui rejoint la partie pour marquer un véhicule comme en reconfiguration. Il ne transporte que la référence du véhicule ; le récepteur met `isReconfigurating` à true sur ce véhicule une fois celui-ci synchronisé. Il étend `Event`.

- **VehicleSetIsReconfiguratingEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `VehicleSetIsReconfiguratingEvent.emptyNew() → table` | 14 | ✍ Crée une instance d'événement vide, utilisée par la couche réseau avant la lecture d'un flux. |
| `VehicleSetIsReconfiguratingEvent.new(object: table)` | 23 | ✍ Crée l'événement pour l'objet véhicule donné. À noter : le commentaire de doc cite un paramètre `state` que la fonction n'a pas. |
| `VehicleSetIsReconfiguratingEvent:readStream(streamId: integer, connection: Connection)` | 33 | ✍ Lit l'objet véhicule dans le flux et, s'il existe et est déjà synchronisé, met son indicateur `isReconfigurating` à true. |
| `VehicleSetIsReconfiguratingEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Écrit la référence du véhicule dans le flux. |

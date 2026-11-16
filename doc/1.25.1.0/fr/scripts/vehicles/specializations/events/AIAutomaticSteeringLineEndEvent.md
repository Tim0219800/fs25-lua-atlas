# vehicles/specializations/events/AIAutomaticSteeringLineEndEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/AIAutomaticSteeringLineEndEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/AIAutomaticSteeringLineEndEvent.lua` — FS25 1.25.1.0

✍ Événement réseau qui indique aux pairs qu'un véhicule a atteint la fin d'une ligne de guidage automatique, en déclenchant `onAIAutomaticSteeringLineEnd` sur le véhicule. Il ne transporte que la référence du véhicule.

- **AIAutomaticSteeringLineEndEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIAutomaticSteeringLineEndEvent.emptyNew() → table` | 14 | ✍ Crée une instance d'événement vide avec la métatable de la classe ; utilisée par la couche réseau avant que `readStream` ne la remplisse. |
| `AIAutomaticSteeringLineEndEvent.new(vehicle: table, state: integer, segmentIndex: any, segmentIsLeft: any)` | 23 | ✍ Crée l'événement pour un véhicule. À noter : les paramètres supplémentaires (state, segmentIndex, segmentIsLeft) sont acceptés mais ignorés. |
| `AIAutomaticSteeringLineEndEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Lit la référence du véhicule et appelle immédiatement `run`. |
| `AIAutomaticSteeringLineEndEvent:writeStream(streamId: integer, connection: Connection)` | 43 | ✍ Écrit seulement la référence du véhicule. |
| `AIAutomaticSteeringLineEndEvent:run(connection: Connection)` | 50 | ✍ Si le véhicule est synchronisé, déclenche sur lui l'événement de spécialisation `onAIAutomaticSteeringLineEnd`. Pas de rediffusion ici. |

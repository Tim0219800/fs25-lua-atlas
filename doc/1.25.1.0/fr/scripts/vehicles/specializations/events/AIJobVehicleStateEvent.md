# vehicles/specializations/events/AIJobVehicleStateEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/AIJobVehicleStateEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/AIJobVehicleStateEvent.lua` — FS25 1.25.1.0

✍ Événement serveur vers client indiquant aux clients qu'un job IA a démarré ou s'est terminé sur un véhicule. Le job est envoyé par son id et recherché dans le système IA du client, il doit donc déjà y exister.

- **AIJobVehicleStateEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIJobVehicleStateEvent.emptyNew() → table` | 14 | ✍ Crée une instance d'événement vide avec la métatable de la classe ; utilisée par la couche réseau avant que `readStream` ne la remplisse. |
| `AIJobVehicleStateEvent.new(vehicle: table, job: boolean, helperIndex: any, startedFarmId: any)` | 23 | ✍ Crée l'événement pour un véhicule avec le job IA (nil quand le job est terminé), l'indice d'assistant et l'id de la ferme qui l'a lancé. |
| `AIJobVehicleStateEvent:readStream(streamId: integer, connection: Connection)` | 38 | ✍ Lit le véhicule et, si indiqué, l'id du job (résolu via `g_currentMission.aiSystem`), l'id de ferme et l'indice d'assistant, puis appelle `run`. |
| `AIJobVehicleStateEvent:writeStream(streamId: integer, connection: Connection)` | 55 | ✍ Écrit le véhicule, un indicateur de présence du job et, s'il existe, id du job, id de ferme et indice d'assistant. Vérifie par assertion un usage serveur vers client. |
| `AIJobVehicleStateEvent:run(connection: Connection)` | 69 | ✍ Sur un véhicule synchronisé, appelle `aiJobStarted(job, helperIndex, farmId)` si un job est défini, sinon `aiJobFinished()`. |

# ai/events/AIJobStartEvent.lua

*[English version](../../../../scripts/ai/events/AIJobStartEvent.md)*

Source: `dataS/scripts/ai/events/AIJobStartEvent.lua` — FS25 1.25.1.0

✍ Événement serveur vers client qui indique aux clients qu'un job IA a démarré : il transporte l'id de ferme, l'index du type de job et les données du job, puis démarre le job localement via `aiSystem:startJobInternal`.

- **AIJobStartEvent** hérite de `Event` (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIJobStartEvent.emptyNew()` | 17 | ✍ Crée un événement vide pour la reconstruction depuis un flux. |
| `AIJobStartEvent.new(job: any, startFarmId: any)` | 24 | ✍ Crée l'événement pour un job et l'id de la ferme qui le démarre. |
| `AIJobStartEvent:readStream(streamId: any, connection: any)` | 35 | ✍ Vérifie que l'émetteur est le serveur, lit l'id de ferme et l'index du type, crée le job via `aiJobTypeManager:createJob`, lit ses données et exécute l'événement. |
| `AIJobStartEvent:writeStream(streamId: any, connection: any)` | 49 | ✍ Écrit l'id de ferme, l'index du type de job (via `aiJobTypeManager:getJobTypeIndex`) et les données du job. |
| `AIJobStartEvent:run(connection: any)` | 58 | ✍ Démarre le job via `g_currentMission.aiSystem:startJobInternal` avec l'id de ferme. |

# ai/events/AIJobSkipTaskEvent.lua

*[English version](../../../../scripts/ai/events/AIJobSkipTaskEvent.md)*

Source: `dataS/scripts/ai/events/AIJobSkipTaskEvent.lua` — FS25 1.25.1.0

✍ Événement réseau envoyé par un client pour que le serveur saute la tâche en cours d'un job IA ; il ne transporte que l'id du job et publie `MessageType.AI_TASK_SKIPPED` sur mobile. Il vérifie par assertion le sens client vers serveur.

- **AIJobSkipTaskEvent** hérite de `Event` (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIJobSkipTaskEvent.emptyNew()` | 17 | ✍ Crée un événement vide, utilisé quand l'événement est reconstruit depuis un flux. |
| `AIJobSkipTaskEvent.new(job: any)` | 24 | ✍ Crée l'événement pour le job donné. |
| `AIJobSkipTaskEvent:readStream(streamId: any, connection: any)` | 34 | ✍ Lit l'id du job, retrouve le job via `g_currentMission.aiSystem:getJobById` et exécute l'événement aussitôt. |
| `AIJobSkipTaskEvent:writeStream(streamId: any, connection: any)` | 43 | ✍ Écrit l'id du job en int32. |
| `AIJobSkipTaskEvent:run(connection: any)` | 49 | ✍ Vérifie qu'il s'exécute côté serveur, puis appelle `aiSystem:skipCurrentTaskInternal` pour le job. Publie `AI_TASK_SKIPPED` sur plateforme mobile. |

## Messages

- publie `MessageType.AI_TASK_SKIPPED` (l.55)

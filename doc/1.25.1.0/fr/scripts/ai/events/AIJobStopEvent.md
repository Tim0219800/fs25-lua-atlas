# ai/events/AIJobStopEvent.lua

*[English version](../../../../scripts/ai/events/AIJobStopEvent.md)*

Source: `dataS/scripts/ai/events/AIJobStopEvent.lua` — FS25 1.25.1.0

✍ Événement qui arrête un job IA et transporte éventuellement le message IA expliquant pourquoi. Le serveur le diffuse aux clients ; la requête d'un client est appliquée sur le serveur via `aiSystem:stopJob`.

- **AIJobStopEvent** hérite de `Event` (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIJobStopEvent.emptyNew()` | 17 | ✍ Crée un événement vide pour la reconstruction depuis un flux. |
| `AIJobStopEvent.new(job: any, aiMessage: any)` | 24 | ✍ Crée l'événement pour un job et un message IA optionnel (peut être nil). |
| `AIJobStopEvent:readStream(streamId: any, connection: any)` | 35 | ✍ Lit l'id du job et retrouve le job, puis, si un drapeau est levé, lit un index de message, crée le message via `aiMessageManager:createMessage` et le laisse lire ses données. Exécute l'événement. |
| `AIJobStopEvent:writeStream(streamId: any, connection: any)` | 51 | ✍ Écrit l'id du job, un booléen de présence du message et, s'il existe, l'index du message et ses propres données. |
| `AIJobStopEvent:run(connection: any)` | 62 | ✍ Ne fait rien si le job est inconnu. Sur un client appelle `aiSystem:stopJobInternal` avec le message ; sur le serveur appelle `aiSystem:stopJob`. |

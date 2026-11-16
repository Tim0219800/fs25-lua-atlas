# ai/events/AIJobStartRequestEvent.lua

*[English version](../../../../scripts/ai/events/AIJobStartRequestEvent.md)*

Source: `dataS/scripts/ai/events/AIJobStartRequestEvent.lua` — FS25 1.25.1.0

✍ Événement bidirectionnel pour démarrer un job IA. Le client envoie le job et l'id de ferme ; le serveur vérifie `getIsStartable`, répond par un code d'état et, si c'est possible, démarre le job via `aiSystem:startJob`. Le client publie ensuite la réponse sur le centre de messages.

- **AIJobStartRequestEvent** hérite de `Event` (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIJobStartRequestEvent.emptyNew()` | 17 | ✍ Crée un événement vide pour la reconstruction depuis un flux. |
| `AIJobStartRequestEvent.new(job: any, startFarmId: any)` | 24 | ✍ Crée la requête client vers serveur pour un job et un id de ferme. |
| `AIJobStartRequestEvent.newServerToClient(state: any, jobTypeIndex: any)` | 35 | ✍ Crée la réponse du serveur avec un code d'état (0 est envoyé quand le job est accepté) et l'index du type de job. |
| `AIJobStartRequestEvent:readStream(streamId: any, connection: any)` | 46 | ✍ Sur le serveur lit l'id de ferme, le type (uint16) et les données du job ; sur un client lit l'état (uint8) et l'index du type. Puis exécute l'événement. |
| `AIJobStartRequestEvent:writeStream(streamId: any, connection: any)` | 62 | ✍ Miroir de `readStream` : un client écrit id de ferme, type et données du job ; le serveur écrit l'état et l'index du type. |
| `AIJobStartRequestEvent:run(connection: any)` | 76 | ✍ Côté serveur : appelle `job:getIsStartable(connection)`, renvoie l'état, et ne démarre le job via `aiSystem:startJob` que s'il est démarrable. Côté client : publie `AIJobStartRequestEvent` avec l'état et le type sur `g_messageCenter`. |

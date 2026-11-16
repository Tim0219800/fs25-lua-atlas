# animals/events/AnimalNameEvent.lua

*[English version](../../../../scripts/animals/events/AnimalNameEvent.md)*

Source: `dataS/scripts/animals/events/AnimalNameEvent.lua` — FS25 1.25.1.0

✍ Événement réseau pour renommer un groupe d'animaux dans un élevage. Un client l'envoie au serveur, qui applique le renommage et le rediffuse aux autres clients. L'aide statique sendEvent choisit le bon chemin (diffusion sur le serveur, envoi au serveur sur un client).

- **AnimalNameEvent** hérite de `Event` (l.6)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AnimalNameEvent.emptyNew()` | 12 | ✍ Crée une instance d'événement vide, utilisée avant la lecture depuis un flux. |
| `AnimalNameEvent.new(husbandry: any, clusterId: any, name: any)` | 19 | ✍ Crée l'événement pour un élevage, un identifiant de groupe et un nouveau nom. |
| `AnimalNameEvent:readStream(streamId: any, connection: any)` | 31 | ✍ Lit l'élevage, l'identifiant du groupe et la chaîne du nom, puis exécute l'événement. |
| `AnimalNameEvent:writeStream(streamId: any, connection: any)` | 41 | ✍ Écrit l'élevage, l'identifiant du groupe et le nom dans le flux. |
| `AnimalNameEvent:run(connection: any)` | 49 | ✍ Appelle renameAnimal sur l'élevage (sans renvoyer d'événement). S'il vient d'un client, le serveur rediffuse l'événement aux autres clients. Aucun test de nil n'est fait sur l'élevage. |
| `AnimalNameEvent.sendEvent(husbandry: any, clusterId: any, name: any, noEventSend: any)` | 59 | ✍ Envoie le renommage sauf si noEventSend vaut true : le serveur diffuse aux clients, un client envoie au serveur. |

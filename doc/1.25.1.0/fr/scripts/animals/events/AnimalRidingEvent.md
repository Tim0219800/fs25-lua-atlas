# animals/events/AnimalRidingEvent.lua

*[English version](../../../../scripts/animals/events/AnimalRidingEvent.md)*

Source: `dataS/scripts/animals/events/AnimalRidingEvent.lua` — FS25 1.25.1.0

✍ Événement réseau demandant qu'un joueur commence à monter un groupe d'animaux (cheval) d'un élevage. À l'exécution il appelle simplement startRiding sur l'élevage ; aucune rediffusion n'est faite dans ce fichier.

- **AnimalRidingEvent** hérite de `Event` (l.6)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AnimalRidingEvent.emptyNew()` | 12 | ✍ Crée une instance d'événement vide, utilisée avant la lecture depuis un flux. |
| `AnimalRidingEvent.new(husbandry: any, clusterId: any, player: any)` | 19 | ✍ Crée l'événement pour un élevage, un identifiant de groupe et un joueur. |
| `AnimalRidingEvent:readStream(streamId: any, connection: any)` | 31 | ✍ Lit l'élevage, l'identifiant du groupe et le joueur, puis exécute l'événement. |
| `AnimalRidingEvent:writeStream(streamId: any, connection: any)` | 41 | ✍ Écrit l'élevage, l'identifiant du groupe et le joueur dans le flux. |
| `AnimalRidingEvent:run(connection: any)` | 49 | ✍ Appelle startRiding sur l'élevage avec l'identifiant du groupe et le joueur. Aucun test de nil n'est fait sur l'élevage. |

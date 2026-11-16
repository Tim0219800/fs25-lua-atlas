# animals/events/DogFollowEvent.lua

*[English version](../../../../scripts/animals/events/DogFollowEvent.md)*

Source: `dataS/scripts/animals/events/DogFollowEvent.lua` — FS25 1.25.1.0

✍ Événement réseau envoyé par un client pour faire suivre un joueur par un chien, ou le renvoyer à son point d'apparition si aucun joueur n'est donné. Le flux contient un indicateur de suivi et, s'il est actif, le joueur. À l'exécution il appelle Dog:followEntity ou Dog:goToSpawn.

- **DogFollowEvent** hérite de `Event` (l.6)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `DogFollowEvent.emptyNew()` | 12 | ✍ Crée une instance d'événement vide, utilisée avant la lecture depuis un flux. |
| `DogFollowEvent.new(dog: any, player: any)` | 19 | ✍ Crée l'événement pour un chien et un joueur optionnel ; l'indicateur de suivi vaut true si un joueur est fourni. |
| `DogFollowEvent:readStream(streamId: any, connection: any)` | 31 | ✍ Lit le chien et l'indicateur de suivi, puis le joueur si le chien suit, et exécute l'événement. |
| `DogFollowEvent:writeStream(streamId: any, connection: any)` | 43 | ✍ Écrit le chien, l'indicateur de suivi et, en cas de suivi, le joueur. |
| `DogFollowEvent:run(connection: any)` | 52 | ✍ Si le chien existe : avec l'indicateur de suivi, appelle followEntity quand le joueur est résolu (il peut ne pas exister de ce côté) ; sans, appelle goToSpawn. |

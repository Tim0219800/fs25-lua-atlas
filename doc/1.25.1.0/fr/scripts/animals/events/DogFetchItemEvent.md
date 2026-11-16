# animals/events/DogFetchItemEvent.lua

*[English version](../../../../scripts/animals/events/DogFetchItemEvent.md)*

Source: `dataS/scripts/animals/events/DogFetchItemEvent.lua` — FS25 1.25.1.0

✍ Événement réseau envoyé par un client pour demander au serveur de faire rapporter un objet (une balle) lancé par un joueur à un chien. À l'exécution il appelle Dog:fetchItem si le chien, le joueur et l'objet ont été résolus.

- **DogFetchItemEvent** hérite de `Event` (l.6)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `DogFetchItemEvent.emptyNew()` | 12 | ✍ Crée une instance d'événement vide, utilisée avant la lecture depuis un flux. |
| `DogFetchItemEvent.new(dog: any, player: any, item: any)` | 19 | ✍ Crée l'événement pour un chien, le joueur qui lance et l'objet. |
| `DogFetchItemEvent:readStream(streamId: any, connection: any)` | 31 | ✍ Lit le chien, le joueur et l'objet (objets de noeud), puis exécute l'événement. |
| `DogFetchItemEvent:writeStream(streamId: any, connection: any)` | 41 | ✍ Écrit le chien, le joueur et l'objet (objets de noeud) dans le flux. |
| `DogFetchItemEvent:run(connection: any)` | 49 | ✍ Si le chien, le joueur et l'objet sont tous non nil, appelle fetchItem sur le chien. |

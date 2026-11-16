# animals/events/DogPetEvent.lua

*[English version](../../../../scripts/animals/events/DogPetEvent.md)*

Source: `dataS/scripts/animals/events/DogPetEvent.lua` — FS25 1.25.1.0

✍ Événement réseau envoyé par un client pour faire caresser un chien par le serveur. À l'exécution il appelle Dog:pet si le chien existe.

- **DogPetEvent** hérite de `Event` (l.6)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `DogPetEvent.emptyNew()` | 12 | ✍ Crée une instance d'événement vide, utilisée avant la lecture depuis un flux. |
| `DogPetEvent.new(dog: any)` | 19 | ✍ Crée l'événement pour un chien. |
| `DogPetEvent:readStream(streamId: any, connection: any)` | 29 | ✍ Lit l'objet de noeud du chien, puis exécute l'événement. |
| `DogPetEvent:writeStream(streamId: any, connection: any)` | 37 | ✍ Écrit l'objet de noeud du chien dans le flux. |
| `DogPetEvent:run(connection: any)` | 43 | ✍ Si le chien existe, appelle pet sur lui. |

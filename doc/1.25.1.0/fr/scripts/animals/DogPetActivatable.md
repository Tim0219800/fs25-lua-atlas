# animals/DogPetActivatable.lua

*[English version](../../../scripts/animals/DogPetActivatable.md)*

Source: `dataS/scripts/animals/DogPetActivatable.lua` — FS25 1.25.1.0

✍ Petit objet activable qui permet au joueur de caresser un chien. Il affiche le texte localisé action_petAnimal, est toujours activable et mesure la distance via le chien, puis appelle Dog:pet à l'exécution.

- **DogPetActivatable** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `DogPetActivatable.new(dog: any)` | 15 | ✍ Crée l'activatable pour un chien avec le texte d'action de caresse localisé. |
| `DogPetActivatable:getIsActivatable()` | 27 | ✍ Retourne toujours true ; la disponibilité est décidée ailleurs, par exemple quand le chien enregistre ou retire l'activatable. |
| `DogPetActivatable:getDistance(posX: any, posY: any, posZ: any)` | 33 | ✍ Retourne la distance entre la position monde donnée et le chien, déléguée à Dog:getDistanceTo. |
| `DogPetActivatable:run()` | 40 | ✍ Appelle pet sur le chien. |

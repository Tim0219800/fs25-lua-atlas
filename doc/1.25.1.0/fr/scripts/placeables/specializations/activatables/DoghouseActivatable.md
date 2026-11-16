# placeables/specializations/activatables/DoghouseActivatable.lua

*[English version](../../../../../scripts/placeables/specializations/activatables/DoghouseActivatable.md)*

Source: `dataS/scripts/placeables/specializations/activatables/DoghouseActivatable.lua` — FS25 1.25.1.0

✍ Objet activable pour un placeable de niche : permet au joueur de remplir la gamelle du chien. Tant qu'il est actif, il dessine l'indication de remplissage de la gamelle avec le nom du chien via la mission.

- **DoghouseActivatable** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `DoghouseActivatable.new(doghousePlaceable: any)` | 15 | ✍ Crée l'activable pour un placeable de niche et fixe le texte `action_doghouseFillbowl`. |
| `DoghouseActivatable:run()` | 26 | ✍ Demande au placeable de niche de passer la gamelle à l'état rempli (`setFoodBowlState(true)`). |
| `DoghouseActivatable:draw()` | 32 | ✍ Dessin à chaque image : affiche l'indication de remplissage de la gamelle avec le nom du chien (vide s'il n'y a pas de chien). |
| `DoghouseActivatable:activate()` | 44 | ✍ Enregistre cet objet comme élément dessinable de la mission pour que `draw` soit appelée. |
| `DoghouseActivatable:deactivate()` | 50 | ✍ Retire cet objet des éléments dessinables de la mission. |

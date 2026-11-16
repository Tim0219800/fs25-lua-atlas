# vehicles/specializations/activatables/LivestockTrailerActivatable.lua

*[English version](../../../../../scripts/vehicles/specializations/activatables/LivestockTrailerActivatable.md)*

Source: `dataS/scripts/vehicles/specializations/activatables/LivestockTrailerActivatable.lua` — FS25 1.25.1.0

✍ Activatable rattaché à une remorque à bétail pour que le joueur puisse ouvrir l'écran de gestion des animaux. Il garde une référence à la remorque et n'est sélectionnable que si des animaux ou des rideables sont présents et que l'entrée est permise. Aide d'interface côté client ; il ne transfère pas d'animaux lui-même.

- **LivestockTrailerActivatable** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `LivestockTrailerActivatable.new(livestockTrailer: any)` | 15 | ✍ Crée l'activatable pour la remorque à bétail donnée et mémorise le texte localisé `action_openLivestockTrailerMenu`. |
| `LivestockTrailerActivatable:getIsActivatable()` | 26 | ✍ Renvoie false tant que la remorque a un trigger de chargement. Sinon true s'il y a des rideables dans le trigger ou des animaux à bord, et que la remorque ou l'un de ces rideables est actif pour l'entrée. |
| `LivestockTrailerActivatable:run()` | 49 | ✍ Pointe `g_animalScreen` vers cette remorque (sans étable, hors vue marchand) et ouvre l'interface `AnimalScreen`. |

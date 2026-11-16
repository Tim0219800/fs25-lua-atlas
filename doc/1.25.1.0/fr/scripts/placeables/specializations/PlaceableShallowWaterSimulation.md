# placeables/specializations/PlaceableShallowWaterSimulation.lua

*[English version](../../../../scripts/placeables/specializations/PlaceableShallowWaterSimulation.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableShallowWaterSimulation.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable sans prérequis qui enregistre les plans d'eau et obstacles de placeable.shallowWaterSimulation auprès de g_currentMission.shallowWaterSimulation, afin que l'eau du bâtiment réagisse à la simulation d'eau peu profonde. Elle ne fait rien si cette simulation n'existe pas ou pour un aperçu de construction. La classe de simulation n'est pas dans le dump (NON VÉRIFIÉ).

- **PlaceableShallowWaterSimulation** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableShallowWaterSimulation.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Retourne toujours true. |
| `PlaceableShallowWaterSimulation:onLoad(savegame: table)` | 51 | ✍ Ne fait rien s'il n'y a pas de simulation ou si le placeable est un aperçu de construction. Sinon applique éventuellement un matériau de base par nom à chaque plan d'eau et l'enregistre, puis ajoute chaque obstacle avec type (rectangle par défaut), taille, décalage et rotation Y. |
| `PlaceableShallowWaterSimulation:onDelete()` | 126 | ✍ Retire les plans d'eau (géométrie de zone et plan) et les obstacles que ce placeable avait enregistrés. |

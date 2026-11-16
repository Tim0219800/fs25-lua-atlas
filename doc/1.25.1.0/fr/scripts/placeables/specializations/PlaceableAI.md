# placeables/specializations/PlaceableAI.lua

*[English version](../../../../scripts/placeables/specializations/PlaceableAI.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableAI.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable (`spec_ai`) qui intègre un placeable au système d'IA : elle marque comme à recalculer les zones de navigation de l'IA, enregistre des splines de route et gère des boîtes d'obstacles activables par des objets animés (par exemple des portails). Le travail côté serveur passe par `g_currentMission.aiSystem`, dont la classe n'est pas dans le dump (NON VÉRIFIÉ). Aucune spécialisation prérequise, mais l'activation des obstacles nécessite `spec_animatedObjects`.

- **PlaceableAI** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableAI.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Vérification des prérequis ; retourne toujours true, cette spécialisation n'exige donc aucune autre spécialisation. |
| `PlaceableAI.registerFunctions(placeableType: any)` | 24 | ✍ Enregistre les fonctions de la spécialisation sur le type de placeable : `setObstacleActive`, `loadAIUpdateArea`, `loadAISpline`, `loadAIObstacle` et `updateAIUpdateAreas`. |
| `PlaceableAI.registerEventListeners(placeableType: any)` | 34 | ✍ S'abonne aux événements de placeable `onLoad`, `onPostLoad`, `onDelete` et `onFinalizePlacement`. |
| `PlaceableAI.registerXMLPaths(schema: any, basePath: any)` | 43 | ✍ Enregistre le schéma XML `.ai` : zones de mise à jour (nœuds de début/fin), splines (nœud, largeur, hauteur et rayon de braquage max) et obstacles (nœud, taille, décalage, et objet animé lié par index ou saveId avec temps normalisés de début/fin). |
| `PlaceableAI:onLoad(savegame: table)` | 66 | ✍ Charge depuis le XML les zones de mise à jour, splines et obstacles dans `spec_ai`, en ne gardant que ceux dont le chargement réussit. Écrit un avertissement si `placeable.ai.updateAreas` est absent. |
| `PlaceableAI:onPostLoad(savegame: any)` | 103 | ✍ Si des objets animés et une carte de navigation de l'IA existent, relie chaque obstacle à son objet animé (par index ou saveId, avec avertissements s'il manque) et ajoute à `setAnimTime` de l'objet un crochet qui active l'obstacle tant que le temps d'animation est entre ses bornes de début et de fin. |
| `PlaceableAI:onDelete()` | 145 | ✍ Serveur uniquement : si l'indicateur est actif, marque les zones de mise à jour de l'IA comme à recalculer, retire les splines de route du placeable du système d'IA et désactive les obstacles actifs. |
| `PlaceableAI:loadAIUpdateArea(xmlFile: any, key: any, area: any)` | 175 | ✍ Lit les nœuds de début et de fin, les convertit en coordonnées locales à la racine et stocke le centre et la taille X/Z de la zone. Retourne false avec un avertissement XML si un nœud manque. |
| `PlaceableAI:loadAISpline(xmlFile: any, key: any, spline: any)` | 212 | ✍ Lit le nœud de spline, le rend invisible et stocke la largeur, la hauteur et le rayon de braquage maximaux facultatifs. Retourne false avec un avertissement si le nœud manque. |
| `PlaceableAI:loadAIObstacle(xmlFile: any, key: any, obstacle: any)` | 236 | ✍ Lit le nœud d'un obstacle, sa taille, son décalage, le lien vers l'objet animé (saveId ou index) et les temps de début/fin. Retourne false avec un avertissement si le nœud manque, si un nœud sans corps rigide n'a pas de taille, si le lien ou les temps manquent, ou si le début n'est pas avant la fin. |
| `PlaceableAI:onFinalizePlacement()` | 282 | ✍ Serveur uniquement : rafraîchit les zones de mise à jour de l'IA quand le placeable vient d'être posé (ou ne vient pas d'une sauvegarde valide, ou lors d'un rechargement), enregistre ses splines de route et applique l'état initial des obstacles d'après le temps de chaque animation liée. |
| `PlaceableAI:setObstacleActive(obstacle: any, active: any)` | 312 | ✍ Ajoute la boîte d'obstacle au système d'IA (nœud, décalage, taille) ou la retire, et enregistre l'état actif. Ne fait rien s'il n'y a pas de système d'IA. |
| `PlaceableAI:updateAIUpdateAreas()` | 328 | ✍ Serveur uniquement : convertit chaque zone enregistrée en rectangle englobant en coordonnées monde et appelle `aiSystem:setAreaDirty` pour que la navigation de l'IA y soit recalculée. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `setObstacleActive` | 25 |
| registerFunction | `loadAIUpdateArea` | 26 |
| registerFunction | `loadAISpline` | 27 |
| registerFunction | `loadAIObstacle` | 28 |
| registerFunction | `updateAIUpdateAreas` | 29 |
| registerEventListener | `onLoad` | 35 |
| registerEventListener | `onPostLoad` | 36 |
| registerEventListener | `onDelete` | 37 |
| registerEventListener | `onFinalizePlacement` | 38 |

# vehicles/specializations/ArticulatedAxis.lua

*[English version](../../../../scripts/vehicles/specializations/ArticulatedAxis.md)*

Source: `dataS/scripts/vehicles/specializations/ArticulatedAxis.lua` — FS25 1.25.1.0

✍ Spécialisation pour les véhicules qui tournent en pliant une articulation entre composants (chargeuses articulées, tombereaux, etc.). Elle exige Drivable. Le XML sous vehicle.articulatedAxis donne l'indice de l'articulation, la vitesse et les limites de rotation, un nœud de rotation, des pièces visuelles rotatives optionnelles, des listes de roues et un son de direction. Elle étend les limites de temps de braquage, calcule un rayon de braquage maximal à partir des roues et surcharge les conversions courbure/rayon utilisées par la direction et l'IA. L'articulation n'est physiquement tournée que sur le serveur ; visuels et son tournent sur les clients.

- **ArticulatedAxis** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ArticulatedAxis.prerequisitesPresent(specializations: table) → boolean` | 17 | ✍ Renvoie vrai seulement si le type de véhicule possède la spécialisation Drivable. |
| `ArticulatedAxis.initSpecialization()` | 23 | ✍ Déclare les clés XML vehicle.articulatedAxis (indice d'articulation, rotSpeed, rotMax, rotMin, anchorActor, rotNode, aiReverserNode, maxTurningRadius, indices de roues personnalisés, entrées rotatingPart) et les chemins du son de direction. |
| `ArticulatedAxis.registerOverwrittenFunctions(vehicleType: any)` | 52 | ✍ Surcharge getSteeringRotTimeByCurvature, getTurningRadiusByRotTime et getAIReverserNode. Le corps de getAIReverserNode n'est pas dans le dump (NON VÉRIFIÉ). |
| `ArticulatedAxis.registerEventListeners(vehicleType: any)` | 60 | ✍ Abonne la spécialisation à onLoad, onPostLoad, onDelete, onDeactivate et onUpdate. |
| `ArticulatedAxis:onLoad(savegame: table)` | 71 | ✍ Lit les réglages de l'axe (l'indice d'articulation commence à 1) et les pièces rotatives, puis élargit les temps de braquage min/max du véhicule. Définit maxRotation et wheelSteeringDuration et estime maxTurningRadius à partir des roues et de l'angle de l'articulation, sauf surcharge par le XML. Avertit si moins de 2 roues sont trouvées par composant. Charge le son de direction sur les clients. |
| `ArticulatedAxis:onPostLoad()` | 233 | ✍ Si une articulation est configurée, appelle une fois updateArticulatedAxisRotation (si définie) avec un angle 0 et un grand dt. Sinon, retire l'écouteur onUpdate. |
| `ArticulatedAxis:onDelete()` | 246 | ✍ Sur les clients, supprime les échantillons sonores de direction chargés. |
| `ArticulatedAxis:onDeactivate()` | 255 | ✍ Sur les clients, arrête le son de direction et réinitialise son indicateur de lecture. |
| `ArticulatedAxis:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 268 | ✍ À chaque image, convertit rotatedTime en angle de braquage borné (éventuellement filtré par updateArticulatedAxisRotation), lance ou arrête le son de direction et suit un temps interpolé pour la caméra. En cas de changement, le serveur fait tourner le nœud et met à jour le repère de l'articulation, et les clients interpolent les pièces rotatives. |
| `ArticulatedAxis:getSteeringRotTimeByCurvature(superFunc: any, curvature: any)` | 328 | ✍ Surcharge : convertit une courbure de trajectoire en temps de braquage à partir de wheelSteeringDuration, d'une correspondance par arctangente et de maxTurningRadius. |
| `ArticulatedAxis:getTurningRadiusByRotTime(superFunc: any, rotTime: any)` | 334 | ✍ Surcharge : convertit un temps de braquage en rayon de braquage signé (1/courbure, math.huge en ligne droite). Délègue au parent s'il n'y a pas d'articulation ou si la vitesse de rotation est 0. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerOverwrittenFunction | `getSteeringRotTimeByCurvature` | 53 |
| registerOverwrittenFunction | `getTurningRadiusByRotTime` | 54 |
| registerOverwrittenFunction | `getAIReverserNode` | 55 |
| registerEventListener | `onLoad` | 61 |
| registerEventListener | `onPostLoad` | 62 |
| registerEventListener | `onDelete` | 63 |
| registerEventListener | `onDeactivate` | 64 |
| registerEventListener | `onUpdate` | 65 |

# vehicles/specializations/SplineVehicle.lua

*[English version](../../../../scripts/vehicles/specializations/SplineVehicle.md)*

Source: `dataS/scripts/vehicles/specializations/SplineVehicle.lua` — FS25 1.25.1.0

✍ Spécialisation pour les véhicules qui ne se déplacent que le long d'une spline (wagons et locomotives de train). Elle lit les nœuds avant/arrière et les deux bogies, mesure leurs distances, et laisse le système de train (`self.trainSystem`, défini via `setTrainSystem`) placer le véhicule sur la spline du rail avec `alignToSplineTime`. Elle surcharge la vitesse, le son de surface et l'activation des décharges. La classe TrainSystem n'est pas dans le dump : son comportement est NON VÉRIFIÉ. À noter : `setSplineSpeed` est enregistrée comme fonction du véhicule mais aucune fonction de ce nom n'est définie dans ce fichier.

- **SplineVehicle** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SplineVehicle.prerequisitesPresent(specializations: table) → boolean` | 17 | ✍ Retourne toujours true : aucune autre spécialisation n'est requise. |
| `SplineVehicle.initSpecialization()` | 23 | ✍ Déclare le schéma XML de `vehicle.splineVehicle.dollies` (nœuds avant/arrière, les deux nœuds de bogie, option d'alignement) et l'attribut `needsIsEntered` sur les nœuds de décharge (aussi par configuration). |
| `SplineVehicle.registerFunctions(vehicleType: any)` | 43 | ✍ Enregistre `getFrontToBackDistance`, `getSplineTimeFromDistance`, `getSplinePositionAndTimeFromDistance`, `alignToSplineTime`, `getCurrentSplinePosition` et `setSplineSpeed`. |
| `SplineVehicle.registerOverwrittenFunctions(vehicleType: any)` | 54 | ✍ Surcharge `getLastSpeed`, `setTrainSystem`, `getCurrentSurfaceSound`, `getAreSurfaceSoundsActive`, `getIsDischargeNodeActive` et `loadDischargeNode`. |
| `SplineVehicle.registerEventListeners(vehicleType: any)` | 65 | ✍ S'abonne à onLoad et onUpdate. |
| `SplineVehicle:onLoad(savegame: table)` | 74 | ✍ Lit les nœuds avant, arrière et de bogie, calcule leurs distances (avant-arrière, bogie-bogie, racine vers chaque extrémité) avec `calcDistanceFrom`, lit l'option d'alignement et met à zéro l'état de position et de vitesse sur la spline. |
| `SplineVehicle:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 103 | ✍ Si un système de train est défini, lui demande de mettre à jour les positions des véhicules ferroviaires avec `updateRailroadVehiclePositions(dt)`. |
| `SplineVehicle:setTrainSystem(superFunc: any, trainSystem: any)` | 111 | ✍ Appelle le parent, puis convertit les distances mesurées du véhicule en fractions de temps de spline à partir de la longueur de spline fournie par le système de train. |
| `SplineVehicle:getCurrentSplinePosition()` | 130 | ✍ Retourne la position courante (valeur de temps) du véhicule sur la spline. |
| `SplineVehicle:getFrontToBackDistance()` | 136 | ✍ Retourne la distance entre les nœuds avant et arrière, mesurée au chargement. |
| `SplineVehicle:getSplineTimeFromDistance(t: any, distance: any, stepSize: any)` | 142 | ✍ Retourne le temps de spline valide atteint en avançant d'une distance donnée depuis le temps `t` ; vers l'avant si `stepSize` n'est pas négatif. Ne retourne rien sans système de train. |
| `SplineVehicle:getSplinePositionAndTimeFromDistance(t: any, distance: any, stepSize: any)` | 154 | ✍ Comme `getSplineTimeFromDistance` mais retourne la position x, y, z sur la spline et le temps de spline valide. Ne retourne rien sans système de train. |
| `SplineVehicle:alignToSplineTime(spline: any, yOffset: any, tFront: any)` | 167 | ✍ Place le véhicule sur la spline à partir du temps de spline avant : déduit le sens de déplacement, positionne la racine d'après les points avant et de bogie, fixe l'orientation, alimente les interpolateurs réseau, aligne les bogies, mémorise la position et retourne le temps de spline du nœud arrière. À noter : elle lit `spec.trainSystem` pour la longueur de spline alors que le reste du fichier utilise `self.trainSystem`, ce qui ressemble à un bug (lequel est défini : NON VÉRIFIÉ). |
| `SplineVehicle:getLastSpeed(superFunc: any, useAttacherVehicleSpeed: any)` | 228 | ✍ Retourne la vitesse absolue sur la spline convertie en km/h (vitesse de position fois 3,6), sans appeler le parent. |
| `SplineVehicle:getCurrentSurfaceSound()` | 234 | ✍ Retourne le son de surface de roue enregistré sous « railroad ». |
| `SplineVehicle:getAreSurfaceSoundsActive(superFunc: any)` | 240 | ✍ Délègue au véhicule racine quand celui-ci n'est pas la racine (seule la tête du train décide) ; sinon retourne true. |
| `SplineVehicle:loadDischargeNode(superFunc: any, xmlFile: any, key: any, entry: any)` | 251 | ✍ Appelle le parent et lit en plus `needsIsEntered` (true par défaut) sur l'entrée du nœud de décharge. |
| `SplineVehicle:getIsDischargeNodeActive(superFunc: any, dischargeNode: any)` | 263 | ✍ Pour les nœuds qui exigent un véhicule occupé, retourne false tant que le véhicule racine n'est pas contrôlé ; sinon délègue au parent. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `getFrontToBackDistance` | 44 |
| registerFunction | `getSplineTimeFromDistance` | 45 |
| registerFunction | `getSplinePositionAndTimeFromDistance` | 46 |
| registerFunction | `alignToSplineTime` | 47 |
| registerFunction | `getCurrentSplinePosition` | 48 |
| registerFunction | `setSplineSpeed` | 49 |
| registerOverwrittenFunction | `getLastSpeed` | 55 |
| registerOverwrittenFunction | `setTrainSystem` | 56 |
| registerOverwrittenFunction | `getCurrentSurfaceSound` | 57 |
| registerOverwrittenFunction | `getAreSurfaceSoundsActive` | 58 |
| registerOverwrittenFunction | `getIsDischargeNodeActive` | 59 |
| registerOverwrittenFunction | `loadDischargeNode` | 60 |
| registerEventListener | `onLoad` | 66 |
| registerEventListener | `onUpdate` | 67 |

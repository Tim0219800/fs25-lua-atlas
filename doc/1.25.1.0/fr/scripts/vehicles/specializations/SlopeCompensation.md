# vehicles/specializations/SlopeCompensation.lua

*[English version](../../../../scripts/vehicles/specializations/SlopeCompensation.md)*

Source: `dataS/scripts/vehicles/specializations/SlopeCompensation.lua` — FS25 1.25.1.0

✍ Spécialisation qui incline des parties d'un véhicule pour suivre la pente, soit d'après la différence de hauteur entre deux groupes de roues (raycasts sous les roues), soit d'après l'angle d'un nœud de référence. Elle exige Wheels, ajoute un type de configuration "slopeCompensation", pilote par nœud de compensation une animation, un nœud de rotation et/ou des pièces d'animation, et sauvegarde le dernier angle. Elle enregistre aussi un type de valeur d'animation "slopeCompensationLevel". À noter : `updateSlopeCompensationAngle` est enregistrée comme fonction du véhicule et appelée à chaque mise à jour, mais aucune fonction de ce nom n'est définie dans ce fichier (corps absent du dump) ; son emplacement est NON VÉRIFIÉ.

- **SlopeCompensation** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SlopeCompensation.prerequisitesPresent(specializations: any)` | 19 | ✍ Retourne vrai uniquement si le type de véhicule possède la spécialisation Wheels. |
| `SlopeCompensation.initSpecialization()` | 25 | ✍ Enregistre le type de configuration "slopeCompensation", le schéma XML (de base et par configuration), les attributs différés des parts d'AnimatedVehicle (`slopeCompensationNodeIndex`, niveaux de début/fin) et le `lastAngle` sauvegardé par nœud de compensation. |
| `SlopeCompensation.registerXMLPaths(schema: any, basePath: any)` | 48 | ✍ Déclare le schéma sous un chemin de base : seuil de mise à jour, option de haute fréquence, et chaque `compensationNode` (roues ou nœuds de roue, limites d'angle, vitesse, inversion, hauteurs, nom d'animation, nœuds de référence et de rotation avec axes, pièces d'animation avec rotation et translation min/max). |
| `SlopeCompensation.registerFunctions(vehicleType: any)` | 88 | ✍ Enregistre `loadSlopeCompensationWheels`, `loadSlopeCompensationNodeFromXML`, `getSlopeCompensationAngle`, `getSlopeCompensationAngleScale`, `updateSlopeCompensationAngle` et `setSlopeCompensationNodeAngle`. |
| `SlopeCompensation.registerEventListeners(vehicleType: any)` | 99 | ✍ S'abonne à onLoad, onLoadFinished, onUpdate, onUpdateTick et onRegisterAnimationValueTypes. |
| `SlopeCompensation:onLoad(savegame: any)` | 109 | ✍ Lit le seuil et la fréquence de mise à jour, charge les nœuds de compensation du XML de base et de la configuration choisie (qui peut surcharger seuil et fréquence). Retire les écouteurs inutiles : tous s'il n'y a pas de nœud, onUpdateTick en haute fréquence, sinon onUpdate. |
| `SlopeCompensation:onLoadFinished(savegame: any)` | 154 | ✍ Amorce l'animation de chaque nœud en la faisant passer par les temps 0, 1 puis 0,5, puis restaure l'angle sauvegardé de chaque nœud, ou 0 pour un véhicule neuf. |
| `SlopeCompensation:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 180 | ✍ Sauvegarde le dernier angle appliqué de chaque nœud de compensation. |
| `SlopeCompensation:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 189 | ✍ Pour chaque nœud, borne l'angle détecté à ses limites, le met à l'échelle, l'inverse éventuellement, met à jour la cible quand la variation dépasse le seuil, fait avancer l'angle courant vers la cible à la vitesse du nœud (avec un facteur d'adoucissement) et l'applique, puis appelle `updateSlopeCompensationAngle`. |
| `SlopeCompensation:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 218 | ✍ Exécute la même logique que onUpdate (utilisé quand la haute fréquence est désactivée). |
| `SlopeCompensation:onRegisterAnimationValueTypes()` | 224 | ✍ Enregistre le type de valeur d'animation « slopeCompensationLevel » (flottant) : il lit ou écrit le `compensationLevel` du nœud désigné par `slopeCompensationNodeIndex` et réapplique l'angle courant lorsqu'il change. |
| `SlopeCompensation:loadSlopeCompensationWheels(xmlFile: any, key: any, indexName: any, nodeName: any, nodesName: any)` | 265 | ✍ Résout les roues d'un côté à partir d'un index de roue, d'un nœud de roue et/ou d'une liste de nœuds de roue. Retourne true, la liste des nœuds d'entraînement et le plus grand rayon de roue, ou false avec un avertissement si une roue est introuvable ou si aucune n'est définie. |
| `SlopeCompensation:loadSlopeCompensationNodeFromXML(compensationNode: any, xmlFile: any, key: any)` | 316 | ✍ Charge un nœud de compensation : si les deux groupes de roues sont résolus, installe des callbacks de raycast qui calculent l'angle du sol entre les deux groupes (corps statiques uniquement) ; lit aussi les nœuds de référence et de rotation, les limites d'angle (échangées et inversées si min dépasse max), la vitesse, l'animation, les hauteurs et les pièces d'animation. Retourne toujours true. |
| `SlopeCompensation:getSlopeCompensationAngle(compensationNode: any)` | 438 | ✍ Retourne le dernier angle de pente détecté du nœud de compensation donné. |
| `SlopeCompensation:getSlopeCompensationAngleScale(compensationNode: any)` | 444 | ✍ Retourne 1 par défaut ; prévu pour être surchargé afin de moduler la compensation d'un nœud. |
| `SlopeCompensation:setSlopeCompensationNodeAngle(compensationNode: any, angle: any)` | 484 | ✍ Applique un angle à un nœud : le convertit en position 0..1 entre min et max, pilote l'animation, fixe la rotation du nœud sur son axe, et déplace les pièces d'animation (rotation et/ou translation, selon le côté, mélangées avec le niveau de compensation). Le mémorise comme dernier angle du nœud. |
| `SlopeCompensation:updateDebugValues(values: any)` | 542 | ✍ Aide de débogage : ajoute une ligne par nœud de compensation avec son angle détecté borné, en degrés. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `loadSlopeCompensationWheels` | 89 |
| registerFunction | `loadSlopeCompensationNodeFromXML` | 90 |
| registerFunction | `getSlopeCompensationAngle` | 91 |
| registerFunction | `getSlopeCompensationAngleScale` | 92 |
| registerFunction | `updateSlopeCompensationAngle` | 93 |
| registerFunction | `setSlopeCompensationNodeAngle` | 94 |
| registerEventListener | `onLoad` | 100 |
| registerEventListener | `onLoadFinished` | 101 |
| registerEventListener | `onUpdate` | 102 |
| registerEventListener | `onUpdateTick` | 103 |
| registerEventListener | `onRegisterAnimationValueTypes` | 104 |

# vehicles/specializations/ConveyorBelt.lua

*[English version](../../../../scripts/vehicles/specializations/ConveyorBelt.md)*

Source: `dataS/scripts/vehicles/specializations/ConveyorBelt.lua` — FS25 1.25.1.0

✍ Spécialisation de véhicule pour les tapis roulants qui transportent la matière d'un point de déchargement vers un autre objet. Elle exige `Dischargeable`, retarde le déchargement réel jusqu'à ce qu'un effet de morphing visuel ait parcouru le tapis, et pilote animations, sons et effets du tapis. Le serveur calcule l'état de remplissage et de défilement et le synchronise aux clients via le flux de mise à jour. Des décalages optionnels liés aux outils mobiles de `Cylindered` modifient la longueur de l'effet. Le fonctionnement interne d'EffectManager, AnimationManager et SoundManager est NON VÉRIFIÉ (absent du dump).

- **ConveyorBelt** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ConveyorBelt.prerequisitesPresent(specializations: table) → boolean` | 17 | ✍ Renvoie vrai uniquement si le type de véhicule possède la spécialisation `Dischargeable`. |
| `ConveyorBelt.initSpecialization()` | 23 | ✍ Enregistre dans le schéma XML les entrées de `vehicle.conveyorBelt` : index du point de déchargement, pourcentage de départ (0,9 par défaut), décalages avec outil mobile et plages d'effets, animations, effets et sons du tapis. |
| `ConveyorBelt.registerFunctions(vehicleType: any)` | 46 | ✍ Enregistre les fonctions de véhicule `getConveyorBeltFillLevel`, `getConveyorBeltTargetObject` et `getLoadTriggerMaxFillSpeed`. |
| `ConveyorBelt.registerOverwrittenFunctions(vehicleType: any)` | 54 | ✍ Surcharge six fonctions de véhicule existantes : facteur de vidage du déchargement, déchargement à vide, gestion du déchargement, possibilité d'entrer, acceptation d'un type de remplissage et capacité libre d'une unité. |
| `ConveyorBelt.registerEventListeners(vehicleType: any)` | 65 | ✍ S'abonne à onLoad, onPostLoad, onDelete, aux deux événements de flux de mise à jour, à onUpdateTick, onFillUnitFillLevelChanged et onMovingToolChanged. |
| `ConveyorBelt:onLoad(savegame: table)` | 79 | ✍ Charge les effets (triés par délai de départ), ainsi que les animations et le son du tapis côté client. Sélectionne le point de déchargement, calcule le niveau de départ à partir de la capacité et lit les décalages d'outils mobiles, avec avertissement si un index d'effet est invalide. |
| `ConveyorBelt:onPostLoad(savegame: any)` | 176 | ✍ Résout l'outil mobile de chaque décalage une fois toutes les spécialisations chargées et applique son état initial. Les décalages sans outil correspondant sont supprimés avec un avertissement. Sans `Cylindered`, les décalages sont désactivés et une erreur XML est journalisée. |
| `ConveyorBelt:onDelete()` | 209 | ✍ Supprime les effets, les nœuds d'animation et les échantillons sonores appartenant au tapis. |
| `ConveyorBelt:onReadUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 221 | ✍ Côté client uniquement : lorsque le bit de modification est présent, lit les booléens `isFilling` et `isScrolling` envoyés par le serveur. |
| `ConveyorBelt:onWriteUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 236 | ✍ Côté serveur uniquement : écrit un booléen de drapeau de modification puis `isFilling` et `isScrolling` si le drapeau du tapis est levé. |
| `ConveyorBelt:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 251 | ✍ Logique principale à chaque tick. Les clients déduisent morphing et défilement des drapeaux synchronisés. Pendant le déchargement, elle avance les positions de début et de fin du morphing selon `dt`/délai et met à jour le facteur de vidage. Elle démarre ou arrête animations, son et défilement des effets, et transmet les valeurs aux effets. |
| `ConveyorBelt:getConveyorBeltFillLevel()` | 343 | ✍ Renvoie le niveau de remplissage de l'unité du tapis, auquel s'ajoute, de façon récursive, celui du tapis suivant de la chaîne sur lequel il décharge. |
| `ConveyorBelt:getConveyorBeltTargetObject()` | 359 | ✍ Suit la chaîne de tapis depuis le point de déchargement courant et renvoie l'objet cible final et l'index de son unité de remplissage, ou nil si rien n'est touché. |
| `ConveyorBelt:getLoadTriggerMaxFillSpeed()` | 377 | ✍ Renvoie la vitesse de remplissage maximale autorisée par la chaîne : le minimum entre la vitesse de vidage de ce point et celle des objets en aval, ou l'infini sans point de déchargement. |
| `ConveyorBelt:getDischargeNodeEmptyFactor(superFunc: any, dischargeNode: any)` | 395 | ✍ Surcharge. Pour le point de déchargement du tapis, renvoie 0 tant que la fin du morphing n'a pas atteint 1, puis le facteur de vidage calculé, ce qui retarde le déchargement réel. Les autres points utilisent la valeur parente. |
| `ConveyorBelt:handleDischargeOnEmpty(superFunc: any, dischargeNode: any)` | 412 | ✍ Surcharge. N'appelle le comportement parent que pour les points de déchargement autres que celui du tapis, qui est donc ignoré. |
| `ConveyorBelt:handleDischarge(superFunc: any, dischargeNode: any, dischargedLiters: any, minDropReached: any, hasMinDropFillLevel: any)` | 422 | ✍ Surcharge. Ignore la gestion du déchargement pour le point de déchargement propre au tapis et délègue au parent pour les autres. |
| `ConveyorBelt:getIsEnterable(superFunc: any)` | 432 | ✍ Surcharge. Le véhicule ne peut être occupé que s'il n'est pas attelé à un autre véhicule et que le contrôle parent est également satisfait. |
| `ConveyorBelt.getHasConveyorBeltLoop(rootVehicle: any, vehicle: any, fillUnitIndex: any)` | 438 | ✍ Parcourt la chaîne de tapis à partir d'un véhicule et renvoie vrai si elle revient au véhicule racine, c'est-à-dire une boucle. Sert à éviter une récursion infinie dans les requêtes de type de remplissage et de capacité. |
| `ConveyorBelt:getFillUnitAllowsFillType(superFunc: any, fillUnitIndex: any, fillType: any)` | 458 | ✍ Surcharge. Après le contrôle parent, s'il n'y a pas de boucle, interroge aussi l'objet cible pour savoir s'il accepte le type de remplissage, y compris via le convertisseur de type du point de déchargement. |
| `ConveyorBelt:getFillUnitFreeCapacity(superFunc: any, fillUnitIndex: any, fillTypeIndex: any, farmId: any)` | 489 | ✍ Surcharge. Sans boucle, ajoute la capacité libre de l'objet cible en aval à la valeur parente, de sorte que le tapis annonce la place cumulée de la chaîne. |
| `ConveyorBelt:onFillUnitFillLevelChanged(fillUnitIndex: any, fillLevelDelta: any, fillType: any, toolType: any, fillPositionData: any, appliedDelta: any)` | 509 | ✍ Sur l'unité du tapis : le serveur met à jour les positions de morphing et les drapeaux de remplissage et de défilement, et lève un drapeau de modification en cas de changement. À vide, il arrête les effets et réinitialise le morphing ; sinon il règle le type de remplissage et démarre les effets. |
| `ConveyorBelt:onMovingToolChanged(movingTool: any, speed: any, dt: any)` | 551 | ✍ Quand l'état d'un outil mobile lié change, règle par interpolation les décalages de ses effets, en tenant compte de l'inversion, puis recalcule le délai total du tapis. |
| `ConveyorBelt:updateDebugValues(values: any)` | 589 | ✍ Ajoute des entrées de débogage à la liste fournie : facteur de remplissage, facteur visuel, délai courant, décalage et positions de début et de fin du morphing. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `getConveyorBeltFillLevel` | 47 |
| registerFunction | `getConveyorBeltTargetObject` | 48 |
| registerFunction | `getLoadTriggerMaxFillSpeed` | 49 |
| registerOverwrittenFunction | `getDischargeNodeEmptyFactor` | 55 |
| registerOverwrittenFunction | `handleDischargeOnEmpty` | 56 |
| registerOverwrittenFunction | `handleDischarge` | 57 |
| registerOverwrittenFunction | `getIsEnterable` | 58 |
| registerOverwrittenFunction | `getFillUnitAllowsFillType` | 59 |
| registerOverwrittenFunction | `getFillUnitFreeCapacity` | 60 |
| registerEventListener | `onLoad` | 66 |
| registerEventListener | `onPostLoad` | 67 |
| registerEventListener | `onDelete` | 68 |
| registerEventListener | `onReadUpdateStream` | 69 |
| registerEventListener | `onWriteUpdateStream` | 70 |
| registerEventListener | `onUpdateTick` | 71 |
| registerEventListener | `onFillUnitFillLevelChanged` | 72 |
| registerEventListener | `onMovingToolChanged` | 73 |

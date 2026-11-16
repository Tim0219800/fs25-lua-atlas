# placeables/specializations/PlaceableVine.lua

*[English version](../../../../scripts/placeables/specializations/PlaceableVine.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableVine.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable pour les vignobles, construite sur PlaceableFence : chaque panneau de clôture porte un nœud de vigne dont l'état de croissance est lu dans la carte de densité du type de culture (fonctions de zone de vigne de `FSDensityMapUtil`, signatures seules dans le dump, donc fonctionnement interne NON VÉRIFIÉ). Elle charge le type de culture, la taille des panneaux, les sections, les visuels par état de croissance et les règles de réinitialisation depuis `placeable.vine`, et fournit des points d'entrée de récolte, de préparation, de secousse et d'écrasement utilisés par les machines à vigne, côté serveur. Le système de vigne `g_currentMission.vineSystem` suit les panneaux.

- **PlaceableVine** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableVine.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Renvoie true seulement si le type de placeable inclut la spécialisation PlaceableFence. |
| `PlaceableVine.registerFunctions(placeableType: any)` | 24 | ✍ Enregistre les fonctions de vigne : mises à jour de nœud et de visuels, destruction de zone, accesseurs de type de culture et d'état initial, facteurs de secousse et d'écrasement, récolte, préparation, facteur de section, zone par nœud et aides de segment. |
| `PlaceableVine.registerOverwrittenFunctions(placeableType: any)` | 43 | ✍ Surcharge les fonctions de clôture `doDeletePanel`, `generateSegmentPoles`, `deleteSegment` et `getHasParallelSnapping`. À noter : aucune fonction `getHasParallelSnapping` n'est définie dans ce fichier (cible NON VÉRIFIÉE). |
| `PlaceableVine.registerEventListeners(placeableType: any)` | 52 | ✍ S'abonne à onLoad et onCreateSegmentPanel (ce dernier est déclenché par la spécialisation de clôture pour chaque panneau créé). |
| `PlaceableVine.registerXMLPaths(schema: any, basePath: any)` | 59 | ✍ Déclare les clés `.vine` : `#fruitType`, `#width`, `#length`, `#thresholdFactor`, `#numLODOffsets`, `#numSections`, états de croissance en et hors saison, nœuds d'état de croissance avec états de feuillage, et états de réinitialisation avec seuil et cible. |
| `PlaceableVine.registerSavegameXMLPaths(schema: any, basePath: any)` | 81 | ✍ Déclare l'attribut de sauvegarde `#startGrowthState` du vignoble. |
| `PlaceableVine:onLoad(savegame: table)` | 90 | ✍ Lit le type de culture (avertit et abandonne s'il manque ou est inconnu), les dimensions du panneau, le nombre de sections, les états de croissance en et hors saison, les correspondances d'états de feuillage (avec vérifications) et les états de réinitialisation, ainsi que l'état de départ sauvegardé. |
| `PlaceableVine:deleteSegment(superFunc: any, segment: any)` | 195 | ✍ Oublie les données de vigne stockées pour le segment, puis appelle le parent pour le supprimer. |
| `PlaceableVine:generateSegmentPoles(superFunc: any, segment: any, sync: any)` | 208 | ✍ Avant que le parent ne régénère un segment hors aperçu, désenregistre ses anciens nœuds de vigne du système de vigne et réinitialise la liste de données du segment. |
| `PlaceableVine:onCreateSegmentPanel(isPreview: any, segment: any, panel: any, poleIndex: any, dy: any, pole: any)` | 236 | ✍ Appelée pour chaque nouveau panneau de clôture. Désactive éventuellement les ombres, puis pour les vrais panneaux crée les données du nœud de vigne, masque les nœuds d'état, ajuste les enfants de LOD et décalages UV aléatoires, calcule les zones de section et lit les pixels de vigne existants. Si aucune vigne n'existe, elle crée la zone avec l'état de départ, et enregistre le nœud auprès du système de vigne. En aperçu, elle n'affiche que l'état d'aperçu. |
| `PlaceableVine:doDeletePanel(superFunc: any, segment: any, segmentIndex: any, poleIndex: any)` | 363 | ✍ Avant que le parent ne supprime un panneau, retire le nœud de vigne correspondant du système de vigne et détruit sa zone de vigne dans la carte de densité ; ne fait rien si le segment ou l'indice de poteau est invalide. |
| `PlaceableVine:destroyVineArea(data: any)` | 399 | ✍ Serveur seulement : détruit la zone de vigne de la carte de densité de chaque section des données du panneau donné. |
| `PlaceableVine:getVineFruitTypeIndex()` | 418 | ✍ Renvoie l'indice du type de culture du vignoble. |
| `PlaceableVine:getInitialGrowthState() → integer` | 427 | ✍ Renvoie l'état de croissance initial des nouvelles vignes : l'état hors saison si le type de culture ne peut pas être planté dans la période courante et qu'il est défini, sinon l'état en saison ou 1. Utilise `environment.currentPeriod`, NON VÉRIFIÉ. |
| `PlaceableVine:updateVineNode(node: any, isGrowing: any)` | 440 | ✍ Actualise un nœud de panneau : en croissance, peut réinitialiser toute la zone à un état cible lorsqu'une partie est déjà dans un état de réinitialisation (serveur seulement) ; relit ensuite les valeurs de croissance de chaque section dans la carte de densité et met à jour les visuels. Ignore les nœuds inconnus ou supprimés. |
| `PlaceableVine:updateVineVisuals(data: any)` | 498 | ✍ Affiche le nœud d'état de croissance dont la surface de feuillage est la plus grande, masque les autres, et fixe son paramètre de shader `hideSectionStates` d'après l'état dominant de chaque section (l'appel n'utilise que trois valeurs de section). |
| `PlaceableVine:harvestVine(node: any, startX: any, startY: any, startZ: any, currentX: any, currentY: any, currentZ: any, callback: any, target: any)` | 538 | ✍ Serveur seulement : pour les sections couvertes par le passage de la récolteuse au-delà du facteur de seuil, coupe la zone de vigne et appelle `callback(target, ...)` avec la surface et les facteurs de mauvaises herbes, de pulvérisation, de labour et de chaux ; puis actualise le nœud. |
| `PlaceableVine:setShakingFactor(node: any, worldX: any, worldY: any, worldZ: any, intensity: any)` | 573 | ✍ Fixe le paramètre de shader `harvestPosition` (position monde et intensité) sur tous les nœuds d'état du panneau pour animer la secousse. |
| `PlaceableVine:setSqueezeFactor(node: integer, worldX: number, worldY: number, worldZ: number, strength: number, length: number, fadeLength: number?)` | 594 | ✍ Fixe les paramètres de shader d'écrasement (`harvestSqueezePosition` et `harvestSqueezeScale` avec force, longueur, longueur de fondu) sur tous les nœuds d'état du panneau. |
| `PlaceableVine:prepareVine(node: any, startX: any, startY: any, startZ: any, currentX: any, currentY: any, currentZ: any)` | 609 | ✍ Serveur seulement : applique l'opération de préparation aux sections touchées par la trajectoire de la machine (au-delà du facteur de seuil), actualise le nœud si quelque chose a changé et renvoie la surface préparée totale (0 sur client ou nœud inconnu). |
| `PlaceableVine:getSectionFactor(node: any, i: any, startX: any, startY: any, startZ: any, currentX: any, currentY: any, currentZ: any)` | 641 | ✍ Renvoie la fraction (0 à 1) de la section `i` couverte, le long de l'axe Z local du nœud, par le segment entre les positions monde de départ et courante. |
| `PlaceableVine:getVineAreaByNode(node: any)` | 669 | ✍ Renvoie six nombres (coordonnées XZ des coins de départ, de largeur et de hauteur) du rectangle couvert par un nœud de panneau, selon la largeur et la longueur de vigne configurées. |
| `PlaceableVine:getVineFruitType()` | 687 | ✍ Renvoie l'indice du type de culture du vignoble, même valeur que `getVineFruitTypeIndex`. |
| `PlaceableVine:getHasSegmentTargetGrowthState(segment: any, fruitTypeIndex: any, useHarvestStates: any, usePrepareStates: any)` | 693 | ✍ Renvoie true si un panneau du segment a de la surface dans les états de croissance de récolte (ou l'état flétri en préparation) pour le type de culture donné ; false pour un autre type ou si aucun mode n'est demandé. |
| `PlaceableVine:getSegmentSideArea(segment: any, segmentSide: any)` | 734 | ✍ Renvoie six coordonnées XZ décrivant une bande le long d'un côté d'un segment de clôture, décalée du segment selon la distance d'accrochage (côté 1 par défaut). |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `updateVineNode` | 25 |
| registerFunction | `updateVineVisuals` | 26 |
| registerFunction | `destroyVineArea` | 27 |
| registerFunction | `getVineFruitTypeIndex` | 28 |
| registerFunction | `getInitialGrowthState` | 29 |
| registerFunction | `setShakingFactor` | 30 |
| registerFunction | `setSqueezeFactor` | 31 |
| registerFunction | `harvestVine` | 32 |
| registerFunction | `prepareVine` | 33 |
| registerFunction | `getVineFruitType` | 34 |
| registerFunction | `getHasSegmentTargetGrowthState` | 35 |
| registerFunction | `getSegmentSideArea` | 36 |
| registerFunction | `getSectionFactor` | 37 |
| registerFunction | `getVineAreaByNode` | 38 |
| registerOverwrittenFunction | `doDeletePanel` | 44 |
| registerOverwrittenFunction | `generateSegmentPoles` | 45 |
| registerOverwrittenFunction | `deleteSegment` | 46 |
| registerOverwrittenFunction | `getHasParallelSnapping` | 47 |
| registerEventListener | `onLoad` | 53 |
| registerEventListener | `onCreateSegmentPanel` | 54 |

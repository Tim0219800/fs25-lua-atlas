# internalMods/FS25_precisionFarming/scripts/maps/CoverMap.lua

*[English version](../../../../../../scripts/internalMods/FS25_precisionFarming/scripts/maps/CoverMap.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/maps/CoverMap.lua` — FS25 1.25.1.0

✍ Classe de carte de Precision Farming (enfant de ValueMap) qui suit la couverture du sol par pixel et utilise une carte temporaire de verrouillage de récolte pour savoir quels pixels ont réellement été récoltés. À la fin d'une récolte, elle déclenche les mises à jour de récolte des cartes d'azote, de pH et de taux de semis. Le constructeur et le chargement de la classe ne figurent pas dans ce dump ; seules les fonctions de mise à jour de la couverture y sont.

- **CoverMap** hérite de `ValueMap` (l.14)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `CoverMap:getCoverUpdateDensityMapModifiers(fruitTypes: table, preUpdate: boolean, useMinForageState: boolean, strawChopperActive: boolean) → DensityMapMultiModifier, table, table` | 319 | ✍ Construit, puis met en cache par ensemble de types de fruits et indicateur de fourrage, le DensityMapMultiModifier utilisé avant (preUpdate) ou après une récolte. Renvoie le multi-modificateur et les deux tables de statistiques partagées (pixels modifiés et totaux). |
| `CoverMap:preUpdateCoverArea(fruitTypes: table, densityMapShape: DensityMapPolygon, useMinForageState: boolean?, strawChopperActive: boolean) → integer?` | 472 | ✍ S'exécute avant la récolte : marque sur la carte de verrouillage temporaire les pixels à un stade récoltable (ou préparable) dans la forme donnée. Renvoie l'indice du type de fruit trouvé, ou nil, et le mémorise comme valeur de repli. |
| `CoverMap:postUpdateCoverArea(fruitTypes: table, densityMapShape: DensityMapPolygon, useMinForageState: boolean?, strawChopperActive: boolean, usedFruitIndex: integer?) → boolean, boolean` | 514 | ✍ S'exécute après la récolte : réduit l'état de couverture des pixels qui portaient du fruit et n'en portent plus, et appelle harvestUpdate sur les cartes d'azote, de pH et de taux de semis si des pixels étaient verrouillés. Efface le verrou et renvoie deux booléens (carte pH mise à jour, carte azote mise à jour). |

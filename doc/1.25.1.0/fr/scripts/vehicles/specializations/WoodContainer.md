# vehicles/specializations/WoodContainer.lua

*[English version](../../../../scripts/vehicles/specializations/WoodContainer.md)*

Source: `dataS/scripts/vehicles/specializations/WoodContainer.lua` — FS25 1.25.1.0

✍ Spécialisation pour conteneurs d'expédition qui reçoivent des grumes via un déclencheur. Le serveur supprime chaque arbre/grume admissible entrant dans le déclencheur et ajoute son volume en bois à une unité de remplissage, tout en suivant un volume pondéré par la qualité qui réduit la quantité payée au vidage. Elle gère un type de configuration `woodContainer`, une animation de poussée optionnelle, des sons de chargement et une plage de pliage si le véhicule est aussi pliable. L'état est sauvegardé (`woodQualityVolume`, `woodQualityTotalVolume`). La déclaration de la table de classe est absente des lignes du dump.


## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `WoodContainer.prerequisitesPresent(specializations: table) → boolean` | 20 | ✍ Renvoie toujours true : aucune spécialisation prérequise. |
| `WoodContainer.initSpecialization()` | 26 | ✍ Ajoute le type de configuration de véhicule `woodContainer`, enregistre les chemins XML (de base et par configuration), les réglages de son selon le nombre de grumes, et les deux attributs de sauvegarde des volumes de qualité. |
| `WoodContainer.registerXMLPaths(schema: any, baseKey: any)` | 47 | ✍ Enregistre sous une clé de base : limites de pliage, `#fillUnitIndex`, `#targetLength` (longueur idéale, 12 par défaut), `#triggerNode` et le nom et l'échelle de vitesse de l'animation de poussée. |
| `WoodContainer.registerFunctions(vehicleType: any)` | 61 | ✍ Enregistre `getPalletUnloadTriggerExtraSellPrice`, `getIsWoodContainerFillingAllowed` et `onWoodContainerTriggerCallback` sur le type de véhicule. |
| `WoodContainer.registerOverwrittenFunctions(vehicleType: any)` | 69 | ✍ Surcharge `getInfoBoxTitle` et `addFillUnitFillLevel` du véhicule. |
| `WoodContainer.registerEventListeners(vehicleType: any)` | 76 | ✍ S'abonne à onLoad, onDelete et onFillUnitFillLevelChanged. |
| `WoodContainer:onLoad(savegame: any)` | 84 | ✍ Choisit la section XML de la configuration `woodContainer` sélectionnée (repli sur la clé de base) et lit limites, unité de remplissage, longueur cible, déclencheur et animation. Sur le serveur, enregistre le callback du déclencheur ; sur le client, charge le son. Restaure les volumes de qualité sauvegardés. |
| `WoodContainer:onDelete()` | 131 | ✍ Retire le déclencheur du nœud et supprime les échantillons sonores. |
| `WoodContainer:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 144 | ✍ Écrit dans la sauvegarde les volumes de bois pondéré par la qualité et total. |
| `WoodContainer:onFillUnitFillLevelChanged(fillUnitIndex: any, fillLevelDelta: any, fillTypeIndex: any, toolType: any, fillPositionData: any, appliedDelta: any)` | 152 | ✍ Pour l'unité de remplissage du conteneur : côté client, joue le son de chargement quand le nombre apparent de grumes change pendant le remplissage ; joue l'animation de poussée en avant quand le niveau quitte zéro, en arrière quand il y revient. |
| `WoodContainer:getPalletUnloadTriggerExtraSellPrice()` | 182 | ✍ Renvoie le prix du véhicule (`getPrice()`), utilisé comme supplément de prix de vente par les déclencheurs de déchargement de palettes. |
| `WoodContainer:getIsWoodContainerFillingAllowed()` | 188 | ✍ Renvoie false si le véhicule est pliable et que le temps d'animation de pliage sort des limites min/max configurées ; sinon true. |
| `WoodContainer:getInfoBoxTitle(superFunc: any)` | 202 | ✍ Remplace le titre de la boîte d'info par le texte localisé `storeItem_shippingContainer`, sans appeler `superFunc`. |
| `WoodContainer:addFillUnitFillLevel(superFunc: any, farmId: any, fillUnitIndex: any, fillLevelDelta: any, fillTypeIndex: any, toolType: any, fillPositionData: any)` | 208 | ✍ Enveloppe l'appel parent. Lors d'un retrait de bois (delta négatif) avec un volume total suivi, le delta renvoyé est multiplié par le ratio volume de qualité / volume total, donc un bois de mauvaise qualité rapporte moins. Les volumes suivis ne sont pas diminués ici. |
| `WoodContainer:onWoodContainerTriggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean)` | 228 | ✍ Gestionnaire de déclencheur côté serveur. Si le remplissage est permis, prend une forme découpable valide, non « transport » et de prix positif, ajoute son volume en bois à l'unité, met à jour les volumes de qualité, supprime la forme et diffuse `WoodContainerWrongLengthEvent` si sa longueur s'écarte de plus d'1 m de la cible. Les arbres de transport déclenchent un avertissement clignotant. |
| `WoodContainer.getSplitShapeInfo(objectId: any, targetLength: any)` | 257 | ✍ Renvoie trois valeurs pour une forme découpable : volume en litres, échelle de qualité (selon le rapport de boîte englobante, les parties convexes, la longueur, les branches attachées, atténuée vers 1 selon la difficulté économique) et sa plus grande dimension englobante. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `getPalletUnloadTriggerExtraSellPrice` | 62 |
| registerFunction | `getIsWoodContainerFillingAllowed` | 63 |
| registerFunction | `onWoodContainerTriggerCallback` | 64 |
| registerOverwrittenFunction | `getInfoBoxTitle` | 70 |
| registerOverwrittenFunction | `addFillUnitFillLevel` | 71 |
| registerEventListener | `onLoad` | 77 |
| registerEventListener | `onDelete` | 78 |
| registerEventListener | `onFillUnitFillLevelChanged` | 79 |

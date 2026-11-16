# vehicles/specializations/FruitExtraObjects.lua

*[English version](../../../../scripts/vehicles/specializations/FruitExtraObjects.md)*

Source: `dataS/scripts/vehicles/specializations/FruitExtraObjects.lua` — FS25 1.25.1.0

✍ Spécialisation pour les barres de coupe et faucheuses qui affichent des objets supplémentaires ou jouent une animation selon le type de fruit ou de remplissage récolté (par exemple un kit de coupe pour une culture). Les objets sont définis sous vehicle.cutter ou vehicle.mower, l'un peut être par défaut, et la visibilité peut dépendre de l'attelage ou du montage sur une remorque de coupe. Purement visuel, côté client. Le type est fourni par getFruitExtraObjectTypeData, qui ne renvoie rien ici et doit être fourni ailleurs.


## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FruitExtraObjects.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Renvoie toujours true : aucune spécialisation prérequise. |
| `FruitExtraObjects.initSpecialization()` | 24 | ✍ Déclare les nœuds XML fruitExtraObjects sous vehicle.cutter et vehicle.mower, ainsi que les clés de sauvegarde lastFruitType et lastFillType. |
| `FruitExtraObjects.registerXMLPaths(schema: any, basePath: any)` | 40 | ✍ Déclare les attributs d'un bloc fruitExtraObjects sous le chemin de base donné : par objet nœud, animation, vitesse, isDefault, fruitType, fillType, ainsi que hideOnDetach et hideOnMount. |
| `FruitExtraObjects.registerFunctions(vehicleType: table)` | 54 | ✍ Enregistre loadFruitExtraObjectFromXML, getFruitExtraObjectTypeData et updateFruitExtraObjects sur le type de véhicule. |
| `FruitExtraObjects.registerOverwrittenFunctions(vehicleType: table)` | 63 | ✍ Vide : cette spécialisation ne surcharge aucune fonction. |
| `FruitExtraObjects.registerEventListeners(vehicleType: table)` | 69 | ✍ Abonne aux événements de post-chargement, changement de type de montage dynamique, pré-attelage et post-dételage. |
| `FruitExtraObjects:onPostLoad(savegame: table)` | 79 | ✍ Client uniquement : charge les objets supplémentaires des blocs XML cutter et mower (un objet par défaut possible), lit hideOnDetach/hideOnMount, restaure les derniers types de fruit et de remplissage depuis la sauvegarde et rafraîchit. Retire ses écouteurs sur serveur ou sans objet (il cite onLoadFinished, non enregistré ici). |
| `FruitExtraObjects:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 144 | ✍ Écrit dans la sauvegarde les noms du dernier type de fruit et du dernier type de remplissage lorsqu'ils sont définis. |
| `FruitExtraObjects:onDynamicMountTypeChanged(dynamicMountType: any, mountObject: any)` | 157 | ✍ Appelle updateFruitExtraObjects quand l'état de montage dynamique change. |
| `FruitExtraObjects:onPreAttach(attacherVehicle: table, inputJointDescIndex: integer, jointDescIndex: integer)` | 166 | ✍ Appelle updateFruitExtraObjects juste avant l'attelage du véhicule. |
| `FruitExtraObjects:onPostDetach(attacherVehicle: table, implement: table)` | 174 | ✍ Appelle updateFruitExtraObjects après le dételage du véhicule. |
| `FruitExtraObjects:loadFruitExtraObjectFromXML(xmlFile: any, key: any, extraObject: any)` | 180 | ✍ Charge un objet supplémentaire (nœud masqué au chargement, animation, vitesse, isDefault, type de fruit, type de remplissage). Renvoie false avec avertissement s'il n'a ni type ni isDefault, ou les deux. |
| `FruitExtraObjects:getFruitExtraObjectTypeData()` | 225 | ✍ Point d'extension par défaut renvoyant nil, nil (type de fruit, type de remplissage) ; destiné à être surchargé par la spécialisation qui connaît la culture courante, comme une barre de coupe ou une faucheuse. |
| `FruitExtraObjects:updateFruitExtraObjects()` | 231 | ✍ Choisit l'objet supplémentaire correspondant au type de fruit ou de remplissage courant (ou dernier connu), avec repli sur l'objet par défaut, le masque si détaché ou monté selon la configuration, et échange visibilité et animations en conséquence. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `loadFruitExtraObjectFromXML` | 55 |
| registerFunction | `getFruitExtraObjectTypeData` | 56 |
| registerFunction | `updateFruitExtraObjects` | 57 |
| registerEventListener | `onPostLoad` | 70 |
| registerEventListener | `onDynamicMountTypeChanged` | 71 |
| registerEventListener | `onPreAttach` | 72 |
| registerEventListener | `onPostDetach` | 73 |

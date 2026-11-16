# placeables/specializations/PlaceableProductionPoint.lua

*[English version](../../../../scripts/placeables/specializations/PlaceableProductionPoint.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableProductionPoint.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable qui encapsule un objet ProductionPoint (chaînes de production avec stockage d'entrée/sortie, stations de chargement et de déchargement). Elle exige PlaceableInfoTrigger, gère une configuration par XML (productionPointConfigurations), un état non finalisé pour les bâtiments constructibles, la synchronisation réseau du point de production, la sauvegarde et une limite du nombre de points via g_currentMission.productionChainManager. Elle déclenche onOutputFillTypesChanged et onProductionStatusChanged.

- **PlaceableProductionPoint** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableProductionPoint.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Exige la présence de la spécialisation PlaceableInfoTrigger. |
| `PlaceableProductionPoint.registerEvents(placeableType: any)` | 24 | ✍ Enregistre les événements onOutputFillTypesChanged et onProductionStatusChanged sur le type de placeable. |
| `PlaceableProductionPoint.registerFunctions(placeableType: any)` | 31 | ✍ Enregistre outputsChanged et productionStatusChanged, que le ProductionPoint appelle pour notifier son placeable. |
| `PlaceableProductionPoint.registerOverwrittenFunctions(placeableType: any)` | 38 | ✍ Surcharge setOwnerFarmId, collectPickObjects, canBuy, updateInfo et finalizeConstruction (cette dernière est enregistrée ici mais non définie dans ce fichier du dump, NON VÉRIFIÉ). |
| `PlaceableProductionPoint.registerEventListeners(placeableType: any)` | 48 | ✍ Abonne aux événements onLoad, onDelete, onFinalizePlacement, onWriteStream, onReadStream et onBuy. |
| `PlaceableProductionPoint.registerXMLPaths(schema: any, basePath: any)` | 59 | ✍ Déclare le XML du point de production sous placeable.productionPoint et dans chaque productionPointConfiguration, avec un indicateur isFinalized pour les bâtiments constructibles. |
| `PlaceableProductionPoint.registerSavegameXMLPaths(schema: any, basePath: any)` | 77 | ✍ Enregistre les chemins XML de sauvegarde en déléguant à ProductionPoint.registerSavegameXMLPaths. |
| `PlaceableProductionPoint.initSpecialization()` | 85 | ✍ Ajoute les types de spécifications de boutique prodPointInputFillTypes et prodPointOutputFillTypes pour les placeables et enregistre le type de configuration productionPoint auprès de g_placeableConfigurationManager. |
| `PlaceableProductionPoint:onLoad(savegame: table)` | 94 | ✍ Choisit le nœud XML de la configuration sélectionnée (repli sur placeable.productionPoint), crée et charge le ProductionPoint. Si isFinalized est faux, masque la station du menu des prix et désactive les missions ; en cas d'échec, passe l'état de chargement à ERROR. |
| `PlaceableProductionPoint:onDelete()` | 123 | ✍ Supprime le point de production et efface la référence. |
| `PlaceableProductionPoint:onFinalizePlacement()` | 134 | ✍ Enregistre le point de production, définit son propriétaire (AccessHandler.EVERYONE si non finalisé), cherche les extensions de stockage et met à jour les effets. Désactive le déclencheur d'achat par interaction si le placeable a un déclencheur d'achat. |
| `PlaceableProductionPoint:updateInfo(superFunc: any, infoTable: any)` | 163 | ✍ Appelle l'updateInfo parent, puis laisse le point de production ajouter ses propres lignes au tableau d'infos. |
| `PlaceableProductionPoint:outputsChanged(outputs: any, state: any)` | 171 | ✍ Déclenche l'événement de placeable onOutputFillTypesChanged avec les sorties et l'état. |
| `PlaceableProductionPoint:productionStatusChanged(production: any, status: any)` | 177 | ✍ Déclenche l'événement de placeable onProductionStatusChanged avec la production et son statut. |
| `PlaceableProductionPoint:onReadStream(streamId: any, connection: any)` | 183 | ✍ Côté client de la synchronisation initiale : lit l'identifiant d'objet du point de production et ses données, puis termine l'enregistrement de l'objet auprès de g_client. |
| `PlaceableProductionPoint:onWriteStream(streamId: any, connection: any)` | 194 | ✍ Côté serveur de la synchronisation initiale : écrit l'identifiant d'objet et les données du point de production, et enregistre l'objet dans le flux de cette connexion. |
| `PlaceableProductionPoint:loadFromXMLFile(xmlFile: any, key: any)` | 205 | ✍ Transmet le chargement de la sauvegarde au point de production. |
| `PlaceableProductionPoint:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 214 | ✍ Transmet l'écriture de la sauvegarde au point de production. |
| `PlaceableProductionPoint:setOwnerFarmId(superFunc: any, farmId: any, noEventSend: any)` | 223 | ✍ Appelle le parent, puis donne le propriétaire au point de production (EVERYONE tant que non finalisé). Si non finalisé, le retire aussi du productionChainManager. |
| `PlaceableProductionPoint:collectPickObjects(superFunc: any, node: any)` | 242 | ✍ N'ajoute pas le nœud aux objets pickables s'il s'agit d'un nœud de déclencheur de chargement ou du nœud racine de remplissage exact d'un déclencheur de déchargement ; sinon délègue au parent. |
| `PlaceableProductionPoint:canBuy(superFunc: any)` | 265 | ✍ Retourne false avec un texte d'avertissement si productionChainManager n'a plus d'emplacement libre ; sinon retourne le résultat du parent. |
| `PlaceableProductionPoint:onBuy()` | 276 | ✍ Compte les points de production appartenant à la ferme courante et transmet le total à g_achievementManager sous NumProductionPoints. À noter : tous les placeables possédés avec cette spécialisation sont comptés, finalisés ou non. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEvent | `onOutputFillTypesChanged` | 25 |
| registerEvent | `onProductionStatusChanged` | 26 |
| registerFunction | `outputsChanged` | 32 |
| registerFunction | `productionStatusChanged` | 33 |
| registerOverwrittenFunction | `setOwnerFarmId` | 39 |
| registerOverwrittenFunction | `collectPickObjects` | 40 |
| registerOverwrittenFunction | `canBuy` | 41 |
| registerOverwrittenFunction | `updateInfo` | 42 |
| registerOverwrittenFunction | `finalizeConstruction` | 43 |
| registerEventListener | `onLoad` | 49 |
| registerEventListener | `onDelete` | 50 |
| registerEventListener | `onFinalizePlacement` | 51 |
| registerEventListener | `onWriteStream` | 52 |
| registerEventListener | `onReadStream` | 53 |
| registerEventListener | `onBuy` | 54 |

# placeables/specializations/PlaceableFactory.lua

*[English version](../../../../scripts/placeables/specializations/PlaceableFactory.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableFactory.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable pour une usine qui consomme au fil du temps des types de remplissage d'entrée configurés puis produit un unique objet de grande valeur (par exemple une machine terminée), vendu par la ferme. Elle exige PlaceableSellingStation, réutilise son SellingStation, ajoute un Storage pour les entrées et s'inscrit comme une production dans le menu des productions. Le serveur pilote la progression ; les clients la reçoivent via le flux réseau. Plusieurs méthodes enregistrées (updateRemainingAmount, setMeshProgress, createFactoryItem, sellFactoryItem, updateInfo, onUpdate, etc.) n'ont pas de corps dans le dump du SDK : NON VÉRIFIÉ.

- **PlaceableFactory** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableFactory.prerequisitesPresent(specializations: table) → boolean` | 19 | ✍ Renvoie true uniquement si le type de placeable possède aussi la spécialisation PlaceableSellingStation. |
| `PlaceableFactory.registerFunctions(placeableType: any)` | 25 | ✍ Enregistre sur le type de placeable les méthodes de l'usine : chargement des meshes, quantité restante et progression, création et vente de l'objet, capacité et niveau, demande d'achat, déclencheur joueur et données d'info. |
| `PlaceableFactory.registerOverwrittenFunctions(placeableType: any)` | 41 | ✍ Surcharge updateInfo et setOwnerFarmId sur le type de placeable pour que l'usine ajoute ses lignes d'info et réagisse aux changements de propriétaire. |
| `PlaceableFactory.registerEventListeners(placeableType: any)` | 48 | ✍ Abonne la spécialisation aux événements de chargement, suppression, mise à jour, lecture/écriture de flux, flux de mise à jour, finalisation du placement et entrée/sortie du déclencheur d'info. |
| `PlaceableFactory.registerXMLPaths(schema: any, basePath: any)` | 63 | ✍ Déclare les chemins XML sous factory : déclencheur joueur, objet (noeud de liaison, fichier i3d, récompense, meshes à visibilité progressive), entrées et sortie de production, station de vente, stockage et son actif. |
| `PlaceableFactory.registerSavegameXMLPaths(schema: any, basePath: any)` | 93 | ✍ Déclare les chemins de sauvegarde : une entrée par type de remplissage avec sa quantité restante, plus le bloc de stockage. |
| `PlaceableFactory:onLoad(savegame: table)` | 103 | ✍ Charge l'i3d de l'objet en asynchrone, crée le Storage et adapte le SellingStation (accepte toute marchandise, saute la vente si une ferme le possède). Lit les entrées (quantité, usagePerHour converti par seconde) et la sortie dans une entrée de productions, puis crée le déclencheur joueur et le son. |
| `PlaceableFactory:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 340 | ✍ Sauvegarde le type de remplissage et la quantité restante de chaque entrée, puis le contenu du stockage. |
| `PlaceableFactory:loadFromXMLFile(xmlFile: any, key: any)` | 353 | ✍ Restaure les quantités restantes par entrée en faisant correspondre les noms de types de remplissage (via updateRemainingAmount), puis charge le contenu du stockage. |
| `PlaceableFactory:onReadStream(streamId: any, connection: any)` | 373 | ✍ Côté client à la connexion : lit l'id et l'état du stockage, l'indicateur de matières d'entrée, la progression compressée et l'index de masquage de chaque mesh progressif, appliqué avec setMeshProgress. |
| `PlaceableFactory:onWriteStream(streamId: any, connection: any)` | 394 | ✍ Pendant serveur de onReadStream : écrit l'id et l'état du stockage, l'enregistre dans le flux, puis l'indicateur d'entrée, la progression et la dernière valeur de chaque mesh progressif. |
| `PlaceableFactory:setOwnerFarmId(superFunc: any, farmId: any)` | 520 | ✍ Appelle le parent, puis n'affiche le déclencheur joueur que tant que l'usine n'a pas de propriétaire. Hors aperçu de construction, elle réinscrit l'usine dans la chaîne de production et ajoute ou retire sa station de vente de l'économie et du système de stockage. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `onMeshI3DFileLoaded` | 26 |
| registerFunction | `updateRemainingAmount` | 27 |
| registerFunction | `setMeshProgress` | 28 |
| registerFunction | `createFactoryItem` | 29 |
| registerFunction | `sellFactoryItem` | 30 |
| registerFunction | `getCapacity` | 31 |
| registerFunction | `getFillLevel` | 32 |
| registerFunction | `removeFillLevel` | 33 |
| registerFunction | `playerTriggerCallback` | 34 |
| registerFunction | `buyRequest` | 35 |
| registerFunction | `updateInfoData` | 36 |
| registerOverwrittenFunction | `updateInfo` | 42 |
| registerOverwrittenFunction | `setOwnerFarmId` | 43 |
| registerEventListener | `onLoad` | 49 |
| registerEventListener | `onDelete` | 50 |
| registerEventListener | `onUpdate` | 51 |
| registerEventListener | `onReadStream` | 52 |
| registerEventListener | `onWriteStream` | 53 |
| registerEventListener | `onReadUpdateStream` | 54 |
| registerEventListener | `onWriteUpdateStream` | 55 |
| registerEventListener | `onFinalizePlacement` | 56 |
| registerEventListener | `onInfoTriggerEnter` | 57 |
| registerEventListener | `onInfoTriggerLeave` | 58 |

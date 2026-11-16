# placeables/specializations/PlaceableManureHeap.lua

*[English version](../../../../scripts/placeables/specializations/PlaceableManureHeap.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableManureHeap.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable pour un tas de fumier : elle crée une LoadingStation et un objet de stockage ManureHeap, les enregistre dans le système de stockage de la mission et peut exiger un placement près d'une étable. Gère le streaming réseau, la délégation de la sauvegarde à l'objet ManureHeap, la spec de capacité du magasin et le niveau affiché dans l'info HUD. ManureHeap, LoadingStation et le système de stockage sont utilisés mais leur code n'est pas dans ce fichier.

- **PlaceableManureHeap** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableManureHeap.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Renvoie toujours true : aucune spécialisation prérequise. |
| `PlaceableManureHeap.registerOverwrittenFunctions(placeableType: any)` | 24 | ✍ Surcharge setOwnerFarmId, collectPickObjects, getCanBePlacedAt et updateInfo sur le type de placeable. |
| `PlaceableManureHeap.registerEventListeners(placeableType: any)` | 33 | ✍ S'abonne à onLoad, onDelete, onFinalizePlacement, onReadStream et onWriteStream. |
| `PlaceableManureHeap.registerXMLPaths(schema: any, basePath: any)` | 43 | ✍ Déclare les clés XML manureHeap : celles de ManureHeap, le drapeau needsBarn (défaut du schéma : true) et les clés loadingStation imbriquées. |
| `PlaceableManureHeap.registerSavegameXMLPaths(schema: any, basePath: any)` | 53 | ✍ Enregistre les clés XML de sauvegarde en déléguant à ManureHeap.registerSavegameXMLPaths. |
| `PlaceableManureHeap.initSpecialization()` | 61 | ✍ Enregistre dans le magasin le type de spec manureHeapCapacity (icône de capacité, espèce placeable) avec ses callbacks de chargement et d'affichage. |
| `PlaceableManureHeap:onLoad(savegame: table)` | 68 | ✍ Crée et charge la station de chargement puis le ManureHeap, et lit needsBarn dans le XML. Renvoie false (et libère la station) si le chargement de la station échoue. À noter : spec.isServer est passé à ManureHeap.new alors que ce champ n'est pas défini ici, et needsBarn vaut false par défaut ici alors que le schéma indique true. |
| `PlaceableManureHeap:onDelete()` | 96 | ✍ Retire le tas du système de stockage et de ses stations de chargement/déchargement, le supprime, puis désenregistre et supprime la station de chargement (y compris de la liste des stations de fumier si le fumier est supporté). |
| `PlaceableManureHeap:onFinalizePlacement()` | 125 | ✍ Enregistre la station de chargement et le tas comme objets réseau, les ajoute au système de stockage avec la ferme propriétaire, et relie le tas et les extensions de stockage proches aux stations extensibles à portée. |
| `PlaceableManureHeap:onReadStream(streamId: any, connection: any)` | 160 | ✍ Côté client à la connexion : lit les identifiants d'objet et les données de flux de la station et du tas, puis termine leur enregistrement côté client. |
| `PlaceableManureHeap:onWriteStream(streamId: any, connection: any)` | 176 | ✍ Côté serveur à la connexion : écrit les identifiants d'objet et les données de flux de la station et du tas et enregistre les deux objets dans le flux de la connexion. |
| `PlaceableManureHeap:loadFromXMLFile(xmlFile: any, key: any)` | 192 | ✍ Chargement de sauvegarde : transmet à l'objet ManureHeap s'il existe. |
| `PlaceableManureHeap:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 201 | ✍ Écriture de sauvegarde : transmet à l'objet ManureHeap s'il existe. |
| `PlaceableManureHeap:setOwnerFarmId(superFunc: any, farmId: any, noEventSend: any)` | 210 | ✍ Surcharge : appelle le parent puis, côté serveur, applique le propriétaire au tas et relie à nouveau extensions de stockage et stations extensibles à portée pour la nouvelle ferme. |
| `PlaceableManureHeap:collectPickObjects(superFunc: any, node: any)` | 241 | ✍ Surcharge : ignore les nœuds de trigger de chargement de la station et le trigger d'activation du tas pour qu'ils ne soient pas sélectionnables ; les autres nœuds passent au parent. |
| `PlaceableManureHeap:getCanBePlacedAt(superFunc: any, x: any, y: any, z: any, farmId: any)` | 263 | ✍ Surcharge : refuse le placement s'il n'y a pas de tas, ou si needsBarn est actif et qu'aucune station de déchargement extensible de la ferme n'est à portée (renvoie false et un texte d'avertissement) ; sinon délègue au parent. |
| `PlaceableManureHeap:updateInfo(superFunc: any, infoTable: any)` | 284 | ✍ Surcharge : après le parent, ajoute à la table d'infos une ligne indiquant le niveau de remplissage du tas en litres. |
| `PlaceableManureHeap.loadSpecValueCapacity(xmlFile: any, customEnvironment: any, baseDir: any)` | 300 | ✍ Lit la valeur de capacité manureHeap dans le XML du placeable pour la spec du magasin. |
| `PlaceableManureHeap.getSpecValueCapacity(storeItem: any, realItem: any)` | 306 | ✍ Renvoie la capacité formatée en volume pour le magasin, ou nil si l'objet n'en a pas. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerOverwrittenFunction | `setOwnerFarmId` | 25 |
| registerOverwrittenFunction | `collectPickObjects` | 26 |
| registerOverwrittenFunction | `getCanBePlacedAt` | 27 |
| registerOverwrittenFunction | `updateInfo` | 28 |
| registerEventListener | `onLoad` | 34 |
| registerEventListener | `onDelete` | 35 |
| registerEventListener | `onFinalizePlacement` | 36 |
| registerEventListener | `onReadStream` | 37 |
| registerEventListener | `onWriteStream` | 38 |

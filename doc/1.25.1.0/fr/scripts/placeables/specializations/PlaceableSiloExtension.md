# placeables/specializations/PlaceableSiloExtension.lua

*[English version](../../../../scripts/placeables/specializations/PlaceableSiloExtension.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableSiloExtension.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable sans prérequis pour les extensions de stockage qui ajoutent de la capacité à des silos existants. Elle possède un unique objet Storage, l'enregistre auprès de g_currentMission.storageSystem et le rattache aux stations de déchargement et de chargement à portée de la même ferme. Le placement est refusé si aucune station n'est à portée, et la vente avertit du contenu stocké et verse sa valeur estimée. Le stockage est transmis aux clients et sauvegardé avec le placeable.

- **PlaceableSiloExtension** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableSiloExtension.prerequisitesPresent(specializations: table) → boolean` | 19 | ✍ Retourne toujours true. |
| `PlaceableSiloExtension.registerOverwrittenFunctions(placeableType: any)` | 25 | ✍ Surcharge setOwnerFarmId, getCanBePlacedAt et canBeSold. |
| `PlaceableSiloExtension.registerEventListeners(placeableType: any)` | 33 | ✍ Abonne à onLoad, onDelete, onFinalizePlacement, onReadStream, onWriteStream et onSell. |
| `PlaceableSiloExtension.registerXMLPaths(schema: any, basePath: any)` | 44 | ✍ Déclare le XML sous placeable.siloExtension : indicateur foreignSilo, avertissement traduisible pour un placement loin d'un silo, nœud de stockage et définition de Storage. |
| `PlaceableSiloExtension.registerSavegameXMLPaths(schema: any, basePath: any)` | 55 | ✍ Déclare les clés de sauvegarde en déléguant à Storage.registerSavegameXMLPaths. |
| `PlaceableSiloExtension.initSpecialization()` | 63 | ✍ Ajoute le type de spécification de boutique siloExtensionVolume (icône de capacité) pour les placeables. |
| `PlaceableSiloExtension:onLoad(savegame: table)` | 70 | ✍ Crée et charge le Storage depuis placeable.siloExtension.storage (avertit s'il manque), lui copie l'indicateur foreignSilo et lit le texte d'avertissement de proximité d'un silo. |
| `PlaceableSiloExtension:onDelete()` | 90 | ✍ Si le stockage est connu du système de stockage, le détache de toutes ses stations de déchargement et de chargement et le retire ; puis supprime le stockage. |
| `PlaceableSiloExtension:onFinalizePlacement()` | 109 | ✍ Trouve les stations de déchargement et de chargement extensibles à portée pour la ferme propriétaire, attribue le propriétaire au stockage, l'enregistre comme objet réseau et l'ajoute au système de stockage et à ces stations. |
| `PlaceableSiloExtension:onReadStream(streamId: any, connection: any)` | 128 | ✍ Synchronisation initiale côté client : lit l'identifiant d'objet et les données du stockage et termine son enregistrement auprès de g_client, si le placeable a un stockage. |
| `PlaceableSiloExtension:onWriteStream(streamId: any, connection: any)` | 140 | ✍ Synchronisation initiale côté serveur : écrit l'identifiant d'objet et les données du stockage et l'enregistre dans le flux de cette connexion. |
| `PlaceableSiloExtension:getCanBePlacedAt(superFunc: any, x: any, y: any, z: any, farmId: any)` | 152 | ✍ Retourne le refus du parent le cas échéant ; faux aussi sans stockage. Cherche à la position donnée des stations de déchargement et de chargement extensibles à portée pour cette ferme et retourne false avec l'avertissement de proximité s'il n'y en a aucune, sinon true. |
| `PlaceableSiloExtension:canBeSold(superFunc: any)` | 179 | ✍ Retourne true ; si le stockage contient quelque chose, retourne aussi un avertissement listant chaque type de remplissage avec une valeur estimée (prix le plus bas d'un point de vente fois PRICE_SELL_FACTOR) et conserve le total pour onSell. |
| `PlaceableSiloExtension:loadFromXMLFile(xmlFile: any, key: any)` | 228 | ✍ Transmet le chargement de la sauvegarde au stockage, s'il existe. |
| `PlaceableSiloExtension:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 238 | ✍ Transmet l'écriture de la sauvegarde au stockage, s'il existe. |
| `PlaceableSiloExtension:setOwnerFarmId(superFunc: any, farmId: any, noEventSend: any)` | 247 | ✍ Appelle le parent, puis sur le serveur donne la même ferme propriétaire au stockage. |
| `PlaceableSiloExtension:onSell()` | 259 | ✍ Serveur uniquement : verse à la ferme la valeur totale du contenu calculée dans canBeSold, en HARVEST_INCOME. |
| `PlaceableSiloExtension.loadSpecValueVolume(xmlFile: any, customEnvironment: any, baseDir: any)` | 271 | ✍ Lit la capacité du stockage depuis le XML de l'article de boutique. |
| `PlaceableSiloExtension.getSpecValueVolume(storeItem: any, realItem: any)` | 277 | ✍ Retourne le volume de l'extension formaté pour la boutique, ou nil si l'article n'en a pas. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerOverwrittenFunction | `setOwnerFarmId` | 26 |
| registerOverwrittenFunction | `getCanBePlacedAt` | 27 |
| registerOverwrittenFunction | `canBeSold` | 28 |
| registerEventListener | `onLoad` | 34 |
| registerEventListener | `onDelete` | 35 |
| registerEventListener | `onFinalizePlacement` | 36 |
| registerEventListener | `onReadStream` | 37 |
| registerEventListener | `onWriteStream` | 38 |
| registerEventListener | `onSell` | 39 |

# handTools/HandToolHolder.lua

*[English version](../../../scripts/handTools/HandToolHolder.md)*

Source: `dataS/scripts/handTools/HandToolHolder.lua` — FS25 1.25.1.0

✍ Objet réseau (fille de `Object`) pouvant ranger un outil à main, par exemple un support sur un véhicule ou un bâtiment. Il est chargé depuis le XML `handToolHolder(?)` (type et noeud du holder, i3d factice, click boxes, déclencheur d'activation, outil généré optionnel, textes de prise/rangement), s'enregistre dans `g_currentMission.handToolSystem` et utilise un `HandToolHolderActivatable` pour l'invite du joueur. Si un nom d'outil généré est défini, seul cet outil peut y être rangé.

- **HandToolHolder** hérite de `Object` (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `HandToolHolder.registerXMLPaths(schema: any, basePath: any)` | 17 | ✍ Déclare l'enregistrement XML partagé `HandToolHolder` : type, noeud et fichier factice du holder, noeuds de click boxes, noeud de déclencheur, fichier de l'outil généré, textes de prise et de rangement. |
| `HandToolHolder.registerSavegameXMLPaths(schema: any, basePath: any)` | 34 | ✍ Déclare l'attribut de sauvegarde `#uniqueId`. |
| `HandToolHolder.new(parent: any, isServer: any, isClient: any, customMt: any)` | 40 | ✍ Crée l'objet holder avec son parent, un nom vide, aucun outil et le joueur marqué hors de portée. |
| `HandToolHolder:load(xmlFile: any, key: any, callback: any, callbackTarget: any, callbackArgs: any, components: any, i3dMappings: any, baseDirectory: any, customEnv: any)` | 53 | ✍ Lit le XML : type et noeud du holder, i3d factice optionnel (chargement partagé asynchrone), click boxes, déclencheur d'activation (`onPlayerCallback`), textes et outil généré optionnel, chargé via `HandToolLoadingData` (non enregistré). Crée l'activable (ciblage requis sans déclencheur). Appelle `onFinishedLoading` tout de suite sauf si un outil généré est encore en chargement. |
| `HandToolHolder:onDummyHandToolI3DLoaded(i3dNode: any, failedReason: any, args: any)` | 110 | ✍ Callback du chargement de l'i3d factice : lie le premier enfant sous le noeud du holder, supprime la racine chargée et rafraîchit la visibilité du factice. Ne fait rien si le chargement a échoué (noeud 0). |
| `HandToolHolder:onSpawnedHandToolLoaded(handTool: any, loadingState: any)` | 121 | ✍ Callback quand l'outil généré est chargé : en cas d'échec, journalise une erreur et appelle le callback avec nil ; sinon rattache l'outil à ce holder, le range dedans, l'enregistre si le holder l'est, renseigne `spawnedHandToolFilename` s'il est vide et termine le chargement. |
| `HandToolHolder:onFinishedLoading()` | 149 | ✍ Appelle le callback de chargement avec le holder, l'ajoute au système d'outils à main et, sans déclencheur, enregistre l'activable auprès du système d'objets activables. |
| `HandToolHolder:delete()` | 161 | ✍ Annule un chargement d'outil en attente, libère un outil rangé non généré, supprime l'outil généré, retire le déclencheur, libère l'i3d factice partagé, se désinscrit du système d'outils à main et des activables, puis appelle le delete parent. |
| `HandToolHolder:saveToXMLFile(xmlFile: any, key: any)` | 201 | ✍ Écrit l'identifiant unique du holder dans `key#uniqueId`. |
| `HandToolHolder:loadFromXMLFile(xmlFile: any, key: any)` | 207 | ✍ Lit `#uniqueId` et l'applique s'il est présent. |
| `HandToolHolder:writeStream(streamId: integer, connection: Connection)` | 218 | ✍ Serveur vers client : écrit si un outil généré existe et, le cas échéant, son identifiant d'objet et ses données `postWriteStream`, et l'enregistre dans le flux. |
| `HandToolHolder:readStream(streamId: integer, connection: Connection, objectId: integer)` | 234 | ✍ Client depuis le serveur : si un outil généré est signalé, lit son identifiant d'objet, appelle `postReadStream` sur l'outil généré local et termine son enregistrement d'objet. |
| `HandToolHolder:register(alreadySent: any)` | 247 | ✍ Appelle le register parent, puis enregistre aussi l'outil généré s'il ne l'est pas encore. |
| `HandToolHolder:getUniqueId() → string` | 260 | ✍ Renvoie l'identifiant unique du holder. |
| `HandToolHolder:setUniqueId(uniqueId: string)` | 267 | ✍ Définit l'identifiant unique ; il ne doit plus changer après la première affectation (seules des assertions de debug le vérifient). |
| `HandToolHolder:getHolderName()` | 275 | ✍ Renvoie le nom du holder. |
| `HandToolHolder:setHolderName(name: any)` | 281 | ✍ Définit le nom du holder. |
| `HandToolHolder:getHandTool()` | 287 | ✍ Renvoie l'outil à main actuellement rangé, ou nil. |
| `HandToolHolder:getSpawnedHandTool()` | 293 | ✍ Renvoie l'outil à main généré par ce holder, ou nil. |
| `HandToolHolder:getSpawnsHandTool()` | 299 | ✍ Renvoie true si un nom d'outil à main généré est configuré. |
| `HandToolHolder:getHolderNodePair(handTool: any)` | 305 | ✍ Renvoie le noeud du holder et le noeud d'étui de l'outil pour le type de ce holder, à aligner ; renvoie nil, nil si l'outil n'a pas `getHolsterNodeByType` ou pas de noeud correspondant. |
| `HandToolHolder:getCanPickupHandToolFromMenu(handTool: any)` | 322 | ✍ Renvoie toujours true. |
| `HandToolHolder:getCanPickupHandTool(handTool: any)` | 328 | ✍ Renvoie true si le holder est vide et que l'outil est rangeable (`spec_storable`) ; avec un outil généré ce doit être cet outil, sinon l'outil doit avoir un noeud d'étui de ce type et la même ferme propriétaire. |
| `HandToolHolder:onPickupHandTool(handTool: any)` | 355 | ✍ Range un outil s'il est autorisé : le mémorise, appelle le callback de rangement, lie son noeud racine au noeud du holder aligné via `HandToolUtil.linkAndTransformRelativeToParent`, remet à zéro le noeud graphique et met à jour le factice. Renvoie true en cas de succès. |
| `HandToolHolder:setPlayerInRange(isInRange: any)` | 393 | ✍ Mémorise si le joueur local est à portée et met à jour la visibilité du factice. |
| `HandToolHolder:updateDummyHandTool()` | 400 | ✍ N'affiche l'outil factice que si le joueur est à portée et le holder vide. |
| `HandToolHolder:onDropHandTool(handTool: any)` | 409 | ✍ Si l'outil donné est celui rangé, le délie, vide le holder, appelle le callback de retrait, met à jour le factice et renvoie l'outil ; sinon ne fait rien. |
| `HandToolHolder:drawDebug()` | 430 | ✍ Debug : dessine des gizmos au noeud du holder et, si un outil est rangé, à son noeud d'étui. |
| `HandToolHolder:setOwnerFarmId(farmId: any, noEventSend: any)` | 443 | ✍ Appelle le parent et propage l'identifiant de ferme propriétaire à l'outil généré (sans envoi d'événement). |
| `HandToolHolder:setStoreCallback(storeCallback: any)` | 453 | ✍ Définit la fonction appelée avec l'outil quand il est rangé. |
| `HandToolHolder:setPickupCallback(pickupCallback: any)` | 459 | ✍ Définit la fonction appelée avec l'outil quand il est retiré. |
| `HandToolHolder:onPlayerCallback(triggerId: any, otherId: any, onEnter: any, onLeave: any, onStay: any)` | 465 | ✍ Callback du déclencheur : pour le noeud racine du joueur local, l'entrée ajoute l'activable et passe en portée, la sortie le retire et quitte la portée. |

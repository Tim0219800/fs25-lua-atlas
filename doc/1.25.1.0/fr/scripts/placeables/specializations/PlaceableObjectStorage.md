# placeables/specializations/PlaceableObjectStorage.lua

*[English version](../../../../scripts/placeables/specializations/PlaceableObjectStorage.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableObjectStorage.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable pour les bâtiments de stockage qui conservent balles et palettes sous forme d'objets abstraits (regroupés en infos d'objets), avec des zones d'apparition pour les sortir et des zones de stockage où des copies visuelles sont affichées. Le joueur ouvre un dialogue de sortie via un activatable, les objets entrent par un trigger d'objets (automatiquement ou par stockage manuel) et le serveur les refait apparaître après un test de chevauchement. La synchro réseau utilise les flux de lecture/écriture et un drapeau dirty. Le dump omet plusieurs éléments dont ce fichier dépend (constantes de PlaceableObjectStorage, tables ABSTRACT_OBJECTS, getNextSpawnAreaAndOffset, onObjectStorageObjectTriggerCallback, onPendingObjectDelete et méthodes d'AbstractBaleObject) : NON VÉRIFIÉ.

- **PlaceableObjectStorage** (l.11)
- **AbstractBaleObject** (l.1131)
- **PlaceableObjectStorageActivatable** (l.1857)
- **PlaceableObjectStorageManualStoreActivatable** (l.1919)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableObjectStorage.prerequisitesPresent(specializations: table) → boolean` | 30 | ✍ Renvoie toujours true : aucune spécialisation prérequise. |
| `PlaceableObjectStorage.registerOverwrittenFunctions(placeableType: any)` | 36 | ✍ Surcharge canBeSold et updateInfo sur le type de placeable. |
| `PlaceableObjectStorage.registerFunctions(placeableType: any)` | 43 | ✍ Enregistre sur le type de placeable les fonctions du stockage d'objets (tests de support, ajout/retrait d'objets abstraits, apparition, infos d'objets, zones visuelles, stockage manuel, callbacks de triggers). |
| `PlaceableObjectStorage.registerEventListeners(placeableType: any)` | 68 | ✍ S'abonne à onLoad, onDelete, onReadStream, onWriteStream, onReadUpdateStream, onWriteUpdateStream et onUpdate. |
| `PlaceableObjectStorage.registerXMLPaths(schema: any, basePath: any)` | 80 | ✍ Déclare les clés XML objectStorage : nœuds de trigger joueur/objet, types et catégories de remplissage supportés, support balles/palettes, entrées supportedObject, capacité (défaut 250), limites de taille, maxUnloadAmount (défaut 25), zones d'apparition et de stockage (hauteur d'empilement max par défaut 3). |
| `PlaceableObjectStorage.registerSavegameXMLPaths(schema: any, basePath: any)` | 117 | ✍ Enregistre les clés de sauvegarde des objets stockés : un className par objet plus les clés de chaque classe d'objet abstrait de PlaceableObjectStorage.ABSTRACT_OBJECTS. |
| `PlaceableObjectStorage.initSpecialization()` | 126 | ✍ Enregistre dans le magasin les types de spec objectStorageCapacity et objectStorageFillTypes pour les placeables. |
| `PlaceableObjectStorage:onLoad(savegame: table)` | 134 | ✍ Charge les triggers (celui des objets uniquement côté serveur), types de remplissage et objets supportés, capacité et limites de taille, zones d'apparition et de stockage, tables d'état, textes, les deux activatables et le drapeau dirty. Avertit si le trigger joueur ou objet manque. |
| `PlaceableObjectStorage:loadFromXMLFile(xmlFile: any, key: any)` | 245 | ✍ Chargement de sauvegarde : pour chaque entrée d'objet, retrouve la classe d'objet abstrait par son className et la laisse se charger, puis marque les infos d'objets comme modifiées. À noter : l'avertissement pour un className nil affiche ce nom nil. |
| `PlaceableObjectStorage:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 263 | ✍ Écriture de sauvegarde : écrit le REFERENCE_CLASS_NAME de chaque objet abstrait stocké et le laisse sauvegarder ses données sous une clé object indexée. |
| `PlaceableObjectStorage:onDelete()` | 278 | ✍ Retire les triggers, supprime tous les objets abstraits stockés, vide les objets en attente et leurs écouteurs de suppression, et retire les deux activatables. |
| `PlaceableObjectStorage:onReadStream(streamId: any, connection: any)` | 310 | ✍ Côté client : reconstruit objectInfos depuis le flux (nombre, quantité et objet abstrait par info), recalcule le total stocké et met à jour les zones visuelles. |
| `PlaceableObjectStorage:onWriteStream(streamId: any, connection: any)` | 338 | ✍ Côté serveur : écrit les infos d'objets, pour chacune sa quantité, l'identifiant du type d'objet abstrait et les données de flux du premier objet. |
| `PlaceableObjectStorage:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 356 | ✍ Côté client : si le bit dirty est actif, relit tout le flux d'infos d'objets ; puis ajoute ou retire l'activatable de stockage manuel selon l'indicateur transmis. |
| `PlaceableObjectStorage:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 373 | ✍ Côté serveur : écrit un booléen pour le drapeau dirty et, s'il est actif, le flux complet d'infos d'objets, puis un booléen pour les objets en attente de stockage manuel. |
| `PlaceableObjectStorage:onUpdate(dt: any)` | 385 | ✍ À chaque image : côté serveur, pilote l'apparition des objets (un par test de chevauchement) et stocke les objets en attente désormais acceptables ; partout, décompte le minuteur de rafraîchissement de 1000 ms (infos, visuels et drapeau dirty) et traite les mises à jour de zones visuelles en attente, avec raiseActive tant qu'il reste du travail. |
| `PlaceableObjectStorage:getObjectStorageSupportsFillType(fillTypeIndex: any)` | 453 | ✍ Renvoie true si le type de remplissage est dans la liste supportée, ou si la liste est vide (tout est permis) ; un type nil ou inconnu n'est accepté que si la liste est vide. |
| `PlaceableObjectStorage:getObjectStorageSupportsObject(object: any)` | 475 | ✍ Indique si l'objet est supporté du tout : sa classe abstraite doit l'accepter et il ne doit pas déjà être stocké (comparaison avec l'objet réel de chaque objet stocké). |
| `PlaceableObjectStorage:getObjectStorageCanStoreObject(object: any, automatically: any)` | 496 | ✍ Vérifie si un objet peut être stocké maintenant (pas pendant une apparition, capacité, nom de fichier et quantités de supportedObject, règles de la classe abstraite ; plus strict en mode automatique). Renvoie un booléen et, pour certains échecs, un identifiant d'erreur de PlaceableObjectStorageErrorEvent. |
| `PlaceableObjectStorage:getIsBaleSupportedByUnloadTrigger(bale: any)` | 552 | ✍ Point d'appel utilisé par les chargeurs de balles pour savoir si une balle est acceptée ; transmet à getObjectStorageSupportsObject. |
| `PlaceableObjectStorage:addObjectToObjectStorage(object: any, loadedFromSavegame: any)` | 558 | ✍ Encapsule une balle ou palette réelle dans la classe d'objet abstrait correspondante (recherchée par nom de classe), l'ajoute au stockage et l'enregistre. Ne fait rien si aucune classe abstraite ne correspond. |
| `PlaceableObjectStorage:addAbstactObjectToObjectStorage(abstractObject: any)` | 569 | ✍ Ajoute un objet abstrait déjà construit à la liste stockée et met à jour le compteur (le nom est mal orthographié dans la source). |
| `PlaceableObjectStorage:removeAbstractObjectsFromStorage(objectInfoIndex: any, amount: any, connection: any)` | 577 | ✍ Serveur : lance la sortie de amount objets d'une info d'objets pour une connexion. Ignoré si une apparition est en cours, si les infos se rafraîchissent encore ou si la demande dépasse la quantité disponible ; sinon réinitialise l'état d'apparition et fait apparaître le premier objet. |
| `PlaceableObjectStorage:spawnNextObjectStorageObject(lastSuccess: any)` | 652 | ✍ Trouve le prochain emplacement libre dans les zones d'apparition (en respectant les emplacements d'objets limités) et lance un test de chevauchement asynchrone. Quand il ne reste rien ou qu'il n'y a plus de place, termine l'opération, envoie un événement d'erreur (manque de place ou limite) à la connexion demandeuse s'il reste des objets, et marque les infos comme modifiées. |
| `PlaceableObjectStorage:removeAbstractObjectFromStorage(abstractObject: any, x: any, y: any, z: any, rx: any, ry: any, rz: any)` | 712 | ✍ Retire un objet abstrait de la liste stockée et lui demande de créer l'objet réel à la position et rotation monde données, avec onObjectFromStorageSpawned en callback ; met à jour le compteur. |
| `PlaceableObjectStorage.onObjectFromStorageSpawned(self: any, spawnedObject: any)` | 727 | ✍ Callback (appelé avec le placeable en premier argument) : pendant une opération d'apparition, mémorise l'objet qui vient d'apparaître pour que les tests de chevauchement l'ignorent. |
| `PlaceableObjectStorage:setObjectStorageObjectInfosDirty()` | 736 | ✍ Démarre le minuteur de 1000 ms après lequel les infos d'objets, les zones visuelles et le drapeau dirty réseau sont rafraîchis, et garde le placeable actif. |
| `PlaceableObjectStorage:updateDirtyObjectStorageObjectInfos()` | 744 | ✍ Si le minuteur de rafraîchissement tourne, reconstruit immédiatement les infos d'objets (le minuteur continue pour la mise à jour visuelle et réseau). |
| `PlaceableObjectStorage:updateObjectStorageObjectInfos()` | 753 | ✍ Reconstruit spec.objectInfos en regroupant les objets stockés identiques (via getIsIdentical), puis trie les groupes par largeur d'apparition croissante. |
| `PlaceableObjectStorage:getObjectStorageObjectInfos()` | 790 | ✍ Renvoie la liste courante des infos d'objets (groupes d'objets stockés identiques). |
| `PlaceableObjectStorage:updateObjectStorageVisualAreas()` | 796 | ✍ Reconstruit les copies visuelles des objets stockés : crée un nouveau nœud masqué, calcule les positions dans les zones de stockage pour chaque info d'objets et les crée une info par mise à jour, puis supprime l'ancien nœud et affiche le nouveau. |
| `PlaceableObjectStorage:getHasPendingManualStoreObjects()` | 870 | ✍ Renvoie true si un objet en attente ne peut pas être stocké automatiquement mais pourrait l'être manuellement. |
| `PlaceableObjectStorage:storePendingManualObjects()` | 889 | ✍ Stocke chaque objet en attente autorisé manuellement (et non automatiquement), retire son écouteur de suppression et met à jour l'activatable de stockage manuel. |
| `PlaceableObjectStorage:updateManualStoreActivatable()` | 912 | ✍ Quand l'état des objets en attente manuelle a changé, ajoute ou retire l'activatable de stockage manuel et lève le drapeau dirty réseau. |
| `PlaceableObjectStorage:onObjectStoragePlayerTriggerCallback(triggerId: any, otherId: any, onEnter: any, onLeave: any, onStay: any)` | 930 | ✍ Callback du trigger joueur : ajoute l'activatable de sortie quand le joueur local entre et le retire quand il sort. |
| `PlaceableObjectStorage:onObjectStorageSpawnOverlapCallback(objectId: any)` | 998 | ✍ Callback de chevauchement du test d'apparition : termine le test en cours et compte les contacts hors triggers, en ignorant les objets qui viennent d'apparaître dans cette opération. |
| `PlaceableObjectStorage:canBeSold(superFunc: any)` | 1017 | ✍ Surcharge : renvoie true avec un avertissement « stockage non vide » si des objets sont stockés, sinon délègue au parent. |
| `PlaceableObjectStorage:updateInfo(superFunc: any, infoTable: any)` | 1028 | ✍ Surcharge : après le parent, ajoute une ligne stockés/capacité, puis une ligne par info d'objets (titre coupé à 32 caractères) jusqu'à MAX_HUD_INFO_ENTRIES, et une ligne « autres » cumulée pour le reste. |
| `PlaceableObjectStorage.loadSpecValueCapacity(xmlFile: any, customEnvironment: any, baseDir: any)` | 1059 | ✍ Chargeur de spec du magasin : renvoie la capacité, abaissée à la somme des quantités supportedObject lorsque ces limites sont utilisées ; nil si le placeable n'a pas d'objectStorage. |
| `PlaceableObjectStorage.getSpecValueCapacity(storeItem: any, realItem: any)` | 1082 | ✍ Renvoie la capacité formatée en nombre de pièces pour le magasin, ou nil si absente. |
| `PlaceableObjectStorage.loadSpecValueFillTypes(xmlFile: any, customEnvironment: any, baseDir: any)` | 1092 | ✍ Chargeur de spec du magasin : collecte les indices de types de remplissage nommés dans l'attribut fillType de chaque entrée supportedObject. |
| `PlaceableObjectStorage.getSpecValueFillTypes(storeItem: any, realItem: any)` | 1110 | ✍ Renvoie la liste des indices de types de remplissage pour l'affichage du magasin, ou nil s'il n'y en a pas. |
| `PlaceableObjectStorageActivatable.new(objectStorage: any)` | 1861 | ✍ Crée l'activatable qui ouvre le menu de sortie, avec son texte d'action et son texte d'avertissement « stockage vide ». |
| `PlaceableObjectStorageActivatable:getIsActivatable()` | 1873 | ✍ Vrai seulement si le joueur a accès au stockage et qu'aucune opération d'apparition n'est en cours. |
| `PlaceableObjectStorageActivatable:run()` | 1887 | ✍ Rafraîchit les infos d'objets et ouvre ObjectStorageDialog avec elles et maxUnloadAmount, ou affiche un avertissement clignotant de 2000 ms si le stockage est vide. |
| `PlaceableObjectStorageActivatable:getDistance(x: any, y: any, z: any)` | 1900 | ✍ Renvoie la distance au nœud de trigger joueur, ou math.huge s'il n'y en a pas. |
| `PlaceableObjectStorageActivatable:onObjectInfoSelected(objectInfoIndex: any, amount: any)` | 1911 | ✍ Callback du dialogue : si un indice d'info et une quantité ont été choisis, envoie PlaceableObjectStorageUnloadEvent au serveur. |
| `PlaceableObjectStorageManualStoreActivatable.new(objectStorage: any)` | 1923 | ✍ Crée l'activatable de stockage manuel des objets en attente, avec le texte de bouton « décharger ». |
| `PlaceableObjectStorageManualStoreActivatable:getIsActivatable()` | 1934 | ✍ Vrai si le joueur a accès au stockage. |
| `PlaceableObjectStorageManualStoreActivatable:run()` | 1944 | ✍ Envoie au serveur PlaceableObjectStorageStoreEvent pour ce stockage. |
| `PlaceableObjectStorageManualStoreActivatable:getDistance(x: any, y: any, z: any)` | 1950 | ✍ Renvoie la distance au nœud de trigger d'objets, ou math.huge s'il n'y en a pas (ce nœud n'existe que côté serveur, donc côté client la valeur est toujours math.huge). |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerOverwrittenFunction | `canBeSold` | 37 |
| registerOverwrittenFunction | `updateInfo` | 38 |
| registerFunction | `getObjectStorageSupportsFillType` | 44 |
| registerFunction | `getObjectStorageSupportsObject` | 45 |
| registerFunction | `getObjectStorageCanStoreObject` | 46 |
| registerFunction | `getIsBaleSupportedByUnloadTrigger` | 47 |
| registerFunction | `addObjectToObjectStorage` | 48 |
| registerFunction | `addAbstactObjectToObjectStorage` | 49 |
| registerFunction | `removeAbstractObjectsFromStorage` | 50 |
| registerFunction | `spawnNextObjectStorageObject` | 51 |
| registerFunction | `removeAbstractObjectFromStorage` | 52 |
| registerFunction | `setObjectStorageObjectInfosDirty` | 53 |
| registerFunction | `updateDirtyObjectStorageObjectInfos` | 54 |
| registerFunction | `updateObjectStorageObjectInfos` | 55 |
| registerFunction | `getObjectStorageObjectInfos` | 56 |
| registerFunction | `updateObjectStorageVisualAreas` | 57 |
| registerFunction | `getHasPendingManualStoreObjects` | 58 |
| registerFunction | `storePendingManualObjects` | 59 |
| registerFunction | `updateManualStoreActivatable` | 60 |
| registerFunction | `onObjectStoragePlayerTriggerCallback` | 61 |
| registerFunction | `onObjectStorageObjectTriggerCallback` | 62 |
| registerFunction | `onObjectStorageSpawnOverlapCallback` | 63 |
| registerEventListener | `onLoad` | 69 |
| registerEventListener | `onDelete` | 70 |
| registerEventListener | `onReadStream` | 71 |
| registerEventListener | `onWriteStream` | 72 |
| registerEventListener | `onReadUpdateStream` | 73 |
| registerEventListener | `onWriteUpdateStream` | 74 |
| registerEventListener | `onUpdate` | 75 |

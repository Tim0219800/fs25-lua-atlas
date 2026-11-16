# animals/Dog.lua

*[English version](../../../scripts/animals/Dog.md)*

Source: `dataS/scripts/animals/Dog.lua` — FS25 1.25.1.0

✍ Chien compagnon en réseau (sous-classe de Object) piloté par le gestionnaire de compagnons animaux du moteur (createAnimalCompanionManager et les fonctions setCompanion*, dont le fonctionnement interne est NON VÉRIFIÉ). Le serveur exécute les comportements (suivre, rapporter, caresser, rester, manger, rentrer) et synchronise l'état du compagnon vers les clients ; les clients envoient des événements (DogFollowEvent, DogFetchItemEvent, DogPetEvent) pour demander des actions. Le fichier gère aussi la sauvegarde du nom, la tuile de texture du pelage, la portée réseau et la priorité de mise à jour, un minuteur d'abandon qui ramène le chien à son point d'apparition, et un activatable de caresse.

- **Dog** hérite de `Object` (l.16)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Dog.new(isServer: any, isClient: any, customMt: any) → table` | 38 | ✍ Crée l'objet chien sans instance moteur, avec les valeurs par défaut du minuteur d'abandon (6000 ms, portée 100), une distance de découpe forcée de 80, un activatable de caresse et un indicateur dirty. Il enregistre le nom de classe pour le réseau. |
| `Dog:load(spawner: any, xmlFilename: any, spawnX: any, spawnY: any, spawnZ: any)` | 72 | ✍ Choisit un nom aléatoire via le système de noms d'animaux et crée le compagnon moteur à la position d'apparition, avec décalage de détection d'eau, déclencheur d'interaction, masques de collision et réglage audio intérieur/extérieur. Retourne false si l'instance moteur n'a pas pu être créée. |
| `Dog:delete()` | 106 | ✍ Marque le chien comme supprimé, supprime l'instance moteur, désabonne les écouteurs de messages (serveur), retire le nom de classe, l'activatable et l'écouteur d'état intérieur, puis appelle le delete du parent. |
| `Dog:loadFromXMLFile(xmlFile: XMLFile, key: string, resetVehicles: boolean) → boolean` | 130 | ✍ Restaure le nom du chien depuis l'attribut XML de sauvegarde `#name`. Retourne toujours true. |
| `Dog:saveToXMLFile(xmlFile: table, key: string, usedModNames: table)` | 141 | ✍ Écrit le nom du chien, encodé en HTML, dans `#name`. |
| `Dog:readStream(streamId: integer, connection: table)` | 149 | ✍ Connexion d'un client : lit le point d'apparition, le fichier XML, la position, le nom et les indices de tuile du pelage. À la première lecture il charge le compagnon et lie le spawner au chien ; il applique tuile et nom, puis appelle le readStream du parent. Le spawner peut être nil s'il n'est pas encore synchronisé. |
| `Dog:writeStream(streamId: integer, connection: table)` | 180 | ✍ Côté serveur : écrit le spawner, le fichier XML, la position d'apparition, le nom et les indices de tuile (3 bits chacun), puis appelle le writeStream du parent. |
| `Dog:writeUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 199 | ✍ Côté serveur : écrit l'état du compagnon moteur dans le flux de mise à jour via writeAnimalCompanionManagerToStream. |
| `Dog:readUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 210 | ✍ Côté client : lit l'état du compagnon depuis le flux avec le délai d'interpolation client et les variables de temps réseau (comportement du moteur NON VÉRIFIÉ). |
| `Dog:update(dt: number)` | 219 | ✍ Applique une tuile de pelage en attente dès que le compagnon est prêt, sinon reste actif. Sur le serveur, il ramène à son point d'origine un chien resté en attente s'il est abandonné et se maintient actif à chaque image. |
| `Dog:updateTick(dt: number)` | 245 | ✍ Serveur seulement : lève l'indicateur dirty quand le moteur signale que le compagnon doit être synchronisé, puis appelle le parent. |
| `Dog:testScope(x: number, y: number, z: number, coeff: number, isGuiVisible: any) → boolean` | 261 | ✍ Test de portée réseau : vrai si l'observateur est plus proche que le plus petit de la distance de découpe du compagnon (multipliée par coeff) et de forcedClipDistance. Retourne un booléen. |
| `Dog:getUpdatePriority(skipCount: number, x: number, y: number, z: number, coeff: number, connection: table, isGuiVisible: any) → number` | 277 | ✍ Priorité de mise à jour réseau : 0 si la distance de découpe vaut 0, sinon plus élevée quand le chien est proche, avec un bonus croissant selon skipCount (80 % distance, 20 % pondération des sauts). |
| `Dog:onGhostRemove()` | 291 | ✍ Masque le chien et arrête sa mise à jour physique quand il sort de la portée réseau d'un client. |
| `Dog:onGhostAdd()` | 297 | ✍ Affiche le chien et reprend sa mise à jour physique quand il entre dans la portée réseau d'un client. |
| `Dog:hourChanged()` | 303 | ✍ Serveur seulement, abonné à HOUR_CHANGED : transmet l'heure du jour de l'environnement au compagnon via setCompanionDaytime. Environment est absent du dump, l'unité de dayTime est NON VÉRIFIÉE. |
| `Dog:setName(name: any)` | 315 | ✍ Définit le nom du chien, avec une chaîne vide si nil est passé. |
| `Dog:setVisibility(state: any)` | 321 | ✍ Affiche ou masque le compagnon et active ou désactive sa mise à jour physique, si l'instance moteur existe. |
| `Dog:playerInteractionTriggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean)` | 335 | ✍ Callback de déclencheur du moteur : quand le joueur local entre et que sa ferme peut accéder au chien, l'activatable de caresse est ajouté à la mission ; il est retiré à la sortie. |
| `Dog:followEntity(player: integer)` | 352 | ✍ Fait suivre un joueur par le chien. Un client mémorise seulement la cible et envoie DogFollowEvent ; le serveur applique le comportement de suivi et efface l'indicateur d'attente. |
| `Dog:goToSpawn()` | 373 | ✍ Efface les cibles de suivi et de lanceur et envoie le chien vers le noeud d'apparition du spawner. Un client envoie DogFollowEvent sans joueur ; le serveur applique le comportement d'aller vers. |
| `Dog:onFoodBowlFilled(foodBowlNode: any)` | 386 | ✍ Efface les cibles de suivi et de lanceur et lance le comportement de repas vers le noeud de gamelle donné. Aucun test client/serveur n'est fait ici : l'appel est attendu côté serveur. |
| `Dog:fetchItem(player: object, ball: any)` | 395 | ✍ Lance le comportement de rapport d'une balle lancée par un joueur. Un client envoie DogFetchItemEvent ; le serveur enregistre la position de lancer de la balle, applique le comportement et mémorise le lanceur. |
| `Dog:pet()` | 408 | ✍ Déclenche la réaction à la caresse. Un client envoie DogPetEvent ; le serveur applique le comportement, incrémente la statistique de ferme petDogCount et tente de débloquer le succès PetDog. |
| `Dog:idleStay()` | 423 | ✍ Serveur seulement : efface les cibles de suivi et de lanceur, applique le comportement par défaut et marque le chien comme en attente (le minuteur d'abandon peut alors s'appliquer). |
| `Dog:idleWander()` | 433 | ✍ Point d'entrée serveur sans effet (l'appel moteur est commenté dans la source). |
| `Dog:setTextureTileIndices(tileIndexU: integer, tileIndexV: integer)` | 443 | ✍ Mémorise les indices de tuile du pelage de l'atlas (pour la synchronisation) et les applique aussitôt si le compagnon est prêt, sinon les marque en attente et garde le chien actif jusqu'à son chargement. |
| `Dog:applyTextureTile()` | 463 | ✍ Applique les indices de tuile stockés au compagnon via setCompanionTextureTile et efface l'indicateur d'attente. |
| `Dog:isAbandoned(dt: any)` | 470 | ✍ Vérifie si un joueur contrôlé ou un véhicule occupé se trouve à moins de abandonRange du chien. À portée, le minuteur est rechargé ; sinon il décompte dt et retourne true à son expiration. |
| `Dog:resetSteeringParms()` | 510 | ✍ Point d'entrée serveur vide, sans effet. |
| `Dog:teleportToSpawn()` | 517 | ✍ Serveur seulement : ramène le chien à sa position d'apparition, efface les états d'attente et de suivi et affiche la notification que le chien est dans sa niche. Un TODO de la source indique que la notification n'est pas synchronisée. |
| `Dog:playerFarmChanged(player: any)` | 533 | ✍ Callback de message côté serveur : si le joueur qui change de ferme était suivi ou lanceur de balle, le chien passe à l'attente. |
| `Dog:onPlayerLeave(player: any)` | 543 | ✍ Serveur seulement : si le joueur qui part était suivi ou lanceur, le chien passe à l'attente. Le code appelant est hors de ce fichier. |
| `Dog:finalizePlacement()` | 554 | ✍ Affiche le chien et, sur le serveur, s'abonne aux messages HOUR_CHANGED et PLAYER_FARM_CHANGED. |
| `Dog:onIndoorStateChanged(isIndoor: any)` | 565 | ✍ Écouteur du gestionnaire de sons : met à jour le réglage audio extérieur du compagnon selon l'état intérieur courant. |
| `Dog.registerSavegameXMLPaths(schema: any, basePath: any)` | 571 | ✍ Enregistre dans le schéma l'attribut XML de sauvegarde `#name` (nom du chien). |

## Messages

- s'abonne à `MessageType.HOUR_CHANGED` (l.558)
- s'abonne à `MessageType.PLAYER_FARM_CHANGED` (l.559)

# vehicles/specializations/AutoLoader.lua

*[English version](../../../../scripts/vehicles/specializations/AutoLoader.md)*

Source: `dataS/scripts/vehicles/specializations/AutoLoader.lua` — FS25 1.25.1.0

✍ Spécialisation pour remorques ou chargeurs qui ramassent automatiquement les objets (véhicules avec AutoLoadable, ou balles) entrant dans des triggers et les placent sur une ou plusieurs zones de chargement, à l'aide d'une grille de placement 2D et d'un test de recouvrement. Toute la logique tourne sur le serveur. Les objets montés et leurs positions de grille sont sauvegardés. Elle s'intègre à l'action controller comme action de chargement automatique. Certaines fonctions (`onUnmountObject`, restauration de sauvegarde, `onPostLoad`) n'ont pas de corps dans le dump du SDK : NON VÉRIFIÉ.

- **AutoLoader** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AutoLoader.prerequisitesPresent(specializations: any)` | 15 | ✍ Renvoie toujours true : aucune spécialisation prérequise. |
| `AutoLoader.initSpecialization()` | 21 | ✍ Enregistre les clés XML des zones de chargement (`vehicle.autoLoader.areas.area` : noeud, longueur, largeur, hauteur, espacement, triggers avec indicateur alwaysActive) et les clés de sauvegarde de chaque objet monté. |
| `AutoLoader.registerFunctions(vehicleType: any)` | 47 | ✍ Enregistre les callbacks de trigger et de recouvrement, `getIsValidAutoLoaderObject`, `getIsAutoLoadingAllowed` et `onUnmountObject`. |
| `AutoLoader.registerOverwrittenFunctions(vehicleType: any)` | 57 | ✍ Surcharge `getDynamicMountTimeToMount`, `addToPhysics` et `removeFromPhysics`. |
| `AutoLoader.registerEventListeners(vehicleType: any)` | 65 | ✍ S'abonne à onLoad, onPostLoad, onDelete, onUpdate et onRootVehicleChanged. Un abonnement à onDraw réservé au debug est commenté. |
| `AutoLoader:onLoad(savegame: any)` | 76 | ✍ Serveur : construit la liste des zones depuis le XML (6 x 2,5 x 4 avec 0,1 d'espacement par défaut), crée une PlacementGrid2D par zone et ajoute les triggers de ramassage. Tous : réinitialise l'indicateur d'activité et charge les textes d'avertissement « pas de place » et « trop grand ». |
| `AutoLoader:onDelete()` | 186 | ✍ Sur le serveur, cesse d'écouter les objets en attente, démonte tous les objets montés, supprime les grilles et retire les triggers, puis vide les tables d'objets. |
| `AutoLoader:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 218 | ✍ Sauvegarde pour chaque objet monté sa position de grille, sa taille et l'index de zone, plus l'identifiant unique pour un véhicule ou les données complètes pour une balle. |
| `AutoLoader:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 243 | ✍ Serveur : décompte les objets ignorés, remonte les véhicules restaurés depuis une sauvegarde, reconstruit les grilles si besoin, puis pour chaque objet en attente cherche une place libre, teste le recouvrement avec `overlapBox` et le monte via `autoLoad`. Affiche un avertissement clignotant s'il n'y a pas de place ou si l'objet est trop grand. |
| `AutoLoader:onDraw()` | 362 | ✍ Dessin de debug de la grille de chaque zone. Elle n'est abonnée que dans les builds de debug, la ligne d'abonnement étant commentée. |
| `AutoLoader:addToPhysics(superFunc: any)` | 373 | ✍ Appelle la fonction parente puis, sur le serveur, rajoute chaque objet monté à la physique. Renvoie false si le parent a échoué. |
| `AutoLoader:removeFromPhysics(superFunc: any)` | 392 | ✍ Appelle la fonction parente puis, sur le serveur, retire chaque objet monté de la physique. Renvoie le résultat du parent. |
| `AutoLoader:getIsValidAutoLoaderObject(object: any)` | 417 | ✍ Renvoie true si l'objet est un Vehicle ou une Bale différent, pas encore monté, compatible avec le chargement automatique et accessible à la ferme active du véhicule. |
| `AutoLoader:autoLoaderPickupTriggerCallback(triggerId: any, otherActorId: any, onEnter: any, onLeave: any, onStay: any, otherShapeId: any)` | 448 | ✍ Callback de trigger. À l'entrée, un objet valide et autorisé devient en attente pour ce trigger et le véhicule est réveillé ; les objets récemment ignorés sont refusés sur les triggers toujours actifs. À la sortie, l'entrée en attente est retirée. |
| `AutoLoader:autoLoaderOverlapCallback(transformId: any)` | 474 | ✍ Callback du test de recouvrement : positionne l'indicateur de zone bloquée et arrête la requête quand une forme non-trigger d'un autre objet (ni lui-même, ni monté, ni l'objet en attente) est trouvée. Renvoie true pour continuer sinon. |
| `AutoLoader:getIsAutoLoadingAllowed()` | 490 | ✍ Renvoie false quand le véhicule est renversé (l'axe haut local monte de moins de 0,5 au-dessus du noeud), true sinon. |
| `AutoLoader:getDynamicMountTimeToMount(superFunc: any)` | 503 | ✍ Surcharge le délai de montage dynamique : renvoie -1 quand le chargement automatique est permis, math.huge sinon (ne monte jamais). La fonction parente est ignorée. |
| `AutoLoader:onRootVehicleChanged(rootVehicle: table)` | 510 | ✍ Enregistre ou déplace l'action `autoLoaderLoad` dans l'action controller du véhicule racine, disponible tant que des objets sont en attente, ou la supprime s'il n'y a pas de contrôleur. |
| `AutoLoader.actionControllerEvent(self: any, direction: any)` | 535 | ✍ Callback de l'action controller : une direction négative désactive le chargement automatique, toute autre l'active. Renvoie toujours true. |
| `AutoLoader.onDeletePendingObject(self: any, object: any)` | 548 | ✍ Écouteur de suppression : retire l'objet supprimé de la table des objets en attente. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `autoLoaderPickupTriggerCallback` | 48 |
| registerFunction | `autoLoaderOverlapCallback` | 49 |
| registerFunction | `getIsValidAutoLoaderObject` | 50 |
| registerFunction | `getIsAutoLoadingAllowed` | 51 |
| registerFunction | `onUnmountObject` | 52 |
| registerOverwrittenFunction | `getDynamicMountTimeToMount` | 58 |
| registerOverwrittenFunction | `addToPhysics` | 59 |
| registerOverwrittenFunction | `removeFromPhysics` | 60 |
| registerEventListener | `onLoad` | 66 |
| registerEventListener | `onPostLoad` | 67 |
| registerEventListener | `onDelete` | 68 |
| registerEventListener | `onUpdate` | 69 |
| registerEventListener | `onRootVehicleChanged` | 70 |

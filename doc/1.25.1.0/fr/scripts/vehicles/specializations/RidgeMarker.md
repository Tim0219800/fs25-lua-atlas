# vehicles/specializations/RidgeMarker.lua

*[English version](../../../../scripts/vehicles/specializations/RidgeMarker.md)*

Source: `dataS/scripts/vehicles/specializations/RidgeMarker.lua` — FS25 1.25.1.0

✍ Spécialisation pour les outils équipés de traceurs de lignes repliables (bras qui griffent une ligne de guidage dans le sol). Elle exige AnimatedVehicle et WorkArea, ajoute un type de configuration "ridgeMarker" et un type de zone de travail "ridgemarker", et fait défiler les états de traceur via une action d'entrée. L'état est sauvegardé, envoyé aux clients qui rejoignent et synchronisé par RidgeMarkerSetStateEvent ; le marquage du sol passe par la density map.

- **RidgeMarker** (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `RidgeMarker.initSpecialization()` | 21 | ✍ Enregistre le type de configuration "ridgeMarker" et le type de zone de travail "ridgemarker", puis déclare les chemins du schéma XML du véhicule (dont ceux par configuration, le nœud enfant de zone de travail et les attributs des pièces à rotation de vitesse) ainsi que l'attribut de sauvegarde `ridgeMarker#state`. |
| `RidgeMarker.registerRidgeMarkerXMLPaths(schema: any, baseKey: any)` | 47 | ✍ Déclare dans le schéma XML, sous une clé de base, le bouton d'entrée, la liste des `marker` (animation, limites de travail, temps d'animation relevé, index de zone de travail), les limites de pliage, la direction de pliage interdite, l'option « actif seulement abaissé » et le nœud de direction. |
| `RidgeMarker.registerRidgeMarkerAreaXMLPaths(schema: any, baseKey: any)` | 65 | ✍ Déclare les entrées de schéma `ridgeMarkerArea` d'une zone de travail : le nœud autour duquel la zone de marquage est construite, sa taille (0,25 par défaut) et le décalage de la zone de test en z positif (0,2 par défaut). |
| `RidgeMarker.prerequisitesPresent(specializations: table) → boolean` | 75 | ✍ Retourne vrai uniquement si le type de véhicule possède les spécialisations AnimatedVehicle et WorkArea. |
| `RidgeMarker.registerFunctions(vehicleType: any)` | 81 | ✍ Enregistre les fonctions de la spécialisation sur le type de véhicule : `loadRidgeMarker`, `setRidgeMarkerState`, `canFoldRidgeMarker` et `processRidgeMarkerArea`. |
| `RidgeMarker.registerOverwrittenFunctions(vehicleType: any)` | 90 | ✍ Surcharge `loadWorkAreaFromXML`, `getIsWorkAreaActive`, `loadSpeedRotatingPartFromXML`, `getIsSpeedRotatingPartActive` et `getCanBeSelected` sur le type de véhicule. |
| `RidgeMarker.registerEventListeners(vehicleType: any)` | 100 | ✍ S'abonne à onLoad, onPostLoad, onReadStream, onWriteStream, onUpdateTick, onRegisterActionEvents, onSetLowered, onFoldStateChanged et onAIImplementStart. |
| `RidgeMarker:onLoad(savegame: table)` | 115 | ✍ Choisit la configuration de traceur (repli sur `vehicle.ridgeMarker`), lit l'action d'entrée, les entrées `marker` (plafonnées à MAX_NUM_RIDGEMARKERS - 1), les limites de pliage et le nœud de direction, puis met l'état à 0. Hors client, retire l'écouteur onUpdateTick. |
| `RidgeMarker:onPostLoad(savegame: any)` | 173 | ✍ Lors du chargement d'une sauvegarde avec des traceurs définis, restaure l'état enregistré et amène l'animation correspondante directement à sa fin. |
| `RidgeMarker:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 188 | ✍ Écrit l'état courant des traceurs dans la sauvegarde, seulement si le véhicule a au moins un traceur. |
| `RidgeMarker:onReadStream(streamId: integer, connection: Connection)` | 199 | ✍ Côté client à la connexion : lit l'état des traceurs dans le flux, l'applique sans envoyer d'événement et avance l'animation à sa fin si l'état n'est pas 0. |
| `RidgeMarker:onWriteStream(streamId: integer, connection: Connection)` | 214 | ✍ Côté serveur à la connexion : écrit l'état courant des traceurs dans le flux lorsque des traceurs existent. |
| `RidgeMarker:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 223 | ✍ Tick réservé au client qui met à jour la visibilité de l'action de bascule des traceurs. |
| `RidgeMarker:loadRidgeMarker(xmlFile: any, key: any, ridgeMarker: any)` | 229 | ✍ Lit une entrée `marker` (nom d'animation, limites de travail min/max, temps d'animation relevé, index de zone de travail). Retourne false avec un avertissement XML si `workAreaIndex` est absent. |
| `RidgeMarker:setRidgeMarkerState(state: integer, noEventSend: boolean)` | 249 | ✍ Change le traceur actif : envoie RidgeMarkerSetStateEvent, replie l'animation du traceur précédent à l'envers, puis déplie le nouveau (en s'arrêtant au temps « relevé » si l'outil est levé). L'état 0 signifie tout replié. |
| `RidgeMarker:canFoldRidgeMarker(state: integer) → boolean` | 279 | ✍ Retourne si l'état donné peut être choisi, selon que le temps d'animation de pliage est dans les limites configurées et selon la direction de pliage interdite. Utilisé par la bascule et la visibilité de l'action. |
| `RidgeMarker:processRidgeMarkerArea(workArea: any, dt: any)` | 299 | ✍ Callback de zone de travail : si le nœud de test est sur un type de sol de champ, efface les traces de pneus et applique une mise à jour de density map de type labour ou cultivateur (cultivateur si le sol est labouré). Les clients éloignés ignorent la mise à jour. Retourne 0, 0. |
| `RidgeMarker:loadWorkAreaFromXML(superFunc: table, workArea: table, xmlFile: XMLFile, key: string) → boolean` | 351 | ✍ Surcharge le chargement des zones de travail : crée des nœuds start/width/height/test autour de `ridgeMarkerArea#node`, appelle le parent, et convertit une zone DEFAULT en type RIDGEMARKER si le nœud existe. Avertit si une zone RIDGEMARKER n'a pas de nœud. |
| `RidgeMarker:loadSpeedRotatingPartFromXML(superFunc: table, speedRotatingPart: table, xmlFile: XMLFile, key: string) → boolean` | 403 | ✍ Étend le chargement des pièces à rotation de vitesse avec les attributs `ridgeMarkerAnim` et `ridgeMarkerAnimTimeMax` (0,99 par défaut). |
| `RidgeMarker:getIsSpeedRotatingPartActive(superFunc: table, speedRotatingPart: table) → boolean` | 418 | ✍ Retourne false tant que l'animation de traceur liée n'a pas atteint son temps max (traceur pas totalement déplié) ; sinon délègue au parent. |
| `RidgeMarker:getCanBeSelected(superFunc: any)` | 428 | ✍ Retourne toujours true, l'outil reste donc sélectionnable. |
| `RidgeMarker:getIsWorkAreaActive(superFunc: table, workArea: table) → boolean` | 436 | ✍ Pour les zones RIDGEMARKER, retourne false s'il n'y a pas de traceur, si l'animation du traceur est hors de ses limites min/max, ou si l'outil doit être abaissé et ne l'est pas ; sinon délègue au parent. |
| `RidgeMarker:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 463 | ✍ Côté client : enregistre l'action motorisée qui bascule les traceurs (texte `action_toggleRidgeMarker`) lorsque le véhicule est actif pour l'entrée et possède des traceurs. |
| `RidgeMarker:onSetLowered(lowered: boolean)` | 479 | ✍ Ajuste les traceurs qui définissent un temps d'animation relevé : à l'abaissement, relance l'animation si elle est arrêtée à ce temps ; au relevage, la ramène à ce temps si elle était plus dépliée. |
| `RidgeMarker:onFoldStateChanged(direction: integer, moveToMiddle: boolean)` | 507 | ✍ Remet l'état des traceurs à 0 (sans événement) lorsque l'outil commence à se plier dans le sens positif et ne va pas vers la position médiane. |
| `RidgeMarker:onAIImplementStart()` | 515 | ✍ Remet l'état des traceurs à 0 (sans événement) au démarrage d'une tâche IA avec cet outil. |
| `RidgeMarker.actionEventToggleRidgeMarkers(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 521 | ✍ Callback d'entrée : calcule l'état suivant (cycle de 0 à numMarkers) et l'applique avec `setRidgeMarkerState` si `canFoldRidgeMarker` l'autorise. |
| `RidgeMarker.updateActionEvents(self: any)` | 532 | ✍ Affiche ou masque l'action de bascule selon qu'il existe des traceurs et que l'état suivant est sélectionnable. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `loadRidgeMarker` | 82 |
| registerFunction | `setRidgeMarkerState` | 83 |
| registerFunction | `canFoldRidgeMarker` | 84 |
| registerFunction | `processRidgeMarkerArea` | 85 |
| registerOverwrittenFunction | `loadWorkAreaFromXML` | 91 |
| registerOverwrittenFunction | `getIsWorkAreaActive` | 92 |
| registerOverwrittenFunction | `loadSpeedRotatingPartFromXML` | 93 |
| registerOverwrittenFunction | `getIsSpeedRotatingPartActive` | 94 |
| registerOverwrittenFunction | `getCanBeSelected` | 95 |
| registerEventListener | `onLoad` | 101 |
| registerEventListener | `onPostLoad` | 102 |
| registerEventListener | `onReadStream` | 103 |
| registerEventListener | `onWriteStream` | 104 |
| registerEventListener | `onUpdateTick` | 105 |
| registerEventListener | `onRegisterActionEvents` | 106 |
| registerEventListener | `onSetLowered` | 107 |
| registerEventListener | `onFoldStateChanged` | 108 |
| registerEventListener | `onAIImplementStart` | 109 |

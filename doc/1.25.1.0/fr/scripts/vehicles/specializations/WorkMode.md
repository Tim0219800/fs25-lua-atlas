# vehicles/specializations/WorkMode.lua

*[English version](../../../../scripts/vehicles/specializations/WorkMode.md)*

Source: `dataS/scripts/vehicles/specializations/WorkMode.lua` — FS25 1.25.1.0

✍ Spécialisation pour les outils proposant plusieurs modes de travail sélectionnables, chacun regroupant ses animations, zones de travail, effets d'andaineur, configuration IA, limites d'outils mobiles et largeur de travail variable. Elle exige WorkArea et AnimatedVehicle, lit le bloc XML `vehicle.workModes` (éventuellement par configuration `workMode`) et sauvegarde le mode courant. Le mode est synchronisé vers les clients (flux de connexion et flux de mise à jour serveur vers client pour les effets d'andain) et modifié via SetWorkModeEvent. Elle déclenche `onWorkModeChanged`.

- **WorkMode** (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `WorkMode.prerequisitesPresent(specializations: table) → boolean` | 23 | ✍ Retourne true seulement si le type de véhicule possède aussi les spécialisations WorkArea et AnimatedVehicle. |
| `WorkMode.initSpecialization()` | 30 | ✍ Enregistre le type de configuration `workMode` et les chemins XML sous `vehicle.workModes` et sous chaque entrée de configuration, ainsi que l'attribut de sauvegarde `workMode#state` (défaut 1). |
| `WorkMode.registerWorkModeXMLPaths(schema: any, basePath: any)` | 48 | ✍ Déclare toutes les clés XML d'un bloc de mode de travail : limites de pliage, autorisations de changement, animations par mode, zones de travail/dépôt, limite d'outil mobile, largeur de travail variable, effet d'andaineur, animation nodes et IA. Ajoute aussi `workModeIndex` pour les types de pulvérisation et `allowWhileChangingWorkMode` pour les outils mobiles. |
| `WorkMode.registerEvents(vehicleType: table)` | 98 | ✍ Enregistre l'événement véhicule `onWorkModeChanged`. |
| `WorkMode.registerFunctions(vehicleType: any)` | 104 | ✍ Ajoute loadWorkModeFromXML, setWorkMode, getWorkMode, getIsWorkModeChangeAllowed et deactivateWindrowerEffects au type de véhicule. À noter : `WorkMode:getWorkMode` est enregistrée ici mais aucune définition n'apparaît dans ce fichier (origine NON VÉRIFIÉE). |
| `WorkMode.registerOverwrittenFunctions(vehicleType: any)` | 114 | ✍ Surcharge getIsWorkAreaActive, getCanBeSelected, getAllowsLowering, loadSprayTypeFromXML, getIsSprayTypeActive, loadMovingToolFromXML, getIsMovingToolActive et getAreEffectsVisible. |
| `WorkMode.registerEventListeners(vehicleType: any)` | 127 | ✍ Abonne la spécialisation aux callbacks de chargement, suppression, flux réseau, mise à jour, affichage, allumage/extinction, désactivation, abaissement, état de pliage et enregistrement des événements d'action. |
| `WorkMode:onLoad(savegame: table)` | 149 | ✍ Lit les définitions de modes de travail (selon la configuration `workMode` du véhicule si elle existe), applique le mode par défaut, crée l'extension HUD et alloue le dirty flag. Si aucun mode n'est défini, elle retire tous les autres écouteurs d'événements pour éviter tout coût. Affiche une erreur si le nombre de modes dépasse ce que la largeur en bits réseau permet. |
| `WorkMode:onPostLoad(savegame: any)` | 219 | ✍ Restaure le mode sauvegardé (borné à la plage valide), avance les animations jusqu'à leur état final et, pour les outils pliables à l'arrêt, définit le sens de pliage d'après le temps de pliage courant. |
| `WorkMode:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 251 | ✍ Écrit l'indice du mode de travail courant dans la clé de sauvegarde `#state`. |
| `WorkMode:onDelete()` | 260 | ✍ Supprime les effets d'andaineur et les animation nodes de chaque mode ainsi que l'extension HUD. |
| `WorkMode:onReadStream(streamId: integer, connection: Connection)` | 278 | ✍ Côté client à la connexion : lit l'indice du mode courant dans le flux et l'applique sans envoyer d'événement. |
| `WorkMode:onWriteStream(streamId: integer, connection: Connection)` | 287 | ✍ Côté serveur à la connexion : écrit l'indice du mode courant dans le flux. |
| `WorkMode:onReadUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 298 | ✍ Client uniquement : si le bit dirty a été envoyé, lit pour chaque effet d'andaineur du mode actif s'il a été récemment chargé, ainsi que le type de fruit accumulé. |
| `WorkMode:onWriteUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 320 | ✍ Serveur uniquement : si le dirty flag est actif, écrit pour chaque effet d'andaineur du mode actif s'il a été chargé dans les 500 dernières ms, puis le type de fruit accumulé. |
| `WorkMode:onUpdate(dt: number, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 338 | ✍ Client : fait monter et descendre en fondu les animations d'allumage, démarre ou arrête les effets d'andaineur selon le dernier temps de charge et le type de fruit, et active les actions de changement de mode selon que le changement est autorisé. Serveur : suit le type de fruit et l'activité de ramassage des zones de travail du mode actif et lève le dirty flag. |
| `WorkMode:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 440 | ✍ Quand l'outil est entièrement déplié (ou en position de pliage intermédiaire), relance les animations de mode marquées à répéter après dépliage et exécute une animation d'abaissement différée pendant le pliage. |
| `WorkMode:onDraw(isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 481 | ✍ Ajoute à chaque frame l'extension d'aide HUD du mode de travail au HUD lorsqu'elle existe. |
| `WorkMode:onDeactivate()` | 492 | ✍ Arrête les effets d'andaineur lorsque le véhicule est désactivé. |
| `WorkMode:deactivateWindrowerEffects()` | 498 | ✍ Client uniquement : arrête les effets d'andaineur de tous les modes de travail. |
| `WorkMode:loadWorkModeFromXML(xmlFile: any, key: any, workMode: any)` | 511 | ✍ Remplit une table de mode depuis le XML : nom, action d'entrée, mode par défaut, animations d'allumage et d'abaissement (seulement si l'animation existe), zones de travail et de dépôt, animations de changement de mode, limite d'outil mobile, largeur de travail variable, effets d'andaineur, animation nodes et configuration IA. Retourne toujours true. |
| `WorkMode:setWorkMode(state: integer, noEventSend: boolean)` | 603 | ✍ Passe au mode donné : sauf si `noEventSend` est défini, envoie SetWorkModeEvent (diffusion depuis le serveur, requête depuis un client). Puis échange animations, effets, largeur de travail variable, indices de dépôt des zones de travail et limites d'outils mobiles, et déclenche `onWorkModeChanged`. Retourne sans rien faire si l'indice est invalide. |
| `WorkMode:getIsWorkAreaActive(superFunc: any, workArea: any)` | 741 | ✍ Retourne false pour une zone de travail que le mode actif associe à la zone de dépôt 0 ; sinon délègue à l'implémentation parente. |
| `WorkMode:getCanBeSelected(superFunc: any)` | 758 | ✍ Retourne toujours true, l'outil est donc sélectionnable quelle que soit la logique parente. |
| `WorkMode:getAllowsLowering(superFunc: any)` | 764 | ✍ Retourne le résultat parent, ou true si le mode actif définit des animations d'abaissement ; l'avertissement du parent est transmis. |
| `WorkMode:loadSprayTypeFromXML(superFunc: any, xmlFile: any, key: any, sprayType: any)` | 778 | ✍ Lit le `#workModeIndex` optionnel d'un type de pulvérisation, puis appelle le chargeur parent. |
| `WorkMode:getIsSprayTypeActive(superFunc: any, sprayType: any)` | 786 | ✍ Retourne false si le type de pulvérisation est lié à un autre mode que le mode courant ; sinon délègue au parent. |
| `WorkMode:loadMovingToolFromXML(superFunc: any, xmlFile: any, key: any, entry: any)` | 798 | ✍ Appelle le chargeur parent et, en cas de succès, lit `#allowWhileChangingWorkMode` (défaut true) dans l'entrée de l'outil mobile. |
| `WorkMode:getIsMovingToolActive(superFunc: any, movingTool: any)` | 810 | ✍ Retourne false pour un outil mobile qui interdit tout mouvement pendant un changement de mode tant qu'une animation de changement de mode est en cours ; sinon délègue au parent. |
| `WorkMode:getAreEffectsVisible(superFunc: any)` | 831 | ✍ Retourne false tant qu'une animation de changement de mode est en cours ou si le parent masque les effets ; sinon true. |
| `WorkMode:getIsWorkModeChangeAllowed() → boolean` | 857 | ✍ Retourne false si la position de pliage est hors des limites configurées, ou si le changement en position abaissée est interdit et que l'attache de l'outil descend ; sinon true. |
| `WorkMode:onTurnedOff()` | 884 | ✍ Client uniquement : arrête les effets d'andaineur, lance le fondu sortant des animations d'allumage et arrête les animation nodes du mode. |
| `WorkMode:onTurnedOn()` | 901 | ✍ Client uniquement : lance le fondu entrant des animations d'allumage et démarre les animation nodes du mode actif. |
| `WorkMode:onSetLowered(lowered: boolean)` | 918 | ✍ Joue ou inverse les animations d'abaissement du mode actif quand l'outil est abaissé ou relevé. Si l'outil est en cours de pliage, la demande est différée. À noter : la comparaison utilise `self.foldMiddleAnimTime` alors que le reste du code utilise `spec_foldable.foldMiddleAnimTime`, ce qui semble incohérent. |
| `WorkMode:onFoldStateChanged(direction: integer, moveToMiddle: any)` | 947 | ✍ Au début d'un dépliage, réarme l'indicateur de répétition des animations du mode et demande au véhicule porteur de relever l'outil s'il est encore abaissé. |
| `WorkMode:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 973 | ✍ Client uniquement : enregistre l'action cyclique `TOGGLE_WORKMODE` et une action directe par mode disposant d'une touche ; toutes démarrent inactives et sont activées ensuite par onUpdate. |
| `WorkMode.actionEventWorkModeChange(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 998 | ✍ Callback d'entrée qui passe au mode suivant, en revenant au premier après le dernier, et l'applique via setWorkMode (qui envoie l'événement). |
| `WorkMode.actionEventWorkModeChangeDirect(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1012 | ✍ Callback d'entrée qui sélectionne le mode associé à l'action déclenchée, s'il diffère du mode courant. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEvent | `onWorkModeChanged` | 99 |
| registerFunction | `loadWorkModeFromXML` | 105 |
| registerFunction | `setWorkMode` | 106 |
| registerFunction | `getWorkMode` | 107 |
| registerFunction | `getIsWorkModeChangeAllowed` | 108 |
| registerFunction | `deactivateWindrowerEffects` | 109 |
| registerOverwrittenFunction | `getIsWorkAreaActive` | 115 |
| registerOverwrittenFunction | `getCanBeSelected` | 116 |
| registerOverwrittenFunction | `getAllowsLowering` | 117 |
| registerOverwrittenFunction | `loadSprayTypeFromXML` | 118 |
| registerOverwrittenFunction | `getIsSprayTypeActive` | 119 |
| registerOverwrittenFunction | `loadMovingToolFromXML` | 120 |
| registerOverwrittenFunction | `getIsMovingToolActive` | 121 |
| registerOverwrittenFunction | `getAreEffectsVisible` | 122 |
| registerEventListener | `onLoad` | 128 |
| registerEventListener | `onPostLoad` | 129 |
| registerEventListener | `onDelete` | 130 |
| registerEventListener | `onReadStream` | 131 |
| registerEventListener | `onWriteStream` | 132 |
| registerEventListener | `onReadUpdateStream` | 133 |
| registerEventListener | `onWriteUpdateStream` | 134 |
| registerEventListener | `onUpdate` | 135 |
| registerEventListener | `onUpdateTick` | 136 |
| registerEventListener | `onDraw` | 137 |
| registerEventListener | `onTurnedOn` | 138 |
| registerEventListener | `onTurnedOff` | 139 |
| registerEventListener | `onDeactivate` | 140 |
| registerEventListener | `onSetLowered` | 141 |
| registerEventListener | `onFoldStateChanged` | 142 |
| registerEventListener | `onRegisterActionEvents` | 143 |

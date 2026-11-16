# vehicles/specializations/WoodHarvester.lua

*[English version](../../../../scripts/vehicles/specializations/WoodHarvester.md)*

Source: `dataS/scripts/vehicles/specializations/WoodHarvester.lua` — FS25 1.25.1.0

✍ Spécialisation pour les têtes d'abatteuse : saisir un arbre sur pied ou une grume, l'abattre au nœud de coupe, le tenir avec un joint physique, le faire passer dans le nœud d'ébranchage et le tronçonner à la longueur choisie. Elle exige TurnOnVehicle. Le serveur gère toute la découpe et les joints et synchronise par événements (`WoodHarvesterOnCutTreeEvent`, `WoodHarvesterOnDelimbTreeEvent`, longueur de coupe, lâcher, inclinaison, coupe) ; les clients gèrent effets, sons, animations, tableaux de bord et entrées. Elle déclenche l'événement de véhicule `onCutTree`, enregistre un réglage de coupe auto par véhicule et une caractéristique de boutique pour la taille maximale d'arbre.

- **WoodHarvester** (l.18)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `WoodHarvester.prerequisitesPresent(specializations: any)` | 26 | ✍ Renvoie true seulement si le type de véhicule possède la spécialisation TurnOnVehicle. |
| `WoodHarvester.initSpecialization()` | 32 | ✍ Ajoute la caractéristique de boutique `woodHarvesterMaxTreeSize` et enregistre le schéma XML : nœud de coupe, inclinaison, ébranchage, longueurs de coupe, effets, nœuds d'avance, sons, animations de coupe et de saisie, mesure d'arbre et tableaux de bord. Enregistre aussi les attributs de sauvegarde. |
| `WoodHarvester.registerEvents(vehicleType: any)` | 97 | ✍ Enregistre l'événement de véhicule `onCutTree`. |
| `WoodHarvester.registerFunctions(vehicleType: any)` | 103 | ✍ Enregistre les fonctions publiques du véhicule : callback de découpe, diamètre d'arbre, recherche à portée, coupe, ébranchage, vérification d'accès, inclinaison de tête, choix de longueur et lâcher d'arbre. |
| `WoodHarvester.registerOverwrittenFunctions(vehicleType: any)` | 119 | ✍ Surcharge `getCanBeSelected`, `getDoConsumePtoPower`, `getConsumingLoad`, `getIsFoldAllowed` et les trois requêtes d'alignement automatique sur l'arbre. |
| `WoodHarvester.registerEventListeners(vehicleType: any)` | 131 | ✍ S'abonne aux événements de chargement, suppression, flux, mise à jour, affichage, entrées, activation, allumage/extinction, changement d'état, `onCutTree` et réglages du véhicule. |
| `WoodHarvester:onLoad(savegame: any)` | 155 | ✍ Initialise l'état d'exécution et lit depuis le XML coupe, attache, ébranchage, longueurs de coupe (valeurs explicites ou min/max/pas, 0 signifiant illimité), effets, sons, animations et textes. Enregistre le réglage de véhicule `WOOD_HARVESTER_AUTO_CUT`. |
| `WoodHarvester:onPostLoad(savegame: any)` | 305 | ✍ Si une animation de saisie existe, la joue à l'envers et la force instantanément à son état final pour que la pince démarre dans une position définie. |
| `WoodHarvester:onLoadFinished(savegame: any)` | 321 | ✍ Restaure depuis une sauvegarde (sauf réinitialisation des véhicules) : indice de longueur, état allumé, dimensions du dernier arbre, position du joint et sens d'attache. Si un arbre était tenu et la tête allumée, le recherche à nouveau et le marque comme issu de la sauvegarde. |
| `WoodHarvester:onRegisterDashboardValueTypes()` | 361 | ✍ Enregistre trois valeurs de tableau de bord : `cutLength` (cm, 9999999 si illimitée), `curCutLength` (cm déjà avancés) et `diameter` (mm du dernier arbre). |
| `WoodHarvester:onDelete()` | 389 | ✍ Retire le joint qui tient l'arbre, supprime le nœud auxiliaire et libère effets, sons et nœuds d'animation. |
| `WoodHarvester:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 407 | ✍ Sauvegarde l'indice de longueur, l'indicateur allumé (vrai aussi tant qu'un arbre est tenu), le sens d'attache et, si un arbre est tenu, ses dimensions et la position du joint. |
| `WoodHarvester:onReadStream(streamId: any, connection: any)` | 428 | ✍ Synchronisation initiale côté client : lit si un arbre est tenu (plus le temps d'animation de saisie sur 7 bits), s'il se déplace, et l'indice de longueur de coupe. |
| `WoodHarvester:onWriteStream(streamId: any, connection: any)` | 446 | ✍ Synchronisation initiale côté serveur : écrit l'indicateur d'arbre tenu avec le temps d'animation de saisie, l'indicateur de déplacement et l'indice de longueur. |
| `WoodHarvester:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 460 | ✍ Côté client : lit si l'effet d'avance est actif et, le cas échéant, si l'effet d'ébranchage est actif. |
| `WoodHarvester:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 474 | ✍ Côté serveur : écrit l'indicateur de l'effet d'avance et, s'il est actif, celui de l'effet d'ébranchage. |
| `WoodHarvester:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 485 | ✍ Serveur : abandonne les formes perdues (déclenche `onCutTree` avec rayon 0), exécute la coupe quand le minuteur ou l'animation est prêt (découpe, attache ou ramassage, compteurs de succès), ébranche et fait avancer l'arbre tenu vers la cible, et met à jour son joint. Client : pilote sons et effets de coupe et d'ébranchage. |
| `WoodHarvester:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 795 | ✍ Réinitialise les avertissements, puis, allumée et sans arbre tenu, cherche un arbre valide et l'écarte si la coupe serait trop basse. Détend aussi les joints libérés, lance l'animation de saisie différée et, côté client, met à jour les invites de coupe et de longueur. |
| `WoodHarvester:onDraw(isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 915 | ✍ Affiche un avertissement clignotant pour le véhicule actif quand il est allumé : arbre trop épais, trop épais à cette position, type non pris en charge ou accès au terrain refusé. |
| `WoodHarvester:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 934 | ✍ Client : enregistre les actions d'entrée pour couper, changer la longueur (suivante et précédente), lâcher l'arbre et, si une animation d'inclinaison existe, incliner la tête. |
| `WoodHarvester:onDeactivate()` | 965 | ✍ Efface l'arbre candidat courant et remet à zéro le diamètre affiché. |
| `WoodHarvester:onTurnedOn()` | 973 | ✍ Annule toute animation de saisie différée, joue l'animation de saisie vers sa position ouverte si aucun arbre n'est tenu, et remet le diamètre à zéro. |
| `WoodHarvester:onTurnedOff()` | 990 | ✍ Ouvre la pince complètement avec une suite différée de 500 ms quand aucun arbre n'est tenu et, côté client, arrête effets et sons. |
| `WoodHarvester:onStateChange(state: any, data: any)` | 1015 | ✍ Serveur : quand le moteur démarre alors qu'un arbre est encore tenu, rallume l'abatteuse si c'est permis. |
| `WoodHarvester:getCanSplitShapeBeAccessed(x: any, z: any, shape: any)` | 1029 | ✍ Demande à `g_splitShapeManager` si cette ferme peut couper la forme à la position x, z, selon la connexion du propriétaire. |
| `WoodHarvester:loadWoodHarvesterHeaderTiltFromXML(headerTilt: any, xmlFile: any, key: any)` | 1035 | ✍ Lit un bloc d'inclinaison de tête dans la table fournie (nom d'animation, facteur de vitesse, état). Renvoie false si aucun nom d'animation n'est défini. |
| `WoodHarvester:getIsWoodHarvesterTiltStateAllowed(headerTilt: any)` | 1050 | ✍ Point d'extension renvoyant true par défaut ; d'autres spécialisations peuvent le surcharger pour interdire l'inclinaison. |
| `WoodHarvester:setWoodHarvesterTiltState(state: any, noEventSend: any)` | 1056 | ✍ Définit ou inverse (nil) l'inclinaison de tête en jouant l'animation dans un sens ou l'autre, puis envoie `WoodHarvesterHeaderTiltEvent` sauf si `noEventSend`. |
| `WoodHarvester:setWoodHarvesterCutLengthIndex(index: any, noEventSend: any)` | 1073 | ✍ Sélectionne une longueur de coupe par indice (met à jour la longueur courante) et envoie `WoodHarvesterCutLengthEvent` sauf si `noEventSend`. |
| `WoodHarvester:dropWoodHarvesterTree(noEventSend: any)` | 1085 | ✍ Serveur : retire le joint, relâche l'arbre tenu, arrête l'ébranchage et déclenche `onCutTree` avec rayon 0 partout. Envoie `WoodHarvesterDropTreeEvent` sauf si `noEventSend`. |
| `WoodHarvester:findSplitShapesInRange(yOffset: number, skipCutAnimation: boolean)` | 1110 | ✍ Cherche un arbre ou une grume au nœud de coupe quand rien n'est tenu. Vérifie autorisation, accès de la ferme, alignement (15 degrés debout, 40 degrés au sol) et rayon max, sinon active des indicateurs d'avertissement. À noter : l'expression `yOffset or 0 + 1` vaut `yOffset or 1`, donc le test un mètre plus haut ignore l'addition voulue. |
| `WoodHarvester:cutTree(length: any, noEventSend: any)` | 1186 | ✍ Envoie `WoodHarvesterCutTreeEvent` ; côté serveur, une longueur 0 lance la coupe (immédiate pour les grumes ramassées au sol), une longueur positive fixe la cible d'avance et lance l'ébranchage. Efface l'indicateur de coupe auto en attente. |
| `WoodHarvester:onCutTree(radius: any, isNewTree: any, loadedFromSavegame: any)` | 1222 | ✍ Gestionnaire d'événement. Avec un rayon positif, ajuste l'animation de saisie à la taille de l'arbre, mémorise le diamètre et marque un arbre tenu ; sinon ouvre la pince, efface l'indicateur et restaure une inclinaison mémorisée. Positionne les animations d'emblée si chargé depuis une sauvegarde. |
| `WoodHarvester:onVehicleSettingChanged(gameSettingId: any, state: any)` | 1274 | ✍ Mémorise la nouvelle valeur du réglage `WOOD_HARVESTER_AUTO_CUT` comme indicateur de coupe automatique. |
| `WoodHarvester:onDelimbTree(state: any)` | 1282 | ✍ Indique si l'arbre tenu est en cours d'avance. À la fin, déclenche la coupe suivante (`cutTree(0)`) sur le serveur si la coupe auto est active, sinon signale qu'une coupe manuelle est en attente. |
| `WoodHarvester:woodHarvesterSplitShapeCallback(shape: any, isBelow: any, isAbove: any, minY: any, maxY: any, minZ: any, maxZ: any)` | 1303 | ✍ Callback de `splitShape`. Enregistre la nouvelle forme et, s'il s'agit de la partie haute, l'attache au nœud d'attache avec un joint physique verrouillé, libère les joints de composants configurés, remet l'inclinaison à zéro, mémorise les positions et déclenche `onCutTree` avec le rayon de l'arbre (aussi diffusé aux clients). |
| `WoodHarvester:setLastTreeDiameter(diameter: any)` | 1389 | ✍ Mémorise le dernier diamètre d'arbre mesuré (mètres) utilisé par le tableau de bord. |
| `WoodHarvester:getCanBeSelected(superFunc: any)` | 1396 | ✍ Renvoie toujours true : l'outil peut être sélectionné quel que soit le résultat parent. |
| `WoodHarvester:getDoConsumePtoPower(superFunc: any) → boolean` | 1403 | ✍ Renvoie true si le parent le dit ou si l'abatteuse est allumée. |
| `WoodHarvester:getConsumingLoad(superFunc: any)` | 1409 | ✍ Ajoute la pleine charge (1) à la valeur parente tant que l'arbre tenu avance ou que l'animation de coupe joue, et incrémente le compteur de un. |
| `WoodHarvester:getIsFoldAllowed(superFunc: any, direction: any, onAiTurnOn: any)` | 1424 | ✍ Renvoie false avec un texte d'avertissement tant qu'un arbre est tenu ; sinon s'en remet au parent. |
| `WoodHarvester:getSupportsAutoTreeAlignment(superFunc: any)` | 1435 | ✍ Toujours true : l'abatteuse prend en charge l'alignement automatique sur les arbres. |
| `WoodHarvester:getIsAutoTreeAlignmentAllowed(superFunc: any)` | 1441 | ✍ Renvoie false tant qu'un arbre est tenu ; sinon s'en remet au parent. |
| `WoodHarvester:getAutoAlignHasValidTree(superFunc: any, radius: any)` | 1452 | ✍ Renvoie deux booléens : s'il existe un arbre candidat, et si le rayon donné respecte le rayon de coupe maximal. |
| `WoodHarvester.actionEventCutTree(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1459 | ✍ Callback d'entrée. Si allumée, après 1 s de délai : avec un arbre tenu à l'arrêt, coupe à la longueur choisie (ou termine une coupe auto en attente) ; avec un arbre candidat, lance l'abattage. Sinon affiche un avertissement demandant d'allumer l'outil. |
| `WoodHarvester.actionEventSetCutlength(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1485 | ✍ Callback d'entrée : décale l'indice de longueur de `callbackState` (+1 ou -1) avec retour en boucle, sauf si l'arbre est en cours d'avance. |
| `WoodHarvester.actionEventDropTree(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1502 | ✍ Callback d'entrée : appelle `dropWoodHarvesterTree`. |
| `WoodHarvester.actionEventTiltHeader(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1508 | ✍ Callback d'entrée : bascule l'inclinaison de tête si permis et sans arbre tenu. |
| `WoodHarvester.loadSpecValueMaxTreeSize(xmlFile: any, customEnvironment: any, baseDir: any)` | 1518 | ✍ Chargeur de caractéristique de boutique : renvoie la valeur `cutNode#maxRadius` du XML du véhicule. |
| `WoodHarvester.getSpecValueMaxTreeSize(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 1524 | ✍ Accesseur de caractéristique de boutique : convertit le rayon stocké en diamètre en cm (rayon x 2 x 100) et le renvoie avec une chaîne formatée, ou nil si absent. La forme du retour dépend de `returnValues` et `returnRange`. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEvent | `onCutTree` | 98 |
| registerFunction | `woodHarvesterSplitShapeCallback` | 104 |
| registerFunction | `setLastTreeDiameter` | 105 |
| registerFunction | `findSplitShapesInRange` | 106 |
| registerFunction | `cutTree` | 107 |
| registerFunction | `onDelimbTree` | 108 |
| registerFunction | `getCanSplitShapeBeAccessed` | 109 |
| registerFunction | `loadWoodHarvesterHeaderTiltFromXML` | 110 |
| registerFunction | `getIsWoodHarvesterTiltStateAllowed` | 111 |
| registerFunction | `setWoodHarvesterTiltState` | 112 |
| registerFunction | `setWoodHarvesterCutLengthIndex` | 113 |
| registerFunction | `dropWoodHarvesterTree` | 114 |
| registerOverwrittenFunction | `getCanBeSelected` | 120 |
| registerOverwrittenFunction | `getDoConsumePtoPower` | 121 |
| registerOverwrittenFunction | `getConsumingLoad` | 122 |
| registerOverwrittenFunction | `getIsFoldAllowed` | 123 |
| registerOverwrittenFunction | `getSupportsAutoTreeAlignment` | 124 |
| registerOverwrittenFunction | `getIsAutoTreeAlignmentAllowed` | 125 |
| registerOverwrittenFunction | `getAutoAlignHasValidTree` | 126 |
| registerEventListener | `onLoad` | 132 |
| registerEventListener | `onPostLoad` | 133 |
| registerEventListener | `onLoadFinished` | 134 |
| registerEventListener | `onRegisterDashboardValueTypes` | 135 |
| registerEventListener | `onDelete` | 136 |
| registerEventListener | `onReadStream` | 137 |
| registerEventListener | `onWriteStream` | 138 |
| registerEventListener | `onReadUpdateStream` | 139 |
| registerEventListener | `onWriteUpdateStream` | 140 |
| registerEventListener | `onUpdate` | 141 |
| registerEventListener | `onUpdateTick` | 142 |
| registerEventListener | `onDraw` | 143 |
| registerEventListener | `onRegisterActionEvents` | 144 |
| registerEventListener | `onDeactivate` | 145 |
| registerEventListener | `onTurnedOn` | 146 |
| registerEventListener | `onTurnedOff` | 147 |
| registerEventListener | `onStateChange` | 148 |
| registerEventListener | `onCutTree` | 149 |
| registerEventListener | `onVehicleSettingChanged` | 150 |

## Messages

- publie `MessageType.TREE_SHAPE_MOUNTED` (l.599)

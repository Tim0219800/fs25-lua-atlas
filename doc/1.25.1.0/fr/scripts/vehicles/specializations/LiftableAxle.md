# vehicles/specializations/LiftableAxle.lua

*[English version](../../../../scripts/vehicles/specializations/LiftableAxle.md)*

Source: `dataS/scripts/vehicles/specializations/LiftableAxle.lua` — FS25 1.25.1.0

✍ Spécialisation pour les remorques à essieu relevable piloté par une animation. L'essieu se bascule manuellement (action d'entrée), automatiquement selon le niveau d'une fill unit, ou se règle sur une fraction fixe pour que les attaches s'alignent sur la hauteur de l'attelage du tracteur. Gère une configuration de véhicule `liftableAxle`, sauvegarde état et hauteur, et se synchronise via `LiftableAxleEvent`. Aucun prérequis ; la table de classe est créée hors de ce fichier (NON VÉRIFIÉ où).


## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `LiftableAxle.prerequisitesPresent(specializations: table) → boolean` | 20 | ✍ Renvoie toujours vrai : aucune autre spécialisation n'est requise. |
| `LiftableAxle.initSpecialization()` | 26 | ✍ Enregistre le type de configuration `liftableAxle`, les chemins XML (de base et par configuration) et les attributs de sauvegarde `state` et `height`. |
| `LiftableAxle.registerXMLPaths(schema: any, basePath: any)` | 44 | ✍ Enregistre les chemins XML d'un bloc d'essieu relevable : action d'entrée, nom et vitesse d'animation, état par défaut, fill unit et seuil, attaches dépendantes (entrée) avec hauteurs min/max, et textes lever/baisser. |
| `LiftableAxle.registerFunctions(vehicleType: table)` | 69 | ✍ Enregistre `setLiftableAxleState` et `getLiftableAxleAttacherJointHeight` sur le type de véhicule. |
| `LiftableAxle.registerOverwrittenFunctions(vehicleType: table)` | 77 | ✍ Surcharge `getIsSmoothAttachUpdateAllowed`. |
| `LiftableAxle.registerEventListeners(vehicleType: table)` | 84 | ✍ S'abonne aux événements onLoad, onPostLoad, onReadStream, onWriteStream, onFillUnitFillLevelChanged, onPreAttachImplement, onPreDetachImplement, onPreAttach, onPreDetach et onRegisterActionEvents. |
| `LiftableAxle:onLoad(savegame: table)` | 100 | ✍ Choisit le bloc de configuration et charge animation, déclencheur de fill unit, données des attaches dépendantes et textes. Un `defaultState` numérique autre que 0/1 devient une hauteur fixe. Retire tous les écouteurs inutiles (pas d'animation, rôle client/serveur, données absentes). |
| `LiftableAxle:onPostLoad(savegame: any)` | 195 | ✍ Restaure l'état et la hauteur sauvegardés (sauf réinitialisation des véhicules) et les applique immédiatement sans animation ni envoi d'événement. |
| `LiftableAxle:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 211 | ✍ Sauvegarde l'état de l'essieu et, s'il est défini, la hauteur fixe ; ne fait rien si aucune animation n'est configurée. |
| `LiftableAxle:onReadStream(streamId: any, connection: any)` | 224 | ✍ Connexion client : lit l'état et la hauteur fixe optionnelle et les applique instantanément. |
| `LiftableAxle:onWriteStream(streamId: any, connection: any)` | 237 | ✍ Connexion côté serveur : écrit l'état et la hauteur fixe optionnelle. |
| `LiftableAxle:onFillUnitFillLevelChanged(fillUnitIndex: any, fillLevelDelta: any, fillType: any, toolType: any, fillPositionData: any, appliedDelta: any)` | 248 | ✍ Serveur uniquement, une fois le véhicule synchronisé : quand la fill unit surveillée change, relève l'essieu si son pourcentage de remplissage dépasse le seuil, le baisse sinon. |
| `LiftableAxle:onPreAttachImplement(object: any, inputJointDescIndex: any, jointDescIndex: any, loadFromSavegame: any)` | 264 | ✍ Quand un outil est attelé à une attache listée, calcule la fraction d'essieu correspondant à la hauteur d'attache de l'outil et la définit comme hauteur fixe. |
| `LiftableAxle:onPreDetachImplement(implement: any)` | 295 | ✍ Quand un outil quitte une attache listée, la désactive ; si plus aucune attache listée n'est active, revient à l'état ou à la hauteur fixe par défaut. |
| `LiftableAxle:onPreAttach(attacherVehicle: any, inputJointDescIndex: any, jointDescIndex: any)` | 333 | ✍ Quand ce véhicule est attelé via une attache d'entrée listée, lit la hauteur d'attelage du parent (via `getLiftableAxleAttacherJointHeight` ou la moyenne de ses distances haute et basse) et règle la hauteur fixe correspondante. |
| `LiftableAxle:onPreDetach(attacherVehicle: any, implement: any)` | 375 | ✍ Quand le véhicule est dételé du parent via une attache d'entrée listée, la désactive et restaure l'état ou la hauteur par défaut si aucune n'est encore active. |
| `LiftableAxle:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 413 | ✍ Client : enregistre l'action d'entrée configurée (priorité de texte élevée) tant que le véhicule est actif pour l'entrée, et met à jour son libellé. |
| `LiftableAxle.actionEvent(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 427 | ✍ Callback d'entrée : bascule l'état de l'essieu. |
| `LiftableAxle.updateActionEvents(self: any)` | 434 | ✍ Règle l'aide d'entrée sur le texte lever ou baisser selon l'état actuel. |
| `LiftableAxle:setLiftableAxleState(state: any, fixedHeight: any, skipAnimation: any, noEventSend: any)` | 445 | ✍ Définit l'état de levage, éventuellement une hauteur fixe (0 à 1, qui force aussi l'état à hauteur >= 0,5), et joue l'animation ou la saute. Appelle toujours `LiftableAxleEvent.sendEvent` pour la synchro multijoueur sauf si `noEventSend` est vrai. |
| `LiftableAxle:getLiftableAxleAttacherJointHeight(attacherJointIndex: any)` | 481 | ✍ Renvoie la hauteur d'attelage actuelle pour une attache couverte par une entrée d'attache dépendante active, sinon nil. |
| `LiftableAxle:getIsSmoothAttachUpdateAllowed(superFunc: any, implement: any)` | 501 | ✍ Surcharge : la mise à jour d'attelage progressive est refusée pendant que l'animation de l'essieu joue. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `setLiftableAxleState` | 70 |
| registerFunction | `getLiftableAxleAttacherJointHeight` | 71 |
| registerOverwrittenFunction | `getIsSmoothAttachUpdateAllowed` | 78 |
| registerEventListener | `onLoad` | 85 |
| registerEventListener | `onPostLoad` | 86 |
| registerEventListener | `onReadStream` | 87 |
| registerEventListener | `onWriteStream` | 88 |
| registerEventListener | `onFillUnitFillLevelChanged` | 89 |
| registerEventListener | `onPreAttachImplement` | 90 |
| registerEventListener | `onPreDetachImplement` | 91 |
| registerEventListener | `onPreAttach` | 92 |
| registerEventListener | `onPreDetach` | 93 |
| registerEventListener | `onRegisterActionEvents` | 94 |

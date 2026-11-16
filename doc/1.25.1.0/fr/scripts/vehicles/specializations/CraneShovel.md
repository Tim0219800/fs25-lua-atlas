# vehicles/specializations/CraneShovel.lua

*[English version](../../../../scripts/vehicles/specializations/CraneShovel.md)*

Source: `dataS/scripts/vehicles/specializations/CraneShovel.lua` — FS25 1.25.1.0

✍ Spécialisation pour une benne/pelle de grue qui s'ouvre et se ferme par une animation, basculée par une action d'entrée. L'état est sauvegardé, synchronisé (CraneShovelEvent) et peut se fermer automatiquement au repliage de la grue ; le noeud de déversement et le noeud de pelle ne sont actifs que dans l'état correspondant. Aucun prérequis ; lit le bloc XML 'vehicle.craneShovel' et ne fait rien sans nom d'animation.


## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `CraneShovel.prerequisitesPresent(specializations: table) → boolean` | 20 | ✍ Renvoie toujours true : aucune autre spécialisation n'est requise. |
| `CraneShovel.initSpecialization()` | 26 | ✍ Enregistre le schéma XML 'vehicle.craneShovel' (action d'entrée, nom et vitesse d'animation, ouvert par défaut, fermeture au repliage, indices d'unité de remplissage et de noeud de déversement, textes) et la clé de sauvegarde de l'état. |
| `CraneShovel.registerFunctions(vehicleType: table)` | 53 | ✍ Enregistre loadCraneShovelFromXML, setCraneShovelState et getCraneShovelStateChangedAllowed sur le type de véhicule. |
| `CraneShovel.registerOverwrittenFunctions(vehicleType: table)` | 62 | ✍ Enregistre des surcharges de getIsDischargeNodeActive et getShovelNodeIsActive. |
| `CraneShovel.registerEventListeners(vehicleType: table)` | 70 | ✍ S'abonne aux événements de chargement, post-chargement, lecture/écriture de flux, changement d'état de repliage et enregistrement des actions. |
| `CraneShovel:onLoad(savegame: table)` | 82 | ✍ Charge les réglages de la pelle et démarre dans l'état ouvert/fermé par défaut. Si le chargement échoue (pas d'animation), retire tous les autres écouteurs ; ne garde l'écouteur de repliage que sur le serveur avec 'closeWhileFolding'. |
| `CraneShovel:onPostLoad(savegame: any)` | 102 | ✍ Reprend l'état sauvegardé (sauf réinitialisation des véhicules) et l'applique instantanément, sans animation et sans envoyer d'événement. |
| `CraneShovel:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 116 | ✍ Écrit l'état ouvert/fermé dans la sauvegarde si une animation est configurée. |
| `CraneShovel:onReadStream(streamId: any, connection: any)` | 125 | ✍ Client à la connexion : lit le booléen ouvert/fermé et l'applique instantanément sans envoyer d'événement. |
| `CraneShovel:onWriteStream(streamId: any, connection: any)` | 132 | ✍ Serveur à la connexion : écrit le booléen ouvert/fermé dans le flux. |
| `CraneShovel:onFoldStateChanged(direction: any, moveToMiddle: any)` | 139 | ✍ Quand le sens de repliage n'est pas celui de mise au travail et que la pelle est ouverte, la ferme (écouteur conservé seulement sur le serveur avec 'closeWhileFolding'). |
| `CraneShovel:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 150 | ✍ Enregistre l'action d'entrée configurée pour basculer la pelle quand le véhicule est actif pour les entrées, avec priorité de texte haute, et définit son libellé. Ne vérifie pas isClient. |
| `CraneShovel.actionEvent(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 164 | ✍ Rappel d'entrée : bascule l'état de la pelle si getCraneShovelStateChangedAllowed l'autorise ; sinon affiche l'avertissement renvoyé pendant 5 s. |
| `CraneShovel.updateActionEvents(self: any)` | 176 | ✍ Définit le libellé de l'entrée sur le texte de fermeture si la pelle est ouverte, sinon sur le texte d'ouverture. |
| `CraneShovel:loadCraneShovelFromXML(spec: any, xmlFile: any, key: any)` | 187 | ✍ Lit la configuration de la pelle dans la table de spec fournie (action, animation, vitesse, valeurs par défaut, indices d'unité de remplissage et de noeud de déversement, textes). Renvoie false si aucun nom d'animation n'est défini. |
| `CraneShovel:setCraneShovelState(state: any, skipAnimation: any, noEventSend: any)` | 212 | ✍ Définit l'état ouvert (true) ou fermé (false), joue l'animation dans le sens correspondant (ou la termine instantanément avec skipAnimation) et met à jour le libellé. Envoie toujours CraneShovelEvent ensuite sauf noEventSend, même si l'état est inchangé. |
| `CraneShovel:getCraneShovelStateChangedAllowed(spec: any)` | 237 | ✍ Renvoie si la bascule est autorisée et un avertissement optionnel ; par défaut true, nil. Point d'extension. |
| `CraneShovel:getIsDischargeNodeActive(superFunc: any, dischargeNode: any)` | 243 | ✍ Rend le noeud de déversement configuré inactif tant que la pelle est fermée ; sinon délègue au parent. |
| `CraneShovel:getShovelNodeIsActive(superFunc: any, shovelNode: any)` | 256 | ✍ Rend les noeuds de pelle inactifs sauf si l'animation tourne dans le sens de fermeture (vitesse négative) ; sinon délègue au parent. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `loadCraneShovelFromXML` | 54 |
| registerFunction | `setCraneShovelState` | 55 |
| registerFunction | `getCraneShovelStateChangedAllowed` | 56 |
| registerOverwrittenFunction | `getIsDischargeNodeActive` | 63 |
| registerOverwrittenFunction | `getShovelNodeIsActive` | 64 |
| registerEventListener | `onLoad` | 71 |
| registerEventListener | `onPostLoad` | 72 |
| registerEventListener | `onReadStream` | 73 |
| registerEventListener | `onWriteStream` | 74 |
| registerEventListener | `onFoldStateChanged` | 75 |
| registerEventListener | `onRegisterActionEvents` | 76 |

# vehicles/specializations/TurnOnVehicle.lua

*[English version](../../../../scripts/vehicles/specializations/TurnOnVehicle.md)*

Source: `dataS/scripts/vehicles/specializations/TurnOnVehicle.lua` — FS25 1.25.1.0

✍ Spécialisation pour les outils et machines qui ont un état marche/arrêt (outils à prise de force, convoyeurs, etc.). Elle garde `spec_turnOnVehicle.isTurnedOn`, le synchronise via `SetTurnedOnEvent`, déclenche `onTurnedOn`/`onTurnedOff` et joue sons, effets, nœuds d'animation et animations côté client. Elle surcharge aussi de nombreuses fonctions d'autres spécialisations (zones de travail, nœuds de déchargement, alarmes, pelle, IA) pour les lier à l'état allumé. Aucun prérequis ; AnimatedVehicle n'est utilisée que si elle est présente.

- **TurnOnVehicle** (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `TurnOnVehicle.prerequisitesPresent(specializations: any)` | 19 | ✍ Renvoie toujours true : la spécialisation n'a aucun prérequis. |
| `TurnOnVehicle.initSpecialization()` | 25 | ✍ Enregistre les chemins du schéma XML sous `vehicle.turnOnVehicle` (touche, textes, drapeaux toujours actif, nœuds d'animation, effets, sons, animations, vitesse d'allumage, tableaux de bord) ainsi que les attributs ajoutés aux attaches, zones de travail, alarmes, pelle et nœuds de déchargement. |
| `TurnOnVehicle.registerEvents(vehicleType: any)` | 93 | ✍ Enregistre les deux événements de véhicule `onTurnedOn` et `onTurnedOff`. |
| `TurnOnVehicle.registerFunctions(vehicleType: any)` | 100 | ✍ Ajoute au type de véhicule les fonctions publiques de cette spécialisation (setIsTurnedOn, getIsTurnedOn, getCanBeTurnedOn, getTurnedOnSpeedFactor, etc.). |
| `TurnOnVehicle.registerOverwrittenFunctions(vehicleType: any)` | 117 | ✍ Enregistre les surcharges de fonctions appartenant à d'autres spécialisations (zone de travail, déchargement, alarme, pelle, poursuite IA, prise de force, compacteur de silo, mode de travail, etc.). |
| `TurnOnVehicle.registerEventListeners(vehicleType: any)` | 141 | ✍ Abonne la spécialisation aux événements du cycle de vie du véhicule (chargement, suppression, flux réseau, mise à jour, actions, attache/détache, changement de véhicule racine) et à ses propres événements d'allumage/extinction. |
| `TurnOnVehicle:onLoad(savegame: table)` | 165 | ✍ Lit les réglages XML (entrée de bascule, textes, toujours allumé, règles d'extinction, drapeaux IA). Côté client, charge aussi nœuds d'animation, animations d'allumage, unités de remplissage activables, effets, sons et simulation de vitesse. Retire les écouteurs onDelete/onUpdate sur un serveur pur. À noter : le défaut de `varianceSpeed` est 0.01 dans le code alors que le schéma indique 1. |
| `TurnOnVehicle:onRegisterDashboardValueTypes()` | 262 | ✍ Enregistre les deux types de valeur de tableau de bord `turnOnVehicle.turnedOn` (état booléen) et `turnOnVehicle.rpm` (vitesse d'allumage entre minRpm et maxRpm). |
| `TurnOnVehicle:onDelete()` | 278 | ✍ Côté client uniquement : supprime les échantillons sonores, nœuds d'animation et effets créés au chargement. |
| `TurnOnVehicle:onReadStream(streamId: integer, connection: Connection)` | 295 | ✍ Connexion d'un client : lit le booléen d'état envoyé par le serveur et l'applique avec `setIsTurnedOn` sans renvoyer d'événement. |
| `TurnOnVehicle:onWriteStream(streamId: integer, connection: Connection)` | 304 | ✍ Côté serveur lors d'une connexion : écrit le booléen `isTurnedOn` courant dans le flux. |
| `TurnOnVehicle:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 314 | ✍ Pilote le fondu de chaque animation d'allumage (la vitesse monte ou descend selon dt, l'animation s'arrête à vitesse nulle). Côté client, simule aussi la vitesse d'allumage (`alpha`) avec une petite variance temporelle, utilisée pour le son et les compteurs. |
| `TurnOnVehicle:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 373 | ✍ Client : met à jour le texte et l'état de l'action de bascule sauf si toujours allumé ou piloté par l'attelage. Serveur : si `turnOffIfNotAllowed` est actif et que l'allumage est impossible, l'éteint, sinon éteint le véhicule porteur s'il est allumé. |
| `TurnOnVehicle:setIsTurnedOn(isTurnedOn: boolean, noEventSend: boolean)` | 406 | ✍ Change l'état allumé. Si la valeur change, envoie `SetTurnedOnEvent` (sauf `noEventSend`), déclenche onTurnedOn/onTurnedOff, notifie le véhicule racine par un changement d'état TURN_ON/TURN_OFF et met à jour le tableau de bord. |
| `TurnOnVehicle:onTurnedOn()` | 431 | ✍ Client : joue l'animation d'allumage, le son de démarrage et les sons de travail, et lance nœuds d'animation et effets. Bascule aussi sur le nœud de déchargement marqué `turnOnActivateNode` en mémorisant le précédent. |
| `TurnOnVehicle:onTurnedOff()` | 461 | ✍ Client : joue l'animation d'extinction et le son d'arrêt, arrête sons de travail, nœuds d'animation et effets. Restaure le nœud de déchargement courant avant l'allumage, s'il avait été mémorisé. |
| `TurnOnVehicle:getIsTurnedOn() → boolean` | 488 | ✍ Renvoie true si le véhicule est toujours allumé ou actuellement allumé. |
| `TurnOnVehicle:getCanBeTurnedOn() → boolean` | 497 | ✍ Renvoie false pour les véhicules toujours allumés, si l'attache d'entrée interdit l'allumage ou si le véhicule n'est pas alimenté (`getIsPowered`) ; true sinon. |
| `TurnOnVehicle:getCanBeTurnedOnAll() → boolean` | 522 | ✍ Renvoie true uniquement si chaque véhicule enfant du véhicule racine disposant de `getCanBeTurnedOn` peut être allumé. |
| `TurnOnVehicle:getCanToggleTurnedOn() → boolean` | 539 | ✍ Indique si le joueur peut basculer l'état : false si toujours allumé ou allumé par le véhicule porteur. |
| `TurnOnVehicle:getTurnedOnNotAllowedWarning() → string` | 556 | ✍ Renvoie le texte d'avertissement localisé `warning_attachToPower` si le véhicule n'est pas alimenté, sinon nil. |
| `TurnOnVehicle:getAIRequiresTurnOn()` | 566 | ✍ Renvoie le drapeau XML `aiRequiresTurnOn` (l'IA doit-elle allumer cet outil). |
| `TurnOnVehicle:getRequiresTurnOn()` | 572 | ✍ Renvoie le drapeau XML `requiresTurnOn` (documenté dans le schéma comme propre à la version mobile). |
| `TurnOnVehicle:getAIRequiresTurnOffOnHeadland()` | 578 | ✍ Renvoie false par défaut ; d'autres spécialisations peuvent la surcharger pour forcer l'extinction en bout de champ. |
| `TurnOnVehicle:loadTurnedOnAnimationFromXML(xmlFile: any, key: any, turnedOnAnimation: any)` | 584 | ✍ Lit une entrée `turnedOnAnimation` (nom, durées de fondu converties en ms, échelle de vitesse) dans la table fournie. Renvoie false avec un avertissement si le nom manque. |
| `TurnOnVehicle:getIsTurnedOnAnimationActive(turnedOnAnimation: any)` | 605 | ✍ Renvoie true quand le véhicule est allumé ; l'argument d'animation n'est pas utilisé ici, ce qui permet d'affiner la condition ailleurs. |
| `TurnOnVehicle:getUseTurnedOnSchema(superFunc: any)` | 615 | ✍ Surcharge : renvoie aussi true quand le véhicule est allumé. |
| `TurnOnVehicle:loadInputAttacherJoint(superFunc: table, xmlFile: any, key: any, inputAttacherJoint: any, i: any)` | 622 | ✍ Surcharge : après le chargement de base, lit `#canBeTurnedOn` (true par défaut) sur l'attache d'entrée. |
| `TurnOnVehicle:loadWorkAreaFromXML(superFunc: table, workArea: table, xmlFile: XMLFile, key: string)` | 637 | ✍ Surcharge : lit `#needsSetIsTurnedOn` (true par défaut) pour chaque zone de travail. |
| `TurnOnVehicle:getIsWorkAreaActive(superFunc: table, workArea: table) → boolean` | 649 | ✍ Surcharge : une zone de travail marquée `needsSetIsTurnedOn` est inactive tant que le véhicule est éteint ; sinon on s'en remet à l'implémentation précédente. |
| `TurnOnVehicle:getCanAIImplementContinueWork(superFunc: any, isTurning: any) → boolean` | 660 | ✍ Surcharge : l'IA ne peut continuer que si le test de base passe et, quand l'outil doit être allumé, qu'il est en ligne et allumable, il est effectivement allumé. En bout de champ, elle autorise toujours. |
| `TurnOnVehicle:getIsOperating(superFunc: any) → boolean` | 687 | ✍ Surcharge : renvoie true dès que le véhicule est allumé, sinon le résultat précédent. |
| `TurnOnVehicle:getAlarmTriggerIsActive(superFunc: any, alarmTrigger: any)` | 697 | ✍ Surcharge : une alarme marquée `needsTurnOn` est forcée inactive tant que le véhicule est éteint. |
| `TurnOnVehicle:loadAlarmTrigger(superFunc: any, xmlFile: any, key: any, alarmTrigger: any, fillUnit: any)` | 711 | ✍ Surcharge : après le chargement de base, lit `#needsTurnOn` et `#turnOffInTrigger` (false par défaut) sur l'alarme. |
| `TurnOnVehicle:getIsFillUnitActive(superFunc: any, fillUnitIndex: any)` | 721 | ✍ Surcharge : les unités de remplissage déclarées activables sont inactives tant que le véhicule est éteint. |
| `TurnOnVehicle:loadShovelNode(superFunc: any, xmlFile: any, key: any, shovelNode: any)` | 734 | ✍ Surcharge : après le chargement de base, lit `#needsActivation` dans `shovelNode.needsActiveVehicle`. Renvoie toujours true. |
| `TurnOnVehicle:getShovelNodeIsActive(superFunc: any, shovelNode: any)` | 744 | ✍ Surcharge : un nœud de pelle qui exige l'activation est inactif tant que le véhicule est éteint. |
| `TurnOnVehicle:getIsSeedChangeAllowed(superFunc: any)` | 756 | ✍ Surcharge : le changement de semence n'est permis que véhicule éteint (et si la règle de base l'autorise). |
| `TurnOnVehicle:getCanBeSelected(superFunc: any)` | 762 | ✍ Surcharge : renvoie toujours true, ces outils sont donc sélectionnables quelles que soient les règles de base. |
| `TurnOnVehicle:getIsPowerTakeOffActive(superFunc: any)` | 768 | ✍ Surcharge : la prise de force est considérée active si le véhicule est allumé ou si la base l'indique. |
| `TurnOnVehicle:loadDischargeNode(superFunc: any, xmlFile: any, key: any, entry: any)` | 774 | ✍ Surcharge : après le chargement de base, lit `#needsSetIsTurnedOn` et `#turnOnActivateNode` (false par défaut) ; un nœud avec ce dernier drapeau devient `activateableDischargeNode`. |
| `TurnOnVehicle:getIsDischargeNodeActive(superFunc: any, dischargeNode: any)` | 791 | ✍ Surcharge : un nœud de déchargement qui exige l'allumage est inactif tant que le véhicule est éteint. |
| `TurnOnVehicle:loadBunkerSiloCompactorFromXML(superFunc: any, xmlFile: any, key: any)` | 803 | ✍ Surcharge : après le chargement de base, lit `#turnedOnCompactingScale` dans la spec du compacteur de silo (nil si absent). |
| `TurnOnVehicle:getBunkerSiloCompacterScale(superFunc: any)` | 812 | ✍ Surcharge : renvoie l'échelle de compactage « allumé » quand le véhicule est allumé et la valeur définie, sinon l'échelle de base. |
| `TurnOnVehicle:getIsWorkModeChangeAllowed(superFunc: any)` | 825 | ✍ Surcharge : refuse un changement de mode de travail pendant que le véhicule est allumé si la spec de mode de travail a `allowChangeWhileTurnedOn` à false. |
| `TurnOnVehicle:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 838 | ✍ Client : si actif pour l'entrée et la bascule autorisée, enregistre l'action de bascule (priorité de texte haute) et l'action masquée `TURN_ON_ALL_IMPLEMENTS`, toutes deux comme actions alimentées. |
| `TurnOnVehicle:onRegisterExternalActionEvents(trigger: any, name: any, xmlFile: any, key: any)` | 856 | ✍ Enregistre l'action externe (déclencheur hors véhicule) nommée `turnOn` avec ses rappels d'enregistrement et de mise à jour. |
| `TurnOnVehicle:onAlarmTriggerChanged(alarmTrigger: any, state: any)` | 864 | ✍ Quand une alarme devient active et possède `turnOffInTrigger`, éteint le véhicule localement sans envoyer d'événement. |
| `TurnOnVehicle:onSetBroken()` | 874 | ✍ Éteint le véhicule (sans envoi d'événement) quand il tombe en panne. |
| `TurnOnVehicle:onStateChange(state: any, data: any)` | 880 | ✍ Sur MOTOR_TURN_OFF, éteint localement le véhicule s'il ne peut plus être allumé (par exemple perte d'alimentation). |
| `TurnOnVehicle:onDeactivate()` | 890 | ✍ Éteint localement le véhicule à sa désactivation si `turnOffOnDeactivate` est actif (true par défaut sauf sur mobile). |
| `TurnOnVehicle:onPostAttach(attacherVehicle: any, inputJointDescIndex: any, jointDescIndex: any)` | 899 | ✍ Si `turnedOnByAttacherVehicle` est actif, copie l'état allumé du véhicule porteur sur cet outil, sans événement. |
| `TurnOnVehicle:onPreDetach(attacherVehicle: table, implement: table)` | 912 | ✍ Éteint localement l'outil juste avant son détachement. |
| `TurnOnVehicle:onRootVehicleChanged(rootVehicle: table)` | 919 | ✍ Enregistre ou rattache l'action `turnOn` au contrôleur d'actions du véhicule racine (sauvegardée, avec écouteurs d'événements IA pour allumer au début de ligne et éteindre à la fin, au blocage ou au transport). La retire s'il n'y a pas de contrôleur ou si la bascule est interdite. |
| `TurnOnVehicle.actionControllerTurnOnEvent(self: any, direction: any)` | 972 | ✍ Rappel du contrôleur d'actions : direction positive allume si possible et renvoie le succès ; sinon éteint et renvoie true si l'outil est bien éteint. |
| `TurnOnVehicle.actionEventTurnOn(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 988 | ✍ Rappel de la touche de bascule : inverse l'état si la bascule et l'allumage sont permis, sinon affiche l'avertissement clignotant (2 s) quand le véhicule est éteint. |
| `TurnOnVehicle.actionEventTurnOnAll(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1003 | ✍ Rappel de l'action tout allumer : si tous les véhicules enfants sont allumables, inverse l'état de chacun disposant de `setIsTurnedOn` ; sinon affiche l'avertissement si ce véhicule est éteint. |
| `TurnOnVehicle.updateActionEvents(self: any)` | 1026 | ✍ Met à jour l'action de bascule : règle le texte allumer/éteindre et son état actif d'après `getCanToggleTurnedOn`. |
| `TurnOnVehicle.externalActionEventRegister(data: any, vehicle: any)` | 1050 | ✍ Enregistre l'action externe de bascule ; à l'appui, tente d'abord de démarrer le moteur via `Motorized.tryStartMotor`, puis exécute la bascule normale. |
| `TurnOnVehicle.externalActionEventUpdate(data: any, vehicle: any)` | 1065 | ✍ Met à jour le texte et l'état actif de l'action externe selon que le véhicule est allumé et basculable. |
| `TurnOnVehicle:getTurnedOnSpeedFactor()` | 1085 | ✍ Renvoie le facteur de vitesse d'allumage simulé (`alpha`, autour de 0 à 1 avec une légère variance). Client uniquement : la table n'existe pas sur un serveur pur. |
| `TurnOnVehicle.dashboardRpmAttributes(self: any, xmlFile: any, key: any, dashboard: any, isActive: any)` | 1093 | ✍ Chargeur d'attributs de tableau de bord : lit `#minRpm` (0 par défaut) et `#maxRpm` (1000 par défaut) dans l'entrée. Renvoie true. |
| `TurnOnVehicle.dashboardRpmValue(self: any, dashboard: any)` | 1102 | ✍ Valeur de tableau de bord : interpole entre minRpm et maxRpm avec le facteur de vitesse d'allumage. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEvent | `onTurnedOn` | 94 |
| registerEvent | `onTurnedOff` | 95 |
| registerFunction | `setIsTurnedOn` | 101 |
| registerFunction | `getIsTurnedOn` | 102 |
| registerFunction | `getCanBeTurnedOn` | 103 |
| registerFunction | `getCanBeTurnedOnAll` | 104 |
| registerFunction | `getCanToggleTurnedOn` | 105 |
| registerFunction | `getTurnedOnNotAllowedWarning` | 106 |
| registerFunction | `getAIRequiresTurnOn` | 107 |
| registerFunction | `getRequiresTurnOn` | 108 |
| registerFunction | `getAIRequiresTurnOffOnHeadland` | 109 |
| registerFunction | `loadTurnedOnAnimationFromXML` | 110 |
| registerFunction | `getIsTurnedOnAnimationActive` | 111 |
| registerFunction | `getTurnedOnSpeedFactor` | 112 |
| registerOverwrittenFunction | `getUseTurnedOnSchema` | 118 |
| registerOverwrittenFunction | `loadInputAttacherJoint` | 119 |
| registerOverwrittenFunction | `loadWorkAreaFromXML` | 120 |
| registerOverwrittenFunction | `getIsWorkAreaActive` | 121 |
| registerOverwrittenFunction | `getCanAIImplementContinueWork` | 122 |
| registerOverwrittenFunction | `getIsOperating` | 123 |
| registerOverwrittenFunction | `getAlarmTriggerIsActive` | 124 |
| registerOverwrittenFunction | `loadAlarmTrigger` | 125 |
| registerOverwrittenFunction | `getIsFillUnitActive` | 126 |
| registerOverwrittenFunction | `loadShovelNode` | 127 |
| registerOverwrittenFunction | `getShovelNodeIsActive` | 128 |
| registerOverwrittenFunction | `getIsSeedChangeAllowed` | 129 |
| registerOverwrittenFunction | `getCanBeSelected` | 130 |
| registerOverwrittenFunction | `getIsPowerTakeOffActive` | 131 |
| registerOverwrittenFunction | `loadDischargeNode` | 132 |
| registerOverwrittenFunction | `getIsDischargeNodeActive` | 133 |
| registerOverwrittenFunction | `loadBunkerSiloCompactorFromXML` | 134 |
| registerOverwrittenFunction | `getBunkerSiloCompacterScale` | 135 |
| registerOverwrittenFunction | `getIsWorkModeChangeAllowed` | 136 |
| registerEventListener | `onLoad` | 142 |
| registerEventListener | `onRegisterDashboardValueTypes` | 143 |
| registerEventListener | `onDelete` | 144 |
| registerEventListener | `onReadStream` | 145 |
| registerEventListener | `onWriteStream` | 146 |
| registerEventListener | `onUpdate` | 147 |
| registerEventListener | `onUpdateTick` | 148 |
| registerEventListener | `onRegisterActionEvents` | 149 |
| registerEventListener | `onRegisterExternalActionEvents` | 150 |
| registerEventListener | `onDeactivate` | 151 |
| registerEventListener | `onPostAttach` | 152 |
| registerEventListener | `onPreDetach` | 153 |
| registerEventListener | `onRootVehicleChanged` | 154 |
| registerEventListener | `onTurnedOn` | 155 |
| registerEventListener | `onTurnedOff` | 156 |
| registerEventListener | `onAlarmTriggerChanged` | 157 |
| registerEventListener | `onSetBroken` | 158 |
| registerEventListener | `onStateChange` | 159 |

# vehicles/specializations/PowerConsumer.lua

*[English version](../../../../scripts/vehicles/specializations/PowerConsumer.md)*

Source: `dataS/scripts/vehicles/specializations/PowerConsumer.lua` — FS25 1.25.1.0

✍ Spécialisation pour les outils qui prélèvent de la puissance moteur, via la prise de force ou comme résistance à la traction. Elle n'a aucun prérequis. Elle lit vehicle.powerConsumer (éventuellement par configuration powerConsumer), applique une force de résistance en mouvement, communique couple et régime de prise de force au moteur racine, et peut refuser la mise en marche si le moteur du tracteur manque de couple. Elle fournit aussi la caractéristique de boutique « neededPower » et un décalage optionnel de limite de vitesse selon la puissance du moteur source.

- **PowerConsumer** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PowerConsumer.initSpecialization()` | 15 | ✍ Enregistre le type de configuration « powerConsumer » et la caractéristique de boutique « neededPower », puis les chemins XML (de base et par configuration), les clés de données de boutique et les attributs de mode de travail forceScale et ptoPowerScale. |
| `PowerConsumer.registerPowerConsumerXMLPaths(schema: any, basePath: any)` | 40 | ✍ Enregistre tous les attributs XML powerConsumer sous un chemin de base donné : nœuds de force, maxForce (kN), forceDir, réglages du pic à l'allumage, puissance et régime de prise de force, multiplicateur de puissance virtuelle et entrées speedLimitModifier. |
| `PowerConsumer.prerequisitesPresent(specializations: table) → boolean` | 70 | ✍ Retourne toujours true : aucune spécialisation prérequise. |
| `PowerConsumer.registerFunctions(vehicleType: any)` | 76 | ✍ Ajoute loadPowerSetup, getPtoRpm, getDoConsumePtoPower, getPowerMultiplier, getConsumedPtoTorque et getConsumingLoad au type de véhicule. |
| `PowerConsumer.registerOverwrittenFunctions(vehicleType: any)` | 87 | ✍ Surcharge getCanBeTurnedOn, getCanBeTurnedOnAll, getTurnedOnNotAllowedWarning, getRawSpeedLimit et loadWorkModeFromXML. |
| `PowerConsumer.registerEventListeners(vehicleType: any)` | 97 | ✍ Abonne aux événements onLoad, onUpdate, onStateChange, onWorkModeChanged et onTurnedOn. |
| `PowerConsumer:onLoad(savegame: table)` | 108 | ✍ Lit les réglages de force, de pic à l'allumage et de speedLimitModifier depuis la clé de configuration (ou vehicle.powerConsumer à défaut) et appelle loadPowerSetup. Les limites en chevaux sont converties en kW. À noter : elle retire un écouteur « onPostDetach » qui n'a jamais été enregistré ici. |
| `PowerConsumer:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 161 | ✍ Tant que le véhicule est actif et avance dans forceDir, applique au nœud de force une force de freinage égale à un terme de frottement plafonné par maxForce et mis à l'échelle par getPowerMultiplier. Décompte aussi le minuteur du pic à l'allumage. |
| `PowerConsumer:loadPowerSetup(xmlFile: table, baseKey: any)` | 192 | ✍ Charge la puissance de prise de force minimale et maximale requise (kW au régime ptoRpm), le régime de prise de force et le multiplicateur de puissance virtuelle depuis le XML. Avertit pour une clé obsolète et si le maximum est inférieur au minimum. |
| `PowerConsumer:getPtoRpm() → number` | 210 | ✍ Retourne le régime de prise de force configuré tant que le véhicule consomme de la puissance de prise de force, sinon 0. |
| `PowerConsumer:getDoConsumePtoPower() → boolean` | 221 | ✍ True si useTurnOnState est actif et que le véhicule est allumé (nécessite getIsTurnedOn). |
| `PowerConsumer:getPowerMultiplier() → number` | 228 | ✍ Retourne 1 par défaut ; destinée à être surchargée pour moduler la force de résistance dans onUpdate. |
| `PowerConsumer:getConsumedPtoTorque(expected: any, ignoreTurnOnPeak: any) → number` | 236 | ✍ Retourne le couple de prise de force (kNm) et un multiplicateur virtuel. La puissance est interpolée entre minimum et maximum selon la charge moyenne, divisée par la vitesse angulaire, avec un pic temporaire après l'allumage sauf si ignoreTurnOnPeak. Retourne 0, 1 au repos. |
| `PowerConsumer:getConsumingLoad()` | 264 | ✍ Retourne par défaut 0, 0 (charge, nombre) ; les spécialisations la surchargent pour fournir leur charge à getConsumedPtoTorque. |
| `PowerConsumer:getCanBeTurnedOn(superFunc: any) → boolean` | 271 | ✍ Retourne false (avec un indicateur de puissance insuffisante) quand le couple attendu de cet outil et de tous les outils attelés, ramené côté moteur, dépasse 90 % du couple maximal du moteur racine et que l'outil est éteint. Sinon délègue au parent. |
| `PowerConsumer:getCanBeTurnedOnAll(superFunc: any) → boolean` | 299 | ✍ Même vérification de couple pour toute la chaîne d'outils : retourne false avec le texte d'avertissement si l'ensemble des couples de prise de force dépasse 90 % du couple maximal du moteur et que cet outil est éteint. |
| `PowerConsumer:getTurnedOnNotAllowedWarning(superFunc: any) → string` | 325 | ✍ Retourne l'avertissement de puissance insuffisante si getCanBeTurnedOn signale un manque de puissance ; sinon délègue au parent. |
| `PowerConsumer:getRawSpeedLimit(superFunc: any)` | 337 | ✍ Ajoute à la limite de vitesse du parent le décalage de la dernière entrée speedLimitModifier dont la plage de puissance contient la puissance maximale du moteur source (kW). |
| `PowerConsumer:loadWorkModeFromXML(superFunc: any, xmlFile: any, key: any, workMode: any)` | 353 | ✍ Après le chargement du mode de travail par le parent, lit ses forceScale et ptoPowerScale (1 par défaut). Retourne false si le parent a échoué. |
| `PowerConsumer:onStateChange(state: any, data: any)` | 366 | ✍ À l'attelage ou au dételage, mémorise la puissance maximale du moteur du véhicule racine dans sourceMotorPeakPower (math.huge sans moteur). |
| `PowerConsumer:onWorkModeChanged(workMode: any, oldWorkMode: any)` | 381 | ✍ Remet à l'échelle maxForce et la puissance de prise de force min/max à partir de leurs valeurs d'origine avec le forceScale du mode de travail. À noter : ptoPowerScale est chargé mais non utilisé ici. |
| `PowerConsumer:onTurnedOn()` | 398 | ✍ Démarre le minuteur du pic à l'allumage à 1,5 fois la durée du pic. |
| `PowerConsumer.getTotalConsumedPtoTorque(self: table?, excludeVehicle: table?, expected: boolean?, ignoreTurnOnPeak: boolean?) → number, number` | 409 | ✍ Additionne récursivement le couple de prise de force consommé (kNm) d'un véhicule et de ses outils attelés, en excluant éventuellement un véhicule. Retourne le total et un multiplicateur virtuel pondéré par le couple. |
| `PowerConsumer.getMaxPtoRpm(self: any) → number` | 438 | ✍ Retourne récursivement le régime de prise de force le plus élevé demandé par un véhicule ou par un outil qui lui est attelé. |
| `PowerConsumer:consoleSetPowerConsumer(neededMinPtoPower: any, neededMaxPtoPower: any, forceFactor: any, maxForce: any, forceDir: any, ptoRpm: any)` | 458 | ✍ Gestionnaire de commande console : remplace les valeurs de puissance et de force de l'outil sélectionné et de tous les véhicules de même fichier de configuration, pour du réglage en direct. Retourne un message d'état ou d'usage. |
| `PowerConsumer.loadSpecValueNeededPower(xmlFile: XMLFile, customEnvironment: string, baseDir: any) → number` | 500 | ✍ Chargeur de caractéristique de boutique : lit neededPower, son maxPower et une valeur par configuration powerConsumer depuis le XML dans une table (base, maxPower, config). |
| `PowerConsumer.getSpecValueNeededPower(storeItem: table, realItem: table, configurations: any, saleItem: any, returnValues: any, returnRange: any) → string, number, number` | 529 | ✍ Construit le texte de boutique de la puissance requise, une valeur unique kW/ch ou une plage en ch selon les configurations. Retourne nil si aucune puissance n'est définie ou si le minimum vaut 0. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `loadPowerSetup` | 77 |
| registerFunction | `getPtoRpm` | 78 |
| registerFunction | `getDoConsumePtoPower` | 79 |
| registerFunction | `getPowerMultiplier` | 80 |
| registerFunction | `getConsumedPtoTorque` | 81 |
| registerFunction | `getConsumingLoad` | 82 |
| registerOverwrittenFunction | `getCanBeTurnedOn` | 88 |
| registerOverwrittenFunction | `getCanBeTurnedOnAll` | 89 |
| registerOverwrittenFunction | `getTurnedOnNotAllowedWarning` | 90 |
| registerOverwrittenFunction | `getRawSpeedLimit` | 91 |
| registerOverwrittenFunction | `loadWorkModeFromXML` | 92 |
| registerEventListener | `onLoad` | 98 |
| registerEventListener | `onUpdate` | 99 |
| registerEventListener | `onStateChange` | 100 |
| registerEventListener | `onWorkModeChanged` | 101 |
| registerEventListener | `onTurnedOn` | 102 |

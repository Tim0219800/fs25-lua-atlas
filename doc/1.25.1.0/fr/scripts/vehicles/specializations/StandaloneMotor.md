# vehicles/specializations/StandaloneMotor.lua

*[English version](../../../../scripts/vehicles/specializations/StandaloneMotor.md)*

Source: `dataS/scripts/vehicles/specializations/StandaloneMotor.lua` — FS25 1.25.1.0

✍ Spécialisation pour un outil doté de son propre moteur, sans être un véhicule motorisé conduisible (par exemple une machine autonome ou un moteur de remorque). Elle joue sons, effets et animations de moteur tant que la machine a besoin de puissance et peut tourner, simule régime, charge et une température moteur simple avec ventilateur, et expose des valeurs de tableau de bord (temps de fonctionnement, température, alerte, état d'allumage). Aucun prérequis, et ce fichier ne synchronise rien sur le réseau.


## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `StandaloneMotor.prerequisitesPresent(specializations: table) → boolean` | 19 | ✍ Retourne toujours true : aucune autre spécialisation n'est requise. |
| `StandaloneMotor.initSpecialization()` | 25 | ✍ Déclare le schéma `vehicle.standaloneMotor` (délai d'arrêt, fractions de charge et de régime au ralenti, durée de démarrage, limites de pliage), les chemins de sons, effets et animations, les chemins de valeurs de tableau de bord et l'attribut de groupe `#isMotorRunning`. |
| `StandaloneMotor.registerFunctions(vehicleType: any)` | 50 | ✍ Enregistre `updateStandaloneMotorTemperature`, `getNeedsStandaloneMotorRunning`, `getAllowsStandaloneMotorRunning`, `getStandaloneMotorTargetRpm` et `getStandaloneMotorLoad`. |
| `StandaloneMotor.registerOverwrittenFunctions(vehicleType: any)` | 60 | ✍ Surcharge `getIsOperating`, `loadDashboardGroupFromXML` et `getIsDashboardGroupActive`. |
| `StandaloneMotor.registerEventListeners(vehicleType: any)` | 68 | ✍ S'abonne à onLoad, onRegisterDashboardValueTypes, onDelete et onUpdateTick. |
| `StandaloneMotor:onLoad(savegame: any)` | 77 | ✍ Lit les réglages XML, initialise régime, charge et température (départ 20, max 120, chauffe 1,5 degré par seconde à pleine charge ; ventilateur activé à 95 et coupé à 85, refroidissement 3 degrés par seconde) et charge les sons, effets et animations du moteur. |
| `StandaloneMotor:onRegisterDashboardValueTypes()` | 115 | ✍ Enregistre les types de valeurs de tableau de bord « operatingTime », « motorTemperature » (avec plage min/max), « motorTemperatureWarning » (vrai tant que la température est dans les seuils d'alerte du tableau de bord) et « ignitionState » (plage 0 à 2). |
| `StandaloneMotor:onDelete()` | 143 | ✍ Supprime les sons, effets et animations du moteur. |
| `StandaloneMotor:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 153 | ✍ Démarre le moteur (son, effets, animations, minuteur de démarrage) quand il est nécessaire et autorisé, et l'arrête après le délai d'arrêt (immédiatement s'il n'est pas autorisé). Tant qu'il est actif, lisse le régime vers la cible, calcule la charge via `getStandaloneMotorLoad`, alimente les paramètres de son et d'effet, met à jour la température et garde le véhicule actif avec `raiseActive`. |
| `StandaloneMotor:getNeedsStandaloneMotorRunning()` | 214 | ✍ Retourne si le moteur doit tourner : le résultat de `getRequiresPower`. |
| `StandaloneMotor:getAllowsStandaloneMotorRunning()` | 220 | ✍ Retourne false si le véhicule est repliable et que son temps d'animation de pliage est hors des limites configurées ; sinon true. |
| `StandaloneMotor:getStandaloneMotorTargetRpm()` | 234 | ✍ Retourne 0 par défaut : la fraction de régime cible (0 à 1), prévue pour être surchargée par d'autres spécialisations. |
| `StandaloneMotor:getStandaloneMotorLoad()` | 240 | ✍ Retourne 0, 0 par défaut : la somme des facteurs de charge et leur nombre, prévus pour être surchargés par d'autres spécialisations. |
| `StandaloneMotor:updateStandaloneMotorTemperature(dt: any)` | 246 | ✍ Chauffe le moteur proportionnellement à dt, à la charge et au régime (plafonné au maximum), active le ventilateur au-dessus de sa température d'activation et le coupe sous sa température de désactivation, et refroidit le moteur tant que le ventilateur tourne (pas sous le minimum). |
| `StandaloneMotor:getIsOperating(superFunc: any) → boolean` | 272 | ✍ Retourne true si le parent le fait ou si le moteur autonome est actif. |
| `StandaloneMotor:loadDashboardGroupFromXML(superFunc: any, xmlFile: any, key: any, group: any)` | 278 | ✍ Appelle le parent et lit en plus `isMotorRunning` sur le groupe de tableau de bord. |
| `StandaloneMotor:getIsDashboardGroupActive(superFunc: any, group: any)` | 290 | ✍ Retourne false pour un groupe marqué `isMotorRunning` tant que le moteur n'est pas actif ; sinon délègue au parent. |
| `StandaloneMotor:updateDebugValues(values: any)` | 302 | ✍ Aide de débogage côté serveur : ajoute à la table fournie le régime (pourcentage et régime réel du son si disponible), la charge, le minuteur d'arrêt et la température. |
| `StandaloneMotor.getMotorIgnitionState(self: any) → boolean` | 323 | ✍ Retourne l'état d'allumage pour le tableau de bord : 0 moteur éteint, 1 pendant le démarrage (jusqu'à `motorStartTime`), 2 une fois démarré. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `updateStandaloneMotorTemperature` | 51 |
| registerFunction | `getNeedsStandaloneMotorRunning` | 52 |
| registerFunction | `getAllowsStandaloneMotorRunning` | 53 |
| registerFunction | `getStandaloneMotorTargetRpm` | 54 |
| registerFunction | `getStandaloneMotorLoad` | 55 |
| registerOverwrittenFunction | `getIsOperating` | 61 |
| registerOverwrittenFunction | `loadDashboardGroupFromXML` | 62 |
| registerOverwrittenFunction | `getIsDashboardGroupActive` | 63 |
| registerEventListener | `onLoad` | 69 |
| registerEventListener | `onRegisterDashboardValueTypes` | 70 |
| registerEventListener | `onDelete` | 71 |
| registerEventListener | `onUpdateTick` | 72 |

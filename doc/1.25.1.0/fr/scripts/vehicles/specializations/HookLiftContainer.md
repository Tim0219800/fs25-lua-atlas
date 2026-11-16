# vehicles/specializations/HookLiftContainer.lua

*[English version](../../../../scripts/vehicles/specializations/HookLiftContainer.md)*

Source: `dataS/scripts/vehicles/specializations/HookLiftContainer.lua` — FS25 1.25.1.0

✍ Spécialisation de véhicule pour les conteneurs portés par une remorque à bras de levage (hooklift). Elle requiert AnimatedVehicle et Attachable. Elle coopère avec HookLiftTrailer : elle bloque le déversement et le détachement tant que la remorque ne les autorise pas, fait basculer la remorque quand le conteneur bascule, transmet à la remorque l'ajout ou le retrait de la physique et pilote un visuel de verrou et les flexibles. Elle définit des nœuds de référence de rouleaux lus par la remorque.

- **HookLiftContainer** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `HookLiftContainer.prerequisitesPresent(specializations: table) → boolean` | 17 | ✍ Renvoie true seulement si le type de véhicule possède AnimatedVehicle et Attachable. |
| `HookLiftContainer.initSpecialization()` | 23 | ✍ Enregistre les clés XML : tiltContainerOnDischarge, les nœuds de début et de fin visualRollReference (bas du conteneur) et les changements d'objets de containerLock. |
| `HookLiftContainer.registerFunctions(vehicleType: any)` | 39 | ✍ Enregistre onHookLiftContainerLockChanged comme fonction de véhicule, appelée par la remorque. |
| `HookLiftContainer.registerOverwrittenFunctions(vehicleType: any)` | 45 | ✍ Surcharge getCanDischargeToObject, getCanDischargeToGround, isDetachAllowed, addToPhysics, removeFromPhysics et getBrakeForce. |
| `HookLiftContainer.registerEventListeners(vehicleType: any)` | 56 | ✍ Abonne à onLoad, onStartTipping et onStopTipping. |
| `HookLiftContainer:onLoad(savegame: table)` | 65 | ✍ Lit l'option de basculement, les nœuds de référence visuels et les changements d'objets du verrou (mis sur off), et désactive les flexibles de connexion si le véhicule en a. |
| `HookLiftContainer:getCanDischargeToObject(superFunc: any, dischargeNode: any)` | 84 | ✍ Renvoie false si la remorque porteuse indique que le basculement n'est pas autorisé (getIsTippingAllowed), sinon s'en remet au test parent. |
| `HookLiftContainer:getCanDischargeToGround(superFunc: any, dischargeNode: any)` | 97 | ✍ Même règle que pour les objets : le déversement au sol est refusé tant que la remorque porteuse n'autorise pas le basculement, sinon le parent décide. |
| `HookLiftContainer:isDetachAllowed(superFunc: any)` | 110 | ✍ Renvoie false (avec nil en seconde valeur) sauf si la remorque indique pouvoir détacher le conteneur, sinon s'en remet au parent. |
| `HookLiftContainer:onStartTipping(tipSideIndex: any)` | 123 | ✍ Si tiltContainerOnDischarge est activé, demande à la remorque porteuse de lancer son animation de basculement. |
| `HookLiftContainer:onStopTipping()` | 133 | ✍ Si tiltContainerOnDischarge est activé, demande à la remorque porteuse de rejouer son animation de basculement en sens inverse. |
| `HookLiftContainer:onHookLiftContainerLockChanged(state: any)` | 144 | ✍ Appelée par la remorque quand l'état du verrou change : active ou désactive les flexibles de connexion du conteneur (s'il est attelé) et applique les changements d'objets de containerLock. Suppose qu'un véhicule porteur existe. |
| `HookLiftContainer:addToPhysics(superFunc: any)` | 160 | ✍ Après l'ajout du conteneur à la physique par le parent, prévient la remorque porteuse (setHookLiftContainerPhysicsState true). Renvoie false si le parent a échoué. |
| `HookLiftContainer:removeFromPhysics(superFunc: any) → boolean` | 176 | ✍ Prévient d'abord la remorque porteuse (état physique false), puis laisse le parent retirer le conteneur. Renvoie false si le parent a échoué. |
| `HookLiftContainer:getBrakeForce(superFunc: any)` | 191 | ✍ Renvoie 0 tant que le conteneur est attelé à un véhicule (pas de freinage propre), sinon la valeur du parent. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `onHookLiftContainerLockChanged` | 40 |
| registerOverwrittenFunction | `getCanDischargeToObject` | 46 |
| registerOverwrittenFunction | `getCanDischargeToGround` | 47 |
| registerOverwrittenFunction | `isDetachAllowed` | 48 |
| registerOverwrittenFunction | `addToPhysics` | 49 |
| registerOverwrittenFunction | `removeFromPhysics` | 50 |
| registerOverwrittenFunction | `getBrakeForce` | 51 |
| registerEventListener | `onLoad` | 57 |
| registerEventListener | `onStartTipping` | 58 |
| registerEventListener | `onStopTipping` | 59 |

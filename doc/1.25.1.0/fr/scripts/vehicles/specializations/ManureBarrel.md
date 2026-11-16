# vehicles/specializations/ManureBarrel.lua

*[English version](../../../../scripts/vehicles/specializations/ManureBarrel.md)*

Source: `dataS/scripts/vehicles/specializations/ManureBarrel.lua` — FS25 1.25.1.0

✍ Spécialisation pour les tonnes à lisier pouvant porter un outil d'épandage sur une attache. Requiert Sprayer et AttacherJoints. Tant qu'un outil est attelé sur l'attache configurée (`vehicle.manureBarrel#attacherJointIndex`), les effets d'épandage et les zones de travail de la tonne sont désactivés pour que l'outil attelé fasse le travail. Pas de code réseau propre.

- **ManureBarrel** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ManureBarrel.prerequisitesPresent(specializations: any)` | 15 | ✍ Renvoie vrai seulement si les spécialisations Sprayer et AttacherJoints sont présentes. |
| `ManureBarrel.initSpecialization()` | 21 | ✍ Enregistre le chemin XML `vehicle.manureBarrel#attacherJointIndex`. |
| `ManureBarrel.registerOverwrittenFunctions(vehicleType: any)` | 32 | ✍ Surcharge `getAreEffectsVisible` et `getIsWorkAreaActive`. |
| `ManureBarrel.registerEventListeners(vehicleType: any)` | 39 | ✍ S'abonne aux événements onLoad, onPostAttachImplement et onPostDetachImplement. |
| `ManureBarrel:onLoad(savegame: any)` | 47 | ✍ Lit l'index d'attache de l'outil et signale l'élément obsolète `toolAttachAnimName`. |
| `ManureBarrel:onPostAttachImplement(attachable: any, inputJointDescIndex: any, jointDescIndex: any, loadFromSavegame: any)` | 57 | ✍ Mémorise l'outil attelé lorsqu'il est attelé sur l'attache d'outil configurée. |
| `ManureBarrel:onPostDetachImplement(implementIndex: any)` | 66 | ✍ Oublie l'outil mémorisé lorsque l'outil sur l'attache configurée est dételé. |
| `ManureBarrel:getAreEffectsVisible(superFunc: any)` | 84 | ✍ Surcharge : renvoie faux tant qu'un outil est attelé sur l'attache d'outil, sinon s'en remet au parent. |
| `ManureBarrel:getIsWorkAreaActive(superFunc: any, workArea: any)` | 96 | ✍ Surcharge : renvoie faux tant qu'un outil est attelé sur l'attache d'outil, sinon s'en remet au parent. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerOverwrittenFunction | `getAreEffectsVisible` | 33 |
| registerOverwrittenFunction | `getIsWorkAreaActive` | 34 |
| registerEventListener | `onLoad` | 40 |
| registerEventListener | `onPostAttachImplement` | 41 |
| registerEventListener | `onPostDetachImplement` | 42 |

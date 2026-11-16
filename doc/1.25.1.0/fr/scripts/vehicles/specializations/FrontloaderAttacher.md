# vehicles/specializations/FrontloaderAttacher.lua

*[English version](../../../../scripts/vehicles/specializations/FrontloaderAttacher.md)*

Source: `dataS/scripts/vehicles/specializations/FrontloaderAttacher.lua` — FS25 1.25.1.0

✍ Spécialisation pour les tracteurs avec une configuration d'attache de chargeur frontal sélectionnable. Côté serveur, l'attelage d'un outil de type chargeur frontal verrouille le joint de composant d'essieu avant configuré (limites de rotation à 0) et le dételage restaure les limites sauvegardées. Exige AttacherJoints.

- **FrontloaderAttacher** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FrontloaderAttacher.prerequisitesPresent(specializations: any)` | 15 | ✍ Exige la spécialisation AttacherJoints. |
| `FrontloaderAttacher.registerEventListeners(vehicleType: any)` | 21 | ✍ Abonne aux événements de chargement, pré-attelage et pré-dételage d'un outil. |
| `FrontloaderAttacher.initSpecialization()` | 29 | ✍ Enregistre le type de configuration « frontloader » et les attributs XML frontAxisLimitJoint et frontAxisJoint de l'attacherJoint d'une configuration de chargeur frontal. |
| `FrontloaderAttacher:onLoad(savegame: any)` | 44 | ✍ Lit la configuration de chargeur frontal active pour trouver le joint de composant d'essieu avant à limiter pendant l'attelage d'un chargeur (l'indice doit exister, sinon avertissement XML). Retire les écouteurs d'attelage/dételage côté client ou sans joint défini. |
| `FrontloaderAttacher:onPreDetachImplement(implement: any)` | 70 | ✍ Serveur : au dételage d'un outil de type chargeur frontal, restaure sur les trois axes les limites de rotation du joint d'essieu avant sauvegardées à l'attelage. |
| `FrontloaderAttacher:onPreAttachImplement(attachable: any, inputJointDescIndex: any, jointDescIndex: any, loadFromSavegame: any)` | 92 | ✍ Serveur : à l'attelage d'un outil de type chargeur frontal, sauvegarde les limites de rotation du joint d'essieu avant et fixe ses trois limites de rotation à 0 pour que l'essieu ne pivote plus. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEventListener | `onLoad` | 22 |
| registerEventListener | `onPreDetachImplement` | 23 |
| registerEventListener | `onPreAttachImplement` | 24 |

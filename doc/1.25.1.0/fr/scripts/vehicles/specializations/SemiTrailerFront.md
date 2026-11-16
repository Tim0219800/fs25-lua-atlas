# vehicles/specializations/SemiTrailerFront.lua

*[English version](../../../../scripts/vehicles/specializations/SemiTrailerFront.md)*

Source: `dataS/scripts/vehicles/specializations/SemiTrailerFront.lua` — FS25 1.25.1.0

✍ Spécialisation pour la partie avant détachable d'une semi-remorque séparable. Elle exige AttacherJoints et agit sur le premier input attacher joint d'Attachable : sans semi-remorque arrière attachée, les limites de rotation du joint sont ramenées à zéro en environ une seconde, et rétablies à l'attelage d'une partie arrière. Le dételage du tracteur n'est permis que si une semi-remorque arrière est attachée. Les changements de joint se font côté serveur.

- **SemiTrailerFront** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SemiTrailerFront.prerequisitesPresent(specializations: table) → boolean` | 17 | ✍ Retourne vrai uniquement si le type de véhicule possède AttacherJoints. |
| `SemiTrailerFront.registerOverwrittenFunctions(vehicleType: any)` | 23 | ✍ Surcharge `isDetachAllowed`. |
| `SemiTrailerFront.registerEventListeners(vehicleType: any)` | 29 | ✍ S'abonne à onLoad, onUpdate, onPostAttachImplement, onPreDetachImplement, onPreDetach et onPostAttach. |
| `SemiTrailerFront:onLoad(savegame: table)` | 41 | ✍ Initialise l'état de fondu (valeur 1, direction 1, durée 1000 ms), récupère le premier input attacher joint d'Attachable et sauvegarde son `lowerRotLimitScale`. Provoque une erreur si le véhicule n'a aucun input attacher joint. |
| `SemiTrailerFront:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 60 | ✍ À la première mise à jour, sans semi-remorque arrière attachée, passe la direction du fondu à la fermeture. Côté serveur, tant qu'il est attelé à un tracteur et que le fondu n'est pas terminé, fait évoluer la valeur avec dt, met à l'échelle les limites de rotation du joint et les applique sur le joint physique avec `setJointRotationLimit`. |
| `SemiTrailerFront:isDetachAllowed(superFunc: any) → boolean` | 100 | ✍ Retourne false (avec l'avertissement du parent) si le parent interdit le dételage ; sinon retourne true seulement si une semi-remorque arrière est attachée, sans avertissement. |
| `SemiTrailerFront:onPostAttachImplement(attachable: table, inputJointDescIndex: any, jointDescIndex: any, loadFromSavegame: any)` | 113 | ✍ Mémorise la remorque arrière attachée et met la direction de fondu à 1000 pour rétablir les limites de rotation. |
| `SemiTrailerFront:onPreDetachImplement(implement: integer)` | 122 | ✍ Oublie la remorque arrière et met la direction de fondu à -1 pour faire disparaître progressivement les limites de rotation. |
| `SemiTrailerFront:onPreDetach(attacherVehicle: table, implement: table)` | 132 | ✍ Efface la référence d'implement du tracteur lorsque cette partie avant est dételée. |
| `SemiTrailerFront:onPostAttach(attacherVehicle: table, inputJointDescIndex: integer, jointDescIndex: integer)` | 142 | ✍ Après l'attelage à un tracteur, mémorise l'entrée d'implement correspondante du véhicule porteur. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerOverwrittenFunction | `isDetachAllowed` | 24 |
| registerEventListener | `onLoad` | 30 |
| registerEventListener | `onUpdate` | 31 |
| registerEventListener | `onPostAttachImplement` | 32 |
| registerEventListener | `onPreDetachImplement` | 33 |
| registerEventListener | `onPreDetach` | 34 |
| registerEventListener | `onPostAttach` | 35 |

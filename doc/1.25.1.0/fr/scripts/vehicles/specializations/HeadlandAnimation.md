# vehicles/specializations/HeadlandAnimation.lua

*[English version](../../../../scripts/vehicles/specializations/HeadlandAnimation.md)*

Source: `dataS/scripts/vehicles/specializations/HeadlandAnimation.lua` — FS25 1.25.1.0

✍ Spécialisation de véhicule qui joue des animations configurées quand le véhicule tourne en bout de champ, détecté d'après l'amplitude du braquage avec des seuils et des délais d'activation et de désactivation. Le véhicule peut en option devoir se trouver sur certains types de sol de champ. Elle se configure sous vehicle.headlandAnimation et s'appuie sur le système d'animation du véhicule (playAnimation, getAnimationTime). Sans prérequis ni code réseau propre.

- **HeadlandAnimation** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `HeadlandAnimation.prerequisitesPresent(specializations: table) → boolean` | 17 | ✍ Renvoie toujours true : aucun prérequis envers d'autres spécialisations. |
| `HeadlandAnimation.initSpecialization()` | 23 | ✍ Enregistre le schéma XML sous vehicle.headlandAnimation : délais d'activation et de désactivation (temps), seuils de braquage (0 à 1), types de sol requis et liste d'animations avec nom et vitesse. |
| `HeadlandAnimation.registerFunctions(vehicleType: any)` | 41 | ✍ Vide : la spécialisation n'ajoute aucune fonction de véhicule. |
| `HeadlandAnimation.registerOverwrittenFunctions(vehicleType: any)` | 46 | ✍ Vide : rien n'est surchargé. |
| `HeadlandAnimation.registerEventListeners(vehicleType: any)` | 51 | ✍ Abonne la spécialisation à onLoad et onUpdate. |
| `HeadlandAnimation:onLoad(savegame: table)` | 59 | ✍ Si un nœud headlandAnimation existe, charge les délais, angles, les noms de FieldGroundType requis (avertissement si nom inconnu) et la liste d'animations. Sinon retire l'écouteur onUpdate. À noter : l'attribut des types de sol est découpé sans test de nil, son omission provoquerait donc une erreur. |
| `HeadlandAnimation:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 117 | ✍ À chaque frame, fait tourner un minuteur selon l'amplitude de braquage (rotatedTime) et le type de sol sous le véhicule pour décider de l'état de fourrière, puis joue toutes les animations en avant ou en arrière quand cet état change. À noter : il teste spec.headlandRequiredDensityBits, jamais assigné dans ce fichier. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEventListener | `onLoad` | 52 |
| registerEventListener | `onUpdate` | 53 |

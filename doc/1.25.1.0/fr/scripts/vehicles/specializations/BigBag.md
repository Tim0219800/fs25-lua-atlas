# vehicles/specializations/BigBag.lua

*[English version](../../../../scripts/vehicles/specializations/BigBag.md)*

Source: `dataS/scripts/vehicles/specializations/BigBag.lua` — FS25 1.25.1.0

✍ Spécialisation des big bags (sacs en vrac) : elle ajuste une animation de taille selon le niveau de remplissage et les limites d'un joint de composants pour que le sac s'étire quand il est soulevé et plein. Configurée sous vehicle.bigBag (fillUnitIndex, sizeAnimation, componentJoint). Les limites du joint ne sont modifiées que côté serveur ; l'animation tourne sur toutes les machines. Elle remplace aussi le titre de l'infobulle par le texte de boutique des big bags.

- **BigBag** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `BigBag.prerequisitesPresent(specializations: table) → boolean` | 17 | ✍ Renvoie toujours true : aucune autre spécialisation n'est requise. |
| `BigBag.initSpecialization()` | 23 | ✍ Enregistre les clés XML vehicle.bigBag : indice de l'unité de remplissage, animation de taille (temps min, max et réduction au levage), indice du joint de composants, limites de rotation et de translation et amortissement angulaire. |
| `BigBag.registerFunctions(vehicleType: any)` | 48 | ✍ Point d'entrée vide, n'enregistre aucune nouvelle fonction de véhicule. |
| `BigBag.registerOverwrittenFunctions(vehicleType: any)` | 53 | ✍ Remplace getInfoBoxTitle sur le type de véhicule. |
| `BigBag.registerEventListeners(vehicleType: any)` | 59 | ✍ Enregistre onLoad, onUpdate et onFillUnitFillLevelChanged. |
| `BigBag:onLoad(savegame: table)` | 68 | ✍ Lit les valeurs XML bigBag. Si le joint de composants référencé existe, crée un groupe de transformation de référence sur le second composant, mémorise les limites et applique l'amortissement angulaire aux deux composants ; initialise l'état d'animation. |
| `BigBag:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 116 | ✍ Mesure le déplacement du joint par rapport à sa référence pour en déduire un alpha de levage et un temps de réduction de l'animation de taille. Côté serveur, réinterpole les limites de rotation du joint quand alpha varie de plus de 0,05. |
| `BigBag:onFillUnitFillLevelChanged(fillUnitIndex: any, fillLevelDelta: any, fillType: any, toolType: any, fillPositionData: any, appliedDelta: any)` | 149 | ✍ Quand l'unité de remplissage suivie change, recalcule le temps d'animation de taille d'après le pourcentage de remplissage et l'applique. Côté serveur, interpole aussi les limites de translation du joint entre les valeurs vide et plein. |
| `BigBag:getInfoBoxTitle(superFunc: any)` | 172 | ✍ Renvoie le texte localisé shopItem_bigBag comme titre de l'infobulle, sans appeler l'implémentation parente. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerOverwrittenFunction | `getInfoBoxTitle` | 54 |
| registerEventListener | `onLoad` | 60 |
| registerEventListener | `onUpdate` | 61 |
| registerEventListener | `onFillUnitFillLevelChanged` | 62 |

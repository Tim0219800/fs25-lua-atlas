# vehicles/specializations/ConnectedAttributes.lua

*[English version](../../../../scripts/vehicles/specializations/ConnectedAttributes.md)*

Source: `dataS/scripts/vehicles/specializations/ConnectedAttributes.lua` — FS25 1.25.1.0

✍ Spécialisation qui copie des valeurs de nœuds sources (par exemple position, rotation ou échelle d'un nœud) vers des nœuds cibles, avec combinaison facultative par somme, moyenne, soustraction, multiplication ou division. Chaque entrée vehicle.connectedAttributes.attribute déclare sources, cibles, règles de combinaison, prérequis d'animation et déclencheurs de mise à jour (à chaque image avec isActiveDirty, au début/pendant/à la fin d'une animation, ou depuis les pièces mobiles de Cylindered via connectedAttributeIndices). Les classes de types de source et de cible (TYPES, TYPES_BY_NAME, COMBINE_OPERATION) ne sont pas définies dans ce dump, qui se termine par une classe LocalOffset vide : leur contenu exact est NON VÉRIFIÉ.

- **LocalOffset** (l.634)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ConnectedAttributes.prerequisitesPresent(specializations: table) → boolean` | 26 | ✍ Renvoie toujours true : aucune autre spécialisation n'est requise. |
| `ConnectedAttributes.initSpecialization()` | 32 | ✍ Enregistre le schéma XML de connectedAttributes.attribute : chaque classe de type ajoute ses propres chemins de source et de cible, et les entrées movingTool/movingPart de Cylindered reçoivent une liste connectedAttributeIndices par enregistrement différé. |
| `ConnectedAttributes.registerFunctions(vehicleType: any)` | 85 | ✍ Point d'entrée vide, n'enregistre aucune nouvelle fonction de véhicule. |
| `ConnectedAttributes.registerOverwrittenFunctions(vehicleType: any)` | 90 | ✍ Remplace loadExtraDependentParts et updateExtraDependentParts (fournies par une autre spécialisation, laquelle : NON VÉRIFIÉ). |
| `ConnectedAttributes.registerEventListeners(vehicleType: any)` | 97 | ✍ Enregistre onLoad, onLoadFinished, onUpdate, onUpdateEnd, onPlayAnimation, onUpdateAnimation et onFinishAnimation. |
| `ConnectedAttributes:onLoad(savegame: any)` | 109 | ✍ Analyse chaque attribut du XML : déclencheurs d'animation, prérequis sur le temps d'animation, sources, règles de combinaison et cibles, dont les valeurs peuvent être mises à l'échelle (*, /), décalées (+, -) ou constantes. Les entrées invalides produisent des avertissements XML ; un attribut exige au moins une source et une cible. Les écouteurs inutiles (update, événements d'animation) sont ensuite retirés. |
| `ConnectedAttributes:onLoadFinished(savegame: any)` | 384 | ✍ Force une mise à jour unique de chaque attribut afin que les cibles démarrent avec les valeurs calculées depuis les sources. |
| `ConnectedAttributes:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 393 | ✍ À chaque image, met à jour les attributs marqués isActiveDirty, en ignorant ceux dont maxUpdateDistance est inférieur à la distance de mise à jour du véhicule. |
| `ConnectedAttributes:onUpdateEnd(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 405 | ✍ Exécute une fois onUpdate avec un dt très grand, pour rafraîchir une dernière fois les attributs marqués. |
| `ConnectedAttributes:onPlayAnimation(animationName: any)` | 413 | ✍ Au démarrage d'une animation, force la mise à jour de chaque attribut qui la liste avec onStart activé. |
| `ConnectedAttributes:onUpdateAnimation(animationName: any)` | 429 | ✍ Pendant l'exécution d'une animation, force la mise à jour de chaque attribut qui la liste avec onRun activé. |
| `ConnectedAttributes:onFinishAnimation(animationName: any)` | 445 | ✍ À la fin d'une animation, force la mise à jour de chaque attribut qui la liste avec onStop activé. |
| `ConnectedAttributes.updateAttribute(attribute: any, forceUpdate: any)` | 461 | ✍ Statique. Vérifie les prérequis d'animation, lit toutes les sources, évalue les règles de combinaison (moyenne, somme, soustraction, multiplication, division) et, si une valeur a changé ou si forceUpdate est vrai, écrit les valeurs mises à l'échelle dans chaque cible. La division ne vérifie pas le zéro. |
| `ConnectedAttributes:loadExtraDependentParts(superFunc: any, xmlFile: any, baseName: any, entry: any)` | 544 | ✍ Appelle le parent puis lit connectedAttributeIndices sur la pièce mobile et stocke la liste dans l'entrée. Renvoie false si le parent échoue. |
| `ConnectedAttributes:updateExtraDependentParts(superFunc: any, part: any, dt: any)` | 559 | ✍ Appelle le parent puis met à jour chaque attribut dont l'indice figure sur la pièce mobile, en ignorant les indices inconnus. |
| `ConnectedAttributes:updateDebugValues(values: any)` | 575 | ✍ Ajoute des lignes de débogage à la liste fournie : résultats des prérequis, données des sources, valeurs nommées courantes et données des cibles de chaque attribut. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerOverwrittenFunction | `loadExtraDependentParts` | 91 |
| registerOverwrittenFunction | `updateExtraDependentParts` | 92 |
| registerEventListener | `onLoad` | 98 |
| registerEventListener | `onLoadFinished` | 99 |
| registerEventListener | `onUpdate` | 100 |
| registerEventListener | `onUpdateEnd` | 101 |
| registerEventListener | `onPlayAnimation` | 102 |
| registerEventListener | `onUpdateAnimation` | 103 |
| registerEventListener | `onFinishAnimation` | 104 |

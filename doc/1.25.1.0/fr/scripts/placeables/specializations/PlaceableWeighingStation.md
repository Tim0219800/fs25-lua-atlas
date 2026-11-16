# placeables/specializations/PlaceableWeighingStation.lua

*[English version](../../../../scripts/placeables/specializations/PlaceableWeighingStation.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableWeighingStation.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable pour une station de pesée de véhicules (pont-bascule). Un déclencheur suit les nœuds de véhicules sur la plateforme et la masse totale s'affiche sur un ou plusieurs afficheurs à chiffres configurés sous `placeable.weighingStation.display`. Les polices viennent du gestionnaire de matériaux.

- **PlaceableWeighingStation** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableWeighingStation.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Renvoie toujours true : aucune spécialisation requise. |
| `PlaceableWeighingStation.registerFunctions(placeableType: any)` | 24 | ✍ Enregistre `updateWeightDisplay`, `setWeightDisplay` et `onWeighingTriggerCallback` sur le type de placeable. |
| `PlaceableWeighingStation.registerEventListeners(placeableType: any)` | 32 | ✍ S'abonne à onLoad et onDelete. |
| `PlaceableWeighingStation.registerXMLPaths(schema: any, basePath: any)` | 39 | ✍ Déclare les clés XML de la station de pesée (nœud de déclencheur et réglages d'afficheur : nœud, police, alignement, taille, masque, couleurs). |
| `PlaceableWeighingStation:onLoad(savegame: table)` | 61 | ✍ Lit le nœud de déclencheur (erreur journalisée et arrêt s'il manque), l'enregistre, et construit chaque afficheur (matériau de police, alignement, taille, échelle, masque, couleurs) sous forme de ligne de caractères. Affiche 0 au départ. |
| `PlaceableWeighingStation:onDelete()` | 115 | ✍ Retire le nœud de déclencheur. |
| `PlaceableWeighingStation:updateWeightDisplay()` | 126 | ✍ Résout les nœuds suivis en véhicules (écartant ceux qui n'existent plus), additionne leur masse totale et affiche la somme multipliée par 1000 (donc probablement des tonnes en kilogrammes, hypothèse). |
| `PlaceableWeighingStation:setWeightDisplay(mass: any)` | 153 | ✍ Formate le nombre donné avec le masque de chaque afficheur (partie entière et décimale) et écrit le texte sur sa ligne de caractères. |
| `PlaceableWeighingStation:onWeighingTriggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean)` | 170 | ✍ Callback du déclencheur : à l'entrée ou à la sortie, ajoute ou retire l'autre nœud de l'ensemble suivi et actualise le poids affiché. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `onWeighingTriggerCallback` | 25 |
| registerFunction | `updateWeightDisplay` | 26 |
| registerFunction | `setWeightDisplay` | 27 |
| registerEventListener | `onLoad` | 33 |
| registerEventListener | `onDelete` | 34 |

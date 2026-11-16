# handTools/specializations/HandToolStorable.lua

*[English version](../../../../scripts/handTools/specializations/HandToolStorable.md)*

Source: `dataS/scripts/handTools/specializations/HandToolStorable.lua` — FS25 1.25.1.0

✍ Spécialisation d'outil à main pour les outils qui peuvent être rangés dans un support d'outil. Elle lit dans le XML de l'outil une liste de types de supports, chacun avec un nœud optionnel servant à orienter l'outil dans ce support, et fournit une recherche par type de support. Elle n'a aucun prérequis et n'écoute que onLoad.

- **HandToolStorable** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `HandToolStorable.registerXMLPaths(xmlSchema: any)` | 15 | ✍ Déclare les entrées XML répétées handTool.storable.holderType : une chaîne #type obligatoire et un index #node optionnel désignant le nœud d'orientation. |
| `HandToolStorable.registerFunctions(handToolType: any)` | 26 | ✍ Enregistre la fonction getHolsterNodeByType sur le type d'outil à main. |
| `HandToolStorable.registerEventListeners(handToolType: any)` | 32 | ✍ Abonne la spécialisation à l'événement onLoad. |
| `HandToolStorable.prerequisitesPresent(specializations: any)` | 38 | ✍ Retourne toujours true : cette spécialisation n'a aucun prérequis. |
| `HandToolStorable:onLoad(xmlFile: any)` | 44 | ✍ Construit une table type de support vers nœud d'orientation à partir du XML. Les entrées sans type sont signalées en erreur XML et ignorées ; celles sans nœud résolu ne sont pas stockées, donc ce type de support n'est pas accepté. |
| `HandToolStorable:getHolsterNodeByType(typeName: any)` | 66 | ✍ Retourne le nœud d'orientation enregistré pour le nom de type de support donné, ou nil si l'outil ne peut pas être rangé dans ce type de support. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `getHolsterNodeByType` | 27 |
| registerEventListener | `onLoad` | 33 |

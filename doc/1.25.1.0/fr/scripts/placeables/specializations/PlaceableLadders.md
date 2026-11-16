# placeables/specializations/PlaceableLadders.lua

*[English version](../../../../scripts/placeables/specializations/PlaceableLadders.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableLadders.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable pour les placeables avec échelles. Dans ce dump du SDK, seule la surcharge de collectPickObjects est présente ; le code de chargement des déclencheurs d'échelle n'est pas inclus, donc spec.ladderTriggers est rempli ailleurs (NON VÉRIFIÉ).

- **PlaceableLadders** (l.9)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableLadders.registerOverwrittenFunctions(placeableType: any)` | 22 | ✍ Surcharge collectPickObjects sur le type de placeable. |
| `PlaceableLadders:collectPickObjects(superFunc: any, node: any)` | 60 | ✍ Appelle le parent pour le noeud sauf si c'est l'un des noeuds de déclencheur d'échelle, qui ne sont donc pas enregistrés comme objets sélectionnables. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerOverwrittenFunction | `collectPickObjects` | 23 |

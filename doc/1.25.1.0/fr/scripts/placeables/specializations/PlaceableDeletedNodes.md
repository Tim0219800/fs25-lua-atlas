# placeables/specializations/PlaceableDeletedNodes.lua

*[English version](../../../../scripts/placeables/specializations/PlaceableDeletedNodes.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableDeletedNodes.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable qui supprime les nœuds de scène listés dans le XML (`deletedNodes.deletedNode`) une fois le chargement terminé, typiquement pour retirer des parties d'un modèle i3d partagé. Les nœuds qui sont des os d'un maillage skinné sont ignorés avec un avertissement pour éviter un plantage.

- **PlaceableDeletedNodes** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableDeletedNodes.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Renvoie toujours true : aucune spécialisation prérequise. |
| `PlaceableDeletedNodes.registerEventListeners(placeableType: any)` | 24 | ✍ S'abonne à `onLoadFinished`. |
| `PlaceableDeletedNodes.registerXMLPaths(schema: any, basePath: any)` | 30 | ✍ Déclare `deletedNodes.deletedNode(?)#node`. |
| `PlaceableDeletedNodes:onLoadFinished(savegame: table)` | 39 | ✍ Collecte tous les os des shapes skinnés, construit la liste des nœuds à supprimer (en ignorant avec un avertissement les os d'un maillage skinné, sauf si le nœud est le maillage lui-même), puis les supprime dans une seconde passe pour que les chemins d'index restent valides. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEventListener | `onLoadFinished` | 25 |

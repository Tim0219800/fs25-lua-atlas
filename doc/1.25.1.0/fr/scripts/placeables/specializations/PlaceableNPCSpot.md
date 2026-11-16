# placeables/specializations/PlaceableNPCSpot.lua

*[English version](../../../../scripts/placeables/specializations/PlaceableNPCSpot.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableNPCSpot.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable permettant à un bâtiment de définir des emplacements de PNJ (positions où des personnages non joueurs peuvent se tenir). Les emplacements sont construits depuis le XML au chargement et enregistrés auprès de g_npcManager une fois le placement final. NPCSpot et le gestionnaire de PNJ sont définis ailleurs.

- **PlaceableNPCSpot** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableNPCSpot.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Renvoie toujours true : aucune spécialisation prérequise. |
| `PlaceableNPCSpot.registerEventListeners(placeableType: any)` | 24 | ✍ S'abonne à onLoad, onDelete et onFinalizePlacement. |
| `PlaceableNPCSpot.registerXMLPaths(schema: any, basePath: any)` | 32 | ✍ Déclare les entrées XML npcSpots.spot en déléguant à NPCSpot.registerXMLPaths. |
| `PlaceableNPCSpot:onLoad(savegame: table)` | 41 | ✍ Crée un NPCSpot par entrée npcSpots.spot avec un identifiant unique construit à partir de l'identifiant unique du placeable et de l'indice ; les emplacements qui échouent sont supprimés. La liste n'est conservée que si elle n'est pas vide. |
| `PlaceableNPCSpot:onFinalizePlacement()` | 64 | ✍ Ajoute chaque emplacement au gestionnaire de PNJ. |
| `PlaceableNPCSpot:onDelete()` | 75 | ✍ Retire chaque emplacement du gestionnaire de PNJ. À noter : les emplacements eux-mêmes ne sont pas supprimés ici. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEventListener | `onLoad` | 25 |
| registerEventListener | `onDelete` | 26 |
| registerEventListener | `onFinalizePlacement` | 27 |

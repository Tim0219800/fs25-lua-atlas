# vehicles/specializations/TipOccluder.lua

*[English version](../../../../scripts/vehicles/specializations/TipOccluder.md)*

Source: `dataS/scripts/vehicles/specializations/TipOccluder.lua` — FS25 1.25.1.0

✍ Spécialisation (sans prérequis) qui définit des zones au sol où la matière ne doit pas être déversée, par exemple sous les roues. Les zones viennent de vehicle.tipOccluder.occlusionArea dans le XML et sont aussi construites automatiquement à partir des roues partageant un tipOcclusionAreaGroupId (une boîte autour de leur zone de contact). Les autres systèmes les lisent via getTipOcclusionAreas.

- **TipOccluder** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `TipOccluder.prerequisitesPresent(specializations: any)` | 16 | ✍ Renvoie toujours true : aucune spécialisation prérequise. |
| `TipOccluder.initSpecialization()` | 22 | ✍ Enregistre le schéma XML des entrées occlusionArea : nodes start, width et height. |
| `TipOccluder.registerFunctions(vehicleType: any)` | 35 | ✍ Enregistre getTipOcclusionAreas, getWheelsWithTipOcclisionAreaGroupId et getRequiresTipOcclusionArea. |
| `TipOccluder.registerOverwrittenFunctions(vehicleType: any)` | 43 | ✍ Vide : n'enregistre aucune fonction surchargée. |
| `TipOccluder.registerEventListeners(vehicleType: any)` | 48 | ✍ S'abonne à onLoad et onLoadFinished. |
| `TipOccluder:onLoad(savegame: any)` | 55 | ✍ Lit chaque occlusionArea avec ses trois nodes dans la liste (en ignorant les incomplètes) et avertit pour l'ancienne clé FS17 à FS19. |
| `TipOccluder:onLoadFinished(savegame: any)` | 83 | ✍ Pour les roues ayant un tipOcclusionAreaGroupId, crée une zone par groupe (trois transform nodes) et la redimensionne pour couvrir l'empreinte de contact des roues. Avertit en mode dev si le véhicule exige une zone mais n'en a aucune. |
| `TipOccluder:getTipOcclusionAreas()` | 158 | ✍ Renvoie la liste des zones d'occlusion, chacune avec les nodes start, width et height. |
| `TipOccluder:getWheelsWithTipOcclisionAreaGroupId(wheels: any, groupId: any)` | 164 | ✍ Renvoie une nouvelle table des roues dont la physique a le tipOcclusionAreaGroupId donné. À noter : « Occlision » est mal orthographié dans le nom. |
| `TipOccluder:getRequiresTipOcclusionArea()` | 176 | ✍ Renvoie false par défaut ; d'autres spécialisations peuvent le surcharger pour exiger au moins une zone d'occlusion. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `getTipOcclusionAreas` | 36 |
| registerFunction | `getWheelsWithTipOcclisionAreaGroupId` | 37 |
| registerFunction | `getRequiresTipOcclusionArea` | 38 |
| registerEventListener | `onLoad` | 49 |
| registerEventListener | `onLoadFinished` | 50 |

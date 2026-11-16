# vehicles/specializations/BaseMaterial.lua

*[English version](../../../../scripts/vehicles/specializations/BaseMaterial.md)*

Source: `dataS/scripts/vehicles/specializations/BaseMaterial.lua` — FS25 1.25.1.0

✍ Spécialisation vide conservée pour la compatibilité. Malgré son rôle annoncé (appliquer des matériaux depuis le XML du véhicule), le seul code est un onLoad qui signale les éléments XML obsolètes de FS22 (vehicle.baseMaterial et les anciens blocs de configuration de matériaux) et renvoie vers vehicle.designColorConfigurations.

- **BaseMaterial** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `BaseMaterial.prerequisitesPresent(specializations: any)` | 15 | ✍ Renvoie toujours true : aucune autre spécialisation n'est requise. |
| `BaseMaterial.initSpecialization()` | 21 | ✍ Point d'entrée vide, n'enregistre aucune entrée de schéma XML. |
| `BaseMaterial.registerFunctions(vehicleType: any)` | 26 | ✍ Point d'entrée vide, n'enregistre aucune fonction de véhicule. |
| `BaseMaterial.registerEventListeners(vehicleType: any)` | 31 | ✍ Enregistre uniquement l'écouteur onLoad. |
| `BaseMaterial:onLoad(savegame: any)` | 37 | ✍ Vérifie dans le XML du véhicule la présence d'éléments FS22 obsolètes (baseMaterial, baseMaterialConfigurations, designMaterialConfigurations, designMaterial2/3Configurations) et journalise un avertissement ; n'applique aucun matériau. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEventListener | `onLoad` | 32 |

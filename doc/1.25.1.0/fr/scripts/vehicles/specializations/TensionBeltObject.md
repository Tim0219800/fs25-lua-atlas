# vehicles/specializations/TensionBeltObject.lua

*[English version](../../../../scripts/vehicles/specializations/TensionBeltObject.md)*

Source: `dataS/scripts/vehicles/specializations/TensionBeltObject.lua` — FS25 1.25.1.0

✍ Marque un véhicule comme objet pouvant être sanglé par des sangles de tension, sans prérequis. Lit vehicle.tensionBeltObject : un indicateur de prise en charge et une liste de mesh nodes servant au calcul des sangles. Les mesh nodes doivent être des shapes avec le drapeau CPU-Mesh, sinon ils sont ignorés avec un avertissement XML. Utilisé par la spécialisation TensionBelts du véhicule porteur.

- **TensionBeltObject** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `TensionBeltObject.prerequisitesPresent(specializations: any)` | 15 | ✍ Renvoie toujours true : aucune spécialisation prérequise. |
| `TensionBeltObject.initSpecialization()` | 21 | ✍ Enregistre le schéma XML : supportsTensionBelts (true par défaut) et la liste des mesh nodes. |
| `TensionBeltObject.registerFunctions(vehicleType: any)` | 33 | ✍ Enregistre getSupportsTensionBelts, getMeshNodes et getTensionBeltNodeId. |
| `TensionBeltObject.registerEventListeners(vehicleType: any)` | 41 | ✍ S'abonne à onLoad. |
| `TensionBeltObject:onLoad(savegame: table)` | 48 | ✍ Lit l'indicateur de prise en charge et collecte les mesh nodes valides, en ignorant (avec avertissements XML) les nodes manquants, les non-shapes et les shapes sans le drapeau CPU-Mesh. |
| `TensionBeltObject:getSupportsTensionBelts()` | 76 | ✍ Renvoie si ce véhicule peut être sanglé avec des sangles de tension. |
| `TensionBeltObject:getMeshNodes()` | 82 | ✍ Renvoie la liste des mesh nodes valides utilisés pour le calcul des sangles. |
| `TensionBeltObject:getTensionBeltNodeId()` | 88 | ✍ Renvoie le node du premier composant, utilisé comme node de référence des sangles. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `getSupportsTensionBelts` | 34 |
| registerFunction | `getMeshNodes` | 35 |
| registerFunction | `getTensionBeltNodeId` | 36 |
| registerEventListener | `onLoad` | 42 |

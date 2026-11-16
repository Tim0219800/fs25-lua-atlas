# vehicles/specializations/FertilizingCultivator.lua

*[English version](../../../../scripts/vehicles/specializations/FertilizingCultivator.md)*

Source: `dataS/scripts/vehicles/specializations/FertilizingCultivator.lua` — FS25 1.25.1.0

✍ Spécialisation de véhicule pour les cultivateurs qui épandent aussi de l'engrais pendant le même passage. Elle exige les spécialisations Cultivator et Sprayer et surcharge le traitement de la zone de travail du cultivateur afin que la culture et la mise à jour de la carte de densité de pulvérisation se fassent ensemble. Elle ajuste aussi les plages interdites de l'IA pour les sols déjà fertilisés.

- **FertilizingCultivator** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FertilizingCultivator.prerequisitesPresent(specializations: table) → boolean` | 19 | ✍ Renvoie true seulement si les spécialisations Cultivator et Sprayer sont toutes deux présentes sur le type de véhicule. |
| `FertilizingCultivator.initSpecialization()` | 25 | ✍ Enregistre la clé XML vehicle.fertilizingCultivator#needsSetIsTurnedOn (false par défaut). |
| `FertilizingCultivator.registerOverwrittenFunctions(vehicleType: any)` | 36 | ✍ Surcharge processCultivatorArea et setSprayerAITerrainDetailProhibitedRange sur le type de véhicule. |
| `FertilizingCultivator.registerEventListeners(vehicleType: any)` | 43 | ✍ Abonne la spécialisation à l'événement de véhicule onLoad. |
| `FertilizingCultivator:onLoad(savegame: any)` | 49 | ✍ Lit needsSetIsTurnedOn, désactive la limite de vitesse du pulvérisateur, efface la plage de détail de terrain requise par l'IA et rafraîchit les exigences IA du cultivateur. |
| `FertilizingCultivator:processCultivatorArea(superFunc: any, workArea: any, dt: any)` | 60 | ✍ Par zone de travail : arrête le travail de l'IA quand sa source d'engrais est épuisée (selon les réglages d'aide), efface les traces de pneus, cultive (mode profond ou déchaumeur à disques, plus vigne et sous-soleuse) et pulvérise avec le type FERTILIZER. Les clients éloignés au-delà du rayon de mise à jour renvoient 0, 0. Renvoie la surface modifiée et la surface totale cultivée. |
| `FertilizingCultivator:setSprayerAITerrainDetailProhibitedRange(superFunc: any, fillType: any)` | 139 | ✍ Remplace la version du pulvérisateur : efface les plages interdites puis, pour le type de pulvérisation du type de remplissage donné, interdit à l'IA de travailler sur un sol qui a déjà ce type et sur un sol au niveau maximal de pulvérisation. Sans effet si le véhicule ne gère pas les interdictions IA. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerOverwrittenFunction | `processCultivatorArea` | 37 |
| registerOverwrittenFunction | `setSprayerAITerrainDetailProhibitedRange` | 38 |
| registerEventListener | `onLoad` | 44 |

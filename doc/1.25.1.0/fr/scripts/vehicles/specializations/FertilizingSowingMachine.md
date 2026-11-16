# vehicles/specializations/FertilizingSowingMachine.lua

*[English version](../../../../scripts/vehicles/specializations/FertilizingSowingMachine.md)*

Source: `dataS/scripts/vehicles/specializations/FertilizingSowingMachine.lua` — FS25 1.25.1.0

✍ Spécialisation de véhicule pour les semoirs qui épandent aussi de l'engrais pendant le semis. Elle exige les spécialisations SowingMachine et Sprayer et surcharge le traitement de la zone de travail de semis pour semer et mettre à jour la carte de densité de pulvérisation en un seul passage, mettre à jour les statistiques de pulvérisation de la ferme et arrêter l'IA en cas de manque de semences ou d'engrais ou de mauvais type de champ. À noter : ce fichier lit FertilizingSowingMachine.CLIENT_DM_UPDATE_RADIUS sans le définir dans le dump (origine NON VÉRIFIÉE).

- **FertilizingSowingMachine** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FertilizingSowingMachine.prerequisitesPresent(specializations: table) → boolean` | 19 | ✍ Renvoie true seulement si les spécialisations SowingMachine et Sprayer sont toutes deux présentes. |
| `FertilizingSowingMachine.initSpecialization()` | 25 | ✍ Enregistre la clé XML vehicle.fertilizingSowingMachine#needsSetIsTurnedOn (false par défaut). |
| `FertilizingSowingMachine.registerOverwrittenFunctions(vehicleType: any)` | 36 | ✍ Surcharge processSowingMachineArea, getUseSprayerAIRequirements et getAreEffectsVisible sur le type de véhicule. |
| `FertilizingSowingMachine.registerEventListeners(vehicleType: any)` | 44 | ✍ Abonne la spécialisation à l'événement de véhicule onLoad. |
| `FertilizingSowingMachine:onLoad(savegame: any)` | 50 | ✍ Lit needsSetIsTurnedOn, permet au pulvérisateur de fonctionner sans être rempli et sans limite de vitesse, et met needWaterInfo à true sur le véhicule. |
| `FertilizingSowingMachine:processSowingMachineArea(superFunc: any, workArea: any, dt: any)` | 62 | ✍ Par zone de travail : contrôle le semis en eau ou à sec, la disponibilité des semences, la source d'engrais et le type de champ requis (en arrêtant l'IA avec une erreur si besoin), efface les traces de pneus, puis sème (normal ou direct) et pulvérise du FERTILIZER sur les cartes de densité. Met à jour les statistiques de pulvérisation de la ferme. Renvoie la surface modifiée et totale, ou 0, 0 si rien n'est fait. |
| `FertilizingSowingMachine:getUseSprayerAIRequirements(superFunc: any)` | 201 | ✍ Renvoie toujours false : les exigences IA propres au pulvérisateur ne s'appliquent pas à cette machine combinée. |
| `FertilizingSowingMachine:getAreEffectsVisible(superFunc: any)` | 207 | ✍ Les effets sont visibles seulement si le parent le permet et si l'unité de remplissage du pulvérisateur contient un type connu (pas UNKNOWN). |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerOverwrittenFunction | `processSowingMachineArea` | 37 |
| registerOverwrittenFunction | `getUseSprayerAIRequirements` | 38 |
| registerOverwrittenFunction | `getAreEffectsVisible` | 39 |
| registerEventListener | `onLoad` | 45 |

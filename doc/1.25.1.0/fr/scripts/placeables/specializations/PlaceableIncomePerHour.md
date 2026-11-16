# placeables/specializations/PlaceableIncomePerHour.lua

*[English version](../../../../scripts/placeables/specializations/PlaceableIncomePerHour.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableIncomePerHour.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable qui verse un revenu fixe par heure de jeu à la ferme propriétaire, dont le montant peut dépendre d'une configuration incomePerHour. Elle enregistre aussi la caractéristique de boutique et le type de configuration incomePerHour, pour que la valeur apparaisse en boutique. Le revenu n'est ajouté que sur le serveur, et seulement une fois le placeable entièrement construit.

- **PlaceableIncomePerHour** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableIncomePerHour.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Aucun prérequis : renvoie toujours true. |
| `PlaceableIncomePerHour.registerFunctions(placeableType: any)` | 24 | ✍ Enregistre la méthode getIncomePerHour. |
| `PlaceableIncomePerHour.registerOverwrittenFunctions(placeableType: any)` | 30 | ✍ Surcharge getNeedHourChanged et finalizeConstruction (ce dernier sans corps dans le dump du SDK : NON VÉRIFIÉ). |
| `PlaceableIncomePerHour.registerEventListeners(placeableType: any)` | 37 | ✍ Abonne la spécialisation aux événements de chargement et de changement d'heure. |
| `PlaceableIncomePerHour.registerXMLPaths(schema: any, basePath: any)` | 44 | ✍ Déclare incomePerHour comme valeur simple et par entrée de configuration. |
| `PlaceableIncomePerHour.initSpecialization()` | 54 | ✍ Enregistre le type de caractéristique de boutique incomePerHour (chargeur, accesseur, espèce placeable) et le type de configuration incomePerHour auprès du gestionnaire de configurations de placeables. |
| `PlaceableIncomePerHour:onLoad(savegame: table)` | 62 | ✍ Lit le revenu de la configuration choisie (la première par défaut), avec repli sur la valeur de base puis 0. Le placeable est considéré fini sauf s'il possède des états constructibles (getNumFinishedConstructibleStates). |
| `PlaceableIncomePerHour:getNeedHourChanged(superFunc: any)` | 85 | ✍ Renvoie toujours true pour que le placeable reçoive les événements de changement d'heure. |
| `PlaceableIncomePerHour:onHourChanged()` | 91 | ✍ Serveur uniquement. Ignore les placeables sans propriétaire ou inachevés ; sinon ajoute getIncomePerHour multiplié par l'ajustement de temps de l'environnement à la ferme propriétaire, en revenu PROPERTY_INCOME. |
| `PlaceableIncomePerHour:getIncomePerHour()` | 116 | ✍ Renvoie le revenu horaire (avant le facteur d'ajustement du temps). |
| `PlaceableIncomePerHour.loadSpecValueIncomePerHour(xmlFile: XMLFile, customEnvironment: string, baseDir: any) → table` | 126 | ✍ Chargeur de caractéristique de boutique : renvoie un revenu fixe (première configuration ou valeur de base) et un revenu variable cumulant éolienne et première configuration de panneaux solaires, ou nil si tout est nul. |
| `PlaceableIncomePerHour.getSpecValueIncomePerHour(storeItem: table, realItem: table) → integer` | 145 | ✍ Formate le texte de boutique par mois (24 fois la valeur horaire) : un montant, ou une plage du revenu fixe au fixe plus variable s'il y a une part variable. Renvoie nil sans caractéristique stockée. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `getIncomePerHour` | 25 |
| registerOverwrittenFunction | `getNeedHourChanged` | 31 |
| registerOverwrittenFunction | `finalizeConstruction` | 32 |
| registerEventListener | `onLoad` | 38 |
| registerEventListener | `onHourChanged` | 39 |

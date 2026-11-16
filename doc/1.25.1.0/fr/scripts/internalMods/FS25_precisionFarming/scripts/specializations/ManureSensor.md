# internalMods/FS25_precisionFarming/scripts/specializations/ManureSensor.lua

*[English version](../../../../../../scripts/internalMods/FS25_precisionFarming/scripts/specializations/ManureSensor.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/specializations/ManureSensor.lua` — FS25 1.25.1.0

✍ Spécialisation de véhicule de Precision Farming pour les capteurs de lisier sur épandeurs/pulvérisateurs (exige Sprayer et PrecisionFarmingStatistic). Elle enregistre une configuration 'manureSensor', fixe un modèle de capteur et surcharge les fonctions de décalage d'azote : avec capteur la dose est exacte, sans capteur elle dérive dans le temps.

- **ManureSensor** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ManureSensor.prerequisitesPresent(specializations: table) → boolean` | 23 | ✍ Vrai uniquement si le véhicule possède les spécialisations Sprayer et PrecisionFarmingStatistic. |
| `ManureSensor.initSpecialization()` | 29 | ✍ Enregistre le type de configuration 'manureSensor' et les clés XML linkNode#node et linkNode#type (DEFAULT, LARGE, SMALL ou STANDALONE) dans le schéma du véhicule. |
| `ManureSensor:onLoad(savegame: any)` | 59 | ✍ Initialise un décalage de courbe aléatoire et vérifie si une unité de remplissage accepte lisier ou digestat (capteur requis). Fixe le capteur de la configuration choisie et, pour les configs supérieures à 1, utilise les données de liaison de g_precisionFarming selon le fichier de config. |
| `ManureSensor:linkManureSensor(linkData: any)` | 100 | ✍ Clone un noeud de capteur du type donné pour chaque noeud de liaison (trouvé par noeud ou nom de mapping i3d), le lie, applique translation, rotation et échelle optionnelles, puis marque le capteur comme disponible. |
| `ManureSensor:getManureSensorNitrogenOffset(lastChangeLevels: any)` | 134 | ✍ Calcule un décalage d'azote variable dans le temps à partir de trois sinusoïdes sommées sur g_time, mis à l'échelle par lastChangeLevels et MAX_NITROGEN_OFFSET_PCT, arrondi en pas entiers avec le signe conservé. Simule la teneur incertaine du lisier en azote. |
| `ManureSensor:getCurrentNitrogenLevelOffset(superFunc: any, lastChangeLevels: any)` | 146 | ✍ Surcharge. Sans capteur requis, appelle le parent. Si un capteur est requis mais absent, renvoie le décalage fluctuant ; avec capteur, renvoie 0. |
| `ManureSensor:getCurrentNitrogenUsageLevelOffset(superFunc: any, lastChangeLevels: any)` | 162 | ✍ Surcharge. Sans capteur requis, appelle le parent. Avec capteur, renvoie le décalage fluctuant, sans capteur 0 (l'inverse du décalage de niveau ci-dessus). |
| `ManureSensor:getIsUsingExactNitrogenAmount(superFunc: any)` | 178 | ✍ Surcharge. Renvoie la valeur du parent si aucun capteur n'est requis, sinon si un capteur est disponible. |

# internalMods/FS25_precisionFarming/scripts/specializations/WeedSpotSpray.lua

*[English version](../../../../../../scripts/internalMods/FS25_precisionFarming/scripts/specializations/WeedSpotSpray.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/specializations/WeedSpotSpray.lua` — FS25 1.25.1.0

✍ Spécialisation de véhicule de Precision Farming pour la pulvérisation ciblée d'herbicide et d'engrais liquide (exige Sprayer et PrecisionFarmingStatistic). Elle ajoute une configuration 'weedSpotSpray', monte des modèles de capteurs de mauvaises herbes et surcharge l'état des effets de buses pour que chaque buse ne pulvérise que si les cartes de densité sous elle l'exigent. Elle transmet aussi l'usage d'herbicide aux statistiques de parcelle.

- **WeedSpotSpray** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `WeedSpotSpray.prerequisitesPresent(specializations: table) → boolean` | 22 | ✍ Vrai uniquement si le véhicule possède les spécialisations Sprayer et PrecisionFarmingStatistic. |
| `WeedSpotSpray.initSpecialization()` | 28 | ✍ Enregistre le type de configuration de véhicule 'weedSpotSpray' avec son nom localisé. |
| `WeedSpotSpray.registerFunctions(vehicleType: any)` | 34 | ✍ Ajoute les fonctions de véhicule getIsSpotSprayEnabled et addWeedSpotSpraySensorNodes. |
| `WeedSpotSpray.registerOverwrittenFunctions(vehicleType: any)` | 41 | ✍ Surcharge getSprayerUsage, addExtendedSprayerNozzleEffect, updateExtendedSprayerNozzleEffectState et loadWorkAreaFromXML. Les fonctions de buses viennent d'ExtendedSprayerEffects (absent de ce fichier). |
| `WeedSpotSpray.registerEventListeners(vehicleType: any)` | 50 | ✍ S'abonne à onPreLoad, onLoad et onEndWorkAreaProcessing. |
| `WeedSpotSpray:onPreLoad(savegame: any)` | 58 | ✍ Définit isEnabled à vrai quand l'indice de configuration 'weedSpotSpray' choisi est supérieur à 1. |
| `WeedSpotSpray:onLoad(savegame: any)` | 66 | ✍ Construit l'ensemble des états de mauvaises herbes traitables par herbicide (via les remplacements de weedSystem, hors préventifs), charge les noeuds de capteurs depuis g_precisionFarming si activé et met en cache les cartes de densité mauvaises herbes, type de sol et type de pulvérisation avec leurs canaux. |
| `WeedSpotSpray:onEndWorkAreaProcessing(dt: any)` | 98 | ✍ Serveur uniquement, au-dessus de la vitesse 0,5 : quand de l'herbicide est pulvérisé et qu'un véhicule d'épandage ou l'IA est actif, ajoute l'usage à 'usedHerbicide' et l'usage non réduit à 'usedHerbicideRegular'. |
| `WeedSpotSpray:getIsSpotSprayEnabled()` | 121 | ✍ Renvoie si la configuration de pulvérisation ciblée est activée sur ce véhicule. |
| `WeedSpotSpray:addWeedSpotSpraySensorNodes(linkData: any)` | 127 | ✍ Pour chaque capteur trouvé par nom de mapping i3d, clone un modèle de capteur, le lie avec la translation et la rotation configurées et met à l'échelle l'enfant support si bracketSize diffère de 1. |
| `WeedSpotSpray:getSprayerUsage(superFunc: any, fillType: any, dt: any)` | 153 | ✍ Surcharge. Mémorise l'usage du parent comme usage régulier (plein débit) puis, si des effets de buses existent, multiplie l'usage renvoyé par l'alpha des buses actives pour que seules les buses actives consomment. |
| `WeedSpotSpray:addExtendedSprayerNozzleEffect(superFunc: any, effectData: any, effectNode: any, linkNode: any, linkNodeData: any)` | 169 | ✍ Surcharge qui appelle seulement le parent et renvoie son résultat ; n'ajoute aucun comportement. |
| `WeedSpotSpray:updateExtendedSprayerNozzleEffectState(superFunc: any, effectData: any, dt: any, isTurnedOn: any, lastSpeed: any)` | 179 | ✍ Surcharge. Éteint une buse quand la pulvérisation ciblée est active et que le véhicule recule ou va à moins de 0,25. Pour l'herbicide, lit la carte des mauvaises herbes (activé) ou vérifie l'absence de sol nu (non activé). Pour l'engrais liquide, ignore aussi le sol déjà fertilisé. |
| `WeedSpotSpray:loadWorkAreaFromXML(superFunc: any, workArea: any, xmlFile: any, key: any)` | 241 | ✍ Surcharge. Après le chargement d'une zone de travail par le parent, active disableBackwards quand la pulvérisation ciblée est activée, car les capteurs regardent vers l'avant. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `getIsSpotSprayEnabled` | 35 |
| registerFunction | `addWeedSpotSpraySensorNodes` | 36 |
| registerOverwrittenFunction | `getSprayerUsage` | 42 |
| registerOverwrittenFunction | `addExtendedSprayerNozzleEffect` | 43 |
| registerOverwrittenFunction | `updateExtendedSprayerNozzleEffectState` | 44 |
| registerOverwrittenFunction | `loadWorkAreaFromXML` | 45 |
| registerEventListener | `onPreLoad` | 51 |
| registerEventListener | `onLoad` | 52 |
| registerEventListener | `onEndWorkAreaProcessing` | 53 |

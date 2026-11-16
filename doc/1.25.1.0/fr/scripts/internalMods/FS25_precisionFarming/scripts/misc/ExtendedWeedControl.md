# internalMods/FS25_precisionFarming/scripts/misc/ExtendedWeedControl.lua

*[English version](../../../../../../scripts/internalMods/FS25_precisionFarming/scripts/misc/ExtendedWeedControl.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/misc/ExtendedWeedControl.lua` — FS25 1.25.1.0

✍ Extension de Precision Farming pour la gestion des mauvaises herbes. Elle charge une carte de bruit (shared/weedNoise.grle) servant à garder des zones d'herbes en taches, efface les herbes au semis et surcharge la pulvérisation d'herbicide pour que le traitement localisé ignore les stades préventifs. Elle surcharge FSDensityMapUtil, Sprayer, FieldUpdateTask et FieldState et dépend de weedSystem, dont le code n'est pas dans ce dump.

- **ExtendedWeedControl** (l.15)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ExtendedWeedControl:loadFromXML(_: any, _: any, baseDirectory: any, configFileName: any, mapFilename: any)` | 36 | ✍ Crée et charge la carte de bits du bruit d'herbes et construit un filtre dessus. En cas d'échec, journalise une erreur et renvoie false. À noter : en cas de succès, la fonction ne renvoie rien (nil) et non true. |
| `ExtendedWeedControl:unloadMapData()` | 53 | ✍ Libère les filtres, supprime la carte de bits de bruit et, sur le serveur, retire la commande console pfWeedSetNoiseParameters (son enregistrement n'est pas dans ce fichier). |
| `ExtendedWeedControl:setWeedNoiseParameters(minOctave1: any, numOctave1: any, persistence1: any, minOctave2: any, numOctave2: any, persistence2: any)` | 69 | ✍ Outil de développement : régénère la carte de bruit à partir de deux filtres de bruit de Perlin avec les octaves et persistances données, et enregistre weedNoise.grle dans le dossier du profil utilisateur. Les paramètres manquants gardent leurs valeurs précédentes. |
| `ExtendedWeedControl:clearWeedArea(modifier: any, weedFilter: any)` | 107 | ✍ Met à 0 les pixels de la zone du modificateur qui correspondent à la fois au filtre de bruit et au filtre d'herbes donné. |
| `ExtendedWeedControl:getWeedModifier()` | 113 | ✍ Crée à la demande, puis renvoie, le modificateur de densité des herbes, avec les filtres d'herbes denses et clairsemées. Renvoie nil si la carte n'a pas d'herbes. |
| `ExtendedWeedControl:overwriteGameFunctions(pfModule: any)` | 138 | ✍ Surcharge FSDensityMapUtil.setSowingWeedArea (efface les herbes denses et clairsemées), Sprayer.processSprayerArea (mémorise le traitement localisé), FSDensityMapUtil.updateHerbicideArea (réécrite, sans stades préventifs en traitement localisé), FieldUpdateTask.prepare et FieldState.update (état des herbes échantillonné sur un carré de 20 m). |

# vehicles/specializations/TireTracks.lua

*[English version](../../../../scripts/vehicles/specializations/TireTracks.md)*

Source: `dataS/scripts/vehicles/specializations/TireTracks.lua` — FS25 1.25.1.0

✍ Spécialisation (sans prérequis) qui gère les traces de pneus laissées par les roues. D'autres codes (roues, speed rotating parts) y enregistrent des nodes de trace ; chacun possède une trace dans g_currentMission.tireTrackSystem. À chaque mise à jour, la trace s'allonge avec couleur du sol, profondeur et salissure issues de la physique de roue, ou est coupée si les conditions ne sont plus remplies. L'appel moteur getTyreTracksSegmentsCoeff la conditionne (comportement des classes du système de traces NON VÉRIFIÉ, absentes du dump).

- **TireTracks** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `TireTracks.prerequisitesPresent(specializations: any)` | 17 | ✍ Renvoie toujours true : aucune spécialisation prérequise. |
| `TireTracks.initSpecialization()` | 23 | ✍ Vide : n'enregistre rien. |
| `TireTracks.registerFunctions(vehicleType: any)` | 28 | ✍ Enregistre getAllowTireTracks, addTireTrackNode, removeTireTrackNode et updateTireTrackNode. |
| `TireTracks.registerOverwrittenFunctions(vehicleType: any)` | 37 | ✍ Vide : n'enregistre aucune fonction surchargée. |
| `TireTracks.registerEventListeners(vehicleType: any)` | 42 | ✍ S'abonne à onPreLoad, onDelete et onUpdate. |
| `TireTracks:onPreLoad(savegame: table)` | 51 | ✍ Initialise la liste de nodes de trace, lit le coefficient de segments du moteur et met en cache le système de traces de la mission. |
| `TireTracks:onDelete()` | 63 | ✍ Détruit chaque trace créée par ce véhicule dans le système de traces. |
| `TireTracks:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 77 | ✍ Tant que le véhicule est actif et possède des nodes de trace, met à jour chaque node avec l'état courant d'autorisation des traces. |
| `TireTracks:getAllowTireTracks()` | 91 | ✍ Renvoie true quand le véhicule est plus proche que TireTracks.MAX_CREATION_DISTANCE (non défini dans ce fichier, NON VÉRIFIÉ) et que le coefficient de segments est supérieur à 0. |
| `TireTracks:addTireTrackNode(wheel: any, parent: any, linkNode: any, tireTrackAtlasIndex: any, width: any, radius: any, inverted: any, activeFunc: any)` | 97 | ✍ Enregistre un node de trace pour une roue (parent, link node, index d'atlas, largeur, rayon, indicateur d'inversion, callback d'activité optionnel) et crée sa trace. Renvoie l'index du node, ou nil en cas d'échec. |
| `TireTracks:removeTireTrackNode(tireTrackNodeIndex: any)` | 126 | ✍ Efface le node de trace à l'index donné et met à jour l'indicateur de présence de nodes. À noter : il ne détruit pas la trace dans le système de traces ; cela se fait dans onDelete. |
| `TireTracks:updateTireTrackNode(tireTrackNode: any, allowTireTracks: any)` | 134 | ✍ Coupe la trace si elle est interdite, inactive, sans contact, sur une surface qui l'interdit ou sans salissure ; sinon ajoute un point de trace au contact du pneu avec le sol, avec couleur, salissure, profondeur, direction et type de contact. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `getAllowTireTracks` | 29 |
| registerFunction | `addTireTrackNode` | 30 |
| registerFunction | `removeTireTrackNode` | 31 |
| registerFunction | `updateTireTrackNode` | 32 |
| registerEventListener | `onPreLoad` | 43 |
| registerEventListener | `onDelete` | 44 |
| registerEventListener | `onUpdate` | 45 |

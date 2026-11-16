# vehicles/specializations/JigglingParts.lua

*[English version](../../../../scripts/vehicles/specializations/JigglingParts.md)*

Source: `dataS/scripts/vehicles/specializations/JigglingParts.lua` — FS25 1.25.1.0

✍ Spécialisation de véhicule qui fait vibrer des pièces comme les socs de semoir pendant le travail, en pilotant des paramètres de shader (fréquence et amplitude) sur un nœud. La vitesse de vibration suit la vitesse du véhicule et l'amplitude monte et descend progressivement. Une pièce peut être liée à un nœud de référence au sol pour ne vibrer qu'au contact du sol (nécessite la spécialisation GroundReference).

- **JigglingParts** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `JigglingParts.prerequisitesPresent(specializations: any)` | 16 | ✍ Renvoie toujours true : aucun prérequis envers d'autres spécialisations. |
| `JigglingParts.initSpecialization()` | 22 | ✍ Enregistre le schéma XML d'une pièce vibrante : nœud, échelle de vitesse, noms de paramètres de shader, indices de composantes, échelle d'amplitude et indice du nœud de référence au sol. La constante du chemin de base est définie hors de ce fichier (NON VÉRIFIÉ). |
| `JigglingParts.registerFunctions(vehicleType: any)` | 42 | ✍ Enregistre loadJigglingPartsFromXML, isJigglingPartActive et updateJigglingPart sur le type de véhicule. |
| `JigglingParts.registerEventListeners(vehicleType: any)` | 50 | ✍ Abonne la spécialisation à onLoad et onUpdate. |
| `JigglingParts:onLoad(savegame: any)` | 57 | ✍ Charge toutes les entrées jigglingPart depuis vehicle.jigglingParts. Si aucune n'est valide, retire l'écouteur onUpdate. |
| `JigglingParts:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 83 | ✍ À chaque frame, met à jour les pièces actives avec contact au sol, et laisse les pièces inactives s'atténuer tant que leur amplitude est supérieure à zéro. |
| `JigglingParts:loadJigglingPartsFromXML(jigglingPart: any, xmlFile: any, key: any)` | 96 | ✍ Charge une pièce vibrante (nœud, échelles de vitesse et d'amplitude, noms et composantes des paramètres de shader, indice du nœud de référence) et initialise son état. Renvoie false avec un avertissement si le nœud manque. |
| `JigglingParts:isJigglingPartActive(jigglingPart: any)` | 124 | ✍ Résout au premier appel le nœud de référence au sol lié (avertissement s'il est introuvable) et renvoie false si ce nœud ne touche pas le sol, true sinon. |
| `JigglingParts:updateJigglingPart(jigglingPart: any, dt: any, groundContact: any)` | 152 | ✍ Fait avancer la phase de vibration proportionnellement à la vitesse du véhicule, augmente ou réduit l'amplitude (environ 100 ms), puis écrit les valeurs courante et de la frame précédente dans les paramètres de shader du nœud (la précédente sert aux données de mouvement). |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `loadJigglingPartsFromXML` | 43 |
| registerFunction | `isJigglingPartActive` | 44 |
| registerFunction | `updateJigglingPart` | 45 |
| registerEventListener | `onLoad` | 51 |
| registerEventListener | `onUpdate` | 52 |

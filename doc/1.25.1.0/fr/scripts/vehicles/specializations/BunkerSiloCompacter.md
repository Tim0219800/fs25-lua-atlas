# vehicles/specializations/BunkerSiloCompacter.lua

*[English version](../../../../scripts/vehicles/specializations/BunkerSiloCompacter.md)*

Source: `dataS/scripts/vehicles/specializations/BunkerSiloCompacter.lua` — FS25 1.25.1.0

✍ Spécialisation des véhicules qui tassent le contenu d'un silo-tranchée (rouleaux, tracteurs à roues). Elle lit dans le XML un coefficient de tassement et un indicateur de limite de vitesse et, côté client, joue un son de roulage au contact du sol et un son de tassement quand une roue est en contact de type hauteur de sol (density map). Le tassement lui-même n'est pas fait ici : le coefficient est lu ailleurs. À noter : le code utilise BunkerSiloCompacter.XML_PATH, jamais affecté dans ce fichier (où il est défini : NON VÉRIFIÉ).

- **BunkerSiloCompacter** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `BunkerSiloCompacter.prerequisitesPresent(specializations: any)` | 17 | ✍ Renvoie toujours true : aucune autre spécialisation n'est requise. |
| `BunkerSiloCompacter.initSpecialization()` | 23 | ✍ Enregistre les entrées de schéma XML sous XML_PATH : compactingScale, useSpeedLimit et les échantillons sonores de roulage et de tassement. XML_PATH n'est pas défini dans ce fichier, NON VÉRIFIÉ. |
| `BunkerSiloCompacter.registerFunctions(vehicleType: any)` | 38 | ✍ Enregistre loadBunkerSiloCompactorFromXML et getBunkerSiloCompacterScale sur le type de véhicule. |
| `BunkerSiloCompacter.registerOverwrittenFunctions(vehicleType: any)` | 45 | ✍ Remplace doCheckSpeedLimit sur le type de véhicule. |
| `BunkerSiloCompacter.registerEventListeners(vehicleType: any)` | 51 | ✍ Enregistre onLoad, onUpdate et onDelete. |
| `BunkerSiloCompacter:onLoad(savegame: any)` | 59 | ✍ Charge les réglages du compacteur depuis le XML et, côté client, les échantillons sonores de roulage et de tassement. Retire l'écouteur onUpdate si le véhicule n'a pas de fonction getWheels. |
| `BunkerSiloCompacter:onDelete()` | 79 | ✍ Supprime les échantillons sonores chargés via le gestionnaire de sons. |
| `BunkerSiloCompacter:loadBunkerSiloCompactorFromXML(xmlFile: any, key: any)` | 86 | ✍ Lit compactingScale (1 par défaut) et useSpeedLimit (false par défaut) depuis le fichier et la clé XML donnés et les stocke dans la spécialisation. |
| `BunkerSiloCompacter:getBunkerSiloCompacterScale()` | 94 | ✍ Renvoie le coefficient de tassement lu dans le XML (l'orthographe Compacter est celle de la source). |
| `BunkerSiloCompacter:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 104 | ✍ Parcourt les roues pour détecter un contact avec le sol et un contact GROUND_HEIGHT (considéré comme du tassement). Quand l'un des états change, démarre ou arrête les sons de roulage et de tassement. |
| `BunkerSiloCompacter:doCheckSpeedLimit(superFunc: any) → boolean` | 153 | ✍ Si useSpeedLimit est activé, renvoie le résultat parent ou true pendant le tassement, de sorte que la limite de vitesse s'applique. Sinon renvoie le résultat parent. |
| `BunkerSiloCompacter.getDefaultSpeedLimit() → number` | 165 | ✍ Fonction statique renvoyant la limite de vitesse par défaut, la constante 5 (unité non indiquée dans le code, probablement km/h, NON VÉRIFIÉ). |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `loadBunkerSiloCompactorFromXML` | 39 |
| registerFunction | `getBunkerSiloCompacterScale` | 40 |
| registerOverwrittenFunction | `doCheckSpeedLimit` | 46 |
| registerEventListener | `onLoad` | 52 |
| registerEventListener | `onUpdate` | 53 |
| registerEventListener | `onDelete` | 54 |

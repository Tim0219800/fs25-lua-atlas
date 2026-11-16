# vehicles/specializations/SpeedRotatingParts.lua

*[English version](../../../../scripts/vehicles/specializations/SpeedRotatingParts.md)*

Source: `dataS/scripts/vehicles/specializations/SpeedRotatingParts.lua` — FS25 1.25.1.0

✍ Spécialisation pour les pièces hors roues qui tournent ou défilent selon la vitesse de conduite (courroies, tambours, rabatteurs, rouleaux qui suivent la direction, défilement de texture par paramètres de shader). Chaque `vehicle.speedRotatingParts.speedRotatingPart` tire sa vitesse d'un groupe de roues, d'un nœud de référence de vitesse ou de la vitesse du véhicule, accumule un angle `xDrive` et l'applique à des nœuds, des paramètres de shader et éventuellement des traces de pneus. Les pièces ne sont mises à jour que dans une certaine distance de la caméra, ralentissent progressivement quand elles sont inactives, et les angles « versatile Y » sont envoyés du serveur aux clients. Aucun prérequis ; d'autres spécialisations (ex. RidgeMarker) étendent le chargement et l'activité via les fonctions surchargeables.

- **SpeedRotatingParts** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SpeedRotatingParts.prerequisitesPresent(specializations: table) → boolean` | 20 | ✍ Retourne toujours true : aucune autre spécialisation n'est requise. |
| `SpeedRotatingParts.initSpecialization()` | 26 | ✍ Déclare le vaste schéma XML `speedRotatingPart` : nœuds et nœuds de shader, réglages de défilement shader, références de roues, nœuds de direction, options de direction et de rotation Y, rayon et échelle de roue, activité, temps de ralentissement et vitesse d'activation, options de traces de pneus et distance maximale de mise à jour. |
| `SpeedRotatingParts.registerFunctions(vehicleType: any)` | 79 | ✍ Enregistre `loadSpeedRotatingPartFromXML`, `getIsSpeedRotatingPartActive`, `getSpeedRotatingPartDirection` et `updateSpeedRotatingPart`. |
| `SpeedRotatingParts.registerOverwrittenFunctions(vehicleType: any)` | 88 | ✍ Surcharge `validateWashableNode` pour que les nœuds de pièces rotatives liées à une roue utilisent les données de salissure de la roue. |
| `SpeedRotatingParts.registerEventListeners(vehicleType: any)` | 94 | ✍ S'abonne à onLoad, onReadStream, onWriteStream, onReadUpdateStream, onWriteUpdateStream, onUpdate et onUpdateTick. |
| `SpeedRotatingParts:onLoad(savegame: table)` | 107 | ✍ Charge chaque `speedRotatingPart` (en retirant le nœud de traces de pneus de celles qui échouent), détecte si les pièces ont des distances de mise à jour différentes, alloue le dirty flag, et retire tous les écouteurs réseau et de mise à jour si aucune pièce n'est chargée. |
| `SpeedRotatingParts:onReadStream(streamId: integer, connection: Connection)` | 150 | ✍ Client à la connexion : lit un angle de direction sur 9 bits pour chaque pièce à rotation Y versatile. |
| `SpeedRotatingParts:onWriteStream(streamId: integer, connection: Connection)` | 165 | ✍ Serveur à la connexion : écrit l'angle de direction de chaque pièce à rotation Y versatile, quantifié sur 9 bits pour un tour complet. |
| `SpeedRotatingParts:onReadUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 181 | ✍ Côté client : quand le serveur a signalé une mise à jour, lit l'angle de direction sur 9 bits de chaque pièce versatile. |
| `SpeedRotatingParts:onWriteUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 202 | ✍ Côté serveur : si le dirty flag des pièces est présent, écrit true suivi de l'angle de direction quantifié de chaque pièce versatile ; sinon écrit false. |
| `SpeedRotatingParts:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 222 | ✍ À chaque frame, pour les pièces dans leur distance de mise à jour, appelle `updateSpeedRotatingPart` quand la pièce est active ou encore en rotation résiduelle (sauf si elle s'arrête aussitôt une fois inactive). |
| `SpeedRotatingParts:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 242 | ✍ Met à jour le drapeau `isActive` de chaque pièce à portée avec `getIsSpeedRotatingPartActive`. |
| `SpeedRotatingParts:loadSpeedRotatingPartFromXML(speedRotatingPart: table, xmlFile: XMLFile, key: string) → boolean` | 261 | ✍ Charge une pièce (nœuds de représentation/shader, type de paramètre shader, nœud d'entraînement, roues, traces de pneus, direction, options de direction, échelle de roue, ralentissement, distance de mise à jour). Retourne false avec un avertissement si le nœud est invalide, si les roues manquent, si la roue des traces manque, si la config versatile est incorrecte ou si le nœud de référence de vitesse est le nœud d'entraînement. Les roues utilisées voient leur synchronisation de contact activée. |
| `SpeedRotatingParts:getIsSpeedRotatingPartActive(speedRotatingPart: table) → boolean` | 456 | ✍ Test d'activité par défaut : vrai, sauf faux quand la pièce n'est active qu'à l'état abaissé et que le véhicule est relevé. Surchargé par d'autres spécialisations pour ajouter des conditions. |
| `SpeedRotatingParts:getSpeedRotatingPartDirection(speedRotatingPart: table) → integer` | 472 | ✍ Retourne 1 par défaut : le multiplicateur de sens appliqué à la rotation d'une pièce, prévu pour être surchargé. |
| `SpeedRotatingParts:updateSpeedRotatingPart(speedRotatingPart: any, dt: any, isPartActive: any)` | 478 | ✍ Mise à jour par frame d'une pièce : mesure vitesse (nœud de référence, rotation moyenne des roues en contact, ou vitesse du véhicule) et sens, ou la ralentit si inactive, fait avancer `xDrive`, met à jour la direction versatile (serveur, via dirty flag) ou l'alignement de direction, fait tourner les nœuds et écrit les paramètres de défilement/rotation du shader. À noter : avec `dirRefNode` sans alignDirection elle indexe `wheels[1]`, ce qui échouerait sans roue configurée (NON VÉRIFIÉ en pratique). |
| `SpeedRotatingParts:validateWashableNode(superFunc: any, node: any)` | 677 | ✍ Pour les nœuds appartenant à une pièce rotative liée à des roues et portant le paramètre de shader de salissure, retourne false avec la fonction de mise à jour de salissure de roue et des données de nœud copiées de cette roue (multiplicateurs de salissure, facteur d'humidité, vitesse de changement de couleur, nœud de neige) ; sinon délègue au parent. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `loadSpeedRotatingPartFromXML` | 80 |
| registerFunction | `getIsSpeedRotatingPartActive` | 81 |
| registerFunction | `getSpeedRotatingPartDirection` | 82 |
| registerFunction | `updateSpeedRotatingPart` | 83 |
| registerOverwrittenFunction | `validateWashableNode` | 89 |
| registerEventListener | `onLoad` | 95 |
| registerEventListener | `onReadStream` | 96 |
| registerEventListener | `onWriteStream` | 97 |
| registerEventListener | `onReadUpdateStream` | 98 |
| registerEventListener | `onWriteUpdateStream` | 99 |
| registerEventListener | `onUpdate` | 100 |
| registerEventListener | `onUpdateTick` | 101 |

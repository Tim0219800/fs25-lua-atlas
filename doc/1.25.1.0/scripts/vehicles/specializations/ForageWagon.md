# vehicles/specializations/ForageWagon.lua

Source : `dataS/scripts/vehicles/specializations/ForageWagon.lua` — FS25 1.25.1.0

✍ Spécialisation de la remorque autochargeuse (ramassage d'andains d'herbe/foin/ensilage dans la carte de hauteur, DensityMapHeightUtil). Prérequis : FillUnit, TurnOnVehicle, Pickup, WorkArea. EFFETS (client) : fillEffects (vehicle.forageWagon.fillEffect, flux de matière) et startFillEffect (vehicle.forageWagon.startFillEffect, effet de démarrage de remplissage avec retard et fondu) chargés par g_effectManager:loadEffect ; classes d'effets absentes du dump : rendu NON VÉRIFIÉ. DÉCLENCHEMENT : le serveur arme spec.fillTimer = 500 ms dès qu'un ramassage de litres a eu lieu dans la passe (onEndWorkAreaProcessing) ; onUpdateTick décompte ce temps avec dt et isFilling reste vrai tant qu'il est positif ; tout changement d'isFilling lève dirtyFlag et appelle setFillEffectActive. Le client reçoit isFilling et le type de remplissage (FillTypeManager.SEND_NUM_BITS bits) par les flux initial et de mise à jour et appelle lui-même setFillEffectActive. L'effet reçoit comme type spec.lastFillType (le dernier type de matière ramassée), pas de stade de croissance, pas de largeur ; la densité du startFillEffect est modulée par le niveau de remplissage (onFillUnitFillLevelChanged : 1 - niveau/fillStartFadeOff). CONDITIONS : zone active si l'outil est allumé et si Pickup autorise le ramassage (allowPickingUp, spécialisation Pickup non relue : le critère abaissé/contact sol y est donc NON VÉRIFIÉ ici). Les autres sources montrent seulement doCheckSpeedLimit lié à allumé ET abaissé. RAMASSAGE : processForageWagonArea tire, sur la ligne de la zone (rayon 0.5), les litres de chaque type supporté (tipToGroundAroundLine avec -infini = aspiration), mémorise le premier type trouvé (forcedFillType), traite les andains herbe/foin humide-sec comme interchangeables, applique côté serveur les additifs (+5 % pondéré du niveau d'additif disponible) et cumule les litres ; workArea.pickupParticlesActive est posé selon pickupLiters > 0 (champ lu probablement par Pickup : NON VÉRIFIÉ). La surface retournée = largeur de ligne * lastMovedDistance, seulement en marche avant. Ce script ne lit aucune donnée météo ni humidité, et ne modifie pas de carte de densité terrain autre que la hauteur (pas de carte de culture). Remarque : processForageWagonArea n'a pas de garde de distance client (contrairement aux outils de sol), mais seul le serveur remplit le véhicule. dt : fillTimer en ms de temps de jeu. POINTS D'EXTENSION : fonctions processForageWagonArea, setFillEffectActive, fillForageWagon ; surcharges loadSpeedRotatingPartFromXML, getIsSpeedRotatingPartActive, getFillVolumeUVScrollSpeed, getIsWorkAreaActive, doCheckSpeedLimit, getConsumingLoad ; événements de flux, onUpdateTick, onStart/EndWorkAreaProcessing, onTurnedOff, onDeactivate, onFillUnitFillLevelChanged. Vitesse limite par défaut : 20.

- **ForageWagon** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ForageWagon.initSpecialization()` | 15 | ✍ Déclare le type de zone forageWagon et le schéma XML : indices de zone/unité/load info, additifs (unité, usage, types), défilement UV du volume, maxPickupLitersPerSecond, fillEffect et startFillEffect. Non relu clé par clé. |
| `ForageWagon.prerequisitesPresent(specializations: any)` | 46 | ✍ Exige FillUnit, TurnOnVehicle, Pickup et WorkArea. |
| `ForageWagon.registerFunctions(vehicleType: any)` | 55 | ✍ Enregistre processForageWagonArea, setFillEffectActive et fillForageWagon. |
| `ForageWagon.registerOverwrittenFunctions(vehicleType: any)` | 63 | ✍ Surcharge loadSpeedRotatingPartFromXML, getIsSpeedRotatingPartActive, getFillVolumeUVScrollSpeed, getIsWorkAreaActive, doCheckSpeedLimit et getConsumingLoad. |
| `ForageWagon.registerEventListeners(vehicleType: any)` | 74 | ✍ S'abonne aux événements de flux, à onLoad, onDelete, onUpdateTick, onStart/EndWorkAreaProcessing, onTurnedOff, onDeactivate et onFillUnitFillLevelChanged (liste exacte non relue). |
| `ForageWagon:onLoad(savegame: any)` | 92 | ✍ Initialise l'état de remplissage, lit indices de zone/unité/charge, additifs (usage par défaut 0.0000275 par litre, type GRASS_WINDROW), vitesses de défilement UV, débit maximal (500 l/s), charge les effets (client) et un tampon de litres sur 750 ms ; retire l'écouteur onFillUnitFillLevelChanged s'il n'y a pas de startFillEffect. |
| `ForageWagon:onDelete()` | 145 | ✍ Libère les deux groupes d'effets. |
| `ForageWagon:onReadStream(streamId: any, connection: any)` | 153 | ✍ Lit isFilling et le type de remplissage à la connexion et applique setFillEffectActive. |
| `ForageWagon:onWriteStream(streamId: any, connection: any)` | 162 | ✍ Écrit isFillingSent et lastFillType. |
| `ForageWagon:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 170 | ✍ Côté client : si le drapeau est levé, lit isFilling et le type, applique setFillEffectActive. |
| `ForageWagon:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 183 | ✍ Côté serveur : écrit isFillingSent et lastFillType quand dirtyFlag est levé. |
| `ForageWagon:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 195 | ✍ Serveur : décompte fillTimer (dt), déduit isFilling, diffuse le changement et déclenche setFillEffectActive ; alimente le tampon de litres ramassés (charge moteur). |
| `ForageWagon:processForageWagonArea(workArea: any)` | 218 | ✍ Ramasse l'andain sous la ligne de la zone (type forcé si déjà chargé, sinon premier type supporté qui donne des litres), gère l'additif côté serveur, marque pickupParticlesActive et lastPickUpLiters sur la zone, mémorise lastFillType (avec drapeau réseau) et calcule la surface en marche avant. |
| `ForageWagon:setFillEffectActive(isActive: any)` | 299 | ✍ Applique le type de remplissage courant aux deux groupes d'effets puis les démarre ou arrête. Point d'entrée unique des effets visuels ; appelé sur serveur et client. |
| `ForageWagon:fillForageWagon()` | 314 | ✍ Serveur : verse dans l'unité de remplissage les litres accumulés ; si tout ne rentre pas, éteint l'outil et relève le ramasseur. |
| `ForageWagon:loadSpeedRotatingPartFromXML(superFunc: any, speedRotatingPart: any, xmlFile: any, key: any)` | 333 | ✍ Lit l'option rotateOnlyIfFillLevelIncreased d'une pièce tournante. |
| `ForageWagon:getIsSpeedRotatingPartActive(superFunc: any, speedRotatingPart: any)` | 345 | ✍ Fait tourner une pièce marquée rotateOnlyIfFillLevelIncreased seulement tant que isFilling. |
| `ForageWagon:getFillVolumeUVScrollSpeed(superFunc: any, fillVolumeIndex: any)` | 359 | ✍ Vitesse de défilement UV du volume : valeur de chargement si isFilling, valeur de déchargement si déchargement en cours, sinon parent. |
| `ForageWagon:getIsWorkAreaActive(superFunc: any, workArea: any)` | 375 | ✍ Pour la zone de ramassage : inactive si l'outil n'est pas allumé ou si allowPickingUp est faux. |
| `ForageWagon:doCheckSpeedLimit(superFunc: any)` | 390 | ✍ Applique la limite de vitesse si l'outil est allumé et abaissé. |
| `ForageWagon:getConsumingLoad(superFunc: any)` | 396 | ✍ Ajoute la charge de ramassage (litres sur 1 s / débit maximal) à la charge consommée. |
| `ForageWagon:onStartWorkAreaProcessing(dt: any)` | 407 | ✍ Avant la passe : force le type chargé s'il y a plus que le seuil de changement de type, arme éventuellement le délai de l'effet de démarrage et remet lastPickupLiters à zéro. |
| `ForageWagon:onEndWorkAreaProcessing(dt: any, hasProcessed: any)` | 425 | ✍ Serveur : si des litres ont été ramassés, laisse l'effet de démarrage s'écouler (retard), appelle fillForageWagon et arme fillTimer = 500 ms. |
| `ForageWagon:onTurnedOff()` | 449 | ✍ Client : remet fillTimer à zéro et coupe les effets. |
| `ForageWagon:onDeactivate()` | 460 | ✍ Client : remet fillTimer à zéro et coupe les effets. |
| `ForageWagon:onFillUnitFillLevelChanged(fillUnitIndex: any, fillLevelDelta: any, fillTypeIndex: any, toolType: any, fillPositionData: any, appliedDelta: any)` | 470 | ✍ Client : règle la densité du startFillEffect selon le niveau de remplissage (fondu). |
| `ForageWagon.getDefaultSpeedLimit()` | 483 | ✍ Limite de vitesse par défaut : 20. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `processForageWagonArea` | 56 |
| registerFunction | `setFillEffectActive` | 57 |
| registerFunction | `fillForageWagon` | 58 |
| registerOverwrittenFunction | `loadSpeedRotatingPartFromXML` | 64 |
| registerOverwrittenFunction | `getIsWorkAreaActive` | 65 |
| registerOverwrittenFunction | `doCheckSpeedLimit` | 66 |
| registerOverwrittenFunction | `getConsumingLoad` | 67 |
| registerOverwrittenFunction | `getIsSpeedRotatingPartActive` | 68 |
| registerOverwrittenFunction | `getFillVolumeUVScrollSpeed` | 69 |
| registerEventListener | `onLoad` | 75 |
| registerEventListener | `onDelete` | 76 |
| registerEventListener | `onReadStream` | 77 |
| registerEventListener | `onWriteStream` | 78 |
| registerEventListener | `onReadUpdateStream` | 79 |
| registerEventListener | `onWriteUpdateStream` | 80 |
| registerEventListener | `onUpdateTick` | 81 |
| registerEventListener | `onStartWorkAreaProcessing` | 82 |
| registerEventListener | `onEndWorkAreaProcessing` | 83 |
| registerEventListener | `onTurnedOff` | 84 |
| registerEventListener | `onDeactivate` | 85 |
| registerEventListener | `onFillUnitFillLevelChanged` | 86 |

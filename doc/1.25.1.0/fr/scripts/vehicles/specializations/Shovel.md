# vehicles/specializations/Shovel.lua

*[English version](../../../../scripts/vehicles/specializations/Shovel.md)*

Source: `dataS/scripts/vehicles/specializations/Shovel.lua` — FS25 1.25.1.0

✍ Spécialisation pour les godets et pelles qui ramassent de la matière en vrac (types de remplissage de la height map) au sol dans une unité de remplissage et la déversent en s'inclinant. Elle exige FillUnit, FillVolume, Dischargeable et BunkerSiloInteractor. Le ramassage s'exécute côté serveur dans onUpdateTick sur une ou plusieurs entrées `vehicle.shovel.shovelNode` ; le type en cours de chargement est synchronisé aux clients par le flux de mise à jour pour jouer l'effet de remplissage. La décharge dépend de l'angle d'inclinaison d'un nœud `dischargeInfo` plutôt que de la bascule habituelle.

- **Shovel** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Shovel.prerequisitesPresent(specializations: any)` | 17 | ✍ Retourne vrai uniquement si le type de véhicule possède FillUnit, FillVolume, Dischargeable et BunkerSiloInteractor. |
| `Shovel.initSpecialization()` | 23 | ✍ Déclare le schéma XML : options globales (`ignoreFillUnitFillType`, `useSpeedLimit`), attributs de shovelNode (nœud, unité de remplissage, load info, largeur, longueur, décalages, conditions de mouvement et d'angle, litres par seconde, lissage), nœud et angles de `dischargeInfo`, et effets de remplissage. |
| `Shovel.registerFunctions(vehicleType: any)` | 61 | ✍ Enregistre `loadShovelNode`, `getShovelNodeIsActive`, `getCanShovelAtPosition`, `getShovelTipFactor` et `getIsShovelEffectState`. |
| `Shovel.registerOverwrittenFunctions(vehicleType: any)` | 71 | ✍ Surcharge les points d'entrée de décharge (`getIsDischargeNodeActive`, `getDischargeNodeEmptyFactor`, `handleDischarge`, `handleDischargeOnEmpty`, `handleDischargeRaycast`, `getCanToggleDischargeToObject`, `getCanToggleDischargeToGround`) ainsi que `getWearMultiplier` et `doCheckSpeedLimit`. |
| `Shovel.registerEventListeners(vehicleType: any)` | 85 | ✍ S'abonne à onLoad, onReadStream, onWriteStream, onReadUpdateStream, onWriteUpdateStream, onDelete, onUpdateTick et onFillUnitFillLevelChanged. |
| `Shovel:onLoad(savegame: any)` | 98 | ✍ Lit les options globales, chaque `shovelNode`, le `dischargeInfo` (nœud et angles de vitesse min/max, obligatoires si le nœud est défini) et les effets côté client, et alloue le dirty flag. Retire les écouteurs réseau et de tick si aucun shovelNode n'est chargé. À noter : retourne false si les angles manquent, avant l'initialisation des effets et du dirty flag. |
| `Shovel:onDelete()` | 166 | ✍ Supprime les effets de remplissage. |
| `Shovel:onReadStream(streamId: any, connection: any)` | 173 | ✍ Client à la connexion : lit dans le flux le type de remplissage en cours de chargement. |
| `Shovel:onWriteStream(streamId: any, connection: any)` | 180 | ✍ Serveur à la connexion : écrit dans le flux le type de remplissage en cours de chargement. |
| `Shovel:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 187 | ✍ Côté client : lorsque le serveur a signalé un changement, lit le nouveau type de remplissage en cours de chargement. |
| `Shovel:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 199 | ✍ Côté serveur : si le dirty flag d'effet est présent dans le masque, écrit true puis le type de remplissage en cours ; sinon écrit false. |
| `Shovel:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 211 | ✍ Serveur : pour chaque shovelNode actif, ramasse la matière le long de la ligne du nœud depuis la height map vers l'unité de remplissage (limité par la capacité libre, les litres par seconde et l'accès aux terres), peut augmenter temporairement la capacité, prévient le silo bunker, remet à zéro le niveau des nœuds inactifs avec `resetFillLevel` et lisse le sol en marche arrière. Suit le type en cours de chargement avec un maintien de 500 ms et lève le dirty flag lors d'un changement. Client : démarre ou arrête les effets de remplissage. |
| `Shovel:onFillUnitFillLevelChanged(fillUnitIndex: any, fillLevelDelta: any, fillTypeIndex: any, toolType: any, fillPositionData: any, appliedDelta: any)` | 318 | ✍ Serveur : une fois que le niveau retombe à la capacité par défaut, rétablit la capacité par défaut d'une unité de remplissage dont le godet avait augmenté la capacité. |
| `Shovel:loadShovelNode(xmlFile: any, key: any, shovelNode: any)` | 338 | ✍ Lit un shovelNode (nœud, unité de remplissage, load info, taille, décalages, mouvement, litres par seconde convertis en par milliseconde, angle de ramassage max, besoin d'un porteur, options de remise à zéro et d'ignorance, lissage). Retourne false avec un avertissement XML si le nœud manque. |
| `Shovel:getShovelNodeIsActive(shovelNode: any)` | 374 | ✍ Retourne si le nœud peut ramasser maintenant : avance selon son z local (si le mouvement est requis, en mettant à jour sa dernière position), angle de ramassage sous le maximum, et véhicule porteur présent si nécessaire. |
| `Shovel:getIsDischargeNodeActive(superFunc: any, dischargeNode: any)` | 406 | ✍ Pour le nœud de décharge lié au discharge info du godet, retourne false tant que le facteur de bascule vaut 0 ; sinon délègue au parent. |
| `Shovel:getDischargeNodeEmptyFactor(superFunc: any, dischargeNode: any)` | 423 | ✍ Multiplie le facteur de vidage du parent par le facteur de bascule pour le nœud de décharge du godet : plus on bascule, plus la vidange est rapide. |
| `Shovel:handleDischarge(superFunc: any, dischargeNode: any, dischargedLiters: any, minDropReached: any, hasMinDropFillLevel: any)` | 440 | ✍ Ignore le traitement parent pour le nœud de décharge propre au godet quand un nœud de discharge info existe ; les autres nœuds passent par le parent. |
| `Shovel:handleDischargeOnEmpty(superFunc: any, dischargedLiters: any, minDropReached: any, hasMinDropFillLevel: any)` | 450 | ✍ Ignore entièrement le traitement parent quand un nœud de discharge info est défini. |
| `Shovel:handleDischargeRaycast(superFunc: any, dischargeNode: any, hitObject: any, hitShape: any, hitDistance: any, hitFillUnitIndex: any, hitTerrain: any)` | 458 | ✍ Pour le nœud de décharge du godet : passe l'état de décharge à OBJECT si le raycast touche un objet qui accepte le type et a de la place, sinon retour à OFF ; sans objet, passe à GROUND si le godet est incliné, rempli, autorisé au sol, sur terrain possédé et position valide, sinon affiche des avertissements au joueur actif. Les autres nœuds passent par le parent. |
| `Shovel:getCanToggleDischargeToObject(superFunc: any)` | 499 | ✍ Retourne false quand un nœud de discharge info existe (l'inclinaison commande la décharge) ; sinon délègue au parent. |
| `Shovel:getCanToggleDischargeToGround(superFunc: any)` | 509 | ✍ Retourne false quand un nœud de discharge info existe ; sinon délègue au parent. |
| `Shovel:getShovelTipFactor()` | 519 | ✍ Retourne 0 à 1 d'après l'angle entre l'axe z du nœud de discharge info et la verticale du monde, interpolé entre `minSpeedAngle` et `maxSpeedAngle` (radians) ; retourne 0 sous le minimum ou sans nœud. |
| `Shovel:getIsShovelEffectState() → boolean` | 537 | ✍ Retourne si un type de remplissage est en cours de chargement, ainsi que ce type (FillType.UNKNOWN sinon). |
| `Shovel:getWearMultiplier(superFunc: any) → number` | 545 | ✍ Ajoute le multiplicateur d'usure de travail à la valeur du parent pendant le chargement de matière. |
| `Shovel:doCheckSpeedLimit(superFunc: any) → boolean` | 559 | ✍ Retourne true si le parent le fait, ou si `useSpeedLimit` est actif et que le véhicule est allumé (ou ne peut pas l'être). |
| `Shovel:getCanShovelAtPosition(shovelNode: any)` | 565 | ✍ Retourne si le nœud peut ramasser à sa position : toujours vrai si l'état de la parcelle est ignoré ou si la ligne est en zone d'accès libre, sinon les deux extrémités de la largeur doivent être sur des terres accessibles à la ferme active. Retourne false pour un nœud nil. |
| `Shovel:updateDebugValues(values: any)` | 593 | ✍ Aide de débogage : ajoute à la table fournie l'angle du nœud de décharge, les angles de vitesse min et max (en degrés) et le facteur de bascule résultant (ou un texte hors plage). |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `loadShovelNode` | 62 |
| registerFunction | `getShovelNodeIsActive` | 63 |
| registerFunction | `getCanShovelAtPosition` | 64 |
| registerFunction | `getShovelTipFactor` | 65 |
| registerFunction | `getIsShovelEffectState` | 66 |
| registerOverwrittenFunction | `getIsDischargeNodeActive` | 72 |
| registerOverwrittenFunction | `getDischargeNodeEmptyFactor` | 73 |
| registerOverwrittenFunction | `handleDischarge` | 74 |
| registerOverwrittenFunction | `handleDischargeOnEmpty` | 75 |
| registerOverwrittenFunction | `handleDischargeRaycast` | 76 |
| registerOverwrittenFunction | `getCanToggleDischargeToObject` | 77 |
| registerOverwrittenFunction | `getCanToggleDischargeToGround` | 78 |
| registerOverwrittenFunction | `getWearMultiplier` | 79 |
| registerOverwrittenFunction | `doCheckSpeedLimit` | 80 |
| registerEventListener | `onLoad` | 86 |
| registerEventListener | `onReadStream` | 87 |
| registerEventListener | `onWriteStream` | 88 |
| registerEventListener | `onReadUpdateStream` | 89 |
| registerEventListener | `onWriteUpdateStream` | 90 |
| registerEventListener | `onDelete` | 91 |
| registerEventListener | `onUpdateTick` | 92 |
| registerEventListener | `onFillUnitFillLevelChanged` | 93 |

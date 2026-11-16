# vehicles/specializations/MixerWagon.lua

*[English version](../../../../scripts/vehicles/specializations/MixerWagon.md)*

Source: `dataS/scripts/vehicles/specializations/MixerWagon.lua` — FS25 1.25.1.0

✍ Spécialisation des mélangeuses (désileuses-mélangeuses) qui absorbent des balles (et du chargement à la pelle) pour fabriquer du fourrage. Elle exige les spécialisations Trailer et TurnOnVehicle. Avec une recette définie en XML, elle suit un niveau par ingrédient et décide si le mélange est FORAGE ou FORAGE_MIXING ; le serveur ramasse les balles via des triggers et le client joue animations et effets.

- **MixerWagon** (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `MixerWagon.prerequisitesPresent(specializations: table) → boolean` | 22 | ✍ Retourne true seulement si le type de véhicule possède aussi les spécialisations Trailer et TurnOnVehicle. |
| `MixerWagon.initSpecialization()` | 28 | ✍ Enregistre dans le schéma XML les chemins sous vehicle.mixerWagon (nœuds d'animation, triggers de balles, mixingTime, fillUnitIndex, recipe, effet de remplissage) et le niveau sauvegardé par type de remplissage. |
| `MixerWagon.registerFunctions(vehicleType: any)` | 54 | ✍ Ajoute au type de véhicule le callback du trigger de balles et le callback de suppression de balle. |
| `MixerWagon.registerOverwrittenFunctions(vehicleType: any)` | 61 | ✍ Surcharge la gestion du niveau de remplissage, l'acceptation des types, le type déchargé, le chargement automatique de balles, la consommation de prise de force, la charge et l'état de la prise de force. |
| `MixerWagon.registerEventListeners(vehicleType: any)` | 73 | ✍ S'abonne aux événements de chargement, post-chargement, suppression, lecture/écriture de flux, mise à jour, affichage, mise en marche/arrêt et changement de niveau de remplissage. |
| `MixerWagon:onLoad(savegame: table)` | 91 | ✍ Lit le XML : charge animations et effet de remplissage côté client, triggers de balles côté serveur, durée de mélange, unité de remplissage et ingrédients de la recette du système de nourriture animale. Avec une recette, désactive la sauvegarde et la synchro propres à l'unité de remplissage et crée l'extension HUD. |
| `MixerWagon:onPostLoad(savegame: table)` | 191 | ✍ Restaure depuis la sauvegarde les niveaux par ingrédient et émet un avertissement développeur s'il n'y a pas de hudInfoTrigger. |
| `MixerWagon:onDelete()` | 211 | ✍ Retire les triggers de balles et les écouteurs de suppression, supprime animations et effets, et retire puis supprime l'extension HUD. |
| `MixerWagon:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 239 | ✍ Écrit dans la sauvegarde le niveau de chaque ingrédient de la recette. |
| `MixerWagon:onReadStream(streamId: integer, connection: Connection)` | 252 | ✍ Côté client, à la connexion : lit le niveau de chaque ingrédient et l'ajoute à l'unité de remplissage, puis lit le type de remplissage de l'effet. |
| `MixerWagon:onWriteStream(streamId: integer, connection: Connection)` | 268 | ✍ Côté serveur, à la connexion : écrit le niveau de chaque ingrédient et le type de remplissage de l'effet. |
| `MixerWagon:onReadUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 282 | ✍ Client uniquement : applique les écarts de niveau par ingrédient reçus du serveur et met à jour le type de remplissage de l'effet si signalé. |
| `MixerWagon:onWriteUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 306 | ✍ Serveur uniquement : envoie les niveaux par ingrédient si le drapeau dirty est levé, et le type de remplissage de l'effet si le drapeau d'effet est levé. |
| `MixerWagon:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 326 | ✍ Gère les animations de mélange tant que la machine est alimentée et active, décrémente le minuteur, et côté serveur vide les balles des triggers dans l'unité à pickupSpeed. Choisit aussi le type d'effet ; le client démarre ou arrête l'effet. |
| `MixerWagon:mixerWagonBaleTriggerCallback(triggerId: integer, otherActorId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean, otherShapeId: integer)` | 413 | ✍ Callback de trigger : suit les balles acceptées qui entrent ou sortent d'un trigger (avec écouteur de suppression). Si le type de balle est refusé, diffuse à la ferme un événement de balle non acceptée. |
| `MixerWagon:onMixerWagonBaleDeleted(bale: any)` | 451 | ✍ Retire une balle supprimée des tables de suivi de tous les triggers de balles. |
| `MixerWagon:addFillUnitFillLevel(superFunc: any, farmId: any, fillUnitIndex: any, fillLevelDelta: any, fillTypeIndex: any, toolType: any, fillPositionData: any)` | 461 | ✍ Surcharge le remplissage de l'unité du mélangeur. Avec une recette, suit les niveaux par ingrédient, répartit le fourrage rendu selon les ratios, réduit proportionnellement à la décharge, puis fixe le type : ingrédient seul, FORAGE (ratios dans les min/max) ou FORAGE_MIXING. Les autres unités passent par le parent. |
| `MixerWagon:getFillUnitAllowsFillType(superFunc: any, fillUnitIndex: any, fillTypeIndex: any)` | 574 | ✍ Accepte tout type de remplissage appartenant à un ingrédient de la recette sur l'unité du mélangeur ; sinon délègue au parent. |
| `MixerWagon:getDischargeFillType(superFunc: any, dischargeNode: any)` | 589 | ✍ Pour l'unité du mélangeur, renvoie le type courant avec le ratio 1 ; si le contenu est FORAGE_MIXING, renvoie le premier ingrédient dont le niveau est non nul. |
| `MixerWagon:getIsBaleAutoLoadable(superFunc: any, bale: any)` | 614 | ✍ Autorise le chargement automatique d'une balle seulement si le mélangeur est en marche, qu'aucune balle n'est déjà dans un trigger, que le type correspond au contenu et qu'il reste de la place ; puis délègue au parent. |
| `MixerWagon:getDoConsumePtoPower(superFunc: any) → boolean` | 643 | ✍ Retourne true tant que le minuteur de mélange court, sinon délègue au parent. |
| `MixerWagon:getConsumingLoad(superFunc: any)` | 653 | ✍ Ajoute une entrée de charge au résultat du parent, de valeur 1 tant que le minuteur de mélange court, 0 sinon. |
| `MixerWagon:getIsPowerTakeOffActive(superFunc: any)` | 666 | ✍ Signale la prise de force comme active tant que le minuteur de mélange court, ou si le parent le dit. |
| `MixerWagon:onFillUnitFillLevelChanged(fillUnitIndex: any, fillLevelDelta: any, fillTypeIndex: any, toolType: any, fillPositionData: any, appliedDelta: any)` | 672 | ✍ Quand l'unité du mélangeur devient vide, remet à zéro le niveau de chaque ingrédient. |
| `MixerWagon:onTurnedOn()` | 687 | ✍ Client uniquement : démarre les nœuds d'animation de ramassage. |
| `MixerWagon:onTurnedOff()` | 696 | ✍ Client uniquement : arrête les nœuds d'animation de ramassage. |
| `MixerWagon:updateDebugValues(values: any)` | 705 | ✍ Ajoute des lignes de debug : si le contenu est du FORAGE valide et le niveau de chaque ingrédient. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `mixerWagonBaleTriggerCallback` | 55 |
| registerFunction | `onMixerWagonBaleDeleted` | 56 |
| registerOverwrittenFunction | `addFillUnitFillLevel` | 62 |
| registerOverwrittenFunction | `getFillUnitAllowsFillType` | 63 |
| registerOverwrittenFunction | `getDischargeFillType` | 64 |
| registerOverwrittenFunction | `getIsBaleAutoLoadable` | 65 |
| registerOverwrittenFunction | `getDoConsumePtoPower` | 66 |
| registerOverwrittenFunction | `getConsumingLoad` | 67 |
| registerOverwrittenFunction | `getIsPowerTakeOffActive` | 68 |
| registerEventListener | `onLoad` | 74 |
| registerEventListener | `onPostLoad` | 75 |
| registerEventListener | `onDelete` | 76 |
| registerEventListener | `onReadStream` | 77 |
| registerEventListener | `onWriteStream` | 78 |
| registerEventListener | `onReadUpdateStream` | 79 |
| registerEventListener | `onWriteUpdateStream` | 80 |
| registerEventListener | `onUpdate` | 81 |
| registerEventListener | `onDraw` | 82 |
| registerEventListener | `onTurnedOn` | 83 |
| registerEventListener | `onTurnedOff` | 84 |
| registerEventListener | `onFillUnitFillLevelChanged` | 85 |

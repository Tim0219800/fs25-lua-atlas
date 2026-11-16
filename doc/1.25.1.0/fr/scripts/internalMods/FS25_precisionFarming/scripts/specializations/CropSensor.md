# internalMods/FS25_precisionFarming/scripts/specializations/CropSensor.lua

*[English version](../../../../../../scripts/internalMods/FS25_precisionFarming/scripts/specializations/CropSensor.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/specializations/CropSensor.lua` — FS25 1.25.1.0

✍ Spécialisation de véhicule pour le capteur de culture de Precision Farming (nécessite PrecisionFarmingStatistic). Les capteurs sont définis dans le XML du véhicule sous vehicle.cropSensor ou liés depuis CropSensorLinkageData via la configuration cropSensor. Sur le serveur, les capteurs actifs échantillonnent la carte d'azote dans une forme en cercle ou demi-cercle à chaque mise à jour ; l'état est synchronisé par CropSensorStateEvent. La lumière du jour peut être requise, et le rayon peut suivre la largeur de travail des outils ExtendedSprayer attachés.

- **CropSensor** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `CropSensor.prerequisitesPresent(specializations: table) → boolean` | 40 | ✍ Renvoie true si le type de véhicule possède la spécialisation PrecisionFarmingStatistic. |
| `CropSensor.initSpecialization()` | 46 | ✍ Enregistre le type de configuration de véhicule cropSensor et les chemins de schéma XML de vehicle.cropSensor (nœuds de capteur, nœuds de lumière, rayon, besoin de lumière du jour, forme) et des nœuds de liaison de capteurs. |
| `CropSensor:onLoad(savegame: any)` | 97 | ✍ Charge les nœuds de capteur avec leurs formes (CIRCLE, HALF_CIRCLE_LEFT ou HALF_CIRCLE_RIGHT), nœuds de lumière et rayon, puis lit la configuration cropSensor choisie et lie des capteurs clonés depuis le XML ou les données de liaison. Met en cache les cartes de sol, de couverture et d'azote et les statistiques de parcelles depuis g_precisionFarming. |
| `CropSensor:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 216 | ✍ Serveur uniquement : quand le capteur est disponible et actif, appelle updateSensorNode pour chaque nœud de capteur, en ignorant les nœuds dépendant de la lumière du jour tant que le soleil est éteint. |
| `CropSensor:onDraw()` | 232 | ✍ Client uniquement : si le capteur est actif, sans pilotage IA et exige la lumière du jour alors que le soleil est éteint, affiche un avertissement clignotant dans le HUD. |
| `CropSensor:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 252 | ✍ Client uniquement : si des capteurs sont disponibles, enregistre l'action d'entrée PRECISIONFARMING_TOGGLE_CROP_SENSOR (priorité haute) quand le véhicule est actif pour les entrées et définit son texte. |
| `CropSensor:onRootVehicleChanged(rootVehicle: table)` | 269 | ✍ Serveur uniquement : enregistre (ou rattache de nouveau) l'action cropSensorTurnOn du contrôleur d'actions du véhicule racine, sauvegardée, avec des écouteurs IA qui l'activent au début du travail ou de l'outil et la désactivent à leur fin. La retire si le contrôleur d'actions a disparu. |
| `CropSensor.actionEventToggle(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 301 | ✍ Callback d'entrée qui active ou désactive le capteur de culture. |
| `CropSensor.updateActionEventTexts(self: any)` | 307 | ✍ Définit le texte de l'action de bascule sur le libellé d'arrêt ou de mise en marche selon l'état du capteur. |
| `CropSensor.actionControllerToggleEvent(self: any, direction: any)` | 317 | ✍ Callback du contrôleur d'actions : active le capteur si direction vaut 0 ou plus, le désactive sinon. Renvoie true. |
| `CropSensor:doCheckSpeedLimit(superFunc: any) → boolean` | 326 | ✍ Surcharge : indique aussi que la limite de vitesse s'applique quand le véhicule est un capteur autonome actif. |
| `CropSensor:getUseTurnedOnSchema(superFunc: any)` | 333 | ✍ Surcharge : utilise aussi le schéma de mise en marche quand le véhicule est un capteur autonome actif. |
| `CropSensor:setCropSensorActive(state: any, noEventSend: any)` | 340 | ✍ Définit l'état du capteur (bascule si state vaut nil), met à jour les lumières côté client et la largeur de travail à l'activation, rafraîchit les textes d'action et envoie CropSensorStateEvent sauf si noEventSend est défini. |
| `CropSensor:updateCropSensorWorkingWidth()` | 373 | ✍ Recalcule la largeur de travail maximale de l'attelage et met à jour le rayon de chaque nœud de capteur à partir de celle-ci. |
| `CropSensor:updateSensorRadius(sensorNode: any, workingWidth: any)` | 385 | ✍ Règle le rayon du capteur à la moitié de la largeur de travail majorée de 10 %, moins le décalage latéral du capteur, sans descendre sous CropSensor.MIN_SENSOR_RADIUS. Restaure le rayon d'origine si la largeur est de 0 ou moins. |
| `CropSensor:updateSensorNode(sensorNode: any)` | 400 | ✍ Déplace la forme du capteur (cercle ou polygone) à la position et à l'orientation monde du nœud avec son rayon courant, puis demande à la carte d'azote de mettre à jour la zone du capteur de culture pour cette forme. |
| `CropSensor:linkCropSensor(linkData: any)` | 419 | ✍ Pour chaque nœud de liaison, clone le capteur du type correspondant depuis g_precisionFarming, le lie au nœud cible avec les décalages donnés, applique ou calcule automatiquement les nœuds de rotation, et enregistre son nœud de mesure comme nœud de capteur avec une forme de polygone gauche ou droite. |
| `CropSensor.getMaxWorkingWidth(sensorVehicle: any)` | 491 | ✍ Statique : parcourt les véhicules enfants du véhicule racine possédant ExtendedSprayer et renvoie la plus grande largeur trouvée d'après les zones de travail et les marqueurs IA, en tenant aussi compte du décalage latéral par rapport au véhicule du capteur. |

# vehicles/specializations/AIConveyorBelt.lua

*[English version](../../../../scripts/vehicles/specializations/AIConveyorBelt.md)*

Source: `dataS/scripts/vehicles/specializations/AIConveyorBelt.lua` — FS25 1.25.1.0

✍ Spécialisation qui permet de lancer un convoyeur motorisé comme travail IA (AIJobType.CONVEYOR) : le véhicule balaie d'un côté à l'autre autour de son cap de départ, dans un angle configurable. Elle exige AIFieldWorker et Motorized et n'est active que si le XML contient un nœud vehicle.ai.conveyorBelt (minAngle, maxAngle, stepSize, speed, direction). L'angle courant est sauvegardé avec le véhicule et synchronisé par AIConveyorBeltSetAngleEvent.

- **AIConveyorBelt** (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIConveyorBelt.prerequisitesPresent(specializations: table) → boolean` | 19 | ✍ Renvoie vrai uniquement si le type de véhicule possède les spécialisations AIFieldWorker et Motorized. |
| `AIConveyorBelt.initSpecialization()` | 25 | ✍ Déclare les clés XML minAngle (5 par défaut), maxAngle (45), stepSize (5), speed (1) et direction (-1) sous vehicle.ai.conveyorBelt, ainsi que l'attribut de sauvegarde currentAngle. |
| `AIConveyorBelt.registerFunctions(vehicleType: any)` | 43 | ✍ Ajoute setAIConveyorBeltAngle et getDirectionAndSpeedToTargetAngle au type de véhicule. |
| `AIConveyorBelt.registerOverwrittenFunctions(vehicleType: any)` | 50 | ✍ Surcharge les tests de démarrage IA et les accesseurs de travail, getCanBeSelected et getAINeedsTrafficCollisionBox pour les convoyeurs. |
| `AIConveyorBelt.registerEventListeners(vehicleType: any)` | 61 | ✍ Abonne la spécialisation aux rappels de chargement, post-chargement, flux, mise à jour, update-tick, onAIFieldWorkerStart et enregistrement des événements d'action. |
| `AIConveyorBelt:onLoad(savegame: table)` | 75 | ✍ Lit les réglages XML, ne marque le convoyeur comme compatible IA que si le nœud vehicle.ai.conveyorBelt existe, démarre à l'angle maximal et crée le travail de convoyeur via le gestionnaire de types de travaux IA. Retire onUpdate hors serveur et onUpdateTick hors client. |
| `AIConveyorBelt:onPostLoad(savegame: any)` | 105 | ✍ Restaure l'angle courant sauvegardé, sauf si les véhicules sont réinitialisés. |
| `AIConveyorBelt:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 114 | ✍ Écrit l'angle courant dans l'entrée de sauvegarde du véhicule. |
| `AIConveyorBelt:onReadStream(streamId: integer, connection: Connection)` | 123 | ✍ Côté client à la connexion : lit l'angle sous forme d'int8 et l'applique sans envoyer d'événement. |
| `AIConveyorBelt:onWriteStream(streamId: integer, connection: Connection)` | 131 | ✍ Côté serveur à la connexion : écrit l'angle courant en int8 (la valeur est donc limitée à des degrés entiers dans la plage signée sur 8 bits). |
| `AIConveyorBelt:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 140 | ✍ Serveur uniquement, quand l'IA est active : calcule le sens et la vitesse de balayage vers le cap cible, limite la vitesse du moteur et pilote la physique des roues en conséquence. |
| `AIConveyorBelt:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 155 | ✍ Côté client : active l'action IMPLEMENT_EXTRA3 quand le véhicule est actif en entrée et met à jour son libellé avec l'angle courant en degrés. |
| `AIConveyorBelt:setAIConveyorBeltAngle(angle: any, noEventSend: any)` | 168 | ✍ Enregistre le nouvel angle de balayage et, sauf si noEventSend est vrai, envoie ou diffuse AIConveyorBeltSetAngleEvent pour que tous les pairs soient d'accord. |
| `AIConveyorBelt:getDirectionAndSpeedToTargetAngle(direction: any, minAngle: any, maxAngle: any)` | 182 | ✍ Compare la rotation Y actuelle du premier composant à la cible min ou max et renvoie un sens et une vitesse : il s'inverse avec une vitesse de 0 quand la limite est dépassée, sinon la vitesse dépend de l'angle restant (0,1 à 1). Les angles sont en radians. |
| `AIConveyorBelt:getCanStartAIVehicle(superFunc: any)` | 208 | ✍ Surcharge : renvoie le résultat du parent et exige en plus la présence du nœud vehicle.ai.conveyorBelt dans le XML. |
| `AIConveyorBelt:getCanStartFieldWork()` | 218 | ✍ Renvoie la même valeur que getCanStartAIVehicle. |
| `AIConveyorBelt:getStartableAIJob(superFunc: any)` | 224 | ✍ Surcharge : si le convoyeur peut démarrer, remplit le travail de convoyeur en cache d'après l'état du véhicule et la ferme du joueur local, puis le renvoie si la validation réussit ; sinon renvoie nil. |
| `AIConveyorBelt:getHasStartableAIJob(superFunc: any)` | 242 | ✍ Surcharge qui renvoie toujours vrai. |
| `AIConveyorBelt:getCanBeSelected(superFunc: any)` | 248 | ✍ Surcharge qui renvoie toujours vrai : le convoyeur peut être sélectionné. |
| `AIConveyorBelt:getAINeedsTrafficCollisionBox(superFunc: any)` | 254 | ✍ Surcharge qui renvoie faux : l'IA n'a pas besoin de boîte de collision de trafic pour ce véhicule. |
| `AIConveyorBelt:onAIFieldWorkerStart()` | 260 | ✍ Au démarrage du travail IA, mémorise le cap actuel et fixe les limites de balayage à la moitié de l'angle courant de chaque côté, en démarrant dans le sens positif. |
| `AIConveyorBelt:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 273 | ✍ Côté client : enregistre l'action IMPLEMENT_EXTRA3 pour changer l'angle, seulement pour un véhicule actif en entrée dont le XML contient les réglages de convoyeur IA. |
| `AIConveyorBelt.actionEventChangeAngle(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 287 | ✍ Rappel d'entrée qui ajoute un pas à l'angle et revient au minimum quand le maximum est dépassé. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `setAIConveyorBeltAngle` | 44 |
| registerFunction | `getDirectionAndSpeedToTargetAngle` | 45 |
| registerOverwrittenFunction | `getStartableAIJob` | 51 |
| registerOverwrittenFunction | `getHasStartableAIJob` | 52 |
| registerOverwrittenFunction | `getCanStartFieldWork` | 53 |
| registerOverwrittenFunction | `getCanStartAIVehicle` | 54 |
| registerOverwrittenFunction | `getCanBeSelected` | 55 |
| registerOverwrittenFunction | `getAINeedsTrafficCollisionBox` | 56 |
| registerEventListener | `onLoad` | 62 |
| registerEventListener | `onPostLoad` | 63 |
| registerEventListener | `onReadStream` | 64 |
| registerEventListener | `onWriteStream` | 65 |
| registerEventListener | `onUpdate` | 66 |
| registerEventListener | `onUpdateTick` | 67 |
| registerEventListener | `onAIFieldWorkerStart` | 68 |
| registerEventListener | `onRegisterActionEvents` | 69 |

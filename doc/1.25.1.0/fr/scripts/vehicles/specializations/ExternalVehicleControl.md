# vehicles/specializations/ExternalVehicleControl.lua

*[English version](../../../../scripts/vehicles/specializations/ExternalVehicleControl.md)*

Source: `dataS/scripts/vehicles/specializations/ExternalVehicleControl.lua` — FS25 1.25.1.0

✍ Spécialisation de véhicule qui permet à un joueur à pied de commander des fonctions du véhicule depuis l'extérieur. Les triggers joueur sont déclarés sous vehicle.externalVehicleControl ; les autres spécialisations répondent à l'événement onRegisterExternalActionEvents pour ajouter des actions par trigger. Une classe auxiliaire, ExternalVehicleControlActivatable, branche chaque trigger sur le système d'objets activables et gère l'enregistrement des entrées. À noter : le fichier ne crée pas lui-même la table ExternalVehicleControl ni FUNCTION_XML_PATH (origine NON VÉRIFIÉE).

- **ExternalVehicleControlActivatable** (l.174)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ExternalVehicleControl.prerequisitesPresent(specializations: table) → boolean` | 20 | ✍ Renvoie toujours true : aucune spécialisation prérequise. |
| `ExternalVehicleControl.initSpecialization()` | 26 | ✍ Enregistre la clé XML du nœud de trigger (vehicle.externalVehicleControl.trigger(?)#node) et le chemin différé des fonctions avec son attribut name, afin que d'autres spécialisations ajoutent leurs propres sous-clés. |
| `ExternalVehicleControl.registerEvents(vehicleType: table)` | 41 | ✍ Déclare l'événement de véhicule personnalisé onRegisterExternalActionEvents. |
| `ExternalVehicleControl.registerFunctions(vehicleType: table)` | 48 | ✍ Enregistre la fonction de véhicule registerExternalActionEvent. |
| `ExternalVehicleControl.registerOverwrittenFunctions(vehicleType: table)` | 55 | ✍ Vide : cette spécialisation ne surcharge aucune fonction de véhicule. |
| `ExternalVehicleControl.registerEventListeners(vehicleType: table)` | 61 | ✍ S'abonne à onLoadFinished, onDelete et onUpdateTick. |
| `ExternalVehicleControl:onLoadFinished(savegame: table)` | 70 | ✍ Construit la liste des triggers depuis le XML (avertit si le nœud n'a pas le bit de collision PLAYER), ajoute chaque trigger, déclenche onRegisterExternalActionEvents pour chaque fonction nommée et crée son objet activable. Sans trigger, retire les écouteurs onDelete et onUpdateTick. |
| `ExternalVehicleControl:onDelete()` | 110 | ✍ Retire chaque trigger du moteur et son objet activable du système d'objets activables. |
| `ExternalVehicleControl:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 128 | ✍ Pour chaque trigger dont le joueur est à portée, rafraîchit le texte de l'objet activable et garde le véhicule actif avec raiseActive. |
| `ExternalVehicleControl:registerExternalActionEvent(trigger: any, name: any, registerFunc: any, updateFunc: any)` | 140 | ✍ Ajoute une entrée d'action (rappel d'enregistrement et rappel optionnel de mise à jour du texte) à la liste des fonctions de contrôle d'un trigger et renvoie cette entrée. Prévue pour être appelée depuis les écouteurs de onRegisterExternalActionEvents. |
| `ExternalVehicleControl.onExternalVehicleControlTriggerCallback(trigger: integer, triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean)` | 157 | ✍ Rappel de trigger : ne réagit qu'au nœud racine du joueur local. À l'entrée il marque le joueur à portée et ajoute l'objet activable ; dans les autres cas il efface l'indicateur et le retire. |
| `ExternalVehicleControlActivatable.new(vehicle: any, trigger: any)` | 178 | ✍ Constructeur : mémorise le véhicule et le trigger, initialise un texte d'activation vide et appelle updateText une fois. |
| `ExternalVehicleControlActivatable:registerCustomInput(inputContext: any)` | 191 | ✍ Appelle le rappel d'enregistrement de chaque fonction de contrôle avec le véhicule, uniquement dans le contexte d'entrée du joueur à pied, pour éviter des enregistrements ratés en passant dans le véhicule. |
| `ExternalVehicleControlActivatable:removeCustomInput(inputContext: any)` | 209 | ✍ Retire les événements d'action d'entrée enregistrés pour chaque fonction de contrôle du trigger. |
| `ExternalVehicleControlActivatable:getIsActivatable()` | 217 | ✍ Renvoie true si le joueur peut accéder au véhicule (gestionnaire d'accès) et se trouve dans le trigger. |
| `ExternalVehicleControlActivatable:run()` | 227 | ✍ Vide : l'activation ne fait rien en soi, les actions viennent des événements d'entrée enregistrés. |
| `ExternalVehicleControlActivatable:getDistance(x: any, y: any, z: any)` | 232 | ✍ Renvoie la distance entre la position monde donnée et le nœud du trigger. |
| `ExternalVehicleControlActivatable:updateText()` | 239 | ✍ Appelle le rappel de mise à jour de chaque fonction de contrôle (s'il existe) avec le véhicule afin que textes et états d'action restent à jour. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEvent | `onRegisterExternalActionEvents` | 42 |
| registerFunction | `registerExternalActionEvent` | 49 |
| registerEventListener | `onLoadFinished` | 62 |
| registerEventListener | `onDelete` | 63 |
| registerEventListener | `onUpdateTick` | 64 |

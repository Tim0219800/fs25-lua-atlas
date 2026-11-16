# objects/VehicleSellingPoint.lua

*[English version](../../../scripts/objects/VehicleSellingPoint.md)*

Source: `dataS/scripts/objects/VehicleSellingPoint.lua` — FS25 1.25.1.0

✍ Point de vente de véhicules ou atelier placé sur la carte ou sur un placeable. Un trigger joueur ajoute un activatable qui ouvre le WorkshopScreen, et un trigger de zone de vente suit les formes de véhicules présentes pour que l'écran d'atelier liste les véhicules possédés et leurs outils attelés. Disponible seulement en mode carrière (FSCareerMissionInfo) ; l'icône de carte dépend de la ferme propriétaire. La classe d'activatable associée est définie en fin de fichier.

- **VehicleSellingPoint** (l.9)
- **VehicleSellingPointActivatable** (l.211)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `VehicleSellingPoint.registerXMLPaths(schema: any, basePath: any)` | 14 | ✍ Enregistre les chemins XML : noeud de trigger joueur, noeud d'icône, noeud de trigger de vente, option atelier personnel et option atelier mobile. |
| `VehicleSellingPoint.new() → table` | 26 | ✍ Constructeur : crée l'objet avec une table vide de formes de véhicules dans la zone, un texte d'activation vide et l'état activé. |
| `VehicleSellingPoint:load(components: any, xmlFile: any, key: any, i3dMappings: any)` | 40 | ✍ Lit les noeuds et options du XML, avertit si le trigger joueur n'a pas le bit de collision joueur ou si le trigger de vente n'a pas le bit véhicule, enregistre les deux triggers, crée l'activatable et s'abonne aux messages de changement de ferme et de création du joueur. |
| `VehicleSellingPoint:delete()` | 67 | ✍ Se désabonne des messages, retire les deux triggers, retire l'activatable du système d'activatables et efface la référence à l'icône. |
| `VehicleSellingPoint:openMenu()` | 86 | ✍ Collecte les véhicules présents, configure `g_workshopScreen` avec ce point de vente (concessionnaire ou atelier, et mode mobile) et affiche le `WorkshopScreen`. |
| `VehicleSellingPoint:triggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean)` | 101 | ✍ Callback du trigger joueur : en mode carrière et si activé, ajoute l'activatable quand le joueur local entre et le retire (en rafraîchissant la liste de véhicules) quand il sort. |
| `VehicleSellingPoint:sellAreaTriggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean, otherShapeId: any)` | 123 | ✍ Callback du trigger de zone de vente : enregistre ou retire la forme qui entre ou sort, puis envoie la liste de véhicules rafraîchie à `g_workshopScreen:updateVehicles`. |
| `VehicleSellingPoint:determineCurrentVehicles()` | 137 | ✍ Construit la liste des véhicules dans la zone de vente : pour chaque forme valide, prend les enfants du véhicule racine visibles dans l'aperçu des véhicules et appartenant à la ferme du joueur, triés par noeud racine. Liste vide pour un spectateur ; purge aussi les formes obsolètes. |
| `VehicleSellingPoint:updateIconVisibility()` | 175 | ✍ Affiche l'icône de vente seulement si le point est activé, que la mission est une carrière, que le joueur local n'est pas spectateur et que le propriétaire est tout le monde ou la ferme du joueur. |
| `VehicleSellingPoint:playerFarmChanged(player: any)` | 187 | ✍ Gestionnaire de message : rafraîchit la visibilité de l'icône quand l'événement concerne le joueur local. |
| `VehicleSellingPoint:setOwnerFarmId(ownerFarmId: any)` | 195 | ✍ Mémorise l'identifiant de la ferme propriétaire et rafraîchit la visibilité de l'icône. |
| `VehicleSellingPoint:getOwnerFarmId()` | 202 | ✍ Renvoie l'identifiant de la ferme propriétaire (nil s'il n'a jamais été défini). |
| `VehicleSellingPointActivatable.new(sellingPoint: any, ownWorkshop: any)` | 215 | ✍ Crée l'activatable d'un point de vente avec le texte d'invite des options d'atelier s'il s'agit d'un atelier personnel, sinon des options de concessionnaire. |
| `VehicleSellingPointActivatable:getIsActivatable()` | 231 | ✍ Renvoie true seulement si le point est activé, que le joueur local est à pied, n'est pas spectateur et que le propriétaire est tout le monde ou sa ferme. |
| `VehicleSellingPointActivatable:run()` | 252 | ✍ Ouvre le menu du point de vente, ou affiche à la place un dialogue d'information pendant la visite guidée. |
| `VehicleSellingPointActivatable:getDistance(x: any, y: any, z: any)` | 263 | ✍ Renvoie la distance horizontale (x, z) entre le point donné et le noeud de trigger joueur. |

## Messages

- s'abonne à `MessageType.PLAYER_FARM_CHANGED` (l.59)
- s'abonne à `MessageType.PLAYER_CREATED` (l.60)

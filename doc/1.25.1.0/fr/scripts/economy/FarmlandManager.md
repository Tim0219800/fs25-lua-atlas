# economy/FarmlandManager.lua

*[English version](../../../scripts/economy/FarmlandManager.md)*

Source: `dataS/scripts/economy/FarmlandManager.lua` — FS25 1.25.1.0

✍ Gestionnaire de la propriété des terres, sous-classe de AbstractManager. Lit la couche d'info ou la bit vector map des parcelles et le XML des parcelles de la carte, tient une table id de parcelle vers id de ferme, sauvegarde et charge la propriété et répond aux requêtes de propriété par position monde. Les changements publient FARMLAND_OWNER_CHANGED sur le message center. Enregistre aussi des commandes console gsFarmland* de triche.

- **FarmlandManager** hérite de `AbstractManager` (l.15)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FarmlandManager.new(customMt: any) → table` | 37 | ✍ Constructeur. Crée le gestionnaire via AbstractManager.new avec la métatable fournie ou par défaut. |
| `FarmlandManager:initDataStructures()` | 44 | ✍ Réinitialise les tables de parcelles, listes d'ids, la correspondance parcelle-ferme, le handle et la taille de la carte locale et le nombre de bits (8). |
| `FarmlandManager:loadMapData(xmlFile: any) → boolean` | 60 | ✍ Appelle le parent puis charge la section farmlands du XML de la carte via XMLUtil.loadDataFromMapXML avec loadFarmlandData. Renvoie ce résultat. |
| `FarmlandManager:loadFarmlandData(xmlFileHandle: any) → boolean` | 68 | ✍ Chargeur principal : prend la couche d'info ou charge une bit vector map, parcourt chaque pixel pour calculer surface, centre et boîte englobante par id, crée les Farmland depuis le XML, attribue les parcelles par défaut dans un nouveau jeu solo, s'abonne aux messages de ferme et enregistre les commandes de triche. Renvoie false si le fichier de density map manque ou échoue. |
| `FarmlandManager:unloadMapData()` | 229 | ✍ Retire les commandes console, se désabonne des messages, supprime la bit vector map sauf si elle vient du terrain, supprime toutes les parcelles et appelle le parent. |
| `FarmlandManager:saveToXMLFile(xmlFilename: string) → boolean` | 257 | ✍ Écrit une entrée farmlands.farmland par correspondance (#id, #farmId) dans le fichier XML donné. Renvoie false si le fichier ne peut pas être créé. |
| `FarmlandManager:loadFromXMLFile(xmlFilename: string)` | 282 | ✍ Lit la propriété sauvegardée et l'applique via setLandOwnership (marquée comme chargée depuis la sauvegarde) pour les fermes au-dessus de l'id sans propriétaire, puis appelle g_farmManager:mergeFarmlandsForSingleplayer. Renvoie false sans fichier. À noter : un #farmId absent provoquerait une erreur à la comparaison. |
| `FarmlandManager:delete()` | 316 | ✍ Fonction vide ; le nettoyage est fait dans unloadMapData. |
| `FarmlandManager:getLocalMap() → integer` | 322 | ✍ Renvoie le handle de la bit vector map des parcelles, ou nil si non chargée. |
| `FarmlandManager:getIsOwnedByFarmAtWorldPosition(farmId: integer, worldPosX: number, worldPosZ: number) → boolean` | 332 | ✍ Renvoie true si la ferme donnée possède la parcelle à la position monde X/Z. False pour un id de ferme nil ou sans propriétaire. |
| `FarmlandManager:getIsOwnedByFarmAlongLine(farmId: integer, worldPosX1: number, worldPosZ1: number, worldPosX2: number, worldPosZ2: number) → boolean` | 348 | ✍ Échantillonne la carte des parcelles le long d'un segment monde et renvoie true seulement si la ferme possède tous les points. L'échantillonnage est grossier, environ tous les deux pixels, donc de très fines bandes peuvent échapper. |
| `FarmlandManager:getCanAccessLandAtWorldPosition(farmId: integer, worldPosX: number, worldPosZ: number) → boolean` | 389 | ✍ Renvoie true si la ferme possède le terrain à la position ou si l'access handler l'autorise à utiliser celui de la ferme propriétaire. False pour une ferme nil ou sans propriétaire. |
| `FarmlandManager:getFarmlandOwner(farmlandId: integer) → integer` | 407 | ✍ Renvoie l'id de la ferme propriétaire d'une parcelle, ou l'id sans propriétaire si l'id est nil ou inconnu. Attend un id et non un objet Farmland. |
| `FarmlandManager:getFarmlandIdAtWorldPosition(worldPosX: number, worldPosZ: number) → integer` | 421 | ✍ Renvoie l'id de parcelle lu dans la bit vector map à une position monde X/Z ; 0 signifie aucune parcelle valide. Renvoie l'id sans propriétaire si aucune carte n'est chargée. |
| `FarmlandManager:getFarmlandAtWorldPosition(worldPosX: any, worldPosZ: any)` | 432 | ✍ Renvoie l'objet Farmland à une position monde X/Z, ou nil. |
| `FarmlandManager:getOwnerIdAtWorldPosition(worldPosX: any, worldPosZ: any)` | 439 | ✍ Renvoie l'id de la ferme propriétaire de la parcelle à une position monde X/Z. |
| `FarmlandManager:getIsValidFarmlandId(farmlandId: integer) → boolean` | 448 | ✍ Renvoie true si l'id est un nombre positif correspondant à une parcelle définie. |
| `FarmlandManager:setLandOwnership(farmlandId: integer, farmId: integer, loadFromSavegame: any)` | 462 | ✍ Attribue une parcelle à une ferme (id sans propriétaire pour vendre), met à jour l'objet Farmland et publie FARMLAND_OWNER_CHANGED avec l'indicateur loadFromSavegame. Renvoie false pour des ids invalides ou l'id non achetable. Ne gère pas le réseau lui-même. |
| `FarmlandManager:getFarmlandById(farmlandId: integer) → table` | 492 | ✍ Renvoie l'objet Farmland pour un id, ou nil. |
| `FarmlandManager:getFarmlands() → table` | 499 | ✍ Renvoie la table de toutes les parcelles indexée par id (la table interne, pas une copie). |
| `FarmlandManager:getPricePerHa()` | 505 | ✍ Renvoie le prix de base par hectare lu dans le XML de la carte (60000 par défaut). |
| `FarmlandManager:getOwnedFarmlandIdsByFarmId(id: integer) → array` | 513 | ✍ Renvoie un nouveau tableau des ids de parcelles possédées par l'id de ferme donné. |
| `FarmlandManager:getNumOwnedFarmlandIdsByFarmId(id: integer) → integer` | 527 | ✍ Renvoie le nombre de parcelles possédées par la ferme donnée. |
| `FarmlandManager:convertWorldToLocalPosition(worldPosX: number, worldPosZ: number) → number, number` | 543 | ✍ Convertit des X/Z monde en coordonnées pixel entières dans la carte des parcelles selon la taille du terrain et la résolution. Renvoie deux valeurs ; pas de limitation aux bornes. |
| `FarmlandManager:farmDestroyed(farmId: any)` | 551 | ✍ Gestionnaire du message de suppression de ferme : remet toutes les parcelles qu'elle possédait à l'id sans propriétaire. |
| `FarmlandManager:consoleCommandBuyFarmland(farmlandIdStr: any)` | 572 | ✍ Commande console gsFarmlandBuy [id] : pour le serveur ou l'utilisateur maître avec un client, envoie un FarmlandStateEvent pour acheter la parcelle donnée ou à la position actuelle pour la ferme du joueur local. |
| `FarmlandManager:consoleCommandBuyAllFarmlands()` | 611 | ✍ Commande console gsFarmlandBuyAll : envoie un événement d'achat pour chaque parcelle pour la ferme du joueur local. Même condition d'autorisation que l'achat simple. |
| `FarmlandManager:consoleCommandSellFarmland(farmlandIdStr: any)` | 626 | ✍ Commande console gsFarmlandSell [id] : envoie un événement remettant la parcelle donnée ou à la position actuelle sans propriétaire. Erreur si elle n'a déjà pas de propriétaire. |
| `FarmlandManager:consoleCommandSellAllFarmlands()` | 663 | ✍ Commande console gsFarmlandSellAll : envoie un événement de vente pour chaque parcelle. |
| `FarmlandManager:consoleCommandShowFarmlands()` | 676 | ✍ Commande console gsFarmlandShow : active ou désactive l'enregistrement de ce gestionnaire comme élément de debug (l'overlay demande le mode debug, F5). Le code de dessin n'est pas dans ce fichier. |

## Messages

- s'abonne à `MessageType.FARM_DELETED` (l.207)
- s'abonne à `MessageType.FARM_SETTINGS_CHANGED` (l.208)
- publie `MessageType.FARMLAND_OWNER_CHANGED` (l.483)

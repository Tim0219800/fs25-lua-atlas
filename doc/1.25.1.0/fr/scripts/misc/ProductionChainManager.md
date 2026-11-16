# misc/ProductionChainManager.lua

*[English version](../../../scripts/misc/ProductionChainManager.md)*

Source: `dataS/scripts/misc/ProductionChainManager.lua` — FS25 1.25.1.0

✍ Gestionnaire lié à la carte (étend AbstractManager) qui tient le registre des points de production et des usines, globalement et par ferme, avec une table par ferme associant type de remplissage d'entrée et points de production. Il enregistre des commandes console gsProductionPoint* et, côté serveur, s'abonne aux changements d'heure et rejoint la liste des updateables tant qu'il existe des points de production. Plusieurs gestionnaires qu'il référence (commandes console, update) ne sont pas dans ce fichier du dump (NON VÉRIFIÉ).

- **ProductionChainManager** hérite de `AbstractManager` (l.14)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ProductionChainManager.new(isServer: any, customMt: any) → table` | 19 | ✍ Crée le gestionnaire avec l'indicateur isServer, enregistre six commandes console gsProductionPoint* (liste, table de livraison automatique, propriétaire, état de production, mode de sortie, niveau de remplissage) et, côté serveur, s'abonne à MessageType.HOUR_CHANGED. Les gestionnaires ne sont pas dans ce fichier. |
| `ProductionChainManager:initDataStructures()` | 43 | ✍ Réinitialise les listes de points de production et d'usines avec leurs recherches inverses, la table par ferme, l'indice de mise à jour et les indicateurs de changement d'heure. |
| `ProductionChainManager:unloadMapData()` | 59 | ✍ Retire les commandes console, se désabonne du message d'heure côté serveur, puis appelle le parent. |
| `ProductionChainManager:addProductionPoint(productionPoint: any)` | 77 | ✍ Enregistre un point de production sauf s'il est déjà connu (avertissement) ou si la limite ProductionChainManager.NUM_MAX_PRODUCTION_POINTS est atteinte. Le premier, côté serveur, ajoute le gestionnaire aux updateables de la mission. Les points possédés sont aussi ajoutés aux tables de leur ferme. Renvoie true en cas de succès. |
| `ProductionChainManager:addProductionPointToFarm(productionPoint: any, farmTable: any)` | 110 | ✍ Ajoute un point de production à une table de ferme et l'indexe par chacun de ses types de remplissage d'entrée dans inputTypeToProductionPoints, en créant les sous-tables au besoin. |
| `ProductionChainManager:addFactory(factory: any)` | 130 | ✍ Enregistre une usine sauf si elle est déjà connue (avertissement), l'ajoute à la table de sa ferme propriétaire si elle est possédée, et renvoie true en cas de succès. |
| `ProductionChainManager:addFactoryToFarm(factory: any, farmTable: any)` | 151 | ✍ Ajoute une usine à la liste des usines d'une table de ferme, en créant la liste si nécessaire. |
| `ProductionChainManager:removeProductionPoint(productionPoint: any)` | 161 | ✍ Désenregistre un point de production et le retire des données de sa ferme propriétaire. Quand il n'en reste aucun côté serveur, retire le gestionnaire des updateables de la mission. |
| `ProductionChainManager:removeProductionPointFromFarm(productionPoint: any, farmTable: any)` | 182 | ✍ Retire un point de production d'une table de ferme et de son index par type d'entrée (journalise une erreur si l'entrée d'index manque), en supprimant les entrées vides. Renvoie la table, ou nil si la table de la ferme n'a plus ni points de production ni usines. |
| `ProductionChainManager:removeFactory(factory: any, farmId: any)` | 209 | ✍ Désenregistre une usine et la retire des données de la ferme donnée lorsque celle-ci est connue et n'est pas EVERYONE. |
| `ProductionChainManager:removeFactoryFromFarm(factory: any, farmTable: any)` | 221 | ✍ Retire une usine d'une table de ferme ; renvoie la table, ou nil si la ferme n'a plus ni usines ni points de production. |
| `ProductionChainManager:getProductionPointsForFarmId(farmId: any)` | 237 | ✍ Renvoie les points de production possédés par une ferme, ou une table vide. |
| `ProductionChainManager:getFactoriesForFarmId(farmId: any)` | 243 | ✍ Renvoie les usines possédées par une ferme, ou une table vide. |
| `ProductionChainManager:getNumOfProductionPoints()` | 249 | ✍ Renvoie le nombre total de points de production enregistrés. |
| `ProductionChainManager:getUnownedProductionPoints()` | 255 | ✍ Renvoie une nouvelle liste des points de production dont l'identifiant de ferme propriétaire est AccessHandler.EVERYONE, c'est-à-dire sans ferme propriétaire. |
| `ProductionChainManager:getUnownedFactories()` | 268 | ✍ Renvoie une nouvelle liste des usines dont l'identifiant de ferme propriétaire est AccessHandler.EVERYONE. |
| `ProductionChainManager:getHasFreeSlots()` | 281 | ✍ Renvoie true tant que le nombre de points de production est inférieur à ProductionChainManager.NUM_MAX_PRODUCTION_POINTS. |
| `ProductionChainManager:hourChanged()` | 326 | ✍ Callback du message d'heure : met seulement hourChangedDirty à true. Son consommateur, l'update du gestionnaire, n'est pas dans ce dump (NON VÉRIFIÉ). |
| `ProductionChainManager:updateBalance()` | 392 | ✍ Fonction vide, sans logique dans ce dump ; son rôle est NON VÉRIFIÉ. |

## Messages

- s'abonne à `MessageType.HOUR_CHANGED` (l.35)

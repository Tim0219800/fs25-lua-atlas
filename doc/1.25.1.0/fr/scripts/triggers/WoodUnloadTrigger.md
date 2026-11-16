# triggers/WoodUnloadTrigger.lua

*[English version](../../../scripts/triggers/WoodUnloadTrigger.md)*

Source: `dataS/scripts/triggers/WoodUnloadTrigger.lua` — FS25 1.25.1.0

✍ Sous-classe de UnloadTrigger qui vend ou traite les grumes (split shapes) présentes dans un trigger à collision d'arbres. Le serveur calcule le volume et un prix par grume selon sa qualité, l'ajoute à la cible et supprime la grume. Un second trigger permet au joueur de lancer une vente manuelle, ou autoUnload vend quand un véhicule est dedans ; un trainSystemId peut créditer la ferme locataire d'un train. Plusieurs aides appelées ici (getCanProcessWood, getTargetFillType, onProcessedWood, getNeedRaiseActive, updateActivatableObject) ne sont pas définies dans le dump (NON VÉRIFIÉ).

- **WoodUnloadTrigger** hérite de `UnloadTrigger` (l.16)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `WoodUnloadTrigger.registerXMLPaths(schema: any, basePath: any)` | 24 | ✍ Enregistre les chemins XML du parent UnloadTrigger ainsi que triggerNode, activationTriggerNode, autoUnload (false par défaut) et trainSystemId. |
| `WoodUnloadTrigger.new(isServer: boolean, isClient: boolean, customMt: table?) → table` | 38 | ✍ Crée le trigger au-dessus d'UnloadTrigger.new avec des tables vides de bois et de véhicules dans le trigger, des valeurs de statistiques de split shape par défaut, et extraAttributes initialisé avec price = 1. |
| `WoodUnloadTrigger:load(components: table, xmlFile: table, xmlNode: string, target: table, extraAttributes: table, i3dMappings: table) → boolean` | 61 | ✍ Appelle le load du parent, puis exige un triggerNode dont le masque de collision inclut le bit TREE (sinon retourne false) et enregistre `woodTriggerCallback`. Enregistre éventuellement un trigger d'activation joueur (bit PLAYER requis), lit autoUnload et trainSystemId, et crée l'activable. |
| `WoodUnloadTrigger:delete()` | 106 | ✍ Retire le trigger de bois, ainsi que le trigger d'activation et son activable s'ils existent, puis appelle le delete du parent. |
| `WoodUnloadTrigger:processWood(farmId: any, noEventSend: any)` | 124 | ✍ Sur un client, il envoie seulement WoodUnloadTriggerEvent au serveur. Sur le serveur, il vend chaque grume existante du trigger : calcule volume et prix, ajoute le niveau à la cible (si la capacité libre dépasse 90 % du volume), appelle onProcessedWood et supprime la grume. À noter : totalMass n'est jamais augmenté, la statistique woodTonsSold reçoit donc toujours 0. |
| `WoodUnloadTrigger:calculateWoodBaseValue(objectId: any)` | 199 | ✍ Lit le volume, le type de coupe et les statistiques de split shape d'un noeud de grume, puis retourne le résultat de calculateWoodBaseValueForData : litres, prix par litre et plus grande dimension. |
| `WoodUnloadTrigger:calculateWoodBaseValueForData(volume: any, splitType: any, sizeX: any, sizeY: any, sizeZ: any, numConvexes: any, numAttachments: any)` | 209 | ✍ Calcule le volume multiplié par volumeToLiter du type de coupe, et un prix par litre du type de coupe modulé par la qualité de forme (boîte englobante contre volume, nombre de convexes), la longueur et le nombre d'attachements. L'effet de qualité est atténué selon la difficulté économique. Retourne litres, prix, plus grande dimension. |
| `WoodUnloadTrigger:update(dt: any)` | 247 | ✍ Après l'update du parent, sur le serveur choisit la ferme à créditer : la dernière ferme locataire du système de train, le propriétaire du véhicule en mode autoUnload, ou le propriétaire de la cible. Si cette ferme n'est pas spectatrice, il appelle processWood. |
| `WoodUnloadTrigger:woodTriggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean, otherShapeId: integer)` | 292 | ✍ Callback physique. Les split shapes de prix par litre positif sont ajoutés à l'entrée et retirés à la sortie. En mode autoUnload, les véhicules sont comptés à l'entrée et à la sortie ; l'entrée active l'objet. |
| `WoodUnloadTrigger:getWoodLogs()` | 332 | ✍ Retourne la table des grumes actuellement dans le trigger, indexée par identifiant de noeud. |
| `WoodUnloadTrigger:woodSellTriggerCallback(triggerId: any, otherActorId: any, onEnter: any, onLeave: any, onStay: any, otherShapeId: any)` | 338 | ✍ Callback physique du trigger d'activation : quand le noeud racine du joueur local entre (et que la vente manuelle est active) l'activable est ajouté, et retiré à la sortie. |

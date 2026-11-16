# objects/ProductionPoint.lua

*[English version](../../../scripts/objects/ProductionPoint.md)*

Source: `dataS/scripts/objects/ProductionPoint.lua` — FS25 1.25.1.0

✍ Objet réseau (hérite de Object) d'un point de production de placeable : un ensemble de productions transformant des types de remplissage d'entrée en types de sortie, adossé à un stockage, une station de déchargement (vente), une station de chargement optionnelle et un générateur de palettes. Dans ce dump seule une partie de la classe a des corps : enregistrement du schéma XML (clés de sauvegarde comprises), synchro réseau à la connexion, chargement de l'état sauvegardé, valeurs de spec du magasin, déclencheur d'interaction du joueur, ouverture du menu de production et demande d'achat. La logique de cycle de production, la distribution des sorties (setOutputDistributionMode, setProductionState, setProductionStatus) et des constantes comme OUTPUT_MODE sont absentes du dump : NON VÉRIFIÉ.

- **ProductionPoint** hérite de `Object` (l.45)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ProductionPoint.registerXMLPaths(schema: any, basePath: any)` | 49 | ✍ Enregistre le schéma XML d'un point de production : nom, option de débit partagé, chaque production (id, nom, cycles par mois/heure/minute, coûts quand active, entrées et sorties avec fillType et amount, sellDirectly, isPrimary), noeud du déclencheur joueur, sons, noeuds d'animation, noeuds d'effets et les sous-sections de la station de vente, de la station de chargement, du générateur de palettes et du stockage. |
| `ProductionPoint.registerSavegameXMLPaths(schema: any, basePath: any)` | 88 | ✍ Enregistre les clés XML de sauvegarde : délai du générateur de palettes, coûts de production restant à réclamer, listes directSellFillType et autoDeliverFillType, id et isEnabled de chaque production, et les chemins de sauvegarde du stockage. |
| `ProductionPoint:readStream(streamId: integer, connection: table)` | 531 | ✍ Connexion côté client : après le readStream parent, lit les types de remplissage en vente directe et en livraison automatique, puis les ids d'objet et l'état de la station de déchargement, de la station de chargement optionnelle et du stockage (en terminant leur enregistrement), les productions actives avec leur statut et l'indicateur de limite de palettes. |
| `ProductionPoint:writeStream(streamId: integer, connection: table)` | 591 | ✍ Connexion côté serveur : écrit les mêmes données que lit readStream, dans le même ordre, et enregistre les stations et le stockage dans le flux pour le client qui se connecte. |
| `ProductionPoint:readUpdateStream(streamId: any, timestamp: any, connection: any)` | 638 | ✍ Mise à jour côté client : lit le booléen palletLimitReached envoyé par le serveur. |
| `ProductionPoint:writeUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 646 | ✍ Mise à jour côté serveur : écrit le booléen palletLimitReached. |
| `ProductionPoint:loadFromXMLFile(xmlFile: XMLFile, key: string) → boolean` | 987 | ✍ Restaure l'état sauvegardé : délai du générateur de palettes, coûts non réclamés, état activé de chaque production (toutes activées si le placeable n'a pas de propriétaire), types en vente directe et en livraison automatique, puis le stockage. Retourne false si le stockage ne se charge pas ; un id de production inconnu donne un avertissement. |
| `ProductionPoint.loadSpecValueInputFillTypes(xmlFile: any, customEnvironment: any, baseDir: any)` | 1260 | ✍ Chargeur de spec du magasin : collecte l'ensemble des noms de types de remplissage d'entrée de toutes les productions du XML du placeable, y compris la première configuration de point de production. Retourne un ensemble de noms, ou nil s'il n'y en a pas. |
| `ProductionPoint.getSpecValueInputFillTypes(storeItem: any, realItem: any)` | 1283 | ✍ Convertit les noms de types de remplissage d'entrée stockés d'un article du magasin en données de types de remplissage via le fill type manager ; nil s'il n'y en a pas. |
| `ProductionPoint.loadSpecValueOutputFillTypes(xmlFile: any, customEnvironment: any, baseDir: any)` | 1293 | ✍ Chargeur de spec du magasin comme celui des entrées, mais collectant les noms de types de remplissage de sortie de toutes les productions et de la première configuration. |
| `ProductionPoint.getSpecValueOutputFillTypes(storeItem: any, realItem: any)` | 1316 | ✍ Convertit les noms de types de remplissage de sortie stockés d'un article du magasin en données de types de remplissage ; nil s'il n'y en a pas. |
| `ProductionPoint:interactionTriggerCallback(triggerId: any, otherId: any, onEnter: any, onLeave: any, onStay: any, otherShapeId: any)` | 1326 | ✍ Callback du déclencheur quand le joueur local entre dans la zone d'interaction ou la quitte. À l'entrée, il exécute l'activatable immédiatement (plateformes à activation automatique) ou met à jour son texte et l'enregistre ; à la sortie, il le retire. |
| `ProductionPoint:openMenu()` | 1350 | ✍ Ouvre le menu en jeu et publie GUI_INGAME_OPEN_PRODUCTION_SCREEN avec ce point de production pour que la page de production l'affiche. |
| `ProductionPoint:buyRequest(requestCallback: any, target: any)` | 1357 | ✍ Lance l'achat d'un point de production sans propriétaire : refusé pendant une visite guidée, calcule le prix (plus celui du terrain si le placeable achète une parcelle que la ferme ne possède pas) et affiche un dialogue oui/non ; sur oui, envoie un BuyExistingPlaceableEvent et affiche le résultat. À noter : l'abonnement se fait sans cible mais le désabonnement avec le point de production comme cible, ce qui peut ne pas le retirer (NON VÉRIFIÉ). |

## Messages

- publie `MessageType.GUI_INGAME_OPEN_PRODUCTION_SCREEN` (l.1352)

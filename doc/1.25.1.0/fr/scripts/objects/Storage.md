# objects/Storage.lua

*[English version](../../../scripts/objects/Storage.md)*

Source: `dataS/scripts/objects/Storage.lua` — FS25 1.25.1.0

✍ Stockage générique multi-types (silo, tas, extension) étendant Object. Il suit les niveaux par type de remplissage avec capacités optionnelles par type, capacité totale partagée ou mode mono-type, niveaux de départ, plans de remplissage (statiques ou dynamiques) pour le visuel, coûts d'entretien journaliers et synchronisation serveur vers clients par drapeau sale avec seuil configurable. Les stations de chargement et de déchargement s'y enregistrent et d'autres codes peuvent écouter les changements de niveau. Chargé depuis le XML du placeable propriétaire.

- **Storage** hérite de `Object` (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Storage.registerXMLPaths(schema: any, basePath: any)` | 19 | ✍ Enregistre les attributs XML du stockage : noeud, capacité, seuil de synchro, option multi-types, coût d'entretien, listes ou catégories de types, extension, capacités par type, niveaux de départ, plans de remplissage et plan dynamique. |
| `Storage.registerSavegameXMLPaths(schema: any, basePath: any)` | 42 | ✍ Enregistre les chemins de sauvegarde : `#farmId` du propriétaire et une entrée `node(?)` par type stocké avec son nom et son niveau. |
| `Storage.new(isServer: boolean, isClient: boolean, customMt: table?) → table` | 54 | ✍ Constructeur : construit l'Object et initialise des tables vides pour les stations de déchargement, de chargement et les écouteurs de niveau, avec rootNode à 0 et `foreignSilo` à false. |
| `Storage:load(components: table, xmlFile: table, key: string, i3dMappings: table, baseDirectory: any) → boolean` | 74 | ✍ Charge le stockage depuis le XML : types acceptés via catégories, noms ou capacités par type (erreur et false si aucun), niveaux de départ avec règles de bornage, plans de remplissage (classe perso ou `FillPlane`), plan dynamique, option extension et drapeau sale. S'abonne à `FARM_DELETED`. |
| `Storage:delete()` | 214 | ✍ Se désabonne des messages, supprime les plans de remplissage, vide les tables de stations et d'écouteurs puis appelle le delete parent. |
| `Storage:readStream(streamId: integer, connection: table)` | 235 | ✍ Synchro initiale côté client : après les données parent, lit pour chaque type trié un niveau Float32 optionnel (précédé d'un booléen) et l'applique avec `setFillLevel`. |
| `Storage:writeStream(streamId: integer, connection: table)` | 251 | ✍ Synchro initiale côté serveur : écrit chaque niveau supérieur à zéro (booléen + Float32) et le mémorise comme dernière valeur synchronisée. |
| `Storage:readUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 268 | ✍ Côté client : si le serveur a signalé une mise à jour du stockage, lit tous les niveaux dans l'ordre des types triés et les applique avec `setFillLevel`. |
| `Storage:writeUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 288 | ✍ Côté serveur : si le drapeau sale du stockage est dans le masque, écrit tous les niveaux (booléen + Float32 si supérieur à zéro) et les mémorise comme derniers synchronisés. |
| `Storage:loadFromXMLFile(xmlFile: XMLFile, key: string) → boolean` | 308 | ✍ Charge depuis une sauvegarde : restaure la ferme propriétaire (par défaut `AccessHandler.EVERYONE`), remet tous les niveaux à zéro puis applique chaque niveau `node(i)` pour les types supportés, avec avertissement pour les types inconnus ou non supportés. Renvoie true. |
| `Storage:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 345 | ✍ Sauvegarde l'identifiant de la ferme propriétaire et une entrée `node(i)` pour chaque type dont le niveau est supérieur à zéro. |
| `Storage:empty()` | 362 | ✍ Met chaque niveau à 0 directement et lève le drapeau sale sur le serveur pour chacun. Ne notifie pas les écouteurs et ne met pas à jour les plans de remplissage. À noter : les dernières valeurs synchronisées ne sont pas réinitialisées ici. |
| `Storage:updateFillPlanes()` | 373 | ✍ Fixe l'état de chaque plan de remplissage statique au rapport niveau sur capacité de son type (1 si la capacité n'est pas positive). |
| `Storage:getIsFillTypeSupported(fillType: integer) → boolean` | 391 | ✍ Renvoie true si le type de remplissage est dans l'ensemble accepté. |
| `Storage:getFillLevel(fillType: integer) → number` | 399 | ✍ Renvoie le niveau actuel d'un type de remplissage, ou 0 s'il n'est pas supporté. |
| `Storage:getFillLevels()` | 405 | ✍ Renvoie la table interne des niveaux indexée par type de remplissage (pas une copie). |
| `Storage:getCapacity(fillType: any)` | 411 | ✍ Renvoie la capacité propre au type de remplissage, ou la capacité générale du stockage s'il n'y en a pas. |
| `Storage:setFillLevel(fillLevel: number, fillType: integer, fillInfo: table)` | 420 | ✍ Borne et fixe le niveau d'un type. En cas de changement, notifie les écouteurs (si la variation dépasse 0,1 ou si la valeur arrondie change), lève le drapeau sale serveur au seuil, à vide ou plein, met à jour les plans et ajoute ou retire de la matière sur le plan dynamique selon la zone optionnelle `fillInfo`. |
| `Storage:getFreeCapacity(fillType: integer) → number` | 471 | ✍ Renvoie la place restante pour un type : 0 s'il n'est pas supporté ; capacité par type ou totale partagée en mode multi-types ; en mode mono-type 0 si un autre type est déjà stocké. |
| `Storage:getSupportedFillTypes()` | 506 | ✍ Renvoie l'ensemble interne des types acceptés (clés = indices de types). |
| `Storage:hourChanged()` | 512 | ✍ Serveur uniquement : débite la ferme propriétaire de l'entretien horaire (coût par niveau et par jour divisé par 24, multiplié par le multiplicateur de coûts de l'économie) sur tous les niveaux stockés, en maintenance de propriété. |
| `Storage:addUnloadingStation(station: any)` | 527 | ✍ Enregistre une station de déchargement utilisant ce stockage. |
| `Storage:removeUnloadingStation(station: any)` | 533 | ✍ Retire une station de déchargement de ce stockage. |
| `Storage:addLoadingStation(loadingStation: any)` | 539 | ✍ Enregistre une station de chargement utilisant ce stockage. |
| `Storage:removeLoadingStation(loadingStation: any)` | 545 | ✍ Retire une station de chargement de ce stockage. |
| `Storage:farmDestroyed(farmId: any)` | 551 | ✍ Gestionnaire de message de suppression de ferme : si la ferme supprimée possède ce stockage, remet tous les types acceptés à 0. |
| `Storage:addFillLevelChangedListeners(func: any)` | 563 | ✍ Ajoute un callback appelé sous la forme `func(fillType, delta)` lorsqu'un niveau change. |
| `Storage:removeFillLevelChangedListeners(func: any)` | 569 | ✍ Retire un callback de changement de niveau ajouté précédemment. |
| `Storage:draw()` | 575 | ✍ Rendu de debug : affiche un tableau des niveaux et capacités près du noeud du stockage, ajouté comme élément de frame au gestionnaire de debug. |

## Messages

- s'abonne à `MessageType.FARM_DELETED` (l.207)

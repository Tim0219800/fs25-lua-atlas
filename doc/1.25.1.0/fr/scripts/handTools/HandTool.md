# handTools/HandTool.lua

*[English version](../../../scripts/handTools/HandTool.md)*

Source: `dataS/scripts/handTools/HandTool.lua` — FS25 1.25.1.0

✍ Classe de base de toute instance d'outil à main (fille de `Object`). Elle exécute un chargement asynchrone basé sur les spécialisations (i3d, XML `handTool.base`, événements de spécialisation de onPreLoad à onLoadFinished), suit le holder, le joueur porteur et l'état tenu, attache l'outil à la main ou à la caméra du joueur, sauvegarde et synchronise l'état sur le réseau, et calcule un prix dépendant de l'âge. Les événements de spécialisation sont levés avec `SpecializationUtil.raiseEvent`. Plusieurs aides qu'elle appelle (`loadCallback`, `registerActionEvents`, `getHolder`, `setHolder`, `loadHandToolOnClient`, `setCanBeDropped`) ne sont pas définies dans ce fichier (NON VÉRIFIÉ).

- **HandTool** hérite de `Object` (l.14)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `HandTool.init()` | 26 | ✍ Appelle la fonction `init` de chaque spécialisation d'outil à main enregistrée qui en définit une. |
| `HandTool.postInit()` | 41 | ✍ Point d'accroche vide pour la post-initialisation ; ne fait rien. |
| `HandTool.registerXMLPaths()` | 46 | ✍ Crée le schéma XML `handTool` (plus un sous-schéma `sounds`), l'enregistre pour l'espèce de boutique des outils à main et le gestionnaire de types, et déclare les clés `handTool.base` (accroupissement, tenu, sauvegarde, dépôt, multiplicateurs de vitesse et de saut, textes, fichier i3d, graphismes, noeuds de main et de première personne, noeud porté, masse) et l'attribut `type`. Chaque spécialisation enregistre ensuite ses propres chemins. |
| `HandTool.registerSavegameXMLPaths(savegameXMLSchema: XMLSchema)` | 103 | ✍ Déclare les clés de sauvegarde sous `handTools.handTool(?)` : filename, modName, uniqueId, farmId, age, price et identifiant du dernier holder, puis les chemins de sauvegarde des spécialisations. |
| `HandTool.registerEvents(handToolType: table)` | 155 | ✍ Enregistre les événements de spécialisation d'un type d'outil à main, de onPreLoad, onLoad et onDelete aux événements de mise à jour, tenu, changement de holder et joueur porteur, ainsi que onDebugDraw. |
| `HandTool.new(isServer: boolean, isClient: boolean, customMt: table?) → HandTool` | 195 | ✍ Crée un objet outil à main avec l'état par défaut : non chargé, état de chargement OK, étape CREATED, sans holder ni joueur porteur, non tenu, masse 0. |
| `HandTool:setFilename(filename: any)` | 230 | ✍ Mémorise le nom du fichier XML de config, sa forme nettoyée, ainsi que le nom du mod et le dossier de base déduits du chemin. |
| `HandTool:setType(typeDef: any)` | 239 | ✍ Initialise les spécialisations de l'outil depuis la définition de type donnée via `SpecializationUtil.initSpecializationsIntoTypeClass`. |
| `HandTool:setLoadCallback(loadCallbackFunction: any, loadCallbackFunctionTarget: any, loadCallbackFunctionArguments: any)` | 245 | ✍ Mémorise la fonction de callback, sa cible et ses arguments, appelés à la fin du chargement. |
| `HandTool:i3dFileLoaded(i3dNode: any, failedReason: any, arguments: any, i3dLoadingId: any)` | 327 | ✍ Callback du chargement i3d : en cas d'échec, passe à l'état ERROR, journalise et appelle le callback de chargement ; sinon garde le noeud masqué et poursuit avec `loadFinished`. |
| `HandTool:loadFinished()` | 343 | ✍ Étape principale du chargement une fois l'i3d disponible : fixe la ferme propriétaire, la masse, l'identifiant unique et la ferme issus de la sauvegarde, le prix (valeur boutique si 0), les textes, le noeud racine, les composants et mappings i3d, puis lit les valeurs `handTool.base` (noeuds graphique, de main et de première personne, multiplicateurs avec saut borné entre 0 et 1,2, accroupissement, tenu, drapeaux de sauvegarde et de dépôt). Lève onLoad et onPostLoad, lit âge et prix de la sauvegarde, s'abonne à `PERIOD_CHANGED`, puis termine ou attend les tâches de sous-chargement. Les erreurs interrompent via le callback de chargement. |
| `HandTool:onFinishedLoading()` | 468 | ✍ Dernière étape du chargement : lève onLoadFinished, marque l'outil synchronisé sur le serveur, l'ajoute à `handToolSystem` (erreur et callback en cas d'échec), l'enregistre si demandé, prépare le holder initial (données de chargement ou identifiant unique de la sauvegarde), l'ajoute aux objets possédés, libère le fichier XML et appelle le callback de chargement. |
| `HandTool:createLoadingTask(target: any) → table` | 525 | ✍ Crée et renvoie une tâche de chargement pour la cible donnée via `SpecializationUtil.createLoadingTask` ; le chargement attend toutes les tâches. |
| `HandTool:finishLoadingTask(task: table)` | 532 | ✍ Marque une tâche de chargement comme terminée via `SpecializationUtil.finishLoadingTask` ; termine le chargement quand tout est prêt et qu'aucune tâche ne reste. |
| `HandTool:setLoadingState(loadingState: any)` | 538 | ✍ Définit l'état de chargement s'il s'agit d'un `HandToolLoadingState` valide ; sinon affiche la pile d'appels et journalise une erreur. |
| `HandTool:setLoadingStep(loadingStep: SpecializationLoadStep)` | 550 | ✍ Définit l'étape de chargement via `SpecializationUtil.setLoadingStep`. |
| `HandTool:delete()` | 556 | ✍ Nettoyage unique : retire l'objet des possessions, désabonne les messages, efface le holder, libère l'i3d partagé, lève onDelete, supprime le noeud racine, retire l'outil du système, supprime le fichier de sons et appelle le delete parent. |
| `HandTool:writeStream(streamId: integer, connection: Connection)` | 601 | ✍ Serveur : après les données du parent, écrit le nom de fichier de config réseau et l'indicateur de dépôt possible, pour que le client charge le même outil. |
| `HandTool:readStream(streamId: integer, connection: Connection, objectId: integer)` | 613 | ✍ Client : lit le nom de fichier et l'indicateur de dépôt, refuse si le chargement a déjà commencé, puis lance un chargement côté client via `HandToolLoadingData` avec un callback qui signale au client que l'objet a fini son chargement asynchrone. |
| `HandTool:postWriteStream(streamId: integer, connection: table)` | 645 | ✍ Serveur, une fois l'outil chargé chez le client : écrit s'il a un holder et, le cas échéant, l'objet holder et l'indicateur tenu, puis lève onWriteStream. |
| `HandTool:postReadStream(streamId: integer, connection: table)` | 659 | ✍ Client : lit l'identifiant du holder en attente et l'indicateur de prise en main, puis lève onReadStream et passe à l'étape SYNCHRONIZED. |
| `HandTool:writeUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 676 | ✍ Serveur : se contente de lever onWriteUpdateStream pour que les spécialisations écrivent leurs données. |
| `HandTool:readUpdateStream(streamId: integer, timestamp: table, connection: table)` | 684 | ✍ Client : se contente de lever onReadUpdateStream pour que les spécialisations lisent leurs données. |
| `HandTool:getNeedsSaving()` | 690 | ✍ Renvoie si l'outil est sauvegardé avec la partie (`canBeSaved`). |
| `HandTool:saveToXMLFile(xmlFile: XMLFile, key: string, usedModNames: table)` | 703 | ✍ Écrit l'identifiant unique, l'identifiant de ferme (-1 si aucun), l'âge et l'identifiant unique du holder, puis laisse chaque spécialisation ayant `saveToXMLFile` écrire sous sa sous-clé. |
| `HandTool:getUniqueId() → string` | 724 | ✍ Renvoie l'identifiant unique de l'outil. |
| `HandTool:setUniqueId(uniqueId: string)` | 731 | ✍ Définit l'identifiant unique ; il ne doit plus changer après la première affectation (seules des assertions de debug le vérifient). |
| `HandTool:register(alreadySent: any)` | 739 | ✍ Appelle le register parent, puis lève onRegistered. |
| `HandTool:getIsSynchronized() → boolean` | 748 | ✍ Renvoie true quand l'étape de chargement est SYNCHRONIZED, c'est-à-dire entièrement chargé et synchronisé. |
| `HandTool:update(dt: number)` | 790 | ✍ Mise à jour par image : résout les holders en attente (objet, identifiant unique ou direct), lève onPreUpdate, onUpdate et onPostUpdate, et reste actif tant qu'un joueur contrôlé le tient. `dt` est en millisecondes. |
| `HandTool:updateTick(dt: any)` | 838 | ✍ Lève onUpdateTick avec `dt`. |
| `HandTool:startHolding()` | 848 | ✍ Appelé quand le joueur prend l'outil en main : peut verrouiller la vue à la première ou troisième personne, met l'état tenu, attache l'outil, lève onHeldStart et réenregistre les événements d'action du joueur propriétaire. |
| `HandTool:stopHolding()` | 888 | ✍ Appelé quand l'outil est rangé : restaure la perspective de caméra si elle était verrouillée, efface l'état tenu, détache l'outil, lève onHeldEnd et relie les événements d'action. |
| `HandTool:getIsCarried() → boolean` | 923 | ✍ Renvoie true si un joueur porte l'outil (inventaire), qu'il soit en main ou non. |
| `HandTool:setCarryingPlayer(player: Player)` | 930 | ✍ Définit le joueur porteur, lève onCarryingPlayerChanged avec le nouveau et l'ancien joueur, et réenregistre les événements d'action si le joueur est le propriétaire local. |
| `HandTool:getCarryingPlayer() → Player` | 946 | ✍ Renvoie le joueur qui porte l'outil, ou nil. |
| `HandTool:periodChanged()` | 952 | ✍ Incrémente l'âge de l'outil d'une période (abonné à `PERIOD_CHANGED`). |
| `HandTool:getPrice()` | 959 | ✍ Renvoie le prix de l'outil. |
| `HandTool:getSellPrice() → number` | 966 | ✍ Renvoie le prix de vente à partir de l'item de boutique, de l'âge et du prix via `HandTool.calculateSellPrice`. |
| `HandTool.calculateSellPrice(storeItem: any, age: any, price: any)` | 977 | ✍ Dépréciation : âge en années (`age / Environment.PERIODS_IN_YEAR`), facteur = min(0,75 - 0,1 * ln(années), 0,8), résultat = max(prix * facteur, 3 % du prix). L'argument `storeItem` est inutilisé. À noter : un âge 0 donne ln(0), le facteur atteint donc le plafond de 0,8. |
| `HandTool:getIsHeld() → boolean` | 1000 | ✍ Renvoie true seulement si l'outil est porté et actuellement en main. |
| `HandTool:setCarryingPlayerStyleChanged()` | 1040 | ✍ Appelé quand le modèle du joueur porteur change : rattache l'outil au nouveau modèle, puis lève onCarryingPlayerStyleChanged. |
| `HandTool:attachTool()` | 1082 | ✍ Si l'outil est tenu, l'attache à la caméra du joueur (première personne, mode forcé) ou à la main, puis rend le noeud racine visible. |
| `HandTool:detachTool()` | 1104 | ✍ Masque et délie le noeud racine ; ne fait rien s'il n'y a pas de noeud racine. |
| `HandTool:attachToolToHand()` | 1118 | ✍ Lie l'outil au noeud de main droite ou gauche en troisième personne du joueur, aligné sur le `handNode` de l'outil ; sans noeud de main, lie avec un décalage nul et avertit. Renvoie false et journalise une erreur si le modèle du joueur est invalide ou l'outil non tenu. |
| `HandTool:attachToolToCamera()` | 1156 | ✍ Lie l'outil au noeud de tangage de la caméra du joueur porteur, aligné sur `firstPersonNode` ; sans ce noeud, utilise un décalage nul et avertit. |
| `HandTool:clearActionEvents(clearCarriedActionEvents: boolean?)` | 1190 | ✍ Retire tous les événements d'action de cet outil de l'input binding dans le contexte d'entrée du joueur. À noter : le paramètre `clearCarriedActionEvents` est documenté mais jamais utilisé. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEvent | `onPreLoad` | 156 |
| registerEvent | `onLoad` | 157 |
| registerEvent | `onPostLoad` | 158 |
| registerEvent | `onLoadFinished` | 159 |
| registerEvent | `onDelete` | 160 |
| registerEvent | `onSave` | 161 |
| registerEvent | `onRegistered` | 162 |
| registerEvent | `onWriteStream` | 163 |
| registerEvent | `onReadStream` | 164 |
| registerEvent | `onWriteUpdateStream` | 165 |
| registerEvent | `onReadUpdateStream` | 166 |
| registerEvent | `onPreUpdate` | 167 |
| registerEvent | `onUpdate` | 168 |
| registerEvent | `onPostUpdate` | 169 |
| registerEvent | `onUpdateTick` | 170 |
| registerEvent | `onDraw` | 171 |
| registerEvent | `onRegisterActionEvents` | 173 |
| registerEvent | `onHandToolHolderChanged` | 174 |
| registerEvent | `onHeldStart` | 175 |
| registerEvent | `onHeldEnd` | 176 |
| registerEvent | `onCarryingPlayerStyleChanged` | 178 |
| registerEvent | `onCarryingPlayerShown` | 179 |
| registerEvent | `onCarryingPlayerHidden` | 180 |
| registerEvent | `onCarryingPlayerEnteredVehicle` | 181 |
| registerEvent | `onCarryingPlayerExitedVehicle` | 182 |
| registerEvent | `onCarryingPlayerChanged` | 183 |
| registerEvent | `onCarryingPlayerPerspectiveSwitched` | 184 |
| registerEvent | `onDebugDraw` | 186 |

## Messages

- s'abonne à `MessageType.PERIOD_CHANGED` (l.455)

# vehicles/specializations/AutomaticArmControlForwarder.lua

*[English version](../../../../scripts/vehicles/specializations/AutomaticArmControlForwarder.md)*

Source: `dataS/scripts/vehicles/specializations/AutomaticArmControlForwarder.lua` — FS25 1.25.1.0

✍ Spécialisation qui permet à la grue d'un porteur forestier de s'aligner automatiquement sur le meilleur arbre (grume) trouvé dans des triggers. Elle exige Cylindered et pilote ses outils mobiles par une séquence d'alignement X, Y et Z, avec une exigence optionnelle de contrôle de bras facile et des limites de temps de pliage. Le serveur exécute l'alignement ; les clients envoient l'entrée et affichent un marqueur d'arbre, avec un indicateur dirty pour la synchronisation. Elle est configurable par configuration du véhicule. Les constantes d'état et la table NEXT_STATE sont définies hors du code présent dans le dump : NON VÉRIFIÉ.


## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AutomaticArmControlForwarder.prerequisitesPresent(specializations: table) → boolean` | 32 | ✍ Renvoie true seulement si le type de véhicule possède la spécialisation Cylindered. |
| `AutomaticArmControlForwarder.initSpecialization()` | 38 | ✍ Ajoute le type de configuration de boutique `automaticArmControlForwarder` et enregistre les chemins XML à la fois directement sous `vehicle.automaticArmControlForwarder` et dans chaque entrée de configuration. |
| `AutomaticArmControlForwarder.registerXMLPaths(schema: any, basePath: any)` | 52 | ✍ Enregistre un jeu de clés XML : exigence du contrôle de bras facile, limites de pliage, noeud racine, triggers d'arbres, réglages d'alignement X, Y, Z et outil X, et marqueur d'arbre avec ses couleurs cible et trop épais. |
| `AutomaticArmControlForwarder.registerFunctions(vehicleType: any)` | 90 | ✍ Enregistre l'API d'alignement (test d'autorisation, entrée, `doTreeArmAlignment`, réinitialisation, requêtes actif/terminé, accesseurs d'arbre cible, recherche du meilleur arbre) et le callback du trigger d'arbres. |
| `AutomaticArmControlForwarder.registerOverwrittenFunctions(vehicleType: any)` | 106 | ✍ Vide : aucune fonction de véhicule n'est surchargée. |
| `AutomaticArmControlForwarder.registerEventListeners(vehicleType: any)` | 111 | ✍ S'abonne à onLoad, onPostLoad, onDelete, onReadUpdateStream, onWriteUpdateStream, onUpdate, `onAutoLoadForwaderMountedTree` et onRegisterActionEvents. |
| `AutomaticArmControlForwarder:onLoad(savegame: any)` | 125 | ✍ Choisit la configuration, lit les noeuds, les réglages d'alignement, les limites de pliage et le marqueur d'arbre, et ajoute les triggers d'arbres. Sans noeud racine, retire ses écouteurs onDelete, onUpdate et d'actions. Retire aussi l'écouteur d'actions si le contrôle automatique du véhicule est actif. |
| `AutomaticArmControlForwarder:onPostLoad(savegame: any)` | 217 | ✍ Résout les objets d'outils mobiles des alignements X, Z, Y et outil X à partir de leurs noeuds. |
| `AutomaticArmControlForwarder:onDelete()` | 239 | ✍ Supprime le marqueur d'arbre et retire tous les triggers d'arbres. |
| `AutomaticArmControlForwarder:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 255 | ✍ Lecture réseau. Le serveur lit l'entrée de contrôle du client et la conserve 250 ms ; un client lit si le serveur a trouvé une cible valide. |
| `AutomaticArmControlForwarder:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 273 | ✍ Écriture réseau, miroir de la lecture : un client envoie son entrée de contrôle, le serveur envoie l'indicateur de cible valide, dans les deux cas seulement si l'indicateur dirty est levé. |
| `AutomaticArmControlForwarder:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 290 | ✍ À chaque mise à jour, trouve la meilleure cible d'arbre si c'est permis et met en cache sa position, sa direction et son rayon. Les clients affichent le marqueur et activent l'entrée. Le serveur lève l'indicateur dirty et réinitialise l'état quand la validité de la cible change, et rejoue l'entrée maintenue. |
| `AutomaticArmControlForwarder:onAutoLoadForwaderMountedTree(treeNodeId: any)` | 367 | ✍ Gestionnaire d'événement : retire l'arbre qui vient d'être monté de la liste des arbres trouvés dans les triggers. |
| `AutomaticArmControlForwarder:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 374 | ✍ Sur les clients, enregistre l'action alimentée TREE_AUTOMATIC_ALIGN avec une priorité de texte très haute, initialement inactive. N'est enregistrée que si le contrôle automatique du véhicule n'est pas disponible. |
| `AutomaticArmControlForwarder.actionEvent(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 389 | ✍ Callback d'entrée : transmet la valeur d'entrée à `setTreeArmAlignmentInput`. |
| `AutomaticArmControlForwarder.updateActionEvents(self: any, state: any)` | 395 | ✍ Active ou désactive l'événement d'action TREE_AUTOMATIC_ALIGN selon l'état donné. |
| `AutomaticArmControlForwarder:getIsAutoTreeAlignmentAllowed()` | 405 | ✍ Renvoie false si le véhicule n'est pas contrôlé, si le contrôle de bras facile est requis mais désactivé, ou si le temps d'animation de pliage est hors des limites configurées ; true sinon. |
| `AutomaticArmControlForwarder:setTreeArmAlignmentInput(inputValue: any)` | 427 | ✍ Serveur : tant que l'entrée est positive, que ce n'est pas terminé et qu'une cible existe, lance l'alignement vers elle ; une entrée 0 réinitialise l'état. Client : mémorise l'entrée et marque le véhicule dirty pour l'envoyer au serveur. |
| `AutomaticArmControlForwarder:doTreeArmAlignment(tx: any, ty: any, tz: any, dx: any, dy: any, dz: any, direction: any, forceMoveUp: any)` | 447 | ✍ Fait avancer la machine à états d'alignement vers un point et une direction cibles : montée, puis X (et outil X), Z, Y, en pilotant chaque outil mobile via `externalMove`. `direction` vaut 1 ou -1 et `forceMoveUp` force l'étape de montée. |
| `AutomaticArmControlForwarder.movingToolXAlignment(self: any, movingTool: any, tx: any, ty: any, tz: any, referenceNode: any, threshold: any, speedScale: any, offset: any, allowInversion: any)` | 533 | ✍ Fait tourner un outil mobile autour de son axe vers un point cible du monde. Renvoie la commande de mouvement et true une fois l'angle sous le seuil ; `allowInversion` lui permet de viser dans le sens opposé si c'est plus court. |
| `AutomaticArmControlForwarder.calculateMovingToolTargetMove(self: any, movingTool: any, targetRot: any)` | 563 | ✍ Prédit où l'outil s'arrêterait compte tenu de sa vitesse et de son accélération, et renvoie -1, 0 ou 1 (selon le signe de la vitesse) afin de ne pas dépasser la rotation cible. Utilise `g_currentDt`. |
| `AutomaticArmControlForwarder:resetAutomaticAlignment()` | 619 | ✍ Remet la machine à états d'alignement à son état initial. |
| `AutomaticArmControlForwarder:getIsAutomaticAlignmentActive()` | 625 | ✍ Renvoie true tant que l'alignement n'est ni au repos ni terminé. |
| `AutomaticArmControlForwarder:getIsAutomaticAlignmentFinished()` | 632 | ✍ Renvoie true quand l'état d'alignement est l'état terminé. |
| `AutomaticArmControlForwarder:getAutomaticAlignmentTargetTree()` | 638 | ✍ Renvoie l'identifiant de noeud de l'arbre actuellement ciblé, ou nil. |
| `AutomaticArmControlForwarder:getAutomaticAlignmentAvailableTargetTree()` | 644 | ✍ Recalcule et renvoie le meilleur arbre à portée sans utiliser la cible en cache, ou nil s'il n'y en a pas. |
| `AutomaticArmControlForwarder:getAutomaticAlignmentCurrentTarget()` | 651 | ✍ Renvoie la position (x, y, z) et la direction (dx, dy, dz) de la cible quand une cible valide existe, sinon six valeurs nil. |
| `AutomaticArmControlForwarder:getBestTreeToAutoAlign(referenceNode: any, trees: any)` | 662 | ✍ Note les arbres non montés selon l'angle, la distance et la hauteur par rapport à un noeud de référence et renvoie l'identifiant au score le plus bas, ou nil. Les grumes montées sont ignorées. |
| `AutomaticArmControlForwarder:onTreeAutoTriggerCallback(triggerId: any, otherId: any, onEnter: any, onLeave: any, onStay: any, otherShapeId: any)` | 690 | ✍ Callback de trigger : pour les formes de maillage découpable, ajoute l'arbre à la liste des arbres trouvés à l'entrée et l'en retire à la sortie. |
| `AutomaticArmControlForwarder.drawDebugCircleRange(node: any, radius: any, steps: any, minRot: any, maxRot: any)` | 703 | ✍ Outil de debug : dessine un arc rouge de segments de ligne autour d'un noeud entre deux angles. Non appelé dans ce fichier. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `getIsAutoTreeAlignmentAllowed` | 91 |
| registerFunction | `setTreeArmAlignmentInput` | 92 |
| registerFunction | `doTreeArmAlignment` | 93 |
| registerFunction | `resetAutomaticAlignment` | 94 |
| registerFunction | `getIsAutomaticAlignmentActive` | 95 |
| registerFunction | `getIsAutomaticAlignmentFinished` | 96 |
| registerFunction | `getAutomaticAlignmentTargetTree` | 97 |
| registerFunction | `getAutomaticAlignmentAvailableTargetTree` | 98 |
| registerFunction | `getAutomaticAlignmentCurrentTarget` | 99 |
| registerFunction | `getBestTreeToAutoAlign` | 100 |
| registerFunction | `onTreeAutoTriggerCallback` | 101 |
| registerEventListener | `onLoad` | 112 |
| registerEventListener | `onPostLoad` | 113 |
| registerEventListener | `onDelete` | 114 |
| registerEventListener | `onReadUpdateStream` | 115 |
| registerEventListener | `onWriteUpdateStream` | 116 |
| registerEventListener | `onUpdate` | 117 |
| registerEventListener | `onAutoLoadForwaderMountedTree` | 118 |
| registerEventListener | `onRegisterActionEvents` | 119 |

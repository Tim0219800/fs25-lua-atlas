# vehicles/specializations/AutomaticArmControlHarvester.lua

*[English version](../../../../scripts/vehicles/specializations/AutomaticArmControlHarvester.md)*

Source: `dataS/scripts/vehicles/specializations/AutomaticArmControlHarvester.lua` — FS25 1.25.1.0

✍ Spécialisation qui permet à la grue d'une abatteuse de s'aligner automatiquement sur un arbre sur pied pour l'abattre. Elle exige Cylindered et déplace ses outils mobiles par une suite d'états (recul, alignement X, Z, Y, terminé). Les arbres sont trouvés par un recouvrement sphérique asynchrone, puis notés selon l'angle et la distance. Un marqueur d'arbre montre la cible, colorée selon sa validité. Le serveur exécute l'alignement et les clients envoient l'entrée via le flux de mise à jour. Les véhicules enfants (la tête d'abattage) peuvent ajouter le support et des surcharges. Les constantes STATE_* et INVALID_REASON_* et la table NEXT_STATE sont définies hors du code présent dans le dump : NON VÉRIFIÉ.


## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AutomaticArmControlHarvester.prerequisitesPresent(specializations: table) → boolean` | 43 | ✍ Renvoie true seulement si le type de véhicule possède la spécialisation Cylindered. |
| `AutomaticArmControlHarvester.initSpecialization()` | 49 | ✍ Ajoute le type de configuration de boutique `automaticArmControlHarvester` et enregistre les chemins XML directement et dans chaque entrée de configuration. |
| `AutomaticArmControlHarvester.registerXMLPaths(schema: any, basePath: any)` | 63 | ✍ Enregistre un jeu de clés XML : exigence du contrôle de bras facile, limites de pliage, noeud de retour, noeud de détection d'arbre (rayons, angle, hauteur de coupe), alignements X, Y, Z, noeuds d'alignement supplémentaires et couleurs et décalage du marqueur d'arbre. |
| `AutomaticArmControlHarvester.registerFunctions(vehicleType: any)` | 106 | ✍ Enregistre l'API d'alignement : tests de support et d'autorisation, validité de l'arbre et état du marqueur, entrée, `doTreeArmAlignment`, requêtes d'activité et de cible, raison d'arbre invalide, recherche du meilleur arbre, callback de recouvrement et `getTreeAutomaticOverwrites`. |
| `AutomaticArmControlHarvester.registerOverwrittenFunctions(vehicleType: any)` | 123 | ✍ Vide : aucune fonction de véhicule n'est surchargée. |
| `AutomaticArmControlHarvester.registerEventListeners(vehicleType: any)` | 128 | ✍ S'abonne à onLoad, onPostLoad, onDelete, onReadUpdateStream, onWriteUpdateStream, onUpdate, onRegisterActionEvents et onRootVehicleChanged. |
| `AutomaticArmControlHarvester:onLoad(savegame: any)` | 141 | ✍ Choisit la configuration, lit les noeuds d'alignement supplémentaires et, si un noeud de détection d'arbre existe, tous les réglages de détection, d'alignement, de marqueur et de pliage. Sans lui, ne garde que les décalages et noeuds de référence (pour un véhicule parent) et retire ses écouteurs de mise à jour et d'actions. |
| `AutomaticArmControlHarvester:onPostLoad(savegame: any)` | 243 | ✍ Résout les objets d'outils mobiles pour X, Z, Y et chaque noeud d'alignement, en supprimant les noeuds dont l'outil est introuvable. |
| `AutomaticArmControlHarvester:onDelete()` | 269 | ✍ Supprime le marqueur d'arbre s'il a été créé. |
| `AutomaticArmControlHarvester:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 278 | ✍ Lecture réseau. Le serveur lit l'entrée de contrôle du client et la conserve 250 ms ; un client lit si le serveur a trouvé une cible valide. |
| `AutomaticArmControlHarvester:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 296 | ✍ Écriture réseau, miroir de la lecture, envoyée seulement si l'indicateur dirty est levé : entrée de contrôle du client vers le serveur, indicateur de cible valide du serveur vers le client. |
| `AutomaticArmControlHarvester:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 313 | ✍ À chaque mise à jour, choisit le meilleur arbre, place et colore le marqueur (coupe, cible ou trop épais, avec une raison si invalide), et lance un recouvrement sphérique asynchrone pour rafraîchir la liste d'arbres. Le serveur pilote ensuite l'alignement, automatiquement ou par entrée maintenue, et gère le retour à la position de repos. |
| `AutomaticArmControlHarvester:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 439 | ✍ Sur les clients, enregistre l'action alimentée TREE_AUTOMATIC_ALIGN avec une priorité de texte très haute, initialement inactive. N'est enregistrée que si le contrôle automatique du véhicule n'est pas disponible. |
| `AutomaticArmControlHarvester.actionEvent(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 454 | ✍ Callback d'entrée : transmet la valeur d'entrée à `setTreeArmAlignmentInput`. |
| `AutomaticArmControlHarvester.updateActionEvents(self: any, state: any)` | 460 | ✍ Active ou désactive l'événement d'action TREE_AUTOMATIC_ALIGN selon l'état donné. |
| `AutomaticArmControlHarvester:onRootVehicleChanged(rootVehicle: table)` | 471 | ✍ Enregistre ou déplace l'action `automaticArmControlHarvester` dans l'action controller du véhicule racine, terminée quand plus aucun retour de bras n'est en attente, ou la supprime s'il n'y a pas de contrôleur. |
| `AutomaticArmControlHarvester.actionControllerEvent(self: any, direction: any)` | 496 | ✍ Callback de l'action controller : une direction négative programme le retour du bras vers son noeud de retour ; dans tous les cas l'état d'alignement est réinitialisé. Renvoie toujours true. |
| `AutomaticArmControlHarvester:getSupportsAutoTreeAlignment()` | 508 | ✍ Renvoie false par défaut ; une tête d'abattage enfant est censée la surcharger pour activer l'alignement automatique sur la grue parente. |
| `AutomaticArmControlHarvester:getIsAutoTreeAlignmentAllowed()` | 514 | ✍ Renvoie true seulement si le véhicule est contrôlé, si le contrôle de bras facile est actif quand il est requis, si le véhicule ou un enfant gère l'alignement automatique, et si le temps de pliage est dans les limites. |
| `AutomaticArmControlHarvester:getAutoAlignHasValidTree(radius: any)` | 551 | ✍ Stub par défaut renvoyant false, false (pas de forme découpable, rayon non valide). Les véhicules enfants la surchargent pour juger le rayon d'un arbre. |
| `AutomaticArmControlHarvester:getAutoAlignTreeMarkerState(foundRadius: any, checkChildren: any)` | 557 | ✍ Demande à ce véhicule, puis à ses véhicules enfants, si un arbre du rayon donné peut être coupé. Renvoie un indicateur de forme découpable trouvée et un indicateur de rayon valide, fusionnés sur les enfants. |
| `AutomaticArmControlHarvester:setTreeArmAlignmentInput(inputValue: any)` | 582 | ✍ Serveur : tant que l'entrée est positive, que ce n'est pas terminé et qu'une cible existe, lance l'alignement ; une entrée 0 réinitialise l'état. Client : mémorise l'entrée et marque le véhicule dirty pour l'envoyer au serveur. |
| `AutomaticArmControlHarvester:doTreeArmAlignment(tx: any, ty: any, tz: any, direction: any)` | 602 | ✍ Fait avancer l'alignement vers un point cible (`direction` 1 vers l'arbre, -1 pour le retour) : prépare les noeuds d'alignement, puis pilote la rotation X, la portée Z et la hauteur Y via `externalMove` et fait avancer l'état. Les surcharges des enfants peuvent remplacer les noeuds de référence et ajouter au décalage X. |
| `AutomaticArmControlHarvester.calculateMovingToolTargetMove(self: any, movingTool: any, targetRot: any)` | 721 | ✍ Prédit où s'arrêterait un outil mobile en rotation et renvoie -1, 0 ou 1 (selon le signe de la vitesse) pour atteindre la rotation cible sans la dépasser. |
| `AutomaticArmControlHarvester.prepareAlignment(self: any, direction: any)` | 776 | ✍ Avant d'aligner vers un arbre, allume le véhicule si possible et remet à plat la tête d'abattage. Puis amène les noeuds d'alignement configurés à leur rotation cible ; renvoie false tant qu'un noeud prérequis bouge encore. |
| `AutomaticArmControlHarvester:getIsAutomaticAlignmentActive()` | 812 | ✍ Renvoie true tant que l'alignement n'est ni au repos ni terminé. |
| `AutomaticArmControlHarvester:getAutomaticAlignmentCurrentTarget()` | 819 | ✍ Renvoie x, y, z de la cible et le rayon de l'arbre quand une cible valide existe, sinon quatre valeurs nil. |
| `AutomaticArmControlHarvester:getAutomaticAlignmentInvalidTreeReason()` | 830 | ✍ Renvoie le code de la raison pour laquelle l'arbre le plus proche a été refusé à cette mise à jour (pas d'accès ou mauvais type), ou le code « aucune ». |
| `AutomaticArmControlHarvester:getBestTreeToAutoAlign(referenceNode: any, trees: any)` | 836 | ✍ Parmi une liste d'identifiants d'arbres, garde les formes découpables statiques et non coupées dans l'angle maximal, puis renvoie le meilleur selon l'angle plus deux fois la distance parmi ceux que l'abatteuse peut couper et atteindre. Renvoie aussi le dernier arbre refusé et pourquoi. |
| `AutomaticArmControlHarvester:onTreeAutoOverlapCallback(objectId: any, ...: any)` | 875 | ✍ Callback du recouvrement asynchrone : collecte les formes ayant un type de découpe, hors souches, dont la distance horizontale au noeud de détection est comprise entre les rayons minimal et maximal. |
| `AutomaticArmControlHarvester:getTreeAutomaticOverwrites()` | 894 | ✍ Renvoie les noeuds de référence Z et Y et le décalage X pour qu'une grue parente puisse les réutiliser. |
| `AutomaticArmControlHarvester.drawDebugCircleRange(node: any, radius: any, steps: any, minRot: any, maxRot: any)` | 901 | ✍ Outil de debug : dessine un arc rouge de segments de ligne autour d'un noeud entre deux angles. Référencé seulement par des lignes de debug commentées. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `getSupportsAutoTreeAlignment` | 107 |
| registerFunction | `getIsAutoTreeAlignmentAllowed` | 108 |
| registerFunction | `getAutoAlignHasValidTree` | 109 |
| registerFunction | `getAutoAlignTreeMarkerState` | 110 |
| registerFunction | `setTreeArmAlignmentInput` | 111 |
| registerFunction | `doTreeArmAlignment` | 112 |
| registerFunction | `getIsAutomaticAlignmentActive` | 113 |
| registerFunction | `getAutomaticAlignmentCurrentTarget` | 114 |
| registerFunction | `getAutomaticAlignmentInvalidTreeReason` | 115 |
| registerFunction | `getBestTreeToAutoAlign` | 116 |
| registerFunction | `onTreeAutoOverlapCallback` | 117 |
| registerFunction | `getTreeAutomaticOverwrites` | 118 |
| registerEventListener | `onLoad` | 129 |
| registerEventListener | `onPostLoad` | 130 |
| registerEventListener | `onDelete` | 131 |
| registerEventListener | `onReadUpdateStream` | 132 |
| registerEventListener | `onWriteUpdateStream` | 133 |
| registerEventListener | `onUpdate` | 134 |
| registerEventListener | `onRegisterActionEvents` | 135 |
| registerEventListener | `onRootVehicleChanged` | 136 |

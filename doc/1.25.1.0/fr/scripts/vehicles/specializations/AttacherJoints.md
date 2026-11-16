# vehicles/specializations/AttacherJoints.lua

*[English version](../../../../scripts/vehicles/specializations/AttacherJoints.md)*

Source: `dataS/scripts/vehicles/specializations/AttacherJoints.lua` — FS25 1.25.1.0

✍ Spécialisation de véhicule qui donne au véhicule des points d'attache (attelage trois points, timon, crochet de remorque...) afin d'y atteler des outils. Elle gère la liste des descripteurs de joints lus dans `vehicle.attacherJoints.attacherJoint(?)`, la liste des outils attelés, la création des joints physiques, l'animation de levage/abaissement des bras inférieurs, des bras supérieurs et des noeuds de rotation, l'attelage rigide (hard attach), l'attelage progressif (smooth attach), la recherche d'un outil à portée, les action events et la synchronisation des attelages (sauvegarde et flux réseau). Elle n'a aucun prérequis (toujours présente) et coopère avec la spécialisation `Attachable` côté outil, ainsi qu'avec les événements réseau `VehicleLowerImplementEvent`, `VehicleDetachEvent` et `VehicleAttachRequestEvent`. Plusieurs fonctions enregistrées ici (par exemple `attachImplement`, `getAttachableInfo`, `setAttacherJointBlocked`, `getAttachControlBarActionAccessible`) et des constantes comme `LOWER_LINK_WIDTH_BY_CATEGORY` n'ont pas de corps dans ce dump du SDK (NON VÉRIFIÉ).

- **AttacherJoints** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AttacherJoints.getClosestLowerLinkCategoryIndex(width: any) → integer` | 40 | ✍ Renvoie la clé de la catégorie de bras inférieurs dont la largeur (table `LOWER_LINK_WIDTH_BY_CATEGORY`, définie hors de ce dump, NON VÉRIFIÉ) est la plus proche de la largeur donnée. Renvoie 1 si la table est vide. |
| `AttacherJoints.initSpecialization()` | 55 | ✍ Enregistre le type de configuration `attacherJoint`, les chemins XML du schéma (joints, sons, durée du combo, ids de config flexibles et prise de force, clés de tableau de bord, chemins différés pour flexibles, côtés de benne et unités de remplissage) ainsi que les clés de sauvegarde des outils attelés et des joints bloqués. |
| `AttacherJoints.registerAttacherJointXMLPaths(schema: any, baseName: any)` | 119 | ✍ Enregistre tous les attributs XML d'un élément `attacherJoint(?)` sous le chemin de base donné : noeud, type de joint, limites, ressorts, bras inférieur, bras supérieur, barres de direction, visuels, object changes, schéma, etc. Utilise l'enregistrement partagé pour que d'autres spécialisations réutilisent ces chemins. |
| `AttacherJoints.registerJointType(name: string)` | 261 | ✍ Enregistre un nouveau type de joint d'attache par son nom : crée la constante `JOINTTYPE_<NOM>` avec l'entier suivant et associe le nom à cette valeur. Ne fait rien si la constante existe déjà. Renvoie la valeur entière. |
| `AttacherJoints.prerequisitesPresent(specializations: any)` | 297 | ✍ Renvoie toujours true : cette spécialisation n'a aucun prérequis sur d'autres spécialisations. |
| `AttacherJoints.registerEvents(vehicleType: any)` | 303 | ✍ Enregistre les événements de véhicule levés par cette spécialisation : `onPreAttachImplement`, `onPostAttachImplement`, `onPreDetachImplement`, `onPostDetachImplement` et `onRequiresTopLightsChanged`. |
| `AttacherJoints.registerFunctions(vehicleType: any)` | 313 | ✍ Enregistre les fonctions que cette spécialisation ajoute au type de véhicule (attelage/dételage, recherche de joints, abaissement, mise à jour graphique, sons, combos, contrôles d'attelage...). Certaines fonctions enregistrées ne sont pas définies dans ce dump (NON VÉRIFIÉ). |
| `AttacherJoints.registerOverwrittenFunctions(vehicleType: any)` | 381 | ✍ Enregistre les surcharges de fonctions de base du véhicule. La plupart répercutent l'appel sur chaque outil attelé (masse, IA, éclairage, caméras, niveaux de remplissage, sélection) ou ajoutent des conditions liées aux joints (pliage, dételage, unités de remplissage, côtés de benne, tableaux de bord). |
| `AttacherJoints.registerEventListeners(vehicleType: any)` | 423 | ✍ Abonne cette spécialisation aux événements de cycle de vie et d'état qu'elle traite (chargement, suppression, flux réseau, mises à jour, action events, éclairage, frein, mise en marche/arrêt, activation, inversion de sens...). |
| `AttacherJoints:onPreLoad(savegame: table)` | 456 | ✍ Initialise le spec du véhicule : liste d'outils attelés vide, aucun outil sélectionné et l'index tournant utilisé par la recherche d'outil à portée. |
| `AttacherJoints:onLoad(savegame: table)` | 467 | ✍ Lit la durée du combo et la distance de mise à jour, charge chaque point d'attache depuis le XML dans `spec.attacherJoints`, prépare les tables d'information d'attelage, les sons côté client, les textes, les données du raycast de hauteur au sol et le dirty flag. En version de développement, signale les sons d'attache/hydraulique manquants. |
| `AttacherJoints:onPostLoad(savegame: table)` | 572 | ✍ Termine la préparation des joints après le chargement : mémorise les transformations d'origine, calcule les limites des noeuds de translation, relie les bras inférieurs dépendants, applique les rotations de départ, précalcule les décalages vers les joints d'entrée et le noeud racine IA, construit la liste des combos, applique la largeur par défaut des bras inférieurs et restaure le sens du combo depuis la sauvegarde. Sans joint, retire la plupart des écouteurs d'événements. |
| `AttacherJoints:onLoadFinished(savegame: table)` | 687 | ✍ Restaure les attelages sauvegardés : attelle les outils dont le véhicule est déjà chargé (par identifiant unique), met les autres en attente, restaure les joints bloqués et s'abonne à `VEHICLE_LOADED` tant que des attelages restent en attente. Ignoré si la sauvegarde réinitialise les véhicules, sauf si la position est conservée. |
| `AttacherJoints:onRegisterDashboardValueTypes()` | 730 | ✍ Enregistre les types de valeur de tableau de bord `bottomArmPosition`, `bottomArmPositionMin` et `bottomArmPositionMax` (0 à 100 pour cent, dérivés de l'alpha de déplacement du joint) pour un bras inférieur choisi par noeud ou liste de noeuds dans le XML du tableau de bord. |
| `AttacherJoints:onPreDelete()` | 823 | ✍ Avant la suppression du véhicule, dételle tous les outils attelés sauf les attelages additionnels (ceux-ci sont dételés par l'attelage principal). |
| `AttacherJoints:onDelete()` | 839 | ✍ Libère les ressources des joints d'attache : échantillons sonores des joints, objets de bras supérieur, requêtes i3d partagées des barres d'outils et échantillons sonores de la spécialisation. |
| `AttacherJoints:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 867 | ✍ Sauvegarde dans le XML de la partie le sens du combo, chaque outil attelé (index du joint, état abaissé, identifiant unique de l'outil, index du joint d'entrée) et les index des joints bloqués. |
| `AttacherJoints:onReadStream(streamId: integer, connection: Connection)` | 905 | ✍ Côté client, à la connexion : lit le nombre d'outils puis, pour chacun, l'objet réseau, les index de joints et l'état abaissé, et le réattelle localement (sans attelage progressif) si l'objet est déjà synchronisé. |
| `AttacherJoints:onWriteStream(streamId: integer, connection: Connection)` | 923 | ✍ Côté serveur, à la connexion : écrit le nombre d'outils attelés puis, pour chacun, l'objet réseau, l'index du joint d'entrée, l'index du joint et l'état abaissé. Pendant de `onReadStream`. |
| `AttacherJoints:onUpdateInterpolation(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 946 | ✍ Met à jour les graphismes des joints des outils attelés lorsque le véhicule est à moins de `maxUpdateDistance` de la caméra, et relève `onUpdateInterpolation` sur les outils attelés en dur car leur position suit la nôtre. |
| `AttacherJoints:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 976 | ✍ Client : affiche le texte « attelage non autorisé » pendant son délai. Recherche les véhicules attelables à portée (serveur avec attelage automatique, ou client dont l'action d'attelage est enregistrée) ; sinon efface l'information d'attelage. |
| `AttacherJoints:onUpdateEnd(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 1001 | ✍ Force la mise à jour graphique de tous les outils attelés quel que soit l'éloignement de la caméra, juste avant que le véhicule puisse s'endormir, pour que l'état visuel soit correct au retour dans la zone. |
| `AttacherJoints:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 1019 | ✍ Logique principale à chaque tick : termine l'attelage progressif côté serveur (attelage rigide puis post-attelage), anime l'abaissement et le relevage (alpha, noeuds de rotation, repère du joint), met à jour les limites de rotation/translation côté serveur, pilote le son hydraulique, exécute la séquence du combo « tout abaisser », rafraîchit les action events et gère l'attelage automatique mobile. |
| `AttacherJoints:loadAttachmentsFinished()` | 1214 | ✍ Appelée quand tous les attelages sauvegardés sont en place. Sur le véhicule racine, réapplique l'objet sélectionné (et sa sous-sélection) lu dans la sauvegarde, puis efface les index mémorisés. |
| `AttacherJoints:handleLowerImplementEvent(vehicle: any, direction: any)` | 1231 | ✍ Traite l'action d'abaissement : détermine l'outil cible (donné, unique ou sélectionné), trouve le véhicule auquel il est attelé et lui demande d'abaisser ou relever via `handleLowerImplementByAttacherJointIndex`. |
| `AttacherJoints:handleLowerImplementByAttacherJointIndex(attacherJointIndex: any, direction: any)` | 1257 | ✍ Abaisse ou relève l'outil du joint donné (bascule si la direction est nil) si l'outil et le joint l'autorisent, via `setJointMoveDown`. Sinon affiche l'avertissement clignotant de l'outil, s'il existe. |
| `AttacherJoints:getAttachedImplements()` | 1280 | ✍ Renvoie la liste des tables d'outils attelés (`object`, `jointDescIndex`, `inputJointDescIndex`...). |
| `AttacherJoints:getAttacherJoints()` | 1286 | ✍ Renvoie la liste des descripteurs de points d'attache de ce véhicule. |
| `AttacherJoints:getAttacherJointByJointDescIndex(jointDescIndex: any)` | 1292 | ✍ Renvoie le descripteur de joint à l'index donné, ou nil. |
| `AttacherJoints:getAttacherJointIndexByNode(node: any)` | 1298 | ✍ Renvoie l'index du joint dont le noeud de transformation est le noeud donné, ou nil s'il n'y en a pas. |
| `AttacherJoints:getAttacherJointByNode(node: any)` | 1312 | ✍ Renvoie le descripteur du joint dont le noeud de transformation est le noeud donné, ou nil. |
| `AttacherJoints:getImplementFromAttacherJointIndex(attacherJointIndex: any)` | 1326 | ✍ Renvoie la table de l'outil attelé utilisant l'index de joint donné, ou nil. Même recherche que `getImplementByJointDescIndex`. |
| `AttacherJoints:getAttacherJointIndexFromObject(object: any)` | 1339 | ✍ Renvoie l'index du joint auquel le véhicule donné est attelé, ou nil s'il n'est pas attelé ici. |
| `AttacherJoints:getAttacherJointDescFromObject(object: any)` | 1352 | ✍ Renvoie le descripteur du joint auquel le véhicule donné est attelé, ou nil. |
| `AttacherJoints:getAttacherJointIndexFromImplementIndex(implementIndex: any)` | 1365 | ✍ Renvoie l'index du joint utilisé par l'outil situé à la position donnée dans la liste des outils attelés, ou nil. |
| `AttacherJoints:getObjectFromImplementIndex(implementIndex: any)` | 1376 | ✍ Renvoie le véhicule de l'outil situé à la position donnée dans la liste des outils attelés, ou nil. |
| `AttacherJoints:updateAttacherJointGraphics(implement: table, dt: number, forceUpdate: any)` | 1389 | ✍ Mise à jour visuelle d'un outil attelé : oriente le bras inférieur vers le joint d'entrée de l'outil (avec lissage pendant l'attelage), étire son noeud de translation, place le noeud de position du joint, oriente la barre d'outils, met à jour les pièces mobiles, le bras supérieur et les noeuds d'alignement visuel. |
| `AttacherJoints:calculateAttacherJointMoveUpperLowerAlpha(jointDesc: table, object: table, initial: boolean)` | 1527 | ✍ Calcule les alphas de déplacement haut et bas (0 à 1) d'un joint pour un outil à partir des distances au sol, en s'appuyant si possible sur les noeuds de hauteur et un raycast terrain asynchrone. Renvoie deux valeurs égales si l'abaissement n'est pas permis (selon l'état abaissé par défaut). |
| `AttacherJoints:doGroundHeightNodeCheck()` | 1629 | ✍ Lance l'étape suivante du contrôle de hauteur au sol : pour le noeud de hauteur courant, calcule les positions monde haute et basse et déclenche un raycast terrain asynchrone. Si le noeud est désactivé, passe au suivant ou termine. |
| `AttacherJoints:finishGroundHeightNodeCheck()` | 1680 | ✍ Termine le contrôle des noeuds de hauteur : à partir de la plus courte distance de rayon trouvée, déduit les alphas haut et bas (avec une correction car le bras tourne sur un arc alors que le rayon est droit), les borne à 0..1 et réinitialise l'index du contrôle. |
| `AttacherJoints:groundHeightNodeCheckCallback(hitObjectId: integer, x: number, y: number, z: number, distance: number, nx: number, ny: number, nz: number, subShapeIndex: integer, shapeId: integer, isLast: boolean) → boolean` | 1743 | ✍ Callback du raycast du contrôle de hauteur. Seuls les corps rigides statiques comptent ; conserve l'impact le plus proche et les données de son rayon, ignore les autres corps sauf pour le dernier impact, puis passe au noeud suivant ou termine. Renvoie false pour arrêter, true pour continuer après un impact non statique. |
| `AttacherJoints:updateAttacherJointRotation(jointDesc: table, object: table)` | 1794 | ✍ Fait pivoter le noeud du joint autour de son axe Z local selon la différence entre les décalages de rotation interpolés de l'outil et du véhicule pour l'alpha de déplacement courant. |
| `AttacherJoints:updateAttacherJointRotationNodes(jointDesc: any, alpha: any)` | 1808 | ✍ Règle le noeud de rotation du joint et son second noeud par interpolation entre leurs rotations haute et basse selon l'alpha donné (0 = haut, 1 = bas). |
| `AttacherJoints:updateAttacherJointSettingsByObject(vehicle: any, updateLimit: any, updateRotationOffset: any, updateDistanceToGround: any)` | 1819 | ✍ Recalcule à la demande les limites du joint, le décalage de rotation (en réglant aussi le repère du joint côté serveur) et/ou les alphas de distance au sol pour le joint portant le véhicule donné. Rafraîchit les tableaux de bord min/max du bras inférieur côté client. |
| `AttacherJoints:setAttacherJointBottomArmWidth(jointDescIndex: any, width: any)` | 1857 | ✍ Règle l'écartement du bras inférieur d'un joint à la largeur donnée (largeur par défaut si nil) en orientant ou translatant les bras gauche et droit, et n'affiche que la barre d'outils de la catégorie la plus proche. Sans effet si le bras inférieur n'a pas de largeur variable. |
| `AttacherJoints:attachImplementFromInfo(info: any)` | 1907 | ✍ Attelle l'outil décrit par une table d'information d'attelage (véhicule, index de joints, outil) si le joint cible est libre. Gère la résolution des attelages multiples, refuse un second outil dans la même direction sur mobile, et renvoie true si l'attelage a eu lieu. |
| `AttacherJoints:postAttachImplement(implement: any)` | 2214 | ✍ Dernière étape d'un attelage : active le bras supérieur, affiche bras inférieur et barre d'outils, aligne les noeuds gauche/droit et visuels, applique les object changes différés, joue le son d'attache (pas en chargement de sauvegarde), lève `onPostAttachImplement`, appelle `postAttach` sur l'outil et lève le changement d'état ATTACH sur le véhicule racine. |
| `AttacherJoints:createAttachmentJoint(implement: table, noSmoothAttach: boolean)` | 2276 | ✍ Serveur uniquement : construit le joint physique entre le joint du véhicule et le joint d'entrée de l'outil avec limites de rotation/translation, ressorts, amortissement et limites de force, éventuellement en attelage progressif, et gère les collisions par paire. Côté client, met seulement l'index du joint à 1 pour signaler qu'il est occupé. |
| `AttacherJoints:hardAttachImplement(implement: table)` | 2448 | ✍ Fusionne rigidement le composant de l'outil dans le nôtre : détèle temporairement ses propres outils, retire les véhicules de la physique, en fait un enfant composé lié au joint, relie les visuels, remet la physique, met à jour les noeuds racines des joints, réattelle les sous-outils et marque la masse comme modifiée. Renvoie true. |
| `AttacherJoints:hardDetachImplement(implement: table)` | 2547 | ✍ Annule un attelage rigide : restaure les noeuds racines des joints, refait du composant de l'outil un composé autonome lié à la racine de la scène à sa pose monde, restaure son noeud visuel, refait la physique de la chaîne, efface le drapeau d'attelage rigide et marque la masse comme modifiée. Renvoie true. |
| `AttacherJoints:detachImplement(implementIndex: integer, noEventSend: boolean) → boolean` | 2605 | ✍ Dételle l'outil à l'index donné de la liste. Sans `noEventSend`, le serveur diffuse `VehicleDetachEvent` et un client envoie une demande puis retourne. Supprime le joint physique, restaure visuels, bras inférieur/supérieur et sons, lève les événements avant/après dételage, met à jour la sélection et les feux de toit, et renvoie true. |
| `AttacherJoints:detachImplementByObject(object: table, noEventSend: boolean) → boolean` | 2820 | ✍ Dételle l'outil correspondant au véhicule donné en retrouvant son index puis en appelant `detachImplement`. Renvoie toujours true, même si rien n'a été trouvé. |
| `AttacherJoints:setSelectedImplementByObject(object: any)` | 2835 | ✍ Mémorise l'entrée d'outil du véhicule donné comme outil sélectionné de ce véhicule. |
| `AttacherJoints:getSelectedImplement()` | 2841 | ✍ Renvoie l'outil sélectionné, ou nil s'il n'est plus attelé à ce véhicule. |
| `AttacherJoints:getCanToggleAttach()` | 2856 | ✍ Renvoie true par défaut ; point d'extension surchargeable qui décide si l'entrée d'attelage/dételage est disponible. |
| `AttacherJoints:getShowAttachControlBarAction()` | 2866 | ✍ Indique s'il faut afficher l'action d'attelage/dételage de la barre de contrôle : false pendant la conduite IA, true si le véhicule sélectionné est attelé à quelque chose, si rien n'est sélectionné alors qu'une information d'attelage existe, ou si un outil est à portée de ce véhicule. |
| `AttacherJoints:detachAttachedImplement()` | 2894 | ✍ Déclenche le gestionnaire de l'action d'attelage/dételage (`actionEventAttach`) si la bascule est possible. |
| `AttacherJoints:startAttacherJointCombo(force: any)` | 2902 | ✍ Démarre le combo « tout abaisser » en inversant son sens et en le marquant actif, sauf si un combo est déjà en cours et que `force` n'est pas donné. |
| `AttacherJoints:getIsAttachingAllowed(attacherJoint: any)` | 2921 | ✍ Indique si un joint peut recevoir un outil : false s'il est déjà occupé, bloqué ou désactivé parce qu'un outil occupe l'un des joints de sa liste `disabledByAttacherJoints`. |
| `AttacherJoints:getIsAttacherJointCompatible(vehicle: any, attacherJoint: any, inputAttacherVehicle: any, inputAttacherJoint: any)` | 2944 | ✍ Point d'extension de compatibilité surchargeable ; renvoie true par défaut. Appelé à la fin de `getAttacherJointCompatibility` ; peut renvoyer false avec un texte d'avertissement. |
| `AttacherJoints:getCanSteerAttachable(attachable: table) → boolean` | 2952 | ✍ Renvoie true si le joint portant l'outil donné possède des noeuds de barres de direction ou impose l'usage de l'essieu directeur, c'est-à-dire que ce véhicule peut diriger l'essieu de l'outil. |
| `AttacherJoints:onAttacherJointsVehicleLoaded(vehicle: table)` | 2966 | ✍ Callback du message `VEHICLE_LOADED` : attelle tout attelage sauvegardé en attente correspondant à l'identifiant unique du véhicule chargé ; quand il n'en reste plus, appelle `loadAttachmentsFinished` et se désabonne. |
| `AttacherJoints:registerSelfLoweringActionEvent(actionEventsTable: any, inputAction: any, target: any, callback: any, triggerUp: any, triggerDown: any, triggerAlways: any, startActive: any, callbackState: any, customIconName: any, ignoreCollisions: any)` | 2993 | ✍ Point d'extension vide dans cette spécialisation (aucune logique) ; d'autres spécialisations peuvent le surcharger pour enregistrer leur propre action d'abaissement. |
| `AttacherJoints:playAttachSound(jointDesc: table) → boolean` | 3000 | ✍ Client uniquement : joue l'échantillon d'attache propre au joint, ou celui par défaut du véhicule. Renvoie true. |
| `AttacherJoints:playDetachSound(jointDesc: table) → boolean` | 3018 | ✍ Client uniquement : joue l'échantillon de dételage du joint, sinon celui du véhicule, sinon se rabat sur un échantillon d'attache. Renvoie true. |
| `AttacherJoints:detachingIsPossible() → boolean` | 3039 | ✍ Renvoie true si le véhicule sélectionné est un outil attelé que son véhicule porteur référence et dont le dételage est actuellement autorisé. |
| `AttacherJoints:attachAdditionalAttachment(jointDesc: any, inputJointDesc: any, object: any)` | 3055 | ✍ Lorsqu'un outil déclare un attelage additionnel, charge cet article du magasin sur le joint de direction opposée et de type correspondant (si tous les joints de cette direction sont libres) et l'attelle ensuite via `additionalAttachmentLoaded`. |
| `AttacherJoints:detachAdditionalAttachment(jointDesc: any, inputJointDesc: any)` | 3103 | ✍ Au dételage, si un attelage additionnel a été créé pour ce joint, le dételle et supprime le véhicule (sauf si le jeu est en train de quitter). |
| `AttacherJoints:additionalAttachmentLoaded(vehicles: any, vehicleLoadState: any, asyncCallbackArguments: any)` | 3121 | ✍ Callback asynchrone après le chargement d'un attelage additionnel : journalise un avertissement en cas d'échec, place le véhicule au niveau du joint au-dessus du terrain, l'attelle, le marque comme attelage additionnel, copie la saleté de l'outil principal et met à jour la sélection. À noter : le sixième argument est un nom de fichier mais les avertissements lisent `.xmlFilename` dessus comme s'il s'agissait d'une table. |
| `AttacherJoints:getImplementIndexByJointDescIndex(jointDescIndex: integer) → integer` | 3161 | ✍ Renvoie la position dans la liste des outils attelés de l'outil utilisant l'index de joint donné, ou nil. |
| `AttacherJoints:getImplementByJointDescIndex(jointDescIndex: integer) → table` | 3177 | ✍ Renvoie la table de l'outil attelé utilisant l'index de joint donné, ou nil. |
| `AttacherJoints:getImplementIndexByObject(object: table) → integer` | 3193 | ✍ Renvoie la position du véhicule donné dans la liste des outils attelés, ou nil. |
| `AttacherJoints:getImplementByObject(object: table) → table` | 3209 | ✍ Renvoie la table d'outil attelé du véhicule donné, ou nil. |
| `AttacherJoints:callFunctionOnAllImplements(functionName: any, ...: any)` | 3223 | ✍ Appelle la fonction nommée avec les arguments supplémentaires sur chaque outil directement attelé qui la possède. Les valeurs de retour sont ignorées. |
| `AttacherJoints:activateAttachments()` | 3236 | ✍ Appelle `activate` sur chaque outil attelé. |
| `AttacherJoints:deactivateAttachments()` | 3248 | ✍ Appelle `deactivate` sur chaque outil attelé. |
| `AttacherJoints:deactivateAttachmentsLights()` | 3260 | ✍ Appelle `deactivateLights` sur chaque outil attelé qui la définit. |
| `AttacherJoints:setJointMoveDown(jointDescIndex: integer, moveDown: boolean, noEventSend: boolean) → boolean` | 3276 | ✍ Règle l'état abaissé d'un joint : s'il change et que l'abaissement est permis, lance le mouvement et appelle `setLowered` sur l'outil. Envoie `VehicleLowerImplementEvent` pour le changement sauf si `noEventSend`. Renvoie true. |
| `AttacherJoints:getJointMoveDown(jointDescIndex: integer) → boolean` | 3306 | ✍ Renvoie l'état abaissé du joint, toujours false si le joint n'autorise pas l'abaissement. |
| `AttacherJoints:getIsHardAttachAllowed(jointDescIndex: integer) → boolean` | 3319 | ✍ Renvoie le drapeau `supportsHardAttach` du joint. |
| `AttacherJoints:getIsSmoothAttachUpdateAllowed(implement: any)` | 3327 | ✍ Point d'extension qui décide si la progression de l'attelage progressif peut avancer pour un outil ; renvoie true par défaut. |
| `AttacherJoints:loadAttacherJointFromXML(attacherJoint: table, xmlFile: integer, baseName: string, index: integer)` | 3337 | ✍ Charge un descripteur de joint depuis le XML dans la table donnée : noeud, type, restrictions, noeuds de rotation/translation, distance au sol, limites, ressorts, bras inférieur (avec plage de largeur et i3d de barre d'outils), bras supérieur, barres de direction, visuels, object changes, direction, schéma et sons. Renvoie false (avec un avertissement) si le noeud manque. |
| `AttacherJoints:onBottomArmToolbarI3DLoaded(i3dNode: integer, failedReason: table, args: table)` | 3791 | ✍ Callback asynchrone après le chargement de l'i3d des barres d'outils : lie sa racine sous le noeud de référence du bras inférieur, la masque, choisit le maillage enfant correspondant à la catégorie de largeur par défaut, mémorise les noeuds de barre d'outils et supprime la racine i3d temporaire. |
| `AttacherJoints:raiseActive(superFunc: any)` | 3819 | ✍ Surcharge : réveille le véhicule et active aussi chaque outil attelé. |
| `AttacherJoints:registerActionEvents(superFunc: any, excludedVehicle: any)` | 3832 | ✍ Surcharge : après l'enregistrement de base, enregistre d'abord les action events du véhicule de l'objet sélectionné (pour qu'ils soient prioritaires), puis ceux de chaque outil attelé. À noter : appelle `printCallstack` puis déréférence la sélection si aucun objet n'est sélectionné. |
| `AttacherJoints:removeActionEvents(superFunc: any)` | 3855 | ✍ Surcharge : supprime les action events de ce véhicule et ceux de chaque outil attelé. |
| `AttacherJoints:addToPhysics(superFunc: any) → boolean` | 3870 | ✍ Surcharge : ajoute le véhicule à la physique, puis recrée le joint de chaque outil attelé souplement (sans attelage progressif) ou appelle `addToPhysics` sur les outils attelés en dur. Renvoie false si l'appel de base échoue. |
| `AttacherJoints:removeFromPhysics(superFunc: any) → boolean` | 3891 | ✍ Surcharge : remet à zéro l'index de joint des outils attelés souplement (les outils attelés en dur sont retirés de la physique eux-mêmes) avant le retrait de base. Renvoie false si l'appel de base échoue. |
| `AttacherJoints:getTotalMass(superFunc: boolean, onlyGivenVehicle: boolean) → number` | 3917 | ✍ Surcharge : ajoute la masse totale de chaque outil attelé à la masse de base, sauf si `onlyGivenVehicle` vaut true. |
| `AttacherJoints:getAdditionalComponentMass(superFunc: any, component: any)` | 3935 | ✍ Surcharge : pour le composant racine, ajoute la masse propre des outils attelés en dur, puisqu'ils sont fusionnés dans ce composant. |
| `AttacherJoints:addChildVehicles(superFunc: table, vehicles: table, rootVehicle: any)` | 3954 | ✍ Surcharge : collecte dans la liste les véhicules enfants de chaque outil attelé avant d'appeler la fonction de base. |
| `AttacherJoints:getAirConsumerUsage(superFunc: any) → number` | 3970 | ✍ Surcharge : ajoute à la consommation d'air de base celle déclarée par les outils attelés. |
| `AttacherJoints:getRequiresPower(superFunc: any)` | 3986 | ✍ Surcharge : renvoie true dès qu'un outil attelé a besoin de puissance, sinon la valeur de base. |
| `AttacherJoints:addVehicleToAIImplementList(superFunc: any, list: any)` | 4001 | ✍ Surcharge : appelle la fonction de base puis laisse chaque outil attelé s'ajouter à la liste des outils IA. |
| `AttacherJoints:collectAIAgentAttachments(superFunc: any, aiDrivableVehicle: any)` | 4014 | ✍ Surcharge : collecte les attachements d'agent IA de chaque outil attelé et démarre une nouvelle chaîne d'attachements après chacun. |
| `AttacherJoints:setAIVehicleObstacleStateDirty(superFunc: any)` | 4028 | ✍ Surcharge : marque aussi l'état d'obstacle IA comme modifié sur chaque outil attelé. |
| `AttacherJoints:getDirectionSnapAngle(superFunc: any)` | 4041 | ✍ Surcharge : cumule l'angle d'aimantation de direction des outils attelés sur la valeur de base. À noter : `math.max` ne reçoit qu'un argument (la somme), donc il ne choisit aucun maximum. |
| `AttacherJoints:getFillLevelInformation(superFunc: any, display: any)` | 4057 | ✍ Surcharge : collecte aussi les informations de niveau de remplissage de chaque outil attelé dans l'affichage. |
| `AttacherJoints:getHasObjectMounted(superFunc: table, object: table) → boolean` | 4074 | ✍ Surcharge : renvoie true si le contrôle de base réussit ou si un outil attelé (récursivement) porte l'objet donné. |
| `AttacherJoints:attachableAddToolCameras(superFunc: any)` | 4093 | ✍ Surcharge : ajoute aussi les caméras d'outil de chaque outil attelé. |
| `AttacherJoints:attachableRemoveToolCameras(superFunc: any)` | 4107 | ✍ Surcharge : retire aussi les caméras d'outil de chaque outil attelé. |
| `AttacherJoints:registerSelectableObjects(superFunc: any, selectableObjects: any)` | 4121 | ✍ Surcharge : laisse aussi chaque outil attelé enregistrer ses objets sélectionnables. |
| `AttacherJoints:getIsReadyForAutomatedTrainTravel(superFunc: any)` | 4135 | ✍ Surcharge : renvoie false si un outil attelé n'est pas prêt pour le déplacement automatisé en train, sinon le résultat de base. |
| `AttacherJoints:getIsAutomaticShiftingAllowed(superFunc: any)` | 4151 | ✍ Surcharge : interdit le changement de rapport automatique à basse vitesse (moins de 2) pendant un attelage ou le mouvement d'un joint, et lorsqu'un outil attelé l'interdit ; sinon le résultat de base. |
| `AttacherJoints:loadDashboardGroupFromXML(superFunc: any, xmlFile: any, key: any, group: any)` | 4180 | ✍ Surcharge : après le chargement de base, lit `#attacherJointIndices` et `#attacherJointNodes` d'un groupe de tableau de bord pour le limiter à certains points d'attache. |
| `AttacherJoints:getIsDashboardGroupActive(superFunc: any, group: any)` | 4208 | ✍ Surcharge : convertit en index les noeuds de joints en attente d'un groupe une fois le chargement terminé, puis renvoie false si aucun des joints du groupe ne porte d'outil ; sinon le résultat de base. |
| `AttacherJoints:loadAttacherJointHeightNode(superFunc: any, xmlFile: any, key: any, heightNode: any, attacherJointNode: any)` | 4246 | ✍ Surcharge : lit `#disablingAttacherJointIndices` pour un noeud de hauteur, puis appelle le chargeur de base. |
| `AttacherJoints:getIsAttacherJointHeightNodeActive(superFunc: any, heightNode: any)` | 4254 | ✍ Surcharge : renvoie false si un outil est attelé à l'un des joints qui désactivent ce noeud de hauteur, sinon le résultat de base. |
| `AttacherJoints:loadTipSide(superFunc: any, xmlFile: any, key: any, entry: any)` | 4266 | ✍ Surcharge : après le chargement de base, lit `#disablingAttacherJointNodes` d'un côté de benne (mémorisé seulement s'il n'est pas vide). Renvoie false si le chargement de base échoue. |
| `AttacherJoints:getIsTipSideAvailable(superFunc: any, sideIndex: any)` | 4281 | ✍ Surcharge : un côté de benne devient indisponible lorsqu'un outil est attelé à l'un des joints listés comme le désactivant (noeuds convertis en index à la demande). Utilise `spec_trailer`, donc suppose la présence de la spécialisation Trailer. |
| `AttacherJoints:loadFillUnitFromXML(superFunc: any, xmlFile: any, key: any, entry: any, index: any)` | 4317 | ✍ Surcharge : après le chargement de base, lit `#disablingAttacherJointNodes` d'une unité de remplissage (mémorisé seulement s'il n'est pas vide). Renvoie false si le chargement de base échoue. |
| `AttacherJoints:getFillUnitSupportsToolType(superFunc: any, fillUnitIndex: any, toolType: any)` | 4333 | ✍ Surcharge : une unité de remplissage ne supporte plus le type d'outil lorsqu'un outil est attelé à un joint listé comme la désactivant. S'appuie sur `spec_fillUnit`. |
| `AttacherJoints:isDetachAllowed(superFunc: any) → boolean` | 4370 | ✍ Surcharge : refuse le dételage quand un joint dont `allowDetachingWhileLifted` est false porte un outil non abaissé (sauf si l'outil l'impose), en renvoyant false et l'avertissement « abaissez d'abord l'outil » avec le type de l'outil. |
| `AttacherJoints:getIsFoldAllowed(superFunc: any, direction: any, onAiTurnOn: any)` | 4396 | ✍ Surcharge : refuse le pliage (false plus texte d'avertissement) tant qu'un outil est attelé à un joint dont `allowFoldingWhileAttached` est false ; sinon le résultat de base. |
| `AttacherJoints:getIsWheelFoliageDestructionAllowed(superFunc: any, wheel: any) → boolean` | 4412 | ✍ Surcharge : les roues ne peuvent pas détruire la végétation si la base refuse ou si un outil attelé bloque cette destruction. |
| `AttacherJoints:getAreControlledActionsAllowed(superFunc: any) → boolean, string` | 4436 | ✍ Surcharge : les actions contrôlées sont refusées (avec l'avertissement) si la base ou un outil attelé les refuse, ou pendant un attelage en cours. |
| `AttacherJoints:getConnectionHoseConfigIndex(superFunc: any)` | 4464 | ✍ Surcharge : renvoie l'index de configuration des flexibles de connexion issu de `vehicle.attacherJoints#connectionHoseConfigId`, remplacé par l'entrée de la configuration d'attache sélectionnée le cas échéant. |
| `AttacherJoints:getPowerTakeOffConfigIndex(superFunc: any)` | 4478 | ✍ Surcharge : renvoie l'index de configuration de la prise de force issu de `vehicle.attacherJoints#powerTakeOffConfigId`, remplacé par l'entrée de la configuration d'attache sélectionnée le cas échéant. |
| `AttacherJoints:loadHoseTargetNode(superFunc: any, xmlFile: any, targetKey: any, entry: any)` | 4492 | ✍ Surcharge : après le chargement de base, lit `#blockedByAttacherJointNodes` d'une cible de flexible et le range dans `blockedByAttacherJointIndices` (ce sont encore des noeuds à ce stade, résolus plus tard). |
| `AttacherJoints:getIsConnectionTargetUsed(superFunc: any, desc: any)` | 4507 | ✍ Surcharge : une cible de connexion de flexible est considérée utilisée si la base le dit ou si un outil est attelé à un joint qui la bloque. |
| `AttacherJoints:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 4529 | ✍ Client : reconstruit les action events du véhicule lorsqu'il est actif pour l'entrée (sélection ignorée) : abaisser l'outil sélectionné, tout abaisser, atteler et dételer. Enregistre l'action d'auto-abaissement si ce véhicule est sélectionné, avec repli sur l'outil unique. |
| `AttacherJoints:onActivate()` | 4580 | ✍ Active tous les outils attelés lorsque le véhicule est activé. |
| `AttacherJoints:onDeactivate()` | 4586 | ✍ Désactive tous les outils attelés et, côté client, arrête le son hydraulique. |
| `AttacherJoints:onReverseDirectionChanged(direction: any)` | 4597 | ✍ Recalcule le temps de chaque joint du combo : inversé par rapport à la durée du combo lorsque l'inverseur est en marche arrière, sinon remis à son temps initial. |
| `AttacherJoints:onStateChange(state: any, data: any)` | 4614 | ✍ Transmet le changement d'état du véhicule à chaque outil attelé ; sur LOWER_ALL_IMPLEMENTS, démarre le combo « tout abaisser » si le véhicule a des joints. |
| `AttacherJoints:onLightsTypesMaskChanged(lightsTypesMask: any)` | 4632 | ✍ Serveur uniquement : recopie le masque des types de feux sur chaque outil attelé qui le gère. |
| `AttacherJoints:onTurnLightStateChanged(state: any)` | 4648 | ✍ Transmet l'état des clignotants aux outils attelés qui gèrent les clignotants. |
| `AttacherJoints:onBrakeLightsVisibilityChanged(visibility: any)` | 4660 | ✍ Transmet la visibilité des feux de freinage aux outils attelés qui la gèrent. |
| `AttacherJoints:onReverseLightsVisibilityChanged(visibility: any)` | 4672 | ✍ Transmet la visibilité des feux de recul aux outils attelés qui la gèrent. |
| `AttacherJoints:onBeaconLightsVisibilityChanged(visibility: any)` | 4684 | ✍ Transmet la visibilité des gyrophares aux outils attelés qui la gèrent. |
| `AttacherJoints:onBrake(brakePedal: any)` | 4696 | ✍ Transmet la valeur de la pédale de frein aux outils attelés qui ont une fonction `brake`. |
| `AttacherJoints:onTurnedOn()` | 4708 | ✍ Met en marche les outils attelés dont la spécialisation TurnOnVehicle est marquée comme démarrée par le véhicule porteur. |
| `AttacherJoints:onTurnedOff()` | 4725 | ✍ Arrête les outils attelés dont la spécialisation TurnOnVehicle est marquée comme démarrée par le véhicule porteur. |
| `AttacherJoints:onLeaveVehicle()` | 4742 | ✍ Lève `onLeaveRootVehicle` sur chaque outil attelé lorsque le joueur quitte ce véhicule. |
| `AttacherJoints.getAttacherJointCompatibility(vehicle: any, attacherJoint: any, inputAttacherVehicle: any, inputAttacherJoint: any)` | 4761 | ✍ Vérifie qu'un joint d'outil peut s'accoupler à un joint du véhicule : direction imposée, état bloqué, correspondance des sous-types, restrictions de marque et de chemin de véhicule, puis le point d'extension `getIsAttacherJointCompatible`. Renvoie true, ou false avec un texte d'avertissement éventuel. |
| `AttacherJoints.findVehicleInAttachRange()` | 4858 | ✍ Fonction obsolète : se contente de journaliser un message renvoyant vers `updateVehiclesInAttachRange`. Ne renvoie rien. |
| `AttacherJoints.updateVehiclesInAttachRange(vehicle: any, maxDistanceSq: any, maxAngle: any, fullUpdate: any)` | 4864 | ✍ Cherche le joint d'entrée libre et compatible le plus proche, dans les limites de distance et d'angle, pour le véhicule et ses outils, en répartissant le balayage sur plusieurs images sauf si `fullUpdate`. Renvoie véhicule porteur, index de joint, outil, son index de joint et avertissement. À noter : appelle la fonction globale `getAttacherJointCompatibility` et non celle de `AttacherJoints.`. |
| `AttacherJoints.actionEventAttach(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 4976 | ✍ Callback d'entrée de l'action d'attelage : si un outil est à portée, vérifie les droits puis attelle côté serveur ou envoie `VehicleAttachRequestEvent` depuis un client ; sinon lance le dételage de l'outil sélectionné, ou affiche un avertissement si c'est interdit. |
| `AttacherJoints.actionEventDetach(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 5009 | ✍ Callback d'entrée de l'action de dételage : lance le dételage de l'outil sélectionné si c'est permis, sinon affiche l'avertissement (ou un texte par défaut). |
| `AttacherJoints.actionEventLowerImplement(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 5024 | ✍ Callback d'entrée pour l'abaissement : appelé avec l'outil comme `self`, il transmet à `handleLowerImplementEvent` du véhicule porteur. |
| `AttacherJoints.actionEventLowerAllImplements(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 5033 | ✍ Callback d'entrée pour tout abaisser : démarre le combo (forcé) et lève le changement d'état LOWER_ALL_IMPLEMENTS sur le véhicule racine. |
| `AttacherJoints.updateActionEvents(self: any)` | 5041 | ✍ Client : met à jour le texte, la visibilité et la priorité de l'action d'attelage (atteler ou dételer, vérification des droits, avertissements) ainsi que l'état et le texte de l'action d'abaissement selon l'outil sélectionné. |
| `AttacherJoints.updateAttacherJointLimits(implement: any, attacherJointDesc: any, inputAttacherJointDesc: any, axis: any)` | 5112 | ✍ Calcule les limites de rotation et de translation d'un axe à partir des limites et échelles du joint et du joint d'entrée (nulles si rotation fixe), les stocke sur l'outil et renvoie les limites courantes interpolées par l'alpha de déplacement. Les variables locales `upperTransLimit`/`lowerTransLimit` sont inversées mais utilisées de façon cohérente. |
| `AttacherJoints.updateAttacherJointRotationLimit(implement: any, attacherJointDesc: any, axis: any, force: any, alpha: any)` | 5150 | ✍ Interpole la limite de rotation d'un axe selon l'alpha et, si elle a sensiblement changé (ou si forcé), l'applique au joint physique en respectant les options de verrouillage haut/bas et de limite basse dynamique sur l'axe 3. |
| `AttacherJoints.updateAttacherJointTranslationLimit(implement: any, attacherJointDesc: any, axis: any, force: any, alpha: any)` | 5179 | ✍ Interpole la limite de translation d'un axe selon l'alpha et, si elle a sensiblement changé (ou si forcé), l'applique au joint physique en respectant les options de verrouillage haut/bas sur l'axe 2. |
| `AttacherJoints.updateRequiredTopLightsState(self: any)` | 5202 | ✍ Vérifie si un outil attelé utilise un joint et un joint d'entrée tous deux marqués pour les feux de toit, et lève `onRequiresTopLightsChanged` avec le résultat. |
| `AttacherJoints.consoleCommandBottomArmWidth(_: any, category: any, width: any)` | 5219 | ✍ Commande de console qui règle la largeur des bras inférieurs de tous les joints de la chaîne du véhicule courant à une largeur de catégorie ou explicite et journalise la catégorie obtenue. Ne fait rien s'il n'y a pas de véhicule courant. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEvent | `onPreAttachImplement` | 304 |
| registerEvent | `onPostAttachImplement` | 305 |
| registerEvent | `onPreDetachImplement` | 306 |
| registerEvent | `onPostDetachImplement` | 307 |
| registerEvent | `onRequiresTopLightsChanged` | 308 |
| registerFunction | `loadAttachmentsFinished` | 314 |
| registerFunction | `handleLowerImplementEvent` | 315 |
| registerFunction | `handleLowerImplementByAttacherJointIndex` | 316 |
| registerFunction | `getAttachedImplements` | 317 |
| registerFunction | `getAttacherJoints` | 318 |
| registerFunction | `getAttacherJointByJointDescIndex` | 319 |
| registerFunction | `getAttacherJointIndexByNode` | 320 |
| registerFunction | `getAttacherJointByNode` | 321 |
| registerFunction | `getImplementFromAttacherJointIndex` | 322 |
| registerFunction | `getAttacherJointIndexFromObject` | 323 |
| registerFunction | `getAttacherJointDescFromObject` | 324 |
| registerFunction | `getAttacherJointIndexFromImplementIndex` | 325 |
| registerFunction | `getObjectFromImplementIndex` | 326 |
| registerFunction | `updateAttacherJointGraphics` | 327 |
| registerFunction | `calculateAttacherJointMoveUpperLowerAlpha` | 328 |
| registerFunction | `doGroundHeightNodeCheck` | 329 |
| registerFunction | `finishGroundHeightNodeCheck` | 330 |
| registerFunction | `groundHeightNodeCheckCallback` | 331 |
| registerFunction | `updateAttacherJointRotation` | 332 |
| registerFunction | `updateAttacherJointRotationNodes` | 333 |
| registerFunction | `updateAttacherJointSettingsByObject` | 334 |
| registerFunction | `setAttacherJointBottomArmWidth` | 335 |
| registerFunction | `attachImplementFromInfo` | 336 |
| registerFunction | `attachImplement` | 337 |
| registerFunction | `postAttachImplement` | 338 |
| registerFunction | `createAttachmentJoint` | 339 |
| registerFunction | `hardAttachImplement` | 340 |
| registerFunction | `hardDetachImplement` | 341 |
| registerFunction | `detachImplement` | 342 |
| registerFunction | `detachImplementByObject` | 343 |
| registerFunction | `playAttachSound` | 344 |
| registerFunction | `playDetachSound` | 345 |
| registerFunction | `detachingIsPossible` | 346 |
| registerFunction | `attachAdditionalAttachment` | 347 |
| registerFunction | `detachAdditionalAttachment` | 348 |
| registerFunction | `getImplementIndexByJointDescIndex` | 349 |
| registerFunction | `getImplementByJointDescIndex` | 350 |
| registerFunction | `getImplementIndexByObject` | 351 |
| registerFunction | `getImplementByObject` | 352 |
| registerFunction | `callFunctionOnAllImplements` | 353 |
| registerFunction | `activateAttachments` | 354 |
| registerFunction | `deactivateAttachments` | 355 |
| registerFunction | `deactivateAttachmentsLights` | 356 |
| registerFunction | `setJointMoveDown` | 357 |
| registerFunction | `getJointMoveDown` | 358 |
| registerFunction | `getIsHardAttachAllowed` | 359 |
| registerFunction | `getIsSmoothAttachUpdateAllowed` | 360 |
| registerFunction | `loadAttacherJointFromXML` | 361 |
| registerFunction | `onBottomArmToolbarI3DLoaded` | 362 |
| registerFunction | `setSelectedImplementByObject` | 363 |
| registerFunction | `getSelectedImplement` | 364 |
| registerFunction | `getCanToggleAttach` | 365 |
| registerFunction | `getShowAttachControlBarAction` | 366 |
| registerFunction | `getAttachControlBarActionAccessible` | 367 |
| registerFunction | `detachAttachedImplement` | 368 |
| registerFunction | `startAttacherJointCombo` | 369 |
| registerFunction | `registerSelfLoweringActionEvent` | 370 |
| registerFunction | `getIsAttachingAllowed` | 371 |
| registerFunction | `getIsAttacherJointCompatible` | 372 |
| registerFunction | `getCanSteerAttachable` | 373 |
| registerFunction | `onAttacherJointsVehicleLoaded` | 374 |
| registerFunction | `getAttachableInfo` | 375 |
| registerFunction | `setAttacherJointBlocked` | 376 |
| registerOverwrittenFunction | `raiseActive` | 382 |
| registerOverwrittenFunction | `registerActionEvents` | 383 |
| registerOverwrittenFunction | `removeActionEvents` | 384 |
| registerOverwrittenFunction | `addToPhysics` | 385 |
| registerOverwrittenFunction | `removeFromPhysics` | 386 |
| registerOverwrittenFunction | `getTotalMass` | 387 |
| registerOverwrittenFunction | `getAdditionalComponentMass` | 388 |
| registerOverwrittenFunction | `addChildVehicles` | 389 |
| registerOverwrittenFunction | `getAirConsumerUsage` | 390 |
| registerOverwrittenFunction | `getRequiresPower` | 391 |
| registerOverwrittenFunction | `addVehicleToAIImplementList` | 392 |
| registerOverwrittenFunction | `collectAIAgentAttachments` | 393 |
| registerOverwrittenFunction | `setAIVehicleObstacleStateDirty` | 394 |
| registerOverwrittenFunction | `getDirectionSnapAngle` | 395 |
| registerOverwrittenFunction | `getFillLevelInformation` | 396 |
| registerOverwrittenFunction | `getHasObjectMounted` | 397 |
| registerOverwrittenFunction | `attachableAddToolCameras` | 398 |
| registerOverwrittenFunction | `attachableRemoveToolCameras` | 399 |
| registerOverwrittenFunction | `registerSelectableObjects` | 400 |
| registerOverwrittenFunction | `getIsReadyForAutomatedTrainTravel` | 401 |
| registerOverwrittenFunction | `getIsAutomaticShiftingAllowed` | 402 |
| registerOverwrittenFunction | `loadDashboardGroupFromXML` | 403 |
| registerOverwrittenFunction | `getIsDashboardGroupActive` | 404 |
| registerOverwrittenFunction | `loadAttacherJointHeightNode` | 405 |
| registerOverwrittenFunction | `getIsAttacherJointHeightNodeActive` | 406 |
| registerOverwrittenFunction | `loadTipSide` | 407 |
| registerOverwrittenFunction | `getIsTipSideAvailable` | 408 |
| registerOverwrittenFunction | `loadFillUnitFromXML` | 409 |
| registerOverwrittenFunction | `getFillUnitSupportsToolType` | 410 |
| registerOverwrittenFunction | `isDetachAllowed` | 411 |
| registerOverwrittenFunction | `getIsFoldAllowed` | 412 |
| registerOverwrittenFunction | `getIsWheelFoliageDestructionAllowed` | 413 |
| registerOverwrittenFunction | `getAreControlledActionsAllowed` | 414 |
| registerOverwrittenFunction | `getConnectionHoseConfigIndex` | 415 |
| registerOverwrittenFunction | `getPowerTakeOffConfigIndex` | 416 |
| registerOverwrittenFunction | `loadHoseTargetNode` | 417 |
| registerOverwrittenFunction | `getIsConnectionTargetUsed` | 418 |
| registerEventListener | `onPreLoad` | 424 |
| registerEventListener | `onLoad` | 425 |
| registerEventListener | `onPostLoad` | 426 |
| registerEventListener | `onLoadFinished` | 427 |
| registerEventListener | `onRegisterDashboardValueTypes` | 428 |
| registerEventListener | `onPreDelete` | 429 |
| registerEventListener | `onDelete` | 430 |
| registerEventListener | `onReadStream` | 431 |
| registerEventListener | `onWriteStream` | 432 |
| registerEventListener | `onUpdateInterpolation` | 433 |
| registerEventListener | `onUpdate` | 434 |
| registerEventListener | `onUpdateEnd` | 435 |
| registerEventListener | `onUpdateTick` | 436 |
| registerEventListener | `onRegisterActionEvents` | 437 |
| registerEventListener | `onStateChange` | 438 |
| registerEventListener | `onLightsTypesMaskChanged` | 439 |
| registerEventListener | `onTurnLightStateChanged` | 440 |
| registerEventListener | `onBrakeLightsVisibilityChanged` | 441 |
| registerEventListener | `onReverseLightsVisibilityChanged` | 442 |
| registerEventListener | `onBeaconLightsVisibilityChanged` | 443 |
| registerEventListener | `onBrake` | 444 |
| registerEventListener | `onTurnedOn` | 445 |
| registerEventListener | `onTurnedOff` | 446 |
| registerEventListener | `onLeaveVehicle` | 447 |
| registerEventListener | `onActivate` | 448 |
| registerEventListener | `onDeactivate` | 449 |
| registerEventListener | `onReverseDirectionChanged` | 450 |

## Messages

- s'abonne à `MessageType.VEHICLE_LOADED` (l.723)

# vehicles/specializations/Rideable.lua

*[English version](../../../../scripts/vehicles/specializations/Rideable.md)*

Source: `dataS/scripts/vehicles/specializations/Rideable.lua` — FS25 1.25.1.0

✍ Spécialisation pour les animaux montables (chevaux). Elle s'appuie sur CCTDrivable et Enterable : le cheval est déplacé comme un character controller par un modèle cinématique côté serveur avec des allures (arrière, arrêt, pas, trot, petit galop, galop), rotation, gravité et sauts, et les clients interpolent. Elle pilote les animations conditionnelles du cheval et du cavalier, les particules et sons de sabots selon la surface, les sons de respiration, les rênes et l'équipement. Elle porte un AnimalCluster (données de l'animal) sauvegardé, envoyé aux clients qui rejoignent, et restitué à un élevage quand le cheval est laissé près d'une écurie ou tombe en panne. XML sous vehicle.rideable (vitesses, rayons de braquage, sabots, nœuds du modèle, sons).

- **Rideable** (l.23)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Rideable.prerequisitesPresent(specializations: table) → boolean` | 55 | ✍ Retourne true seulement si les spécialisations CCTDrivable et Enterable sont présentes. |
| `Rideable.initSpecialization()` | 62 | ✍ Enregistre les entrées du schéma XML sous vehicle.rideable (vitesses d'allure, rayons de braquage mini, vitesse de rotation, hauteur de saut, proxy, quatre sabots avec particules de pas lents et rapides, nœuds du modèle, sons de respiration et d'arrêt, animations conditionnelles) et la clé de sauvegarde animalType. |
| `Rideable.registerFunctions(vehicleType: table)` | 143 | ✍ Enregistre toutes les fonctions de Rideable (saut, allure, direction, cinématique, animation, son, statistiques de monte, pas, accesseurs du cluster, etc.) sur le type de véhicule. |
| `Rideable.registerEventListeners(vehicleType: table)` | 175 | ✍ S'abonne aux événements de chargement, suppression, lecture/écriture de tous les flux (y compris de position), update, mise à jour d'interpolation, dessin, actions, entrée/sortie du véhicule, panne et changement de personnage. |
| `Rideable.registerOverwrittenFunctions(vehicleType: any)` | 197 | ✍ Surcharge les setters de position monde, updateVehicleSpeed, les getters de nom, les contrôles de réinitialisation/vente/aperçu, la rotation du hotspot de carte, les changements de période et de jour, le fichier d'image, la boîte d'info, la suppression du personnage et l'aide d'interaction. |
| `Rideable:onLoad(savegame: table)` | 218 | ✍ Initialise l'état, les paramètres d'animation, les vitesses d'allure et rayons de braquage, le proxy, les sabots avec systèmes de particules copiés, les nœuds du modèle, le lecteur d'animation conditionnelle, les sons de sabots clonés depuis la mission, les sons de respiration et les interpolateurs réseau ; active la synchronisation de position haute précision. Avec une sauvegarde, restaure l'AnimalCluster (état d'erreur si le sous-type est inconnu) et enregistre le cheval auprès du système d'élevage. Note : si un type de particule de sabot manque, loadHoof sort sans enregistrer le sabot, ce qui fait échouer calculateLegsDistance juste après. |
| `Rideable:onLoadFinished()` | 450 | ✍ Marque le véhicule actif (raiseActive) une fois le chargement terminé. |
| `Rideable:setWorldPosition(superFunc: any, x: any, y: any, z: any, xRot: any, yRot: any, zRot: any, i: any, changeInterp: any)` | 456 | ✍ Surchargée : après le parent, sur le serveur pour le composant 1, resynchronise l'angle de rotation interne depuis le cap du nœud et, si changeInterp, l'interpolateur d'angle. |
| `Rideable:setWorldPositionQuaternion(superFunc: any, x: any, y: any, z: any, qx: any, qy: any, qz: any, qw: any, i: any, changeInterp: any)` | 470 | ✍ Surchargée : comme setWorldPosition mais pour la variante quaternion ; resynchronise l'angle de rotation (serveur, composant 1) après le parent. |
| `Rideable:updateVehicleSpeed(superFunc: any, dt: any)` | 484 | ✍ Surchargée : sur le serveur, passe au parent le dt d'interpolation mémorisé au lieu du dt de la frame ; les clients passent le dt normal. |
| `Rideable:calculateLegsDistance(leftLegNode: integer, rightLegNode: integer) → number` | 498 | ✍ Retourne le décalage Z local moyen (par rapport au nœud racine) de deux nœuds de jambes, ou 0 si l'un est nil. Sert aux décalages de contrôle du sol avant et arrière. |
| `Rideable:onDelete()` | 510 | ✍ Se désinscrit du système d'élevage, supprime les sons, les systèmes de particules de sabots avec leurs formes d'émission et le lecteur d'animation. |
| `Rideable:onReadStream(streamId: integer, connection: Connection)` | 544 | ✍ Client à la connexion : lit l'indicateur au sol (depuis le serveur), le cluster d'animal (sous-type puis données) et le joueur qui doit monter, en les appliquant. |
| `Rideable:onWriteStream(streamId: integer, connection: Connection)` | 571 | ✍ Serveur à la connexion : écrit l'indicateur au sol, le cluster d'animal s'il existe et le joueur à faire monter le cas échéant. |
| `Rideable:onReadUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 590 | ✍ Côté serveur, lit l'axe de direction et l'allure envoyés par le client du cavalier. Côté client, lit le minuteur d'arrêt (réinitialise l'allure si arrêté) et la mise à jour optionnelle du cluster, puis rafraîchit la saleté. |
| `Rideable:onWriteUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 615 | ✍ Client vers serveur : écrit l'axe de direction et l'allure. Serveur vers client : écrit le minuteur d'arrêt et la mise à jour du cluster s'il existe. |
| `Rideable:onReadPositionUpdateStream(streamId: integer, connection: Connection)` | 633 | ✍ Lit le booléen au sol du flux de mise à jour de position dans l'interpolateur correspondant. |
| `Rideable:onWritePositionUpdateStream(streamId: integer, connection: Connection, dirtyMask: any)` | 647 | ✍ Écrit l'indicateur au sol courant dans le flux de mise à jour de position. |
| `Rideable:endFade()` | 654 | ✍ Callback vide utilisé comme gestionnaire de fin du fondu d'écran. |
| `Rideable:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 659 | ✍ Sauvegarde le nom du sous-type d'animal et les données du cluster (sous .animal) quand un cluster existe. |
| `Rideable:setCluster(cluster: any)` | 674 | ✍ Mémorise l'AnimalCluster, règle le décalage UV d'atlas du mesh d'après la variation visuelle du sous-type et de l'âge de l'animal, puis rafraîchit le shader de saleté. |
| `Rideable:updateDirt()` | 696 | ✍ Règle le paramètre de shader de saleté du mesh d'après le facteur de saleté du cluster, seulement sur les plateformes où le nettoyage des chevaux est requis ; sinon 0. |
| `Rideable:getCluster()` | 708 | ✍ Retourne l'AnimalCluster de ce cheval (peut être nil). |
| `Rideable:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 717 | ✍ À chaque frame : force le joueur local à monter quand c'est en attente et synchronisé, met à jour le texte d'entrée et envoie la direction depuis un client cavalier, met à jour animation, son (client) et statistiques de monte (serveur), décompte le minuteur d'arrêt, lit la direction gyroscopique si activée, et sur le serveur exécute le transfert différé vers l'élevage et la vérification de portée, puis supprime le véhicule après le transfert. |
| `Rideable:onUpdateInterpolation(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 830 | ✍ Serveur : remet l'allure à l'arrêt si personne ne contrôle, exécute testCCTMove et updateKinematic, alimente les interpolateurs de position, d'angle et d'état au sol et applique position et cap interpolés. Tous : minuteur de sortie, état au sol et orientation suivant le sol via deux raycasts (ou test de proximité du sol à l'arrêt). |
| `Rideable:onDraw(isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 921 | ✍ Tant que le joueur est sur le cheval, ajoute une ligne de HUD affichant le facteur de monte du cluster en pourcentage. |
| `Rideable:onSetBroken()` | 931 | ✍ Détache les rênes. Sur le serveur, confie le cluster au premier élevage disponible et supprime le cheval s'il en existe un, et notifie le dernier propriétaire de l'issue (écurie ou non). |
| `Rideable:testCCTMove(dt: any)` | 958 | ✍ Contrôle serveur des déplacements du character controller déjà simulés : si le déplacement réel est inférieur à 70 % de l'attendu (et l'attendu supérieur à 0,001 par ms), le cheval est arrêté 900 ms et le son d'arrêt est joué. |
| `Rideable:getIsRideableJumpAllowed(allowWhileJump: any)` | 989 | ✍ Retourne true si le cheval est au sol (sauf allowWhileJump), au moins au petit galop et non en panne. |
| `Rideable:jump()` | 1009 | ✍ Déclenche un saut : un client envoie JumpEvent au serveur, le serveur incrémente la statistique horseJumpCount de la ferme et tente les succès. Fixe la vitesse verticale d'après la hauteur de saut (divisée par deux au petit galop) et la gravité. |
| `Rideable:setCurrentGait(gait: any)` | 1033 | ✍ Définit l'allure courante (valeur d'entrée) du cheval. |
| `Rideable:getCurrentGait()` | 1040 | ✍ Retourne la valeur de l'allure courante (voir Rideable.GAITTYPES, défini hors des lignes visibles du dump). |
| `Rideable:setRideableSteer(axisSteer: any)` | 1046 | ✍ Fixe l'axe de direction à l'opposé de l'entrée ; ignore une valeur nulle, le dernier braquage restant jusqu'à resetInputs. |
| `Rideable:resetInputs()` | 1055 | ✍ Remet l'axe de direction à 0. |
| `Rideable:updateKinematic(dt: number)` | 1063 | ✍ Pas cinématique serveur : accélère ou décélère vers la vitesse max de l'allure (accélération réduite en l'air, vitesse forcée à 0 pendant l'arrêt), applique la gravité, tourne avec une accélération angulaire limitée, déplace le character controller et met le mouvement en file pour testCCTMove. Le dt est en ms. |
| `Rideable:groundRaycastCallback(hitObjectId: integer, x: number, y: number, z: number, distance: number) → boolean` | 1138 | ✍ Callback de raycast : ignore le nœud du contrôleur du cheval et les nœuds dont le masque de collision est seulement DEFAULT ; sinon enregistre hauteur, objet et distance de l'impact et arrête le rayon. |
| `Rideable:updateAnimation(dt: number)` | 1159 | ✍ Calcule les paramètres d'animation (vitesses avant, verticale et de lacet, au sol, dans l'eau, arrêté, pondération gauche-droite lissée, etc.) d'après la vitesse et les interpolateurs, les transmet au lecteur d'animation du cheval et, quand il est monté, à celui du cavalier, puis appelle updateFootsteps. |
| `Rideable:updateSound(dt: any)` | 1264 | ✍ Client : quand il est au sol, joue les échantillons de respiration sur un minuteur, respiration d'effort au galop, sinon respiration normale avec intervalle aléatoire à l'arrêt. |
| `Rideable:setWorldPositionQuat(x: number, y: number, z: number, qx: number, qy: number, qz: number, qw: number, changeInterp: boolean)` | 1298 | ✍ Fixe translation et quaternion monde du nœud racine, avec réinitialisation optionnelle des interpolateurs. À noter : elle lit networkInterpolators dans la table spec, que ce fichier ne renseigne jamais, donc changeInterp à true échouerait (NON VÉRIFIÉ si utilisée ailleurs). |
| `Rideable:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 1310 | ✍ Côté client, enregistre les actions accélérer, freiner, diriger et sauter (texte d'aide masqué par défaut) quand actif pour l'entrée et mémorise leurs identifiants. |
| `Rideable:onEnterVehicle(isControlling: boolean)` | 1342 | ✍ Client : efface le joueur en attente, remet les vitesses à zéro, passe l'allure à l'arrêt et le sol à faux. Serveur : mémorise la connexion propriétaire comme dernier propriétaire et efface le minuteur de vérification d'élevage. |
| `Rideable:onVehicleCharacterChanged(character: any)` | 1369 | ✍ Client : quand un cavalier apparaît, attache les rênes à ses mains, les affiche, configure l'animation conditionnelle du cavalier avec les mêmes paramètres, affiche l'équipement et éclaircit l'écran s'il était fondu. |
| `Rideable:onLeaveVehicle()` | 1401 | ✍ Client : remet allure et entrées à zéro et éclaircit l'écran. Serveur : arme la vérification d'élevage pour 5000 ms. Tous : remet le minuteur de sortie à 15000 ms. |
| `Rideable:unlinkReins()` | 1422 | ✍ Client : rattache les deux nœuds de rênes à leurs parents d'origine et masque le nœud des rênes. |
| `Rideable:setEquipmentVisibility(val: any)` | 1434 | ✍ Client : affiche ou masque les nœuds d'équipement (selle) et de rênes si un nœud d'équipement est défini. |
| `Rideable.actionEventAccelerate(self: table, actionName: string, inputValue: number, callbackState: string, isAnalog: boolean)` | 1452 | ✍ Callback d'entrée : quand entré, contrôlé, non arrêté et au sol, augmente l'allure d'un cran (jusqu'au maximum). |
| `Rideable.actionEventBrake(self: table, actionName: string, inputValue: number, callbackState: string, isAnalog: boolean)` | 1468 | ✍ Callback d'entrée : quand entré, non arrêté et au sol, diminue l'allure d'un cran (pas en dessous de 1). |
| `Rideable.actionEventSteer(self: table, actionName: string, inputValue: number, callbackState: string, isAnalog: boolean)` | 1482 | ✍ Callback d'entrée : quand entré et non arrêté, transmet la valeur d'entrée à setRideableSteer. |
| `Rideable.actionEventJump(self: table, actionName: string, inputValue: number, callbackState: string, isAnalog: boolean)` | 1496 | ✍ Callback d'entrée : appelle jump quand getIsRideableJumpAllowed l'accepte. |
| `Rideable:updateFootsteps(dt: any, speed: any)` | 1504 | ✍ Pour chaque sabot, lance un raycast vers le sol ; à l'appui, émet les particules de pas lents ou rapides teintées de la couleur du terrain à la position du sabot et joue le son de surface, et arrête l'émission au lever. À noter : dans la branche rapide la rotation est appliquée à la forme d'émission lente, ce qui ressemble à un bug. |
| `Rideable:updateRiding(dt: any)` | 1569 | ✍ Serveur : en mouvement avec un cluster, cumule le temps de monte pondéré par l'allure (x2 petit galop, x3 galop) et augmente périodiquement les valeurs de monte et de saleté du cluster, met à jour la statistique horseDistance de la ferme et rafraîchit la saleté. |
| `Rideable:getHoofSurfaceSound(x: any, y: any, z: any, hitTerrain: any)` | 1603 | ✍ Retourne l'échantillon de sabot pour une position : sur le terrain, neige, puis champ, puis eau peu profonde ou moyenne, sinon selon l'identifiant de matériau du terrain ; hors terrain, l'échantillon asphalte. Peut retourner nil si aucun échantillon ne correspond. |
| `Rideable:getPosition()` | 1631 | ✍ Retourne la translation monde (x, y, z) du nœud racine. |
| `Rideable:getRotation()` | 1637 | ✍ Retourne la rotation monde (x, y, z) du nœud racine. |
| `Rideable:setPlayerToEnter(player: any)` | 1643 | ✍ Mémorise le joueur qui doit monter sur ce cheval une fois synchronisé, active la vérification et réveille le véhicule. |
| `Rideable:getName(superFunc: any)` | 1652 | ✍ Surchargée : retourne le nom du cluster d'animal (erreur si aucun cluster). |
| `Rideable:getFullName(superFunc: any)` | 1659 | ✍ Surchargée : identique à getName. |
| `Rideable:getCanBeReset(superFunc: any)` | 1665 | ✍ Surchargée pour toujours retourner false : un cheval ne peut pas être réinitialisé. |
| `Rideable:getCanBeSold(superFunc: any)` | 1671 | ✍ Surchargée pour toujours retourner false : un cheval ne peut pas être vendu comme véhicule. |
| `Rideable:getMapHotspotRotation(superFunc: any, isPlayerHotspot: any)` | 1677 | ✍ Surchargée : retourne 0 pour les hotspots autres que le joueur, sinon délègue au parent. |
| `Rideable:getShowInVehiclesOverview(superFunc: any)` | 1687 | ✍ Surchargée pour toujours retourner false : les chevaux sont masqués de l'aperçu des véhicules. |
| `Rideable:periodChanged(superFunc: any)` | 1693 | ✍ Surchargée : appelle le parent puis transmet le changement de période au cluster. |
| `Rideable:dayChanged(superFunc: any)` | 1703 | ✍ Surchargée : appelle le parent puis transmet le changement de jour au cluster. |
| `Rideable:getImageFilename(superFunc: any)` | 1714 | ✍ Surchargée : retourne l'image de boutique du visuel d'animal correspondant au sous-type et à l'âge du cluster, sinon l'image du parent. |
| `Rideable:deleteVehicleCharacter(superFunc: any)` | 1729 | ✍ Surchargée : masque l'équipement et détache les rênes avant d'appeler le parent. |
| `Rideable:getInteractionHelp(superFunc: any) → string` | 1739 | ✍ Surchargée : quand le drapeau d'interaction est « enterable », retourne le texte de monte avec le nom de l'animal ; sinon le texte du parent. |
| `Rideable:showInfo(superFunc: any, box: any)` | 1751 | ✍ Surchargée : affiche d'abord les infos du cluster dans la boîte, puis celles du parent. |
| `Rideable:updateDebugValues(values: any)` | 1763 | ✍ Débogage : ajoute à la table de valeurs une entrée par sabot avec la description du dernier échantillon joué. |
| `Rideable:updateInputText()` | 1773 | ✍ Règle le libellé et la visibilité des actions accélérer, freiner et sauter selon l'allure courante (par exemple pas, trot, petit galop, galop, arrêt), le saut n'étant activé qu'à partir du petit galop. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `getIsRideableJumpAllowed` | 144 |
| registerFunction | `jump` | 145 |
| registerFunction | `setCurrentGait` | 146 |
| registerFunction | `getCurrentGait` | 147 |
| registerFunction | `setRideableSteer` | 148 |
| registerFunction | `resetInputs` | 149 |
| registerFunction | `updateKinematic` | 150 |
| registerFunction | `testCCTMove` | 151 |
| registerFunction | `updateAnimation` | 152 |
| registerFunction | `updateSound` | 153 |
| registerFunction | `updateRiding` | 154 |
| registerFunction | `updateDirt` | 155 |
| registerFunction | `calculateLegsDistance` | 156 |
| registerFunction | `setWorldPositionQuat` | 157 |
| registerFunction | `updateFootsteps` | 158 |
| registerFunction | `getPosition` | 159 |
| registerFunction | `getRotation` | 160 |
| registerFunction | `setEquipmentVisibility` | 161 |
| registerFunction | `getHoofSurfaceSound` | 162 |
| registerFunction | `groundRaycastCallback` | 163 |
| registerFunction | `unlinkReins` | 164 |
| registerFunction | `updateInputText` | 165 |
| registerFunction | `setPlayerToEnter` | 166 |
| registerFunction | `endFade` | 167 |
| registerFunction | `setCluster` | 168 |
| registerFunction | `getCluster` | 169 |
| registerEventListener | `onLoad` | 176 |
| registerEventListener | `onLoadFinished` | 177 |
| registerEventListener | `onDelete` | 178 |
| registerEventListener | `onReadStream` | 179 |
| registerEventListener | `onWriteStream` | 180 |
| registerEventListener | `onReadUpdateStream` | 181 |
| registerEventListener | `onWriteUpdateStream` | 182 |
| registerEventListener | `onReadPositionUpdateStream` | 183 |
| registerEventListener | `onWritePositionUpdateStream` | 184 |
| registerEventListener | `onUpdate` | 185 |
| registerEventListener | `onUpdateInterpolation` | 186 |
| registerEventListener | `onDraw` | 187 |
| registerEventListener | `onRegisterActionEvents` | 188 |
| registerEventListener | `onEnterVehicle` | 189 |
| registerEventListener | `onLeaveVehicle` | 190 |
| registerEventListener | `onSetBroken` | 191 |
| registerEventListener | `onVehicleCharacterChanged` | 192 |
| registerOverwrittenFunction | `setWorldPosition` | 198 |
| registerOverwrittenFunction | `setWorldPositionQuaternion` | 199 |
| registerOverwrittenFunction | `updateVehicleSpeed` | 200 |
| registerOverwrittenFunction | `getName` | 201 |
| registerOverwrittenFunction | `getFullName` | 202 |
| registerOverwrittenFunction | `getCanBeReset` | 203 |
| registerOverwrittenFunction | `getMapHotspotRotation` | 204 |
| registerOverwrittenFunction | `getShowInVehiclesOverview` | 205 |
| registerOverwrittenFunction | `periodChanged` | 206 |
| registerOverwrittenFunction | `dayChanged` | 207 |
| registerOverwrittenFunction | `getImageFilename` | 208 |
| registerOverwrittenFunction | `showInfo` | 209 |
| registerOverwrittenFunction | `deleteVehicleCharacter` | 210 |
| registerOverwrittenFunction | `getCanBeSold` | 211 |
| registerOverwrittenFunction | `getInteractionHelp` | 212 |

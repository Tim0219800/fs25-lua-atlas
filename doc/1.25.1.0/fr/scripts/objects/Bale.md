# objects/Bale.lua

*[English version](../../../scripts/objects/Bale.md)*

Source: `dataS/scripts/objects/Bale.lua` — FS25 1.25.1.0

✍ Une balle de foin, paille, ensilage ou similaire, sous forme de MountableObject réseau qui peut être ramassée, sanglée, chargée automatiquement, enrubannée, ouverte et vendue. Ses propriétés viennent d'un XML de configuration de balle (bale.size, bale.fillTypes, bale.variations, bale.baleMeshes, attributs mountableObject) et sont sauvegardées dans la partie. L'enrubannage et la fermentation dépendent des infos du type de remplissage et de BaleManager (absent de ce dump, NON VÉRIFIÉ). Le fichier définit aussi BaleActivatable, l'action de coupe de balle.

- **Bale** hérite de `MountableObject` (l.11)
- **BaleActivatable** (l.1636)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Bale.new(isServer: boolean, isClient: boolean, customMt: table?) → table` | 49 | ✍ Constructeur. Appelle celui de MountableObject et fixe les valeurs par défaut (paille, niveau 0, masse 0,25, non enrubanné, sans fermentation, vendable, ramassable), réserve un drapeau dirty par propriété synchronisée, crée l'activatable et enregistre la balle dans le système de slots comme objet limité. |
| `Bale:delete()` | 101 | ✍ Libère la requête i3d partagée, vide les listes de maillages, retire l'activatable, arrête le suivi de fermentation, retire l'obstacle IA ainsi que les entrées du système de slots et du système d'objets, désenregistre le nom de classe et appelle le delete du parent. |
| `Bale:readUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 130 | ✍ Mise à jour côté client : pour chaque bit dirty présent, lit type de remplissage, niveau, variation, textures d'enrubannage, état d'enrubannage (uint8 sur 255), couleur et fermentation, les applique, puis appelle le readUpdateStream du parent. |
| `Bale:writeUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 180 | ✍ Mise à jour côté serveur : écrit un indicateur et la valeur correspondante pour chaque bit dirty (type, niveau, variation, textures, état d'enrubannage, couleur, fermentation), puis appelle le writeUpdateStream du parent. |
| `Bale:readStream(streamId: integer, connection: table)` | 225 | ✍ Côté client à la connexion : lit l'index du type de balle et la charge depuis son XML de configuration si elle n'a pas de nœud, puis niveau, type, variation, textures d'enrubannage optionnelles, données du parent, état d'enrubannage, couleur et fermentation. Ajoute aussi la balle au système d'objets. |
| `Bale:writeStream(streamId: integer, connection: table)` | 271 | ✍ Côté serveur à la connexion : écrit l'index du type de balle (1 par défaut), niveau, type, variation, textures d'enrubannage optionnelles, données du parent, état d'enrubannage, couleur et fermentation. L'ordre reflète readStream. |
| `Bale:mount(object: table, node: integer, x: number, y: number, z: number, rx: number, ry: number, rz: number)` | 309 | ✍ Appelle le mount du parent, puis désactive l'obstacle IA de la balle. |
| `Bale:unmount()` | 316 | ✍ Appelle l'unmount du parent. En cas de succès, restaure la masse normale du composant et l'obstacle IA et retourne true, sinon false. |
| `Bale:mountKinematic(object: table, node: integer, x: number, y: number, z: number, rx: number, ry: number, rz: number)` | 335 | ✍ Appelle le mountKinematic du parent, puis désactive l'obstacle IA. |
| `Bale:unmountKinematic()` | 342 | ✍ Appelle l'unmountKinematic du parent. En cas de succès, restaure la masse normale et l'obstacle IA et retourne true, sinon false. |
| `Bale:mountDynamic(object: any, objectActorId: any, jointNode: any, mountType: any, forceAcceleration: any)` | 353 | ✍ Appelle le mountDynamic du parent. Retourne false en cas d'échec, sinon désactive l'obstacle IA et retourne true. |
| `Bale:unmountDynamic(isDelete: any)` | 364 | ✍ Appelle l'unmountDynamic du parent, restaure la masse normale du composant et réactive l'obstacle IA. |
| `Bale:setBaleAIObstacle(isActive: any)` | 372 | ✍ Ajoute le nœud de la balle comme obstacle à aiSystem à l'activation (s'il n'y en a pas) ou le retire à la désactivation. |
| `Bale:createNode(i3dFilename: string)` | 385 | ✍ Charge le fichier i3d via le gestionnaire partagé, prend son premier enfant, le rattache au nœud racine, supprime la racine chargée et définit l'enfant comme nœud de la balle. |
| `Bale:loadFromConfigXML(xmlFilename: string, x: number, y: number, z: number, rx: number, ry: number, rz: number, uniqueId: any)` | 406 | ✍ Charge une balle depuis son XML de configuration : vérifie que le fichier existe et que le type est enregistré (ou qu'un générateur d'icônes est présent), crée le nœud, le place éventuellement, charge les attributs, fixe uniqueId, l'ajoute au système d'objets et active l'obstacle IA. Retourne false avec un log en cas d'échec. |
| `Bale:loadBaleAttributesFromXML(xmlFile: table)` | 455 | ✍ Lit depuis le XML de configuration les attributs de montage, types de remplissage, variations, dimensions (ronde ou carrée, arrondies à 2 décimales), uvId et maillages visuels. Retourne true. |
| `Bale:getBaleMatchesSize(diameter: number, width: number, height: number, length: number) → boolean` | 491 | ✍ Retourne true si la taille de la balle égale les valeurs données : diamètre et largeur pour les balles rondes, largeur, hauteur et longueur pour les balles carrées. |
| `Bale:getSupportsWrapping() → boolean` | 502 | ✍ Retourne si la balle peut être enrubannée pour son type de remplissage actuel. |
| `Bale:loadFromXMLFile(xmlFile: XMLFile, key: string, resetVehicles: boolean) → boolean` | 512 | ✍ Chargement de sauvegarde : lit position, rotation et filename (retourne false si absents ou si le fichier n'existe pas), charge les attributs, crée la balle depuis son XML de configuration et applique les attributs. Retourne true en cas de succès. |
| `Bale.loadBaleAttributesFromXMLFile(attributes: any, xmlFile: any, key: any, resetVehicles: any)` | 544 | ✍ Statique : lit depuis un nœud de sauvegarde, dans la table attributes, le filename, farmId, niveau, type, variation, textures d'enrubannage, fermentation, état et couleur d'enrubannage, indicateur de balle de mission et uniqueId. Retourne true. |
| `Bale:getBaleAttributes()` | 577 | ✍ Retourne une table des attributs actuels de la balle (xmlFilename, farmId, niveau et type, variation, textures d'enrubannage, état et couleur d'enrubannage, indicateur de mission, fermentation et son temps écoulé). |
| `Bale.saveBaleAttributesToXMLFile(attributes: any, xmlFile: any, key: any)` | 602 | ✍ Statique : écrit une table d'attributs dans le XML de sauvegarde (filename, niveau, nom du type, variation, farmId, indicateur de mission, enrubannage, textures et fermentation optionnelles). |
| `Bale:applyBaleAttributes(attributes: any)` | 629 | ✍ Applique une table d'attributs : ferme propriétaire, niveau et type, variation, textures d'enrubannage, état, couleur et indicateur de mission. Sur le serveur, ré-enregistre aussi la fermentation (instantanée pour les balles de mission). Retourne true. |
| `Bale:saveToXMLFile(xmlFile: any, key: any)` | 672 | ✍ Écrit dans la sauvegarde uniqueId, nom de fichier réseau, position, rotation, niveau et type, variation, farmId, indicateur de mission, état et couleur d'enrubannage, textures d'enrubannage et données de fermentation optionnelles. |
| `Bale:getNeedsSaving()` | 708 | ✍ Retourne true si needsSaving est actif et que le nœud de la balle est au-dessus de y = -90 (la zone du magasin à -100 est exclue). |
| `Bale:getAutoLoadIsSupported()` | 720 | ✍ Retourne true : les balles peuvent être gérées par les chargeurs automatiques. |
| `Bale:getAutoLoadIsAllowed()` | 726 | ✍ Retourne le résultat de getAllowPickup. |
| `Bale:getAutoLoadSize()` | 732 | ✍ Retourne l'encombrement de la balle en trois dimensions : largeur, puis diamètre ou hauteur, puis diamètre ou longueur selon que la balle est ronde ou non. |
| `Bale:autoLoad(autoLoader: any, node: any, posX: any, posZ: any, sizeX: any, sizeZ: any)` | 742 | ✍ Place la balle sur le chargeur automatique à la position donnée en la démontant d'abord si elle est montée en cinématique, puis en appelant mountKinematic avec des coordonnées centrées (balles rondes tournées de 90 degrés sur Y). Retourne true. |
| `Bale:getValue()` | 772 | ✍ Retourne la valeur de vente : niveau de remplissage multiplié par le prix au litre du type selon l'économie. |
| `Bale:getMass()` | 779 | ✍ Retourne la masse physique du nœud, ou 0 si le nœud n'existe pas. |
| `Bale:getDefaultMass()` | 785 | ✍ Retourne la masse par défaut mémorisée pour le type de remplissage actuel. |
| `Bale:getFillType() → integer` | 792 | ✍ Retourne l'index du type de remplissage actuel. |
| `Bale:setReducedComponentMass(state: any)` | 798 | ✍ Fixe la masse du nœud à 0,1 si true, sinon la remet à la masse par défaut. |
| `Bale:getAllowComponentMassReduction()` | 808 | ✍ Retourne true si la masse par défaut dépasse 0,1. |
| `Bale:setFillType(fillTypeIndex: any, fillBale: any)` | 814 | ✍ Change le type de remplissage : applique les textures, met à jour le support d'enrubannage, la masse et la force de montage selon les infos du type et, sur le serveur, démarre la fermentation si le type fermente sans exiger l'enrubannage. Remplit éventuellement la balle à sa capacité, actualise visibilité et enrubannage et lève le drapeau dirty. |
| `Bale:setVariationIndex(variationIndex: any)` | 861 | ✍ Applique la variation à l'index donné (1 par défaut) si elle existe : mémorise l'index, applique les textures de variation et, sur le serveur, lève le drapeau dirty. Sans effet pour un index inconnu. |
| `Bale:setVariationId(variationId: any)` | 876 | ✍ Sélectionne une variation par son id, comparé sans tenir compte de la casse. Un id nil sélectionne la première. Retourne true si appliquée, false si l'id est inconnu. |
| `Bale:getVariationId()` | 894 | ✍ Retourne l'id de la variation actuelle, ou la chaîne NONE s'il n'y en a pas ou si l'index est invalide. |
| `Bale:getCapacity() → integer` | 910 | ✍ Retourne la capacité définie pour le type de remplissage actuel, ou 0 si le type n'a pas d'infos. |
| `Bale:getFillLevel() → integer` | 923 | ✍ Retourne le niveau de remplissage actuel. |
| `Bale:setFillLevel(fillLevel: integer)` | 930 | ✍ Mémorise le niveau de remplissage et, sur le serveur, lève le drapeau dirty du niveau. |
| `Bale:getFillTypeInfo(fillTypeIndex: integer) → table` | 942 | ✍ Retourne l'entrée d'infos du type de remplissage actuel de la balle, ou nil. À noter : le paramètre fillTypeIndex est ignoré ; la comparaison utilise self.fillType. |
| `Bale:setCanBeSold(canBeSold: boolean)` | 955 | ✍ Définit si la balle peut être vendue. |
| `Bale:getCanBeSold() → boolean` | 962 | ✍ Retourne si la balle peut être vendue. |
| `Bale:setWrappingState(wrappingState: number, updateFermentation: boolean)` | 970 | ✍ Fixe l'avancement de l'enrubannage (0 à 1) : met à jour la visibilité des maillages et le paramètre shader wrappingState, lève le drapeau dirty sur le serveur et démarre la fermentation à l'enrubannage complet pour les types qui l'exigent. Ajoute l'activatable de coupe au-dessus de 0, le retire sinon. |
| `Bale:setWrapTextures(diffuse: string, normal: string)` | 1024 | ✍ Mémorise les chemins des textures diffuse et normale d'enrubannage (en gardant les anciens si nil) et les applique au matériau de chaque maillage si les fichiers existent, sinon journalise un avertissement. Réinitialise aussi les paramètres shader wrappingState et colorScale et lève le drapeau dirty sur le serveur. |
| `Bale:setColor(r: number, g: number, b: number)` | 1066 | ✍ Fixe la couleur de l'enrubannage (canaux manquants à 1). Seulement si elle diffère de l'actuelle, lève le drapeau dirty sur le serveur et fixe le paramètre shader colorScale sur les maillages qui l'ont. |
| `Bale:setIsMissionBale(state: any)` | 1091 | ✍ Définit si la balle provient d'une mission de champ. |
| `Bale:getMeshNodes()` | 1097 | ✍ Retourne la liste des nœuds de maillage de sangle. |
| `Bale:getSupportsTensionBelts()` | 1103 | ✍ Retourne true : les balles gèrent les sangles de tension. |
| `Bale:getTensionBeltNodeId()` | 1109 | ✍ Retourne le nœud de la balle comme nœud de sangle de tension. |
| `Bale:getBaleSupportsBaleLoader()` | 1115 | ✍ Retourne true : les balles peuvent être utilisées avec les chargeurs de balles. |
| `Bale:getAllowPickup()` | 1121 | ✍ Retourne le drapeau allowPickup. |
| `Bale:getAdditionalMountingDistance()` | 1127 | ✍ Retourne 0 pour les balles rondes, ou la moitié de la hauteur pour les balles carrées. |
| `Bale:getIsFermenting()` | 1137 | ✍ Retourne si la balle est actuellement en fermentation. |
| `Bale:getFermentingPercentage()` | 1143 | ✍ Retourne l'avancement de la fermentation entre 0 et 1, ou 0 si la balle ne fermente pas. |
| `Bale:onFermentationUpdate(percentage: any)` | 1153 | ✍ Callback du gestionnaire de balles : mémorise le nouveau pourcentage et lève le drapeau dirty de fermentation. |
| `Bale:onFermentationEnd()` | 1160 | ✍ Callback à la fin de la fermentation. Sur le serveur, passe la balle au type de sortie des infos de fermentation, efface l'indicateur et lève le drapeau dirty. |
| `Bale:getCanBeOpened()` | 1176 | ✍ Retourne true seulement si la balle est enrubannée, ne fermente pas et n'est montée d'aucune façon. |
| `Bale:getInteractionPosition()` | 1194 | ✍ Retourne la position monde du joueur local, ou rien si le joueur est dans un véhicule. |
| `Bale:getCanInteract()` | 1204 | ✍ Retourne true si le joueur a accès à la balle et se trouve à pied à moins de Bale.INTERACTION_RADIUS (constante absente de ce dump, NON VÉRIFIÉ) de celle-ci. |
| `Bale:open()` | 1221 | ✍ Ouvre la balle en remettant l'état d'enrubannage à 0. |
| `Bale:resetDetailVisibilityCut()` | 1227 | ✍ Remet le paramètre shader visibilityXZ des maillages qui l'ont sur une large plage (5, -5, 5, -5), ce qui supprime toute coupe. |
| `Bale:setDetailVisibilityCutNode(node: any, axis: any, direction: any)` | 1238 | ✍ Applique une coupe de visibilité à chaque maillage de la balle d'après la position d'un nœud, selon l'axe et le sens donnés. |
| `Bale.setBaleMeshVisibilityCut(baleMesh: any, node: any, axis: any, direction: any, recursively: any)` | 1246 | ✍ Statique : fixe visibilityXZ sur un maillage d'après la position locale d'un nœud (X si l'axe vaut 1, sinon Z, en borne basse ou haute selon le sens), avec récursion optionnelle sur les enfants. |
| `Bale:doDensityMapItemAreaUpdate(func: any, target: any, ...: any)` | 1277 | ✍ Appelle la fonction donnée avec un parallélogramme couvrant environ 40 pour cent de la taille de la balle (décalé d'une grille de 0,25), pour balles rondes ou carrées, plus des arguments supplémentaires. Sert à appliquer des opérations de carte de densité sous la balle. |
| `Bale:showInfo(box: any)` | 1300 | ✍ Ajoute des lignes à une boîte d'infos : type et volume, pourcentage de fermentation si la balle fermente, et masse. |
| `Bale.createDummyBale(xmlFilename: string, fillTypeIndex: integer, variationId: string, wrappingState: number?, wrappingColor: table?) → integer, integer` | 1330 | ✍ Statique : construit une balle uniquement visuelle depuis un XML de balle (sans physique, détachée) avec le type, la variation, l'état et la couleur d'enrubannage donnés. Retourne l'id du nœud et l'id de requête de chargement partagée ; l'appelant doit les libérer. |
| `Bale.loadFillTypesFromXML(fillTypes: table, xmlFile: table, baseDirectory: string)` | 1388 | ✍ Statique : lit chaque entrée bale.fillTypes.fillType dans la liste cible : index du type, capacité (1000 par défaut), masse (valeur XML divisée par 1000), force, support d'enrubannage, matériaux, textures et sortie de fermentation optionnelle, exigence d'enrubannage et durée. |
| `Bale.loadVariationsFromXML(variations: table, xmlFile: table, baseDirectory: string)` | 1423 | ✍ Statique : lit les entrées bale.variations.variation (id et textures) dans la liste cible. Ajoute une variation DEFAULT s'il n'y en a aucune. |
| `Bale.setFillTypeTextures(meshes: table, fillTypes: table, fillTypeIndex: integer)` | 1446 | ✍ Statique : pour le type correspondant, assigne le matériau de base (matériau alpha pour les maillages alpha), applique les textures et fixe l'index de tableau de textures fillTypeId sur chaque maillage. Journalise un avertissement si un matériau est introuvable. |
| `Bale.setVariationTextures(meshes: table, variations: table, id: string)` | 1486 | ✍ Statique : applique à tous les maillages les textures de la variation d'id donné (ou d'index numérique), avec repli sur la première variation si elle n'est pas trouvée. |
| `Bale.setTexturesForNode(nodeId: integer, textureData: table)` | 1513 | ✍ Statique : pour un nœud de forme dont le matériau utilise wrapBaleShader, fixe les cartes diffuse, normale, alpha, normale de balle et de filet d'après les données de texture, ou les tableaux de textures de types de la carte si demandé. |
| `Bale.loadVisualMeshesFromXML(rootNode: integer, xmlFile: table, baseDirectory: string) → table, table` | 1559 | ✍ Statique : lit les entrées bale.baleMeshes.baleMesh (nœud, support d'enrubannage, types de remplissage, indicateurs sangle et alpha). Retourne la liste des maillages et celle des nœuds de maillage de sangle. |
| `Bale.updateVisualMeshVisibility(meshes: table, fillTypeIndex: integer, isWrapped: boolean)` | 1590 | ✍ Statique : pour les maillages liés à des types précis, n'affiche que ceux correspondant au type (et, si enrubannée, seulement ceux compatibles avec l'enrubannage) et mémorise l'indicateur de visibilité par type. |
| `Bale.updateVisualMeshWrappingState(meshes: table, wrappingState: number, wrappingColor: table)` | 1615 | ✍ Statique : fixe le paramètre shader wrappingState sur tous les maillages et, au-dessus de 0, le paramètre colorScale d'après la couleur donnée (gris 0,85 par défaut). |
| `BaleActivatable.new(bale: any)` | 1640 | ✍ Crée l'activatable d'une balle avec le texte d'action de coupe de balle. |
| `BaleActivatable:getIsActivatable()` | 1651 | ✍ Retourne true si le joueur peut interagir avec la balle et que la balle peut être ouverte. |
| `BaleActivatable:getDistance(posX: any, posY: any, posZ: any)` | 1667 | ✍ Retourne la distance horizontale (XZ) entre la position donnée et la balle, ou math.huge si la balle n'a pas de nœud. |
| `BaleActivatable:run()` | 1679 | ✍ Ouvre directement la balle sur le serveur, ou envoie un BaleOpenEvent au serveur depuis un client. |

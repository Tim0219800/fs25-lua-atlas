# vehicles/specializations/PowerTakeOffs.lua

*[English version](../../../../scripts/vehicles/specializations/PowerTakeOffs.md)*

Source: `dataS/scripts/vehicles/specializations/PowerTakeOffs.lua` — FS25 1.25.1.0

✍ Spécialisation qui construit et anime les arbres de prise de force visibles. Les prises de sortie se trouvent sur un véhicule avec attaches, les prises d'entrée sur un outil attelable, et les prises locales relient deux nœuds d'un même véhicule. Elle requiert AttacherJoints ou Attachable, lit vehicle.powerTakeOffs (éventuellement par configuration) et charge le modèle d'arbre depuis un fichier XML/i3d de prise de force en trois variantes : simple cardan, double cardan ou basique. Elle concerne surtout le visuel côté client, lié aux événements d'attelage et de dételage. PowerTakeOffs.DEFAULT_MAX_UPDATE_DISTANCE est utilisé mais non défini dans le dump (NON VÉRIFIÉ).

- **PowerTakeOffs** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PowerTakeOffs.prerequisitesPresent(specializations: any)` | 18 | ✍ Retourne true si le type de véhicule possède AttacherJoints ou Attachable. |
| `PowerTakeOffs.initSpecialization()` | 25 | ✍ Enregistre les clés XML du véhicule (sortie/entrée/locale, ignoreInvalidJointIndices, maxUpdateDistance, sons, indices de prise pour pièces et outils mobiles, indice de tableau de bord) et construit un schéma XML distinct pour les fichiers d'arbres de prise de force (nœuds, taille, longueur min, angle max, matériaux, pièces d'articulation). |
| `PowerTakeOffs.registerXMLPaths(schema: any, basePath: any)` | 98 | ✍ Enregistre les chemins XML des prises de sortie, d'entrée et locales sous un chemin de base donné. |
| `PowerTakeOffs.registerOutputXMLPaths(schema: any, basePath: any)` | 106 | ✍ Enregistre les attributs XML d'une prise de sortie : nœud de sortie, attaches (par indice ou nœud), ptoName, indice de saut vers l'entrée, nœuds d'animation, changements d'objets et valeur d'état de tableau de bord. |
| `PowerTakeOffs.registerInputXMLPaths(schema: any, basePath: any)` | 120 | ✍ Enregistre les attributs XML d'une prise d'entrée : nœud d'entrée, attaches d'entrée, nœud de rangement, aboveAttacher, modèles de matériau, longueur prédéfinie, fichier de configuration de prise (fichier Walterscheid par défaut), ptoName, nœuds d'animation et changements d'objets. |
| `PowerTakeOffs.registerFunctions(vehicleType: any)` | 153 | ✍ Ajoute l'API des prises de force au type de véhicule : chargeurs, mise à jour, attelage/dételage, rangement, test de collision, recherche par indice d'attache et nom, et fonctions des arbres typés (simple, double, basique). |
| `PowerTakeOffs.registerOverwrittenFunctions(vehicleType: any)` | 192 | ✍ Surcharge loadExtraDependentParts et updateExtraDependentParts afin que les pièces et outils mobiles puissent piloter les mises à jour des prises de force. |
| `PowerTakeOffs.registerEventListeners(vehicleType: any)` | 199 | ✍ Abonne aux événements onPreLoad, onLoad, onPostLoad, onDelete, onUpdateInterpolation, onUpdateEnd et aux événements d'attelage et de dételage d'outil (avant/après). |
| `PowerTakeOffs:onPreLoad(savegame: any)` | 213 | ✍ Mémorise l'indice de configuration de prise de force retourné par getPowerTakeOffConfigIndex. |
| `PowerTakeOffs:onLoad(savegame: any)` | 220 | ✍ Crée les tables de prises de sortie, d'entrée et locales, lit ignoreInvalidJointIndices et maxUpdateDistance, et charge côté client les sons turnedOn. Sur un serveur sans client, retire l'écouteur d'interpolation. |
| `PowerTakeOffs:onPostLoad(savegame: any)` | 241 | ✍ Charge les prises depuis vehicle.powerTakeOffs, puis depuis l'entrée de configuration sélectionnée si elle existe. Fait après le chargement pour que toutes les attaches existent déjà. |
| `PowerTakeOffs:onDelete()` | 255 | ✍ Libère les fichiers XML et les requêtes i3d partagées des prises, supprime les nœuds d'animation et les nœuds des prises de sortie, d'entrée et locales, et supprime les sons turnedOn. |
| `PowerTakeOffs:onUpdateInterpolation(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 322 | ✍ Client uniquement, dans la limite de maxUpdateDistance : met à jour les arbres des prises d'entrée des véhicules connectés de la même boucle de mise à jour, ainsi que ceux des outils attelés. Quand l'état actif change, démarre ou arrête les animations et le son turnedOn. |
| `PowerTakeOffs:onUpdateEnd(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 395 | ✍ Exécute onUpdateInterpolation une dernière fois avant la mise en veille de la physique. |
| `PowerTakeOffs:getPowerTakeOffConfigIndex()` | 402 | ✍ Retourne 1 par défaut ; destinée à être surchargée par une spécialisation qui choisit une configuration de prise de force. |
| `PowerTakeOffs:loadPowerTakeOffsFromXML(xmlFile: any, key: any)` | 408 | ✍ Parcourt les entrées output (si AttacherJoints), input (si Attachable) et local sous une clé et range chaque prise chargée avec succès dans sa liste. |
| `PowerTakeOffs:loadOutputPowerTakeOff(xmlFile: any, baseName: any, powerTakeOffOutput: any)` | 439 | ✍ Charge une prise de sortie : nœud de sortie (ou indice de saut vers l'entrée), attaches par indice ou nœud, nom, animations et changements d'objets, et enregistre une valeur de tableau de bord « powerTakeOffs.state ». Retourne false si rien de valide n'est configuré. |
| `PowerTakeOffs:loadInputPowerTakeOff(xmlFile: any, baseName: any, powerTakeOffInput: any)` | 518 | ✍ Charge une prise d'entrée : nœud d'entrée, attaches d'entrée, nœud de rangement optionnel (quand Platform.gameplay.hasDetachedPowerTakeOffs), matériaux, nom, animations, changements d'objets et fichier de configuration de l'arbre. Retourne false sans nœud ou attache valide. |
| `PowerTakeOffs:loadLocalPowerTakeOff(xmlFile: any, baseName: any, powerTakeOffLocal: any)` | 588 | ✍ Charge une prise locale entre startNode et endNode d'un même véhicule, avec matériaux et longueur prédéfinie optionnels, puis charge son fichier de configuration d'arbre. Retourne false si un nœud manque. |
| `PowerTakeOffs:placeLocalPowerTakeOff(powerTakeOff: any)` | 618 | ✍ Une fois l'i3d chargé, relie l'arbre au nœud de fin la première fois, calcule sa longueur, puis met à jour sa pose. |
| `PowerTakeOffs:updatePowerTakeOff(input: any, dt: any)` | 636 | ✍ Appelle la fonction de mise à jour propre à l'arbre (simple ou double cardan) si son i3d est chargé et qu'il est relié ou placé. |
| `PowerTakeOffs:updateAttachedPowerTakeOffs(dt: any, attacherVehicle: any)` | 646 | ✍ Met à jour les arbres des prises d'entrée de cet outil connectés au véhicule porteur donné, quand les deux partagent le même indice de boucle de mise à jour. |
| `PowerTakeOffs:updatePowerTakeOffLength(input: any)` | 661 | ✍ Recalcule la longueur de l'arbre via sa fonction de distance lorsque l'i3d est chargé. |
| `PowerTakeOffs:getOutputPowerTakeOffsByJointDescIndex(jointDescIndex: any)` | 671 | ✍ Retourne les prises de sortie liées à un indice d'attache. Si l'une est une entrée de saut vers l'entrée, la recherche est redirigée vers le véhicule porteur de ce véhicule. |
| `PowerTakeOffs:getOutputPowerTakeOffs()` | 699 | ✍ Retourne la table des prises de sortie. |
| `PowerTakeOffs:getInputPowerTakeOffsByJointDescIndexAndName(jointDescIndex: any, ptoName: any)` | 705 | ✍ Retourne les prises d'entrée correspondant à un indice d'attache d'entrée et à un nom de prise. S'il n'y en a pas, suit les sorties de saut vers l'entrée jusqu'à l'outil suivant dans la chaîne. |
| `PowerTakeOffs:getInputPowerTakeOffs()` | 735 | ✍ Retourne la table des prises d'entrée. |
| `PowerTakeOffs:getIsPowerTakeOffActive()` | 741 | ✍ Retourne false par défaut ; les spécialisations la surchargent pour indiquer quand l'arbre doit s'animer et émettre du son. |
| `PowerTakeOffs:attachPowerTakeOff(attachableObject: any, inputJointDescIndex: any, jointDescIndex: any)` | 747 | ✍ Associe chaque prise de sortie de l'attache à la prise d'entrée correspondante (même ptoName) de l'objet attelé et met le montage en file d'attente. Retourne toujours true. |
| `PowerTakeOffs:detachPowerTakeOff(detachingVehicle: any, implement: any, jointDescIndex: any)` | 770 | ✍ Vide les montages en attente, appelle la fonction de dételage de chaque prise d'entrée connectée, arrête les animations de sortie, réinitialise les connexions et désactive les changements d'objets. Retourne toujours true. |
| `PowerTakeOffs:checkPowerTakeOffCollision(attacherJointNode: any, jointDescIndex: any, isTrailerAttacher: any)` | 809 | ✍ Pour les attaches de type remorque uniquement, détache la prise si sa sortie se trouve du mauvais côté (dessous ou dessus) de l'attache par rapport au réglage aboveAttacher de l'entrée. |
| `PowerTakeOffs:parkPowerTakeOff(input: any)` | 828 | ✍ Range l'arbre quand il n'est pas attelé : l'accroche au nœud de rangement s'il existe, sinon cache les deux extrémités à l'intérieur du véhicule. Réinitialise les décalages d'extrémité. |
| `PowerTakeOffs:onPreAttachImplement(attachableObject: any, inputJointDescIndex: any, jointDescIndex: any, loadFromSavegame: any)` | 854 | ✍ Appelle attachPowerTakeOff juste avant l'attelage d'un outil. |
| `PowerTakeOffs:onPostAttachImplement(attachableObject: any, inputJointDescIndex: any, jointDescIndex: any, loadFromSavegame: any)` | 860 | ✍ Après l'attelage, exécute les montages en attente pour cette attache : appelle la fonction d'attelage de la prise d'entrée et active les changements d'objets de l'entrée et de la sortie. |
| `PowerTakeOffs:onPreDetachImplement(implement: any)` | 882 | ✍ Appelle detachPowerTakeOff avant le dételage d'un outil et arrête le son turnedOn côté client. |
| `PowerTakeOffs:loadPowerTakeOffFromConfigFile(powerTakeOff: any, xmlFilename: any)` | 893 | ✍ Ouvre un fichier XML d'arbre de prise de force et demande son i3d de façon asynchrone comme i3d partagé, avec onPowerTakeOffI3DLoaded en rappel. Avertit si le fichier ou le nom de l'i3d manque. |
| `PowerTakeOffs:onPowerTakeOffI3DLoaded(i3dNode: any, failedReason: any, args: any)` | 917 | ✍ Rappel asynchrone : lit taille, longueur min, angle max et décalage, charge les animations, applique les matériaux, choisit le chargeur simple, double ou basique, relie le nœud de départ, range ou place l'arbre, puis supprime le nœud i3d temporaire et le fichier XML. |
| `PowerTakeOffs:loadSingleJointPowerTakeOff(powerTakeOff: any, xmlFile: any, components: any, i3dMappings: any)` | 982 | ✍ Charge les nœuds d'un arbre à cardan simple (articulations, pièces d'échelle et de translation, décalcomanie, nœud de liaison), calcule les longueurs de base et définit les fonctions de mise à jour, de distance, d'attelage et de dételage de ce type. |
| `PowerTakeOffs:updateSingleJointPowerTakeOff(powerTakeOff: any, dt: any)` | 1018 | ✍ Oriente l'articulation de départ vers le nœud de liaison, règle la distance de l'articulation de fin et met à l'échelle la pièce d'échelle pour suivre l'écart. |
| `PowerTakeOffs:loadDoubleJointPowerTakeOff(powerTakeOff: any, xmlFile: any, components: any, i3dMappings: any)` | 1033 | ✍ Charge les nœuds d'un arbre à double cardan (deux articulations de départ et deux de fin, pièces d'échelle et de translation, décalcomanie, nœud de liaison) et définit ses fonctions de mise à jour, de distance, d'attelage et de dételage. |
| `PowerTakeOffs:updateDoubleJointPowerTakeOff(powerTakeOff: any, dt: any)` | 1073 | ✍ Oriente les quatre articulations pour que les deux cardans se partagent la courbure, règle la distance de l'articulation de fin et met à l'échelle la pièce d'échelle. |
| `PowerTakeOffs:loadBasicPowerTakeOff(powerTakeOff: any, xmlFile: any, components: any, i3dMappings: any)` | 1098 | ✍ Charge un arbre basique : seulement les nœuds de départ et de liaison, avec les fonctions d'attelage et de dételage typées et sans fonction de mise à jour. |
| `PowerTakeOffs:updateDistanceOfTypedPowerTakeOff(powerTakeOff: any)` | 1108 | ✍ Met à l'échelle la partie télescopique selon la distance actuelle départ-liaison (ou la longueur prédéfinie) et ajuste ou masque la décalcomanie selon la longueur disponible. |
| `PowerTakeOffs:attachTypedPowerTakeOff(powerTakeOff: any, output: any)` | 1130 | ✍ Si l'attelage est valide, relie l'arbre entre le nœud de sortie et le nœud d'entrée, définit les décalages, met à jour la pose et la longueur, l'affiche et le marque comme relié. |
| `PowerTakeOffs:detachTypedPowerTakeOff(powerTakeOff: any, output: any)` | 1150 | ✍ Range l'arbre via parkPowerTakeOff lorsqu'il est détaché. |
| `PowerTakeOffs:validatePowerTakeOffAttachment(powerTakeOff: any, output: any)` | 1156 | ✍ Retourne false si un nœud manque, si la distance sortie-entrée est inférieure à minLength ou si l'angle vertical dépasse maxAngle ; sinon true. |
| `PowerTakeOffs:loadExtraDependentParts(superFunc: any, xmlFile: any, baseName: any, entry: any)` | 1180 | ✍ Après le chargeur parent, lit les listes powerTakeOffs#indices et #localIndices d'une pièce ou d'un outil mobile. Retourne false si le parent a échoué. |
| `PowerTakeOffs:updateExtraDependentParts(superFunc: any, part: any, dt: any)` | 1208 | ✍ Après la mise à jour parente, rafraîchit les prises d'entrée et locales listées de la pièce ; un indice inconnu est retiré avec un avertissement une fois le chargement terminé. |
| `PowerTakeOffs.consoleCommandTestConnection(vehicle: any, attacherJointIndex: any)` | 1242 | ✍ Gestionnaire de commande console de débogage : pour un indice d'attache, affiche sur les sorties correspondantes un arbre de test magenta, les changements d'objets, une ligne et une étiquette de débogage, et les retire sur les autres. |
| `PowerTakeOffs.consoleCommandDebug(_: any)` | 1295 | ✍ Gestionnaire de commande console de débogage : dispose devant le joueur tous les XML d'arbres de prise de force trouvés sous data/shared/assets/powerTakeOffs en trois variantes (simple, colorée, animée et mobile), avec des objets véhicules factices. Remplace tout jeu de débogage précédent. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `getPowerTakeOffConfigIndex` | 154 |
| registerFunction | `loadPowerTakeOffsFromXML` | 155 |
| registerFunction | `loadOutputPowerTakeOff` | 156 |
| registerFunction | `loadInputPowerTakeOff` | 157 |
| registerFunction | `loadLocalPowerTakeOff` | 158 |
| registerFunction | `placeLocalPowerTakeOff` | 159 |
| registerFunction | `updatePowerTakeOff` | 160 |
| registerFunction | `updateAttachedPowerTakeOffs` | 161 |
| registerFunction | `updatePowerTakeOffLength` | 162 |
| registerFunction | `getOutputPowerTakeOffsByJointDescIndex` | 163 |
| registerFunction | `getOutputPowerTakeOffs` | 164 |
| registerFunction | `getInputPowerTakeOffs` | 165 |
| registerFunction | `getInputPowerTakeOffsByJointDescIndexAndName` | 166 |
| registerFunction | `getIsPowerTakeOffActive` | 167 |
| registerFunction | `attachPowerTakeOff` | 168 |
| registerFunction | `detachPowerTakeOff` | 169 |
| registerFunction | `checkPowerTakeOffCollision` | 170 |
| registerFunction | `parkPowerTakeOff` | 171 |
| registerFunction | `loadPowerTakeOffFromConfigFile` | 173 |
| registerFunction | `onPowerTakeOffI3DLoaded` | 174 |
| registerFunction | `loadSingleJointPowerTakeOff` | 176 |
| registerFunction | `updateSingleJointPowerTakeOff` | 177 |
| registerFunction | `loadDoubleJointPowerTakeOff` | 179 |
| registerFunction | `updateDoubleJointPowerTakeOff` | 180 |
| registerFunction | `loadBasicPowerTakeOff` | 182 |
| registerFunction | `attachTypedPowerTakeOff` | 184 |
| registerFunction | `detachTypedPowerTakeOff` | 185 |
| registerFunction | `validatePowerTakeOffAttachment` | 187 |
| registerOverwrittenFunction | `loadExtraDependentParts` | 193 |
| registerOverwrittenFunction | `updateExtraDependentParts` | 194 |
| registerEventListener | `onPreLoad` | 200 |
| registerEventListener | `onLoad` | 201 |
| registerEventListener | `onPostLoad` | 202 |
| registerEventListener | `onDelete` | 203 |
| registerEventListener | `onUpdateInterpolation` | 204 |
| registerEventListener | `onUpdateEnd` | 205 |
| registerEventListener | `onPreAttachImplement` | 206 |
| registerEventListener | `onPostAttachImplement` | 207 |
| registerEventListener | `onPreDetachImplement` | 208 |

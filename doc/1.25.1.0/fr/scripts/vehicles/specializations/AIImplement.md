# vehicles/specializations/AIImplement.lua

*[English version](../../../../scripts/vehicles/specializations/AIImplement.md)*

Source: `dataS/scripts/vehicles/specializations/AIImplement.lua` — FS25 1.25.1.0

✍ Spécialisation (sans prérequis) qui donne aux outils et équipements leurs données IA : marqueurs de zone et de taille, déclencheur de collision, limites de rayon de braquage, règles d'abaissement et de demi-tour en marche arrière, réglages de tournières et d'alignement sur les rangs, et exigences de sol, de cultures et de hauteur de densité qui décident où l'IA peut travailler. Elle lit le nœud XML vehicle.ai, éventuellement remplacé par une entrée aiConfigurations choisie par la configuration "ai". Elle déclare les événements onAIImplement* (début, fin, ligne, virage, blocage, etc.) ; le code qui déclenche la plupart d'entre eux se trouve dans d'autres fichiers. Les exigences sont converties en objet FieldCropsQuery, dont le comportement côté moteur est NON VÉRIFIÉ.

- **AIImplement** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIImplement.prerequisitesPresent(specializations: table) → boolean` | 17 | ✍ Renvoie toujours vrai : n'importe quel type de véhicule peut porter cette spécialisation. |
| `AIImplement.initSpecialization()` | 23 | ✍ Ajoute le type de configuration de véhicule "ai" et déclare les chemins XML vehicle.ai, ainsi que les mêmes chemins sous chaque entrée aiConfiguration. |
| `AIImplement.registerAIImplementXMLPaths(schema: any, basePath: any)` | 37 | ✍ Déclare sous un chemin de base tous les réglages XML IA d'un équipement : rayon de braquage, abaissement, alignement sur la racine, virage en arrière, drapeaux vignoble, nœud inverseur, limitation de virage, anticipation, couverture, tournières, chevauchement et alignement sur les rangs. |
| `AIImplement.registerAIImplementBaseXMLPaths(schema: any, basePath: any)` | 80 | ✍ Déclare les marqueurs de zone (gauche, droite, arrière, décalage latéral, largeur, décalage de validité) et de taille, puis les chemins du déclencheur de collision. Réutilisable par d'autres spécialisations pour leurs propres configurations IA. |
| `AIImplement.registerAICollisionTriggerXMLPaths(schema: any, basePath: any)` | 98 | ✍ Déclare les clés XML collisionTrigger : useSize, node, backNode, width (4 par défaut), height (3 par défaut) et length (5 par défaut). |
| `AIImplement.registerEvents(vehicleType: any)` | 109 | ✍ Enregistre les événements de véhicule onAIImplement* : début, actif, fin, préparation au travail ou au transport, début et fin de ligne, début, progression et fin de virage, changement de décalage latéral, blocage, reprise, et les deux événements de blocage et reprise du véhicule de travail. |
| `AIImplement.registerFunctions(vehicleType: any)` | 136 | ✍ Ajoute au type de véhicule les accesseurs, mutateurs, fonctions d'exigences et aides de début et fin de ligne de la spécialisation. |
| `AIImplement.registerOverwrittenFunctions(vehicleType: any)` | 211 | ✍ Surcharge addVehicleToAIImplementList, getAllowTireTracks, getDoConsumePtoPower et checkMovingPartDirtyUpdateNode. |
| `AIImplement.registerEventListeners(vehicleType: any)` | 220 | ✍ Abonne la spécialisation à onLoad, onPostLoad et onPostAIFieldCourseSettingsInitialized. |
| `AIImplement:onLoad(savegame: table)` | 229 | ✍ Signale les clés XML obsolètes, choisit vehicle.ai ou l'aiConfiguration sélectionnée par la configuration "ai", et charge tous les réglages IA dans spec_aiImplement : marqueurs, abaissement, virage, tournières, chevauchement, alignement sur les rangs (depuis un type de culture ou des valeurs explicites) et listes d'exigences vides. Lit aussi les canaux de type de sol du système de sol des champs. |
| `AIImplement:onPostLoad(savegame: any)` | 353 | ✍ Résout les indices de roues de la limitation de virage en objets roue (avertissement si indice inconnu) et précalcule les décalages des marqueurs par rapport à chaque point d'attelage d'entrée pour la configuration principale et chaque configuration personnalisée. |
| `AIImplement:onPostAIFieldCourseSettingsInitialized(fieldCourseSettings: any)` | 385 | ✍ Appelé quand les réglages automatiques du parcours de champ sont prêts : copie les valeurs XML de cet outil (drapeaux vignoble, évitement de queue, redressage, alternance du décalage latéral, nombre min et max de tournières, découpe des coins, direction forcée) dans l'objet de réglages fourni. |
| `AIImplement:loadAICollisionTriggerFromXML(xmlFile: any, key: any)` | 436 | ✍ Construit une table de déclencheur de collision depuis une clé : utilise le nœud indiqué avec largeur, hauteur et longueur ou, avec useSize, crée des nœuds à partir de la boîte de taille du véhicule ; crée un nœud arrière retourné s'il manque. Renvoie nil si aucun des deux n'est défini. |
| `AIImplement:loadAIImplementBaseSetupFromXML(xmlFile: any, key: any, availableFunc: any)` | 482 | ✍ Charge marqueurs, décalages latéraux, largeur des marqueurs (calculée à partir des marqueurs gauche et droit si absente), marqueurs de taille et déclencheur de collision depuis une clé. Sans availableFunc, il remplit la spec principale ; avec, il crée une configuration alternative stockée dans aiBaseSetups. Renvoie toujours vrai. |
| `AIImplement:getCustomAIImplementBaseSetup()` | 523 | ✍ Renvoie la première configuration IA alternative dont la fonction de disponibilité renvoie vrai pour ce véhicule, ou nil si aucune ne s'applique. |
| `AIImplement:getCanAIImplementContinueWork(isTurning: any)` | 537 | ✍ Point d'extension par défaut renvoyant vrai, faux, nil ; d'autres spécialisations le surchargent pour signaler qu'il faut suspendre le travail (le sens des valeurs supplémentaires est NON VÉRIFIÉ). |
| `AIImplement:getCanImplementBeUsedForAI()` | 543 | ✍ Renvoie vrai seulement si les marqueurs IA gauche, droit et arrière sont tous définis. |
| `AIImplement:addVehicleToAIImplementList(superFunc: any, list: any)` | 554 | ✍ Surcharge : ajoute ce véhicule à la liste sous la forme {object=self} s'il est utilisable par l'IA, puis appelle le parent pour ajouter aussi les véhicules attelés. |
| `AIImplement:getAllowTireTracks(superFunc: any)` | 564 | ✍ Surcharge : les traces de pneus ne sont autorisées que si le parent les autorise et que le véhicule n'est pas sous contrôle de l'IA. |
| `AIImplement:getDoConsumePtoPower(superFunc: any)` | 570 | ✍ Surcharge : renvoie faux pendant que l'IA du véhicule racine tourne en tournière (pour éviter des virages lents) ; sinon délègue au parent. |
| `AIImplement:checkMovingPartDirtyUpdateNode(superFunc: any, node: any, movingPart: any)` | 584 | ✍ Surcharge : après le contrôle du parent, journalise une erreur XML si un marqueur IA, un marqueur de taille ou un déclencheur de collision se trouve dans une pièce mobile à distance de mise à jour limitée, ce qui fausserait le positionnement IA. |
| `AIImplement:getAIMinTurningRadius()` | 603 | ✍ Renvoie le rayon de braquage minimal défini dans le XML, ou nil s'il n'est pas défini. |
| `AIImplement:getAIMarkers()` | 609 | ✍ Renvoie les nœuds de marqueurs gauche, droit et arrière, un indicateur d'inversion, la largeur des marqueurs et le décalage de validité, en déléguant au premier équipement attelé si configuré ainsi, et en échangeant gauche et droite si inversé. Utilise une configuration alternative si disponible. |
| `AIImplement:updateAIMarkerWidth()` | 635 | ✍ Renseigne une largeur de marqueurs manquante à partir de la distance entre marqueurs gauche et droit pour la configuration principale et les alternatives. À noter : onLoad fixe toujours la largeur, ces branches s'exécutent donc rarement. |
| `AIImplement:setAIMarkersInverted(state: any)` | 663 | ✍ Bascule l'état inversé des marqueurs IA. À noter : le paramètre state est ignoré, l'indicateur est toujours inversé. |
| `AIImplement:calcAIMarkerAttacherJointOffset(leftMarker: any, rightMarker: any, backMarker: any)` | 670 | ✍ Pour chaque point d'attelage d'entrée, stocke les décalages avant et arrière des marqueurs donnés par rapport au nœud du point, afin que l'IA tienne compte plus tard de l'attelage de l'outil. |
| `AIImplement:getAIMarkerAttacherJointOffset(leftMarker: any)` | 695 | ✍ Renvoie l'entrée de décalage stockée pour le marqueur gauche donné et le point d'attelage d'entrée actif, ou nil s'il n'y en a pas. |
| `AIImplement:getAIInvertMarkersOnTurn(turnLeft: any)` | 713 | ✍ Point d'extension par défaut renvoyant faux : les marqueurs ne sont pas inversés en virage ; surchargeable. |
| `AIImplement:getAISizeMarkers()` | 719 | ✍ Renvoie les nœuds de marqueurs de taille gauche, droit et arrière de la configuration active (alternative ou principale). |
| `AIImplement:getAILookAheadSize()` | 732 | ✍ Renvoie la distance d'anticipation utilisée pour vérifier le sol devant l'outil (3 par défaut). |
| `AIImplement:getAIHasNoFullCoverageArea()` | 738 | ✍ Renvoie si l'outil ne couvre pas toute sa largeur (comme les charrues) et le décalage associé. |
| `AIImplement:getAIAreaOverlap()` | 744 | ✍ Renvoie le chevauchement entre lignes défini dans le XML, ou nil s'il n'est pas défini. |
| `AIImplement:getAIRowAlignment()` | 750 | ✍ Renvoie vrai avec l'espacement, l'angle d'alignement et le décalage quand l'alignement sur les rangs est configuré ; sinon faux, 0, 0, 0. |
| `AIImplement:getImplementAllowAutomaticSteering()` | 761 | ✍ Point d'extension par défaut renvoyant faux ; les équipements qui gèrent l'assistance à la conduite le surchargent (utilisé par AIAutomaticSteering). |
| `AIImplement:getAIImplementCollisionTrigger()` | 767 | ✍ Renvoie la table du déclencheur de collision de la configuration active, ou celle de la principale si l'alternative n'en a pas. |
| `AIImplement:getAIImplementCollisionTriggers(collisionTriggers: any)` | 780 | ✍ Ajoute le déclencheur de collision de ce véhicule, s'il existe, à la table fournie, indexée par véhicule. |
| `AIImplement:getAINeedsLowering()` | 789 | ✍ Renvoie si l'IA doit abaisser cet outil pour travailler (vrai par défaut). |
| `AIImplement:getAILowerIfAnyIsLowered()` | 795 | ✍ Renvoie si cet outil doit être abaissé dès qu'un autre outil IA attelé l'est. |
| `AIImplement:getAINeedsRootAlignment()` | 801 | ✍ Renvoie si l'outil doit pointer dans la même direction que le véhicule racine pendant le travail (vrai par défaut). |
| `AIImplement:getAIAllowTurnBackward()` | 807 | ✍ Renvoie si l'IA peut faire demi-tour en marche arrière avec cet outil (vrai par défaut). |
| `AIImplement:getAIBlockTurnBackward()` | 813 | ✍ Renvoie si cet outil interdit à l'IA de reculer (faux par défaut). |
| `AIImplement:getAIIsVineyardTool()` | 819 | ✍ Renvoie si le travail de champ IA avec cet outil est limité aux vignobles. |
| `AIImplement:getAIToolReverserDirectionNode()` | 825 | ✍ Renvoie le nœud de direction inverseur optionnel, utilisé comme nœud cible en marche arrière. |
| `AIImplement:getAITurnRadiusLimitation()` | 831 | ✍ Renvoie cinq valeurs : le rayon limite, le nœud d'articulation de rotation, la liste de roues, le facteur de limite de rotation et le facteur initial de rayon de braquage. |
| `AIImplement:setAIImplementVariableSideOffset(variableSideOffset: any)` | 838 | ✍ Définit l'indicateur signalant que le décalage latéral de l'outil peut changer pendant le travail. |
| `AIImplement:getAIImplementSideOffset()` | 844 | ✍ Renvoie le décalage latéral de la configuration active (0 s'il n'y en a pas) et l'indicateur de décalage latéral variable. |
| `AIImplement:setAIFruitRequirements(fruitType: any, minGrowthState: any, maxGrowthState: any)` | 857 | ✍ Remplace toutes les exigences de cultures par une seule : type de culture et plage d'états de croissance que l'IA doit trouver au sol. |
| `AIImplement:addAIFruitRequirement(fruitType: any, minGrowthState: any, maxGrowthState: any, customMapId: any, customMapStartChannel: any, customMapNumChannels: any)` | 864 | ✍ Ajoute une exigence de culture (type, états de croissance min et max, carte de densité personnalisée et canaux optionnels) et reconstruit la requête de cultures du champ si elle existe déjà. |
| `AIImplement:clearAIFruitRequirements()` | 878 | ✍ Supprime toutes les exigences de cultures et actualise la requête de cultures du champ. |
| `AIImplement:getAIFruitRequirements()` | 888 | ✍ Renvoie la liste des tables d'exigences de cultures. |
| `AIImplement:setAIDensityHeightTypeRequirements(fillType: any)` | 894 | ✍ Remplace les exigences de hauteur de densité (matière en tas) par le seul type de matière donné. |
| `AIImplement:addAIDensityHeightTypeRequirement(fillType: any)` | 901 | ✍ Ajoute un type de matière aux exigences de hauteur de densité et actualise la requête de cultures du champ. |
| `AIImplement:clearAIDensityHeightTypeRequirements()` | 910 | ✍ Supprime toutes les exigences de type de hauteur de densité et actualise la requête. |
| `AIImplement:getAIDensityHeightTypeRequirements()` | 920 | ✍ Renvoie la liste des types de matière de hauteur de densité exigés. |
| `AIImplement:getAIImplementUseVineSegment(placeable: any, segment: any, segmentSide: any)` | 926 | ✍ Point d'extension par défaut renvoyant vrai : l'IA peut utiliser le segment de vigne donné ; surchargeable. |
| `AIImplement:setAIFruitProhibitions(fruitType: any, minGrowthState: any, maxGrowthState: any)` | 932 | ✍ Remplace toutes les interdictions de cultures par une seule (type de culture et plage d'états de croissance où l'IA ne doit pas travailler). |
| `AIImplement:addAIFruitProhibitions(fruitType: any, minGrowthState: any, maxGrowthState: any, customMapId: any, customMapStartChannel: any, customMapNumChannels: any)` | 939 | ✍ Ajoute une interdiction de culture (type, plage d'états de croissance, carte de densité personnalisée et canaux optionnels) et actualise la requête de cultures du champ. |
| `AIImplement:clearAIFruitProhibitions()` | 954 | ✍ Supprime toutes les interdictions de cultures et actualise la requête. |
| `AIImplement:getAIFruitProhibitions()` | 964 | ✍ Renvoie la liste des tables d'interdictions de cultures. |
| `AIImplement:addAITerrainDetailRequiredRange(detailType1: any, detailType2: any, minState: any, maxState: any)` | 971 | ✍ Ajoute une plage de valeurs de détail de terrain exigée (deux types de détail et une plage de canaux, par défaut ceux du type de sol) et actualise la requête. |
| `AIImplement:addAIGroundTypeRequirements(groundTypes: any, excludedType1: any, excludedType2: any, excludedType3: any, excludedType4: any, excludedType5: any, excludedType6: any)` | 979 | ✍ Ajoute une plage de terrain exigée pour chaque type de sol listé, en ignorant jusqu'à six types exclus, et actualise la requête. |
| `AIImplement:clearAITerrainDetailRequiredRange()` | 999 | ✍ Supprime toutes les plages de détail de terrain exigées et actualise la requête. |
| `AIImplement:getAITerrainDetailRequiredRange()` | 1006 | ✍ Renvoie les plages de détail de terrain exigées, prises sur le premier équipement attelé qui en fournit si la configuration utilise les attributs de l'équipement attelé. |
| `AIImplement:addAITerrainDetailProhibitedRange(detailType1: any, detailType2: any, minState: any, maxState: any)` | 1025 | ✍ Ajoute une plage de valeurs de détail de terrain interdite et actualise la requête. |
| `AIImplement:clearAITerrainDetailProhibitedRange()` | 1032 | ✍ Supprime toutes les plages de détail de terrain interdites et actualise la requête. |
| `AIImplement:getAITerrainDetailProhibitedRange()` | 1039 | ✍ Renvoie les plages de détail de terrain interdites, en déléguant au premier équipement attelé si la configuration utilise ses attributs. |
| `AIImplement:getFieldCropsQuery()` | 1057 | ✍ Renvoie la requête de cultures du champ et son indicateur de validité, en créant la requête à la première utilisation. Elle n'est valide que si au moins une exigence ou interdiction existe. |
| `AIImplement:updateFieldCropsQuery()` | 1068 | ✍ Reconstruit la requête de cultures du champ seulement si elle a déjà été créée, pour ne pas en construire inutilement. |
| `AIImplement:compareFieldCropsQuery(otherVehicle: any)` | 1077 | ✍ Renvoie vrai si chaque exigence de culture, interdiction de culture et plage de terrain de ce véhicule existe aussi sur l'autre véhicule ; renvoie faux si l'autre n'a pas de lecteur d'exigences IA. À noter : la comparaison est à sens unique, les entrées supplémentaires de l'autre véhicule ne sont pas détectées. |
| `AIImplement:createFieldCropsQuery()` | 1171 | ✍ Construit une FieldCropsQuery sur la carte de densité du type de sol à partir des exigences et interdictions de cultures et des plages de terrain, et la marque valide si l'une existe. Ne fait rien si la carte du type de sol est indisponible. |
| `AIImplement:getIsAIImplementInLine()` | 1231 | ✍ Renvoie si l'équipement se trouve actuellement dans une ligne de travail. |
| `AIImplement:aiImplementStartLine()` | 1237 | ✍ Marque la ligne comme commencée, déclenche onAIImplementStartLine et en informe le contrôleur d'actions du véhicule racine. |
| `AIImplement:aiImplementEndLine()` | 1249 | ✍ Marque la ligne comme terminée, déclenche onAIImplementEndLine et en informe le contrôleur d'actions du véhicule racine. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEvent | `onAIImplementStart` | 110 |
| registerEvent | `onAIImplementActive` | 111 |
| registerEvent | `onAIImplementEnd` | 112 |
| registerEvent | `onAIImplementPrepareForWork` | 114 |
| registerEvent | `onAIImplementStartLine` | 116 |
| registerEvent | `onAIImplementEndLine` | 117 |
| registerEvent | `onAIImplementStartTurn` | 119 |
| registerEvent | `onAIImplementTurnProgress` | 120 |
| registerEvent | `onAIImplementEndTurn` | 121 |
| registerEvent | `onAIImplementSideOffsetChanged` | 123 |
| registerEvent | `onAIImplementBlock` | 125 |
| registerEvent | `onAIImplementContinue` | 126 |
| registerEvent | `onAIImplementPrepareForTransport` | 128 |
| registerEvent | `onAIImplementJobVehicleBlock` | 130 |
| registerEvent | `onAIImplementJobVehicleContinue` | 131 |
| registerFunction | `loadAICollisionTriggerFromXML` | 137 |
| registerFunction | `loadAIImplementBaseSetupFromXML` | 138 |
| registerFunction | `getCustomAIImplementBaseSetup` | 139 |
| registerFunction | `getCanAIImplementContinueWork` | 140 |
| registerFunction | `getCanImplementBeUsedForAI` | 141 |
| registerFunction | `getAIMinTurningRadius` | 142 |
| registerFunction | `getAIMarkers` | 143 |
| registerFunction | `updateAIMarkerWidth` | 144 |
| registerFunction | `setAIMarkersInverted` | 145 |
| registerFunction | `calcAIMarkerAttacherJointOffset` | 146 |
| registerFunction | `getAIMarkerAttacherJointOffset` | 147 |
| registerFunction | `getAIInvertMarkersOnTurn` | 148 |
| registerFunction | `getAISizeMarkers` | 149 |
| registerFunction | `getAILookAheadSize` | 150 |
| registerFunction | `getAIHasNoFullCoverageArea` | 151 |
| registerFunction | `getAIAreaOverlap` | 152 |
| registerFunction | `getAIRowAlignment` | 153 |
| registerFunction | `getImplementAllowAutomaticSteering` | 155 |
| registerFunction | `getAIImplementCollisionTrigger` | 157 |
| registerFunction | `getAIImplementCollisionTriggers` | 158 |
| registerFunction | `getAINeedsLowering` | 160 |
| registerFunction | `getAILowerIfAnyIsLowered` | 161 |
| registerFunction | `getAINeedsRootAlignment` | 162 |
| registerFunction | `getAIAllowTurnBackward` | 163 |
| registerFunction | `getAIBlockTurnBackward` | 164 |
| registerFunction | `getAIIsVineyardTool` | 165 |
| registerFunction | `getAIToolReverserDirectionNode` | 166 |
| registerFunction | `getAITurnRadiusLimitation` | 167 |
| registerFunction | `setAIImplementVariableSideOffset` | 169 |
| registerFunction | `getAIImplementSideOffset` | 170 |
| registerFunction | `setAIFruitProhibitions` | 172 |
| registerFunction | `addAIFruitProhibitions` | 173 |
| registerFunction | `clearAIFruitProhibitions` | 174 |
| registerFunction | `getAIFruitProhibitions` | 175 |
| registerFunction | `setAIFruitRequirements` | 177 |
| registerFunction | `addAIFruitRequirement` | 178 |
| registerFunction | `clearAIFruitRequirements` | 179 |
| registerFunction | `getAIFruitRequirements` | 180 |
| registerFunction | `setAIDensityHeightTypeRequirements` | 182 |
| registerFunction | `addAIDensityHeightTypeRequirement` | 183 |
| registerFunction | `clearAIDensityHeightTypeRequirements` | 184 |
| registerFunction | `getAIDensityHeightTypeRequirements` | 185 |
| registerFunction | `getAIImplementUseVineSegment` | 187 |
| registerFunction | `addAITerrainDetailRequiredRange` | 189 |
| registerFunction | `addAIGroundTypeRequirements` | 190 |
| registerFunction | `clearAITerrainDetailRequiredRange` | 191 |
| registerFunction | `getAITerrainDetailRequiredRange` | 192 |
| registerFunction | `addAITerrainDetailProhibitedRange` | 194 |
| registerFunction | `clearAITerrainDetailProhibitedRange` | 195 |
| registerFunction | `getAITerrainDetailProhibitedRange` | 196 |
| registerFunction | `getFieldCropsQuery` | 198 |
| registerFunction | `updateFieldCropsQuery` | 199 |
| registerFunction | `compareFieldCropsQuery` | 200 |
| registerFunction | `createFieldCropsQuery` | 201 |
| registerFunction | `getIsAIImplementInLine` | 203 |
| registerFunction | `aiImplementStartLine` | 205 |
| registerFunction | `aiImplementEndLine` | 206 |
| registerOverwrittenFunction | `addVehicleToAIImplementList` | 212 |
| registerOverwrittenFunction | `getAllowTireTracks` | 213 |
| registerOverwrittenFunction | `getDoConsumePtoPower` | 214 |
| registerOverwrittenFunction | `checkMovingPartDirtyUpdateNode` | 215 |
| registerEventListener | `onLoad` | 221 |
| registerEventListener | `onPostLoad` | 222 |
| registerEventListener | `onPostAIFieldCourseSettingsInitialized` | 223 |

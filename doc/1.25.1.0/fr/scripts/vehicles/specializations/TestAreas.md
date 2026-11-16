# vehicles/specializations/TestAreas.lua

*[English version](../../../../scripts/vehicles/specializations/TestAreas.md)*

Source: `dataS/scripts/vehicles/specializations/TestAreas.lua` — FS25 1.25.1.0

✍ Spécialisation utilitaire (exige WorkArea) qui ajoute des « zones de test » aux zones de travail : petits rectangles au sol vérifiés pour la présence de cultures ou de matière, afin que d'autres spécialisations sachent où l'outil est réellement en contact. Les zones viennent du XML ou sont générées automatiquement sur la largeur de la zone de travail. Le serveur échantillonne les density maps et synchronise les indicateurs de contact vers les clients sous forme de flux compact premier/dernier contact. Elle expose la largeur de contact et un taux de charge par zone de travail.

- **TestAreas** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `TestAreas.initSpecialization()` | 15 | ✍ Enregistre le schéma XML de testAreas sous les zones de travail et leurs configurations : génération auto, nodes racine/début/largeur, décalages, longueur, nombre (10), échelle de largeur (0,9), échelle et nodes testArea explicites. |
| `TestAreas.prerequisitesPresent(specializations: any)` | 54 | ✍ Renvoie true uniquement si le type de véhicule possède aussi la spécialisation WorkArea. |
| `TestAreas.registerFunctions(vehicleType: any)` | 60 | ✍ Enregistre les fonctions de lecture/écriture de flux, de génération, de calcul des dimensions, d'enregistrement, d'exigences, d'activité, de traitement et de requête de largeur/charge. |
| `TestAreas.registerOverwrittenFunctions(vehicleType: any)` | 75 | ✍ Surcharge loadWorkAreaFromXML. |
| `TestAreas.registerEventListeners(vehicleType: any)` | 81 | ✍ S'abonne à onPreLoad, onPostLoad, aux quatre événements de flux (lecture/écriture, simple et de mise à jour) et à onUpdateTick. |
| `TestAreas:onPreLoad(savegame: any)` | 93 | ✍ Crée les listes de zones de test et réserve un dirty flag servant à synchroniser les changements de contact. |
| `TestAreas:onPostLoad(savegame: any)` | 105 | ✍ Construit la table de zones de test par index de zone de travail à partir de la table par zone de travail. |
| `TestAreas:onReadStream(streamId: any, connection: any)` | 115 | ✍ Synchronisation initiale à la connexion : lit les indicateurs de contact. |
| `TestAreas:onWriteStream(streamId: any, connection: any)` | 121 | ✍ Synchronisation initiale à la connexion : écrit les indicateurs de contact. |
| `TestAreas:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 127 | ✍ Côté client : lit les indicateurs de contact quand le serveur a signalé un changement dans cette mise à jour. |
| `TestAreas:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 137 | ✍ Côté serveur : écrit un booléen pour le dirty flag et, s'il est actif, les indicateurs de contact. |
| `TestAreas:readTestAreasStream(streamId: any, connection: any)` | 147 | ✍ Lit l'état de contact compact : balayage du premier contact depuis la gauche, puis du dernier depuis la droite, et marque comme en contact toutes les zones entre les deux. |
| `TestAreas:writeTestAreasStream(streamId: any, connection: any)` | 186 | ✍ Écrit l'état de contact compact : booléens jusqu'au premier contact depuis la gauche, puis depuis la droite jusqu'au dernier contact. |
| `TestAreas:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 212 | ✍ Pour chaque zone de travail active, teste les zones depuis la gauche pour trouver le premier contact, puis depuis la droite pour le dernier, marque celles entre les deux comme en contact et mémorise la largeur min/max obtenue. Les zones inactives reviennent à une largeur illimitée. |
| `TestAreas:loadWorkAreaFromXML(superFunc: any, workArea: any, xmlFile: any, key: any)` | 272 | ✍ Surcharge : après le chargement de la zone de travail par le parent, lit ses réglages testAreas (avertit si la plateforme les interdit), puis génère automatiquement les zones ou lit les entrées testArea explicites. Renvoie false si le parent échoue. |
| `TestAreas:generateTestAreasForWorkArea(workArea: any)` | 339 | ✍ Crée des transform groups et découpe la largeur de la zone de travail en numAreas zones de test égales (avec décalages latéraux, longueur et décalage z), en enregistrant chacune. |
| `TestAreas:calculateTestAreaDimensions(workArea: any, testArea: any)` | 384 | ✍ Calcule le X min/max de la zone de test relativement au node racine de la zone de travail et élargit la plage X globale de la zone de travail. |
| `TestAreas:registerTestAreaForWorkArea(workArea: any, testArea: any)` | 398 | ✍ Réinitialise les indicateurs de contact d'une zone de test et l'ajoute à la liste par zone de travail et à la liste globale. |
| `TestAreas:setTestAreaRequirements(fruitTypeIndex: any, fillTypeIndex: any, allowsForageGrowthState: any)` | 413 | ✍ Définit ce que cherchent les zones : un type de fruit (avec états de croissance fourragère optionnels) ou un type de remplissage ; FruitType.UNKNOWN et FillType.UNKNOWN valent aucun. |
| `TestAreas:getIsTestAreaActive(testArea: any)` | 431 | ✍ Point d'extension renvoyant true par défaut ; d'autres spécialisations peuvent le surcharger pour désactiver une zone. |
| `TestAreas:processTestArea(testArea: any)` | 437 | ✍ Serveur : échantillonne la density map (surface de fruit ou niveau de remplissage en hauteur) sous la zone et met à jour son indicateur de contact, en levant le dirty flag en cas de changement. Les clients ne font que du debug. Renvoie l'état de contact courant de la zone. |
| `TestAreas:getTestAreaWidthByWorkAreaIndex(workAreaIndex: any)` | 479 | ✍ Renvoie les X min/max de contact courants, les X min/max totaux et true quand la zone de travail a des zones de test ; sinon des bornes en demi-largeur et false, ou des valeurs illimitées si l'index est inconnu. |
| `TestAreas:getTestAreaChargeByWorkAreaIndex(workAreaIndex: any)` | 496 | ✍ Renvoie la fraction (0 à 1) des zones de test de la zone de travail actuellement en contact, ou 1 si elle n'en a pas. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `readTestAreasStream` | 61 |
| registerFunction | `writeTestAreasStream` | 62 |
| registerFunction | `generateTestAreasForWorkArea` | 63 |
| registerFunction | `calculateTestAreaDimensions` | 64 |
| registerFunction | `registerTestAreaForWorkArea` | 65 |
| registerFunction | `setTestAreaRequirements` | 66 |
| registerFunction | `getIsTestAreaActive` | 67 |
| registerFunction | `processTestArea` | 68 |
| registerFunction | `getTestAreaWidthByWorkAreaIndex` | 69 |
| registerFunction | `getTestAreaChargeByWorkAreaIndex` | 70 |
| registerOverwrittenFunction | `loadWorkAreaFromXML` | 76 |
| registerEventListener | `onPreLoad` | 82 |
| registerEventListener | `onPostLoad` | 83 |
| registerEventListener | `onReadStream` | 84 |
| registerEventListener | `onWriteStream` | 85 |
| registerEventListener | `onReadUpdateStream` | 86 |
| registerEventListener | `onWriteUpdateStream` | 87 |
| registerEventListener | `onUpdateTick` | 88 |

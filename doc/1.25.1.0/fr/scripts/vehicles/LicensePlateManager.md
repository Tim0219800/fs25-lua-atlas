# vehicles/LicensePlateManager.lua

*[English version](../../../scripts/vehicles/LicensePlateManager.md)*

Source: `dataS/scripts/vehicles/LicensePlateManager.lua` — FS25 1.25.1.0

✍ Gestionnaire de plaques d'immatriculation par carte, sous-classe de AbstractManager exposée comme `g_licensePlateManager`. Au chargement de la carte, il lit le fichier référencé par `map.licensePlates#filename`, charge chaque i3d de plaque en asynchrone dans des objets LicensePlate, et lit le nom de police, les couleurs et le placement par défaut. Il contient aussi les fonctions statiques de sérialisation des données de plaque vers les flux réseau et le XML de sauvegarde. Les constantes PLATE_TYPE, PLATE_POSITION, PLACEMENT_OPTION et SEND_NUM_BITS_* sont utilisées ici mais définies hors du code visible (NON VÉRIFIÉ).

- **LicensePlateManager** hérite de `AbstractManager` (l.44)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `LicensePlateManager.new(customMt: table?) → table` | 54 | ✍ Constructeur. Délègue à `AbstractManager.new` avec la métatable de cette classe sauf si une métatable personnalisée est fournie. |
| `LicensePlateManager:initDataStructures()` | 60 | ✍ Réinitialise la liste des plaques, les configurations de couleur, l'indicateur de disponibilité et les identifiants de requêtes i3d partagées. |
| `LicensePlateManager:loadMapData(xmlFile: integer, missionInfo: table, baseDirectory: string) → boolean` | 73 | ✍ Charge les plaques depuis le fichier nommé dans le XML de la carte, s'il existe, et retourne toujours true. Libère le XML immédiatement sauf si des chargements asynchrones de plaques en ont encore besoin. |
| `LicensePlateManager:unloadMapData()` | 97 | ✍ Supprime toutes les plaques, libère les requêtes i3d partagées et le fichier XML, puis appelle le déchargement du parent. |
| `LicensePlateManager:loadLicensePlatesFromXML(xmlFile: table, baseDirectory: string)` | 121 | ✍ Lit le nom de police, les réglages de couleur (matériau de plaque, paramètre de shader, couleurs personnalisées, éventuellement couleurs de marque par défaut plus sombres qu'un seuil de luminosité) et le placement par défaut. Lance le chargement asynchrone de chaque i3d de plaque. |
| `LicensePlateManager:licensePlateI3DFileLoaded(i3dNode: integer, failedReason: integer, args: table?)` | 204 | ✍ Callback asynchrone à la fin du chargement d'un i3d de plaque : détache le noeud de plaque, construit un LicensePlate depuis le XML et le stocke s'il est valide, supprime la racine i3d chargée. À la fin de la dernière requête, ferme le XML et met à jour la disponibilité. |
| `LicensePlateManager:getAreLicensePlatesAvailable() → boolean` | 237 | ✍ Indique si au moins une plaque est chargée et si le matériau de police existe. Retourne l'objet matériau de police plutôt qu'un booléen strict quand les deux conditions sont remplies. |
| `LicensePlateManager:getLicensePlate(preferedType: integer, includeFrame: boolean?) → table` | 246 | ✍ Retourne un clone de la dernière plaque chargée du type préféré, ou de la première plaque si aucune ne correspond. Retourne nil s'il n'y a aucune plaque. L'appelant possède le clone. |
| `LicensePlateManager:getLicensePlateValues(licensePlate: table, variationIndex: integer) → table` | 266 | ✍ Retourne la liste des valeurs d'une variation de plaque, ou nil si la variation n'existe pas. |
| `LicensePlateManager:getRandomLicensePlateData() → table` | 278 | ✍ Retourne une table avec la variation 1, des caractères aléatoires issus de la première plaque, l'indice de couleur par défaut et le placement par défaut. Sans plaque, caractères et couleur valent nil. |
| `LicensePlateManager:getAvailableColors() → table, integer` | 295 | ✍ Retourne la liste des couleurs et l'indice de couleur par défaut. |
| `LicensePlateManager:getDefaultPlacementIndex() → integer` | 302 | ✍ Retourne l'indice de l'option de placement par défaut. |
| `LicensePlateManager:getFont() → table` | 309 | ✍ Retourne le matériau de police de cette carte depuis `g_materialManager`, avec le nom de police et l'environnement du mod. |
| `LicensePlateManager.readLicensePlateData(streamId: integer, connection: integer) → table` | 318 | ✍ Lit les données de plaque depuis un flux réseau : un booléen de validité, puis variation, couleur, placement et une liste de caractères stockés sous forme d'indices de la police. Retourne une table de valeurs par défaut si les données sont marquées invalides. |
| `LicensePlateManager.writeLicensePlateData(streamId: integer, connection: integer, licensePlateData: table)` | 346 | ✍ Écrit les données de plaque dans un flux réseau, en miroir de `readLicensePlateData`. N'écrit les champs que si tous les champs requis sont présents ; sinon écrit seulement un indicateur false. |
| `LicensePlateManager.loadLicensePlateDataFromXML(xmlFile: XMLFile, key: string, useAbsolutePaths: boolean) → table` | 368 | ✍ Lit les données de plaque (fichier de configuration, variation, couleur, placement, caractères) depuis le XML de sauvegarde à la clé. Retourne nil s'il n'y a pas d'attribut de variation. Le nom de fichier est converti depuis la forme réseau sauf si des chemins absolus sont utilisés. |
| `LicensePlateManager.saveLicensePlateDataToXML(xmlFile: XMLFile, key: string, licensePlateData: table, useAbsolutePaths: boolean)` | 402 | ✍ Écrit les données de plaque dans le XML à la clé, seulement si tous les champs requis existent. Le nom du fichier de configuration est converti en forme réseau sauf si des chemins absolus sont utilisés. |
| `LicensePlateManager.createLicensePlateXMLSchema()` | 516 | ✍ Crée, une seule fois, le schéma XML du fichier de plaques de la carte (plaques, police, configurations de couleur, placement) et le stocke dans `LicensePlateManager.xmlSchema`. À noter : le défaut du paramètre de shader est enregistré comme "colorSale" alors que le chargement utilise "colorScale". |

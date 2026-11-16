# vehicles/configurations/VehicleConfigurationItemWheel.lua

*[English version](../../../../scripts/vehicles/configurations/VehicleConfigurationItemWheel.md)*

Source: `dataS/scripts/vehicles/configurations/VehicleConfigurationItemWheel.lua` — FS25 1.25.1.0

✍ Entrée de configuration (sous-classe de VehicleConfigurationItem) pour les roues. Outre la marque et les vitesses, elle peut générer dynamiquement des configurations de roues à partir des dimensions de pneus du XML du véhicule, en utilisant g_wheelManager pour trouver les pneus correspondants, des listes blanches de combinaisons et des catégories de pneus. Elle réécrit le XML en mémoire des entrées générées, ajuste la largeur du véhicule et propose une recherche de repli pour les identifiants de sauvegarde renommés.

- **VehicleConfigurationItemWheel** hérite de `VehicleConfigurationItem` (l.16)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `VehicleConfigurationItemWheel.new(configName: any, customMt: any)` | 20 | ✍ Constructeur, appelle le constructeur parent. À noter : l'argument customMt est ignoré, la métatable de la classe est toujours transmise au constructeur parent. |
| `VehicleConfigurationItemWheel:loadFromXML(xmlFile: any, baseKey: any, configKey: any, baseDirectory: any, customEnvironment: any)` | 28 | ✍ Charge la marque et les vitesses et lit les données de roue de base (rayon, largeur, décalages) depuis les dimensions ou les fichiers de roue. Si les roues définissent des dimensions, prépare les données de génération dynamique (catégories de pneus, listes blanches de combinaisons fusionnées via les configurations parentes, nombre dynamique maximal) ; une marque sur une configuration dynamique est refusée avec un avertissement. Renvoie true, ou false si le parent échoue. |
| `VehicleConfigurationItemWheel:getNeedsRenaming(otherItem: any)` | 225 | ✍ Renvoie false si les marques de roues diffèrent, sinon utilise la comparaison de noms parente ; ainsi les noms identiques ne sont renumérotés qu'au sein d'une même marque. |
| `VehicleConfigurationItemWheel:onSizeLoad(xmlFile: any, sizeData: any)` | 235 | ✍ Applique la gestion parente des dimensions. Pour les configurations générées, écrit aussi le XML généré et, sauf largeur définie manuellement, élargit sizeData.width de la plus grande largeur de pneu supplémentaire, des décalages et des décalages de roues additionnelles. |
| `VehicleConfigurationItemWheel.postLoad(xmlFile: any, baseKey: any, baseDir: any, customEnvironment: any, isMod: any, configurationItems: any, storeItem: any, configName: any)` | 298 | ✍ Statique. Après le postLoad parent, rend non sélectionnable chaque entrée de base ayant des combinaisons de dimensions et génère les entrées dynamiques correspondantes, puis avertit des entrées sélectionnables sans marque si au moins une entrée en a une. |
| `VehicleConfigurationItemWheel.getFallbackConfigId(configs: any, configId: any, configName: any, configFileName: any)` | 336 | ✍ Statique. Pour un identifiant de sauvegarde inconnu, découpe les identifiants selon les tirets bas et renvoie l'indice et le saveId de la configuration partageant la plus longue suite initiale de parties, ou nil, nil. |
| `VehicleConfigurationItemWheel.generateConfigurations(configurationItems: any, xmlFile: any, configName: any, baseConfigItem: any)` | 366 | ✍ Statique. Demande à g_wheelManager les pneus correspondant aux combinaisons de dimensions et ajoute une entrée dynamique par combinaison, en copiant prix, indicateur par défaut, vitesses, configurations dépendantes et décalages de boutique de l'entrée de base, avec un saveId composé de l'id de base et de l'id de roue. |
| `VehicleConfigurationItemWheel:applyGeneratedConfiguration(xmlFile: any)` | 420 | ✍ Pour une configuration dynamique, copie le sous-arbre de la configuration de base dans le XML en mémoire, place le vrai nom de fichier du pneu à la place des dimensions et ajuste le yOffset physique selon la variation de rayon ; les roues sans pneu reçoivent une balise factice pour charger la roue parente. |
| `VehicleConfigurationItemWheel:applyObjectChanges(vehicle: any, configurationIndexToParentConfigIndex: any, index: any)` | 462 | ✍ Applique au véhicule les changements d'objets de cette configuration de roues, en récursant d'abord dans la configuration parente pour appliquer ses changements avant ceux de l'enfant. |
| `VehicleConfigurationItemWheel.registerXMLPaths(schema: any, rootPath: any, configPath: any)` | 477 | ✍ Statique. Enregistre les chemins XML parents ainsi que brand, maxForwardSpeed et maxForwardSpeedShop. |

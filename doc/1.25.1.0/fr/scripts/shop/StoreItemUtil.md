# shop/StoreItemUtil.lua

*[English version](../../../scripts/shop/StoreItemUtil.md)*

Source: `dataS/scripts/shop/StoreItemUtil.lua` — FS25 1.25.1.0

✍ Fonctions utilitaires statiques pour les tables d'articles de boutique : tests d'espèce (véhicule, animal, placeable, objet, outil à main), tests de configurabilité et de location, sommes de coûts incluant les suppléments de configuration, et lecture des fonctions, specs, marque, usage de VRAM et dimensions depuis le XML de boutique. Elles calculent aussi les dimensions d'emprise avec surcharges de configuration et rotation par pas de 90 degrés, et enregistrent les chemins de schéma XML des ensembles de configurations. Dépend de g_storeManager, g_brandManager, StoreSpecies et ConfigurationUtil définis ailleurs.

- **StoreItemUtil** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `StoreItemUtil.getIsVehicle(storeItem: table) → boolean` | 17 | ✍ Retourne true si l'article de boutique est non nil et que son espèce est StoreSpecies.VEHICLE. |
| `StoreItemUtil.getIsAnimal(storeItem: table) → boolean` | 25 | ✍ Retourne true si l'article de boutique est non nil et que son espèce est StoreSpecies.ANIMAL. |
| `StoreItemUtil.getIsPlaceable(storeItem: table) → boolean` | 33 | ✍ Retourne true si l'article de boutique est non nil et que son espèce est StoreSpecies.PLACEABLE. |
| `StoreItemUtil.getIsObject(storeItem: table) → boolean` | 41 | ✍ Retourne true si l'article de boutique est non nil et que son espèce est StoreSpecies.OBJECT. |
| `StoreItemUtil.getIsHandTool(storeItem: table) → boolean` | 49 | ✍ Retourne true si l'article de boutique est non nil et que son espèce est StoreSpecies.HANDTOOL. |
| `StoreItemUtil.getIsConfigurable(storeItem: table) → boolean` | 58 | ✍ Retourne true si l'article a des configurations et qu'au moins un type de configuration propose plus d'une option sélectionnable (isSelectable différent de false). |
| `StoreItemUtil.getCanBeShownInConfigScreen(storeItem: table) → boolean` | 89 | ✍ Retourne false pour les outils à main, achetés directement, et true pour tous les autres articles, qui passent par l'écran de configuration de la boutique. |
| `StoreItemUtil.getIsLeasable(storeItem: table) → boolean` | 98 | ✍ Retourne true si l'article autorise la location, possède un runningLeasingFactor et n'est pas un placeable. |
| `StoreItemUtil.getDefaultConfigId(storeItem: table, configurationName: string) → integer` | 107 | ✍ Retourne l'indice de configuration par défaut pour un nom de configuration en déléguant à ConfigurationUtil.getDefaultConfigIdFromItems. Provoque une erreur si l'article n'a pas de table de configurations. |
| `StoreItemUtil.getDefaultPrice(storeItem: table, configurations: table?) → integer` | 116 | ✍ Retourne le prix de base plus le prix de chaque configuration choisie, via getCosts avec le champ `price`. |
| `StoreItemUtil.getDailyUpkeep(storeItem: table, configurations: table?) → integer` | 125 | ✍ Retourne l'entretien quotidien de base plus celui de chaque configuration choisie, via getCosts avec le champ `dailyUpkeep`. |
| `StoreItemUtil.getCosts(storeItem: table, configurations: table?, costType: string) → integer` | 135 | ✍ Additionne la valeur de l'article pour un champ de coût (0 si absent) avec le même champ de chaque item de configuration choisi. Retourne 0 pour un article nil ; l'argument configurations doit être une table quand l'article a des configurations. |
| `StoreItemUtil.getFunctionsFromXML(xmlFile: XMLFile, storeDataXMLName: string, customEnvironment: string) → table?` | 199 | ✍ Lit la liste des textes de fonctions sous `<parent>.functions.function`, traduits dans l'environnement de mod donné, et les retourne sous forme de tableau, ou nil s'il n'y en a aucun. |
| `StoreItemUtil.loadSpecsFromXML(item: any)` | 215 | ✍ Charge paresseusement les specs d'un article depuis son XML si ce n'est pas déjà fait, puis fait de même récursivement pour les articles de son lot. Le chargement des specs est assuré par getSpecsFromXML. |
| `StoreItemUtil.getSpecsFromXML(specTypes: table, species: XMLFile, xmlFile: XMLFile, customEnvironment: string, baseDirectory: any) → table` | 238 | ✍ Construit une table de specs en appelant la loadFunc de chaque type de spec enregistré pour l'espèce de l'article, indexée par nom de spec. Retourne la table (éventuellement vide). |
| `StoreItemUtil.getBrandIndexFromXML(xmlFile: XMLFile, storeDataXMLKey: string) → integer` | 262 | ✍ Lit le nom `.brand` sous la clé donnée (vide par défaut) et retourne son indice via g_brandManager. Les noms inconnus logent un avertissement et se replient sur la marque par défaut. |
| `StoreItemUtil.getVRamUsageFromXML(xmlFile: XMLFile, storeDataXMLName: string) → integer, integer, boolean` | 274 | ✍ Lit les valeurs d'usage mémoire du XML et retourne la VRAM partagée (tampons de sommets, d'indices et textures), la VRAM par instance (tampons d'instance) et le drapeau ignoreVramUsage. Les unités sont celles écrites dans le XML (NON VÉRIFIÉ). |
| `StoreItemUtil.getSubConfigurationIndex(storeItem: any, configName: any, configIndex: any)` | 290 | ✍ Retourne la position dans la liste des sous-valeurs de configuration dont le groupe d'items contient l'indice de configuration donné, ou nil. Provoque une erreur si l'article n'a pas d'entrée subConfigurations pour ce nom. |
| `StoreItemUtil.getSubConfigurationItems(storeItem: any, configName: any, state: any)` | 308 | ✍ Retourne la liste des items de configuration appartenant à la sous-valeur de configuration à la position `state`. Provoque une erreur si l'article n'a pas d'entrée subConfigurations pour ce nom. |
| `StoreItemUtil.getSizeValues(xmlFilename: any, baseName: any, rotationOffset: any, configurations: any)` | 317 | ✍ Charge un XML de véhicule et retourne sa table d'emprise (largeur, longueur, hauteur et décalages) pour une rotation et des configurations. Retourne les dimensions par défaut de Vehicle si le fichier ne peut pas être chargé. |
| `StoreItemUtil.getSizeValuesFromXML(xmlFilename: any, xmlFile: any, baseName: any, rotationOffset: any, configurations: any)` | 337 | ✍ Lit la taille de base depuis un XML de véhicule déjà ouvert, avec l'élément `base.size` et les valeurs par défaut Vehicle.DEFAULT_SIZE, en déléguant à getSizeValuesFromXMLByKey. |
| `StoreItemUtil.getSizeValuesFromXMLByKey(xmlFilename: any, xmlFile: any, baseName: any, baseKey: any, elementKey: any, configKey: any, rotationOffset: any, configurations: any, defaults: any)` | 343 | ✍ Lit les attributs de taille, laisse les items de configuration choisis les ajuster via onSizeLoad et applique des tailles minimales optionnelles. La rotation est ramenée à des pas de 90 degrés, avec échange de largeur et longueur et rotation des décalages en conséquence. Retourne la table de dimensions. |
| `StoreItemUtil.registerConfigurationSetXMLPaths(schema: any, baseKey: any)` | 399 | ✍ Enregistre sur un schéma XML les chemins du bloc `configurationSets` (titre, drapeau oui/non, ensembles avec nom, paramètres, drapeau par défaut et nom, indice et showWarning de configuration), correspondant à ce que lit ConfigurationUtil.getConfigurationSetsFromXML. |

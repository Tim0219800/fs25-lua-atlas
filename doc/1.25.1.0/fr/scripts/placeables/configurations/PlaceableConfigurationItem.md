# placeables/configurations/PlaceableConfigurationItem.lua

*[English version](../../../../scripts/placeables/configurations/PlaceableConfigurationItem.md)*

Source: `dataS/scripts/placeables/configurations/PlaceableConfigurationItem.lua` — FS25 1.25.1.0

✍ Classe de base qui contient une entrée de configuration sélectionnable d'un placeable (nom, description, prix, entretien quotidien, indicateurs défaut et sélectionnable, identifiant de sauvegarde). Elle se charge depuis le XML du placeable et la sauvegarde, et relaie les rappels de cycle de vie aux greffons de `PlaceableConfigurationItem.GLOBAL_DATA`, non rempli dans ce fichier (où il est défini : NON VÉRIFIÉ). Des sous-classes comme l'élément de couleur l'étendent.

- **PlaceableConfigurationItem** (l.19)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableConfigurationItem.new(configName: any, customMt: any)` | 25 | ✍ Crée un élément de configuration pour un nom de configuration avec des valeurs par défaut : nom vide, index -1, prix 0, pas d'entretien, non défaut, sélectionnable, sans identifiant de sauvegarde. |
| `PlaceableConfigurationItem:loadFromXML(xmlFile: any, baseKey: any, configKey: any, baseDirectory: any, customEnvironment: any)` | 46 | ✍ Lit depuis le XML le nom (avec paramètres de texte optionnels), la description, le prix, l'entretien quotidien, les indicateurs défaut et sélectionnable, l'identifiant de sauvegarde et le titre de boutique. Si le nom est vide, la clé de configuration sert de nom. Retourne true. |
| `PlaceableConfigurationItem:saveToXMLFile(xmlFile: any, key: any, isActive: any, configurationData: any)` | 73 | ✍ Écrit le nom de configuration, l'identifiant de sauvegarde et un indicateur d'activité dans le XML de sauvegarde à la clé donnée. |
| `PlaceableConfigurationItem:loadFromSavegameXMLFile(xmlFile: any, key: any, configurationData: any)` | 81 | ✍ Point d'extension vide pour charger des données propres à l'élément depuis une sauvegarde ; les sous-classes le surchargent. |
| `PlaceableConfigurationItem:setIndex(index: any)` | 86 | ✍ Stocke l'index de l'élément et, si aucun identifiant de sauvegarde n'a été donné dans le XML, utilise l'index sous forme de chaîne comme identifiant. |
| `PlaceableConfigurationItem:getNeedsRenaming(otherItem: any)` | 96 | ✍ Retourne true si cet élément a le même nom affiché qu'un autre, afin que `postLoad` ajoute un suffixe numérique. |
| `PlaceableConfigurationItem:onPreLoad(placeable: any, configId: any)` | 102 | ✍ Appelle `onPreLoad` de chaque greffon de `GLOBAL_DATA` qui le définit, en passant le placeable, cet élément et l'identifiant de configuration. |
| `PlaceableConfigurationItem:onLoad(placeable: any, configId: any)` | 112 | ✍ Appelle `onLoad` de chaque greffon de `GLOBAL_DATA` qui le définit, en passant le placeable, cet élément et l'identifiant de configuration. |
| `PlaceableConfigurationItem:onPostLoad(placeable: any, configId: any)` | 122 | ✍ Appelle `onPostLoad` de chaque greffon de `GLOBAL_DATA` qui le définit, en passant le placeable, cet élément et l'identifiant de configuration. |
| `PlaceableConfigurationItem:onLoadFinished(placeable: any, configId: any)` | 132 | ✍ Appelle `onLoadFinished` de chaque greffon de `GLOBAL_DATA` qui le définit, en passant le placeable, cet élément et l'identifiant de configuration. |
| `PlaceableConfigurationItem:onSizeLoad(xmlFile: any, sizeData: any)` | 142 | ✍ Appelle `onSizeLoad` de chaque greffon de `GLOBAL_DATA` qui le définit, en passant cet élément, le fichier XML et la table des données de taille. |
| `PlaceableConfigurationItem.postLoad(xmlFile: any, baseKey: any, baseDir: any, customEnvironment: any, isMod: any, configurationItems: any, storeItem: any)` | 152 | ✍ Une fois tous les éléments chargés, ajoute un suffixe numérique aux noms en double et écrit un avertissement XML pour les identifiants de sauvegarde dupliqués dans une même configuration. |
| `PlaceableConfigurationItem.registerXMLPaths(schema: any, rootPath: any, configPath: any)` | 178 | ✍ Enregistre les chemins XML du titre, nom, params, desc, price, dailyUpkeep, isDefault, isSelectable et saveId, puis laisse chaque greffon de `GLOBAL_DATA` enregistrer les siens. |
| `PlaceableConfigurationItem.registerSavegameXMLPaths(schema: any, basePath: any)` | 199 | ✍ Enregistre les chemins XML de sauvegarde pour le nom de configuration, l'identifiant de sauvegarde et l'indicateur d'activité. |

# vehicles/configurations/VehicleConfigurationItem.lua

*[English version](../../../../scripts/vehicles/configurations/VehicleConfigurationItem.md)*

Source: `dataS/scripts/vehicles/configurations/VehicleConfigurationItem.lua` — FS25 1.25.1.0

✍ Classe de base d'une entrée de configuration de véhicule (par exemple une couleur, un moteur ou des roues). Elle charge les attributs XML communs (nom, description, prix, coût d'entretien quotidien, indicateurs par défaut et sélectionnable, identifiant de sauvegarde, marque, icône, décalage en boutique), puis transmet les appels de cycle de vie à chaque module de VehicleConfigurationItem.GLOBAL_DATA (les classes VehicleConfigurationData*). Les sous-classes ajoutent les données propres à leur type et la gestion de sauvegarde ou réseau.

- **VehicleConfigurationItem** (l.27)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `VehicleConfigurationItem.new(configName: any, customMt: any)` | 31 | ✍ Constructeur. Fixe configName et les valeurs par défaut : nom vide, indice -1, prix et entretien à 0, non par défaut, sélectionnable, sans identifiant de sauvegarde, pas une option oui/non. |
| `VehicleConfigurationItem:loadFromXML(xmlFile: any, baseKey: any, configKey: any, baseDirectory: any, customEnvironment: any)` | 55 | ✍ Lit depuis le XML les attributs communs de l'entrée (nom avec paramètres de texte facultatifs, desc, price, dailyUpkeep, isDefault, isSelectable, saveId, marque, nom et icône du véhicule, shopOffset), utilise l'indice comme nom s'il n'y en a pas, puis appelle loadConfigItem sur chaque module de GLOBAL_DATA. Renvoie true. |
| `VehicleConfigurationItem:saveToXMLFile(xmlFile: any, key: any, isActive: any, configurationData: any)` | 110 | ✍ Écrit le nom, l'identifiant de sauvegarde et l'état actif de cette entrée dans le XML de sauvegarde à la clé donnée. Les sous-classes l'étendent avec leurs propres données. |
| `VehicleConfigurationItem:loadFromSavegameXMLFile(xmlFile: any, key: any, configurationData: any)` | 118 | ✍ Point d'extension vide appelé au chargement d'une sauvegarde ; les sous-classes le surchargent pour restaurer leurs données par véhicule. |
| `VehicleConfigurationItem:setIndex(index: any)` | 123 | ✍ Mémorise l'indice de cette entrée dans sa liste de configuration et, si aucun identifiant de sauvegarde n'est défini, utilise l'indice sous forme de texte. |
| `VehicleConfigurationItem:getNeedsRenaming(otherItem: any)` | 133 | ✍ Renvoie true si cette entrée a le même nom affiché que l'autre, ce que postLoad utilise pour ajouter un numéro. |
| `VehicleConfigurationItem:onPreLoad(object: any, configId: any)` | 139 | ✍ Transmet l'étape de pré-chargement d'un objet véhicule à chaque module de GLOBAL_DATA qui définit onPreLoad. |
| `VehicleConfigurationItem:onLoad(object: any, configId: any)` | 149 | ✍ Transmet l'étape de chargement d'un objet véhicule à chaque module de GLOBAL_DATA qui définit onLoad. |
| `VehicleConfigurationItem:onPrePostLoad(object: any, configId: any)` | 159 | ✍ Transmet l'étape précédant le post-chargement à chaque module de GLOBAL_DATA qui définit onPrePostLoad. |
| `VehicleConfigurationItem:onPostLoad(object: any, configId: any)` | 169 | ✍ Transmet l'étape de post-chargement à chaque module de GLOBAL_DATA qui définit onPostLoad. |
| `VehicleConfigurationItem:onLoadFinished(object: any, configId: any)` | 179 | ✍ Transmet l'étape de fin de chargement à chaque module de GLOBAL_DATA qui définit onLoadFinished. |
| `VehicleConfigurationItem:onSizeLoad(xmlFile: any, sizeData: any)` | 189 | ✍ Transmet le calcul de dimensions à chaque module de GLOBAL_DATA qui définit onSizeLoad, afin que les configurations puissent modifier les données de taille du véhicule. |
| `VehicleConfigurationItem.postLoad(xmlFile: any, baseKey: any, baseDir: any, customEnvironment: any, isMod: any, configurationItems: any, storeItem: any)` | 199 | ✍ Statique, exécutée une fois toutes les entrées d'une configuration chargées. Ajoute un compteur aux noms en double via getNeedsRenaming et journalise un avertissement XML pour les identifiants de sauvegarde en double. |
| `VehicleConfigurationItem.registerXMLPaths(schema: any, rootPath: any, configPath: any)` | 226 | ✍ Statique. Enregistre les attributs XML communs de configuration (titre, option oui/non, nom, desc, prix, entretien, défaut, sélectionnable, saveId, marque, nom et icône du véhicule, décalages en boutique), puis laisse chaque module de GLOBAL_DATA enregistrer les siens. |
| `VehicleConfigurationItem.registerSavegameXMLPaths(schema: any, basePath: any)` | 257 | ✍ Statique. Enregistre les attributs XML de sauvegarde name, id et isActive d'une entrée de configuration. |

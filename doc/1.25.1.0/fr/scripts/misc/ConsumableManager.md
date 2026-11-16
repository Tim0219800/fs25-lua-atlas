# misc/ConsumableManager.lua

*[English version](../../../scripts/misc/ConsumableManager.md)*

Source: `dataS/scripts/misc/ConsumableManager.lua` — FS25 1.25.1.0

✍ Gestionnaire lié à la carte (étend AbstractManager) pour les consommables, comme des aliments pour animaux : types de consommables avec titre d'interface, et variations avec prix, capacité, texte d'unité, meshes i3d (normal, en cours de consommation, sangle), métadonnées et paramètres de shader. Les données viennent de ConsumableManager.DEFAULT_FILENAME (défini hors de ce fichier, NON VÉRIFIÉ) et des xml de mods mis en file par addModConsumable. Le nombre de variations est limité par ConsumableManager.MAX_NUM_VARIATIONS (défini ailleurs).

- **ConsumableManager** hérite de `AbstractManager` (l.19)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ConsumableManager.new(customMt: any) → table` | 24 | ✍ Crée le gestionnaire, les tables vides de types et de variations, et les deux schémas XML (consumable et consumables), stockés sur la table de classe. |
| `ConsumableManager:loadMapData(xmlFile: any, missionInfo: any, baseDirectory: any) → boolean` | 48 | ✍ Lit le xml des consommables par défaut : types (nom mis en majuscules, titre obligatoire) et références de fichiers de consommables, dont les variations sont chargées ; charge ensuite les consommables de mods en file avec leur environnement personnalisé et vide la file. |
| `ConsumableManager:unloadMapData() → boolean` | 89 | ✍ Supprime les noeuds objet, consommation et sangle de chaque variation, vide la liste des variations, libère les requêtes i3d partagées, puis appelle le parent. À noter : la ligne de doc du code dit à tort qu'elle charge des données au chargement de la carte. |
| `ConsumableManager:addModConsumable(xmlFilename: string, customEnvironment: string, baseDirectory: string)` | 119 | ✍ Met en file le xml de consommables d'un mod (nom de fichier, environnement personnalisé, répertoire de base) pour un chargement dans loadMapData. |
| `ConsumableManager:loadConsumableVariationsFromXML(xmlFilename: string, customEnvironment: string, baseDirectory: string)` | 130 | ✍ Charge chaque consumableVariation d'un xml. Les entrées sans type, nom ou titre sont ignorées avec un avertissement ; le nom est préfixé par l'environnement personnalisé. Lance des chargements i3d asynchrones pour object, consumingObject et tensionBeltObject, lit les métadonnées et paramètres de shader, et rejette les noms en double et toute variation au-delà du maximum. |
| `ConsumableManager:consumableI3DFileLoaded(i3dNode: any, failedReason: any, arguments: any)` | 263 | ✍ Callback asynchrone : trouve le noeud par chemin dans l'i3d chargé, remet sa position et sa rotation à zéro, le détache et le stocke dans la variation sous le champ demandé (node, consumingNode ou tensionBeltNode) ; avertit si le noeud est introuvable. Supprime la racine i3d. |
| `ConsumableManager:getConsumableMeshByIndex(index: any, addTensionBeltMesh: any)` | 283 | ✍ Renvoie un clone du noeud mesh de la variation et, si demandé et disponible, un clone de son mesh de sangle lié en dessous, comme deuxième valeur. Nil si l'indice ou le mesh manque. |
| `ConsumableManager:getConsumableConsumingMeshByIndex(index: any)` | 307 | ✍ Renvoie un clone du mesh en état de consommation (à défaut le mesh normal) avec les paramètres de shader de la variation appliqués récursivement, par emplacement de matériau si un nom d'emplacement est donné. Nil si la variation ou son mesh normal manque. |
| `ConsumableManager:getConsumableVariationIndexByName(name: any, customEnvironment: any)` | 332 | ✍ Renvoie l'indice de la variation pour un nom, en essayant d'abord le nom préfixé par l'environnement personnalisé. Renvoie 0 si inconnu. |
| `ConsumableManager:getConsumableVariationNameByIndex(index: any)` | 351 | ✍ Renvoie le nom enregistré de la variation, ou la chaîne UNKNOWN si l'indice est invalide. |
| `ConsumableManager:getConsumableVariationCapacityAndUnitByIndex(index: any)` | 362 | ✍ Renvoie la capacité d'une unité et son texte d'unité pour l'affichage ; deux nil si l'indice est invalide. |
| `ConsumableManager:getConsumableVariationShaderParameterByIndex(index: any)` | 373 | ✍ Renvoie la liste des paramètres de shader de la variation, ou nil si l'indice est invalide. |
| `ConsumableManager:getConsumableVariationMetaDataByIndex(index: any)` | 384 | ✍ Renvoie la table de métadonnées de la variation (nom vers nombre, chaîne ou vecteur), ou nil si l'indice est invalide. |
| `ConsumableManager:getConsumableVariationsByType(typeName: any)` | 395 | ✍ Renvoie les titres de toutes les variations d'un type sous forme de liste, plus une table associant chaque position de la liste à l'indice réel de la variation. |
| `ConsumableManager:getConsumableVariationPriceByIndex(index: any)` | 410 | ✍ Renvoie le prix par unité d'une variation, ou nil si l'indice est invalide. |
| `ConsumableManager:getTypeTitle(typeName: any)` | 421 | ✍ Renvoie le titre d'interface d'un type de consommable (à défaut le nom du type), ou nil si le type est inconnu. Les noms de types sont stockés en majuscules. |
| `ConsumableManager.registerConsumableXMLPaths(schema: any)` | 432 | ✍ Enregistre les chemins de schéma d'un xml de consommable : type de variation, prix, nom, titre, capacité, texte d'unité, object, consumingObject et tensionBeltObject (fichier et noeud), valeurs de metaData et paramètres de shader. |
| `ConsumableManager.registerConsumablesXMLPaths(schema: any)` | 460 | ✍ Enregistre les chemins de schéma du xml principal des consommables : types (nom, titre) et références vers des fichiers de consommables. |

# specialization/TypeManager.lua

*[English version](../../../scripts/specialization/TypeManager.md)*

Source: `dataS/scripts/specialization/TypeManager.lua` — FS25 1.25.1.0

✍ Registre générique de types d'entités (types de véhicules, de placeables, etc.), chaque type étant une classe plus une liste ordonnée de spécialisations. Il lit les définitions depuis un fichier XML, gère l'héritage via un type parent et construit les tables de fonctions et d'événements par type. Il s'appuie sur un gestionnaire de spécialisations fourni à la construction ; cette classe n'est pas dans ce fichier (NON VÉRIFIÉ).

- **TypeManager** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `TypeManager.new(typeName: any, rootElementName: any, xmlFilename: any, specializationManager: any, customMt: any) → table` | 17 | ✍ Crée un gestionnaire avec une table de types vide, en mémorisant le nom de type affiché, le nom de l'élément racine XML, le chemin du fichier XML et le gestionnaire de spécialisations à utiliser. |
| `TypeManager:loadMapData() → boolean` | 40 | ✍ Ouvre le XML des types et met en file une sous-tâche asynchrone par entrée `type` pour la charger via loadTypeFromXML, puis la fermeture du fichier et une ligne de log. Retourne toujours true ; le chargement réel se fait plus tard dans le gestionnaire de tâches. |
| `TypeManager:unloadMapData()` | 71 | ✍ Vide la table des types en la remplaçant par une table vide. |
| `TypeManager:addType(typeName: string, className: string, filename: string, customEnvironment: string, parent: any) → boolean` | 82 | ✍ Enregistre une nouvelle entrée de type après avoir vérifié que le nom est libre et que classe et fichier sont fournis ; exécute aussi `source` sur le fichier avec l'environnement de mod donné. Retourne false avec un log d'erreur en cas d'échec, sinon true. |
| `TypeManager:loadTypeFromXML(xmlFile: any, key: any, isDLC: any, modDir: any, modName: any)` | 118 | ✍ Lit un type depuis le XML : résout un parent optionnel (en essayant aussi le nom préfixé par le mod), hérite classe, fichier et spécialisations, préfixe les types de mod avec le nom du mod, puis ajoute les spécialisations listées. Retourne false si invalide ou si les scripts de mods sont interdits sur la plateforme. |
| `TypeManager:addSpecialization(typeName: any, specName: any)` | 218 | ✍ Ajoute une spécialisation à un type existant, obtenue via le gestionnaire de spécialisations. Échoue avec un log d'erreur si le type ou la spécialisation est inconnu, ou si elle est déjà présente ; retourne true en cas de succès. |
| `TypeManager:validateTypes()` | 245 | ✍ Met en file, pour chaque type, une vérification que chaque spécialisation définit prerequisitesPresent et que celle-ci retourne true pour les spécialisations du type. Un type en échec est retiré du registre avec un log d'erreur. |
| `TypeManager:finalizeTypes()` | 264 | ✍ Met en file, par type, des sous-tâches asynchrones qui appellent, si elles existent, registerEvents et registerFunctions sur la classe du type, puis registerEvents, registerFunctions, registerOverwrittenFunctions et registerEventListeners sur chaque spécialisation, dans cet ordre. Retourne true. |
| `TypeManager:getTypes()` | 324 | ✍ Retourne la table de tous les types enregistrés, indexée par nom de type. |
| `TypeManager:removeType(typeName: any)` | 330 | ✍ Retire du registre le type portant le nom donné. |
| `TypeManager:getTypeByName(typeName: any, modName: any)` | 336 | ✍ Retourne l'entrée de type pour un nom, avec repli sur le nom préfixé par le mod si un nom de mod est fourni. Si l'entrée manque et que le mod n'est pas chargé (g_modIsLoaded), logue une erreur et retourne nil. |
| `TypeManager:getObjectTypeFromXML(xmlFilename: any)` | 363 | ✍ Ouvre le XML d'un objet, lit l'attribut racine `#type`, trouve l'entrée de type correspondante (avec le nom de mod déduit du chemin) et sa classe. Retourne l'entrée de type et l'objet classe, ou nil, nil avec un log d'erreur. |

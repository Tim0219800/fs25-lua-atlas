# triggers/UnloadTrigger.lua

*[English version](../../../scripts/triggers/UnloadTrigger.md)*

Source: `dataS/scripts/triggers/UnloadTrigger.lua` — FS25 1.25.1.0

✍ Classe de base (sous-classe de Object) des triggers de déchargement, comme les points de vente et les stockages : elle imite une unité de remplissage pour que les véhicules puissent s'y décharger, en relayant le remplissage vers un objet cible qui fournit getIsFillTypeAllowed, getIsToolTypeAllowed, addFillLevelFromTool et getFreeCapacity. Elle lit types acceptés, types d'outils, échelle de prix, noeud IA et conversions de types optionnelles avec un ratio. PalletUnloadTrigger et WoodUnloadTrigger en dérivent. Des parties du fichier sont vides dans le dump, certaines méthodes ne sont donc pas visibles (NON VÉRIFIÉ).

- **UnloadTrigger** hérite de `Object` (l.63)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `UnloadTrigger.registerXMLPaths(schema: any, basePath: any)` | 51 | ✍ Enregistre les attributs XML d'un trigger de déchargement : exactFillRootNode, priceScale, acceptedToolTypes, les chemins de configuration de types partagés, aiNode, et les entrées répétées fillTypeConversion (incomingFillType, outgoingFillType, ratio 1 par défaut). |
| `UnloadTrigger.new(isServer: boolean, isClient: boolean, customMt: table?) → table` | 71 | ✍ Crée le trigger de déchargement comme objet réseau avec des tables vides de types, d'outils et de conversions. |
| `UnloadTrigger:load(components: table, xmlFile: table, xmlNode: string, target: table, extraAttributes: table, i3dMappings: table) → boolean` | 93 | ✍ Lit le noeud de remplissage exact (doit avoir le groupe de collision FILLABLE, sinon retourne false) et l'enregistre comme objet de noeud. Lit aiNode, priceScale, les conversions de types (ratio borné de 0,01 à 10000), définit la cible si fournie, charge types et outils et active le trigger. Retourne true. |
| `UnloadTrigger:delete()` | 140 | ✍ Retire le noeud de remplissage exact des objets de noeud de la mission s'il existe, puis appelle le delete du parent. |
| `UnloadTrigger:loadAcceptedToolType(xmlFile: XMLFile, xmlNode: string)` | 152 | ✍ Analyse l'attribut acceptedToolTypes en un ensemble d'indices de types d'outils. Si l'attribut est absent, acceptedToolTypes passe à nil, ce qui signifie que tout type d'outil passe ce filtre. |
| `UnloadTrigger:loadFillTypes(xmlFile: XMLFile, xmlNode: string)` | 171 | ✍ Charge les types combinés depuis la configuration XML via g_fillTypeManager dans un ensemble. S'il n'y en a pas, l'ensemble devient nil, ce qui signifie aucune restriction par ce trigger. |
| `UnloadTrigger:setTarget(object: table)` | 186 | ✍ Définit l'objet qui reçoit les marchandises déchargées. Vérifie par assert qu'il implémente getIsFillTypeAllowed, getIsToolTypeAllowed, addFillLevelFromTool et getFreeCapacity ; erreur sinon. |
| `UnloadTrigger:getFillUnitIndexFromNode(node: integer)` | 202 | ✍ Émulation d'unité de remplissage : retourne toujours 1, quel que soit le noeud. |
| `UnloadTrigger:getFillUnitExactFillRootNode(fillUnitIndex: integer)` | 209 | ✍ Émulation d'unité de remplissage : retourne le noeud de remplissage exact, sans tenir compte de l'index d'unité. |
| `UnloadTrigger:addFillUnitFillLevel(farmId: integer, fillUnitIndex: integer, fillLevelDelta: number, fillTypeIndex: integer, toolType: table, fillPositionData: table, extraAttributes: any) → number` | 221 | ✍ Transmet une livraison à la cible via addFillLevelFromTool et retourne la quantité acceptée, en unités entrantes. Si une conversion existe pour le type, la quantité est multipliée par le ratio et envoyée sous le type sortant, puis le résultat est divisé en retour. |
| `UnloadTrigger:getFillUnitAllowsFillType(fillUnitIndex: integer, fillType: integer) → boolean` | 247 | ✍ Émulation d'unité de remplissage : retourne si le type est autorisé, en déléguant à getIsFillTypeAllowed ; l'index est ignoré. |
| `UnloadTrigger:getIsFillTypeAllowed(fillType: integer) → boolean` | 255 | ✍ Retourne si le type est autorisé, ce qui délègue simplement à getIsFillTypeSupported. |
| `UnloadTrigger:getIsFillTypeSupported(fillType: integer) → boolean` | 263 | ✍ Retourne false si une liste de types existe et ne contient pas le type. Sinon, si une cible existe, convertit le type via la table de conversions et interroge getIsFillTypeAllowed de la cible. True si aucun test ne le rejette. |
| `UnloadTrigger:getFillUnitFreeCapacity(fillUnitIndex: integer, fillTypeIndex: integer, farmId: any) → number` | 296 | ✍ Retourne la capacité libre de la cible pour le type et la ferme, divisée par le ratio si une conversion s'applique, donc exprimée en unités entrantes. Retourne 0 si la cible n'a pas getFreeCapacity. |
| `UnloadTrigger:getIsToolTypeAllowed(toolType: integer) → boolean` | 311 | ✍ Retourne false si une liste de types d'outils acceptés existe et n'inclut pas l'outil ; sinon retourne la réponse de getIsToolTypeAllowed de la cible. |
| `UnloadTrigger:getCustomDischargeNotAllowedWarning()` | 329 | ✍ Retourne le texte d'avertissement personnalisé affiché quand le déchargement est refusé (nil par défaut, défini par des sous-classes ou d'autres codes). |
| `UnloadTrigger.loadSpecValueFillTypes(xmlFile: XMLFile, xmlPath: string, customEnvironment: string?, baseDir: string?) → table?` | 349 | ✍ Signature seule (pas de corps dans le dump du SDK) : d'après son nom et ses paramètres, elle retourne probablement l'ensemble des noms de types qu'un trigger de déchargement supporte, lus dans le XML au chemin donné, pour les affichages de spécifications. NON VÉRIFIÉ. |

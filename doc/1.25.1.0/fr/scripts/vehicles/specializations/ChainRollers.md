# vehicles/specializations/ChainRollers.lua

*[English version](../../../../scripts/vehicles/specializations/ChainRollers.md)*

Source: `dataS/scripts/vehicles/specializations/ChainRollers.lua` — FS25 1.25.1.0

✍ Spécialisation pour les chaînes à rouleaux dont les éléments sont placés le long d'une spline masquée ; les points de contrôle de la spline suivent des nœuds de référence déplacés par les outils ou pièces mobiles de Cylindered. Configurée sous vehicle.chainRollers (maxUpdateDistance et entrées chainRoller avec elementsNode, endReferenceNode et enfants splineNode). Les mises à jour se font dans onPostUpdate uniquement si le véhicule est plus proche que maxUpdateDistance (100 par défaut) ; un affichage de débogage est dessiné dans l'état de débogage DEBUG_ATTRIBUTES.

- **ChainRollers** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ChainRollers.prerequisitesPresent(specializations: any)` | 15 | ✍ Renvoie toujours true : aucune autre spécialisation n'est requise, bien que les points d'extension des pièces dépendantes n'aient de sens qu'avec Cylindered. |
| `ChainRollers.initSpecialization()` | 21 | ✍ Enregistre, par enregistrement différé, la liste d'indices de nœuds chainRollers#splineNodes sur les entrées movingTool et movingPart de Cylindered. |
| `ChainRollers.registerFunctions(vehicleType: any)` | 44 | ✍ Enregistre loadChainRollerFromXML et updateChainRoller sur le type de véhicule. |
| `ChainRollers.registerOverwrittenFunctions(vehicleType: any)` | 51 | ✍ Remplace loadExtraDependentParts et updateExtraDependentParts (fournies par une autre spécialisation, laquelle : NON VÉRIFIÉ). |
| `ChainRollers.registerEventListeners(vehicleType: any)` | 58 | ✍ Enregistre onLoad, onLoadFinished et onPostUpdate. |
| `ChainRollers:onLoad(savegame: any)` | 66 | ✍ Lit maxUpdateDistance et charge chaque entrée vehicle.chainRollers.chainRoller. Si le bloc est absent ou qu'aucune entrée ne se charge, retire les écouteurs onLoadFinished et onPostUpdate pour que le véhicule ne coûte rien. |
| `ChainRollers:onLoadFinished(savegame: any)` | 94 | ✍ Force une mise à jour immédiate en appelant onPostUpdate avec un dt très grand pour que les chaînes démarrent dans la bonne pose. |
| `ChainRollers:onPostUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 100 | ✍ Quand le véhicule est dans la distance maxUpdateDistance, recopie les positions des nœuds de spline modifiés dans les points de contrôle et replace les éléments de chaque chaîne modifiée. Dans l'état DEBUG_ATTRIBUTES, dessine les nœuds et la courbe de la spline. |
| `ChainRollers:loadChainRollerFromXML(xmlFile: any, key: any, chainRoller: any)` | 143 | ✍ Charge une chaîne : elementsNode (ses enfants sont les éléments), endReferenceNode facultatif et au moins deux entrées splineNode, puis construit une spline masquée à partir de leurs positions. Renvoie false avec un avertissement XML s'il manque des éléments ou des nœuds. |
| `ChainRollers:updateChainRoller(chainRoller: any, dt: any)` | 204 | ✍ Place chaque élément à des paramètres régulièrement espacés le long de la spline et oriente chacun vers le suivant. Le dernier élément vise endReferenceNode s'il est défini. L'argument dt n'est pas utilisé. |
| `ChainRollers:loadExtraDependentParts(superFunc: any, xmlFile: any, baseName: any, entry: any)` | 237 | ✍ Appelle le parent puis lit chainRollers#splineNodes pour la pièce mobile et mémorise les nœuds dans l'entrée. Renvoie false si le parent échoue. |
| `ChainRollers:updateExtraDependentParts(superFunc: any, part: any, dt: any)` | 252 | ✍ Appelle le parent puis marque comme modifiées les données de spline de chaque nœud listé sur la pièce mobile, afin que le prochain post-update reconstruise la chaîne. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `loadChainRollerFromXML` | 45 |
| registerFunction | `updateChainRoller` | 46 |
| registerOverwrittenFunction | `loadExtraDependentParts` | 52 |
| registerOverwrittenFunction | `updateExtraDependentParts` | 53 |
| registerEventListener | `onLoad` | 59 |
| registerEventListener | `onLoadFinished` | 60 |
| registerEventListener | `onPostUpdate` | 61 |

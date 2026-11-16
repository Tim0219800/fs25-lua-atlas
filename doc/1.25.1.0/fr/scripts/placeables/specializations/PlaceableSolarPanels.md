# placeables/specializations/PlaceableSolarPanels.lua

*[English version](../../../../scripts/placeables/specializations/PlaceableSolarPanels.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableSolarPanels.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable qui ajoute des panneaux solaires : un nœud de tête optionnel qui pivote lentement vers le soleil et un revenu dépendant de la météo. Elle exige PlaceableIncomePerHour et enregistre un type de configuration `solarPanels`. Les réglages viennent de `placeable.solarPanels.solarPanelsConfigurations.solarPanelsConfiguration(?)`.

- **PlaceableSolarPanels** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableSolarPanels.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Renvoie true seulement si le type de placeable inclut la spécialisation PlaceableIncomePerHour. |
| `PlaceableSolarPanels.initSpecialization()` | 24 | ✍ Enregistre le type de configuration `solarPanels` auprès du gestionnaire de configurations de placeables, avec le libellé localisé `configuration_solarPanel`. |
| `PlaceableSolarPanels.registerOverwrittenFunctions(placeableType: any)` | 30 | ✍ Surcharge `getIncomePerHour` et `getNeedHourChanged` sur le type de placeable. |
| `PlaceableSolarPanels.registerFunctions(placeableType: any)` | 37 | ✍ Enregistre la nouvelle fonction de placeable `updateHeadRotation`. |
| `PlaceableSolarPanels.registerEventListeners(placeableType: any)` | 43 | ✍ S'abonne à onLoad, onFinalizePlacement, onReadStream, onWriteStream, onHourChanged et onUpdate. |
| `PlaceableSolarPanels.registerXMLPaths(schema: any, basePath: any)` | 54 | ✍ Déclare les clés XML d'une configuration de panneaux solaires : `#headNode`, `#randomHeadOffsetRange` (15 degrés par défaut), `#rotationSpeed` (5 deg/s par défaut), `#isActive` et `#incomePerHour`. |
| `PlaceableSolarPanels.registerSavegameXMLPaths(schema: any, basePath: any)` | 68 | ✍ Déclare l'attribut de sauvegarde `#headRotationRandom` qui stocke le décalage aléatoire de la tête. |
| `PlaceableSolarPanels:onLoad(savegame: any)` | 76 | ✍ Lit la configuration solaire choisie. Avec un nœud de tête, elle tire un décalage aléatoire (-plage/2, 0 ou +plage/2) et règle la vitesse de rotation ; elle lit aussi le revenu et la présence de panneaux. Sans panneaux elle retire des écouteurs ; à noter que les retraits visent `Cover` et non cette classe, donc seul onFinalizePlacement est réellement retiré. |
| `PlaceableSolarPanels:onFinalizePlacement()` | 115 | ✍ Oriente la tête vers le soleil une fois le placement finalisé, en appelant `updateHeadRotation`. |
| `PlaceableSolarPanels:loadFromXMLFile(xmlFile: any, key: any)` | 121 | ✍ Lit `#headRotationRandom` dans la sauvegarde. À noter : la condition est inversée (l'affectation n'a lieu que si la valeur est nil), donc le décalage sauvegardé n'est jamais restauré. |
| `PlaceableSolarPanels:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 131 | ✍ Écrit le décalage de rotation aléatoire de la tête dans la sauvegarde si un nœud de tête existe. |
| `PlaceableSolarPanels:onReadStream(streamId: any, connection: any)` | 140 | ✍ Côté client : lit l'angle aléatoire compressé de la tête envoyé par le serveur si un nœud de tête existe. |
| `PlaceableSolarPanels:onWriteStream(streamId: any, connection: any)` | 149 | ✍ Côté serveur : écrit l'angle aléatoire de la tête sous forme d'angle compressé pour les clients qui rejoignent, si un nœud de tête existe. |
| `PlaceableSolarPanels:onUpdate(dt: any)` | 158 | ✍ Fait tendre la rotation courante de la tête vers la cible à la vitesse configurée (multipliée par `dt`) et l'applique avec `setDirection` ; garde le placeable actif jusqu'à l'atteinte de la cible. |
| `PlaceableSolarPanels:onHourChanged()` | 180 | ✍ Callback horaire qui recalcule la rotation cible de la tête. |
| `PlaceableSolarPanels:updateHeadRotation()` | 186 | ✍ Calcule la direction du soleil à partir de la lumière solaire de l'environnement et, si sa composante X dépasse 0,3 en valeur absolue, fixe l'angle cible de la tête (plus le décalage aléatoire). Dépend de `g_currentMission.environment`, NON VÉRIFIÉ (classe absente du dump). |
| `PlaceableSolarPanels:getIncomePerHour(superFunc: any)` | 206 | ✍ Ajoute le revenu solaire configuré à la valeur de base : complet quand le soleil est levé, multiplié par 0,75 en hiver, par 0,1 sous la pluie. Les valeurs météo viennent de `Environment`/`Weather`, NON VÉRIFIÉ. |
| `PlaceableSolarPanels:getNeedHourChanged(superFunc: any)` | 234 | ✍ Renvoie si des panneaux solaires existent, de sorte que le callback horaire n'est requis que pour les placeables qui en ont. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerOverwrittenFunction | `getIncomePerHour` | 31 |
| registerOverwrittenFunction | `getNeedHourChanged` | 32 |
| registerFunction | `updateHeadRotation` | 38 |
| registerEventListener | `onLoad` | 44 |
| registerEventListener | `onFinalizePlacement` | 45 |
| registerEventListener | `onReadStream` | 46 |
| registerEventListener | `onWriteStream` | 47 |
| registerEventListener | `onHourChanged` | 48 |
| registerEventListener | `onUpdate` | 49 |

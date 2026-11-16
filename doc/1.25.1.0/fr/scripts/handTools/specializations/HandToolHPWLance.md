# handTools/specializations/HandToolHPWLance.lua

*[English version](../../../../scripts/handTools/specializations/HandToolHPWLance.md)*

Source: `dataS/scripts/handTools/specializations/HandToolHPWLance.lua` — FS25 1.25.1.0

✍ Spécialisation d'outil à main pour la lance du nettoyeur haute pression. Elle exige HandToolTethered. Une fois activée, le client propriétaire lance un rayon vers l'avant contre les véhicules ; le serveur nettoie le véhicule visé et facture les frais de fonctionnement à la ferme. L'état et la cible sont synchronisés via le flux de mise à jour. Les clés XML sont sous `handTool.highPressureWasherLance`.

- **HandToolHPWLance** (l.10)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `HandToolHPWLance.registerXMLPaths(xmlSchema: any)` | 14 | ✍ Enregistre les entrées XML de la lance : nœud de rayon, distance de lavage, multiplicateur de lavage, prix par minute, ainsi que les effets et le son de lavage. |
| `HandToolHPWLance.registerFunctions(handToolType: any)` | 26 | ✍ Enregistre `onWashAction`, `setIsActivated` et `onLanceCallback` sur le type d'outil à main. |
| `HandToolHPWLance.registerOverwrittenFunctions(vehicleType: any)` | 34 | ✍ Surcharge `getCanBeDropped` pour que la lance ne puisse jamais être lâchée. |
| `HandToolHPWLance.registerEventListeners(handToolType: any)` | 40 | ✍ Abonne la spécialisation à `onLoad`, `onDelete`, `onWriteUpdateStream`, `onReadUpdateStream`, `onUpdate`, `onRegisterActionEvents`, `onHeldEnd` et `onDebugDraw`. |
| `HandToolHPWLance.prerequisitesPresent(specializations: any)` | 53 | ✍ Renvoie true uniquement si la spécialisation HandToolTethered est présente. |
| `HandToolHPWLance:onLoad(xmlFile: any, baseDirectory: any)` | 59 | ✍ Lit le nœud de rayon, la distance de lavage (10 m par défaut), le multiplicateur (1 par défaut) et le prix (10 par minute par défaut, stocké par seconde). Sur les clients, charge les effets typés eau et le son de lavage. Initialise l'état et un indicateur de modification. |
| `HandToolHPWLance:onDelete()` | 85 | ✍ Supprime les effets et l'échantillon sonore de lavage. |
| `HandToolHPWLance:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 93 | ✍ Écrit l'indicateur d'activation. Lors de l'envoi au serveur, écrit aussi l'identifiant de l'objet véhicule visé s'il y en a un. Le masque de modification n'est pas consulté : l'indicateur est écrit à chaque fois. |
| `HandToolHPWLance:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 107 | ✍ Lit l'indicateur d'activation et, côté serveur de la connexion, l'identifiant du véhicule visé (ignoré si le lecteur est le joueur propriétaire), puis applique l'état avec `setIsActivated`. |
| `HandToolHPWLance:onUpdate(dt: any)` | 130 | ✍ Quand activée : le propriétaire lance un rayon asynchrone vers l'avant sur `washDistance`, met à jour le texte d'action avec le type de cible et signale les changements. Sur le serveur, elle nettoie le véhicule visé selon le multiplicateur et `dt`, et débite les dépenses de la ferme avec un mouvement d'argent VEHICLE_RUNNING_COSTS. |
| `HandToolHPWLance:onLanceCallback(nodeId: any, x: any, y: any, z: any, distance: any, nx: any, ny: any, nz: any, subShapeIndex: any, shapeId: any, isLast: any)` | 184 | ✍ Rappel du rayon : ignore les impacts qui ne sont pas des véhicules et retient comme cible le premier véhicule lavable au nettoyeur haute pression (arrête alors le signalement). Sinon continue ; l'absence d'impact efface la cible. |
| `HandToolHPWLance:setIsActivated(isActivated: any)` | 216 | ✍ Définit l'état d'activation, uniquement s'il change et si un joueur porte l'outil. Le propriétaire le marque pour synchronisation. Démarre ou arrête les effets d'eau et le son de lavage. |
| `HandToolHPWLance:onRegisterActionEvents()` | 248 | ✍ Enregistre l'entrée ACTIVATE_HANDTOOL (rappel à l'appui et au relâchement) avec priorité très haute et un texte construit à partir de `activateText` de l'outil. |
| `HandToolHPWLance:onWashAction(_: any, inputValue: any)` | 263 | ✍ Rappel d'entrée : active la lance tant que la valeur d'entrée est positive, la désactive sinon. |
| `HandToolHPWLance:getCanBeDropped(superFunc: any)` | 269 | ✍ Fonction surchargée : renvoie toujours false. |
| `HandToolHPWLance:onHeldEnd()` | 275 | ✍ Désactive la lance et renvoie l'outil à son support, avec l'indicateur à true. |
| `HandToolHPWLance:onDebugDraw(x: any, y: any, textSize: any)` | 282 | ✍ Ajoute des lignes de debug montrant l'état d'activation et le nom de type du véhicule visé ; renvoie la position y mise à jour. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `onWashAction` | 27 |
| registerFunction | `setIsActivated` | 28 |
| registerFunction | `onLanceCallback` | 29 |
| registerOverwrittenFunction | `getCanBeDropped` | 35 |
| registerEventListener | `onLoad` | 41 |
| registerEventListener | `onDelete` | 42 |
| registerEventListener | `onWriteUpdateStream` | 43 |
| registerEventListener | `onReadUpdateStream` | 44 |
| registerEventListener | `onUpdate` | 45 |
| registerEventListener | `onRegisterActionEvents` | 46 |
| registerEventListener | `onHeldEnd` | 47 |
| registerEventListener | `onDebugDraw` | 48 |

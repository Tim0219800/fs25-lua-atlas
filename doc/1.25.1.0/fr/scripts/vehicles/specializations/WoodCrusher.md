# vehicles/specializations/WoodCrusher.lua

*[English version](../../../../scripts/vehicles/specializations/WoodCrusher.md)*

Source: `dataS/scripts/vehicles/specializations/WoodCrusher.lua` — FS25 1.25.1.0

✍ Spécialisation pour les machines qui tirent des grumes à travers un déclencheur, les coupent à un nœud de coupe et les transforment en plaquettes dans une unité de remplissage. Elle exige TurnOnVehicle et FillUnit. L'essentiel de la logique est dans des fonctions statiques réutilisables (`loadWoodCrusher`, `updateWoodCrusher`, ...) qui reçoivent explicitement une table de spec, ce qui permet à d'autres spécialisations d'embarquer un broyeur. Broyage, forces et suivi des déclencheurs tournent côté serveur ; effets, sons et animations côté client, un simple booléen du flux de mise à jour indiquant aux clients si le broyage est en cours. Racine XML : `vehicle.woodCrusher`.

- **WoodCrusher** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `WoodCrusher.prerequisitesPresent(specializations: table) → boolean` | 19 | ✍ Renvoie true seulement si le type de véhicule possède les spécialisations TurnOnVehicle et FillUnit. |
| `WoodCrusher.initSpecialization()` | 25 | ✍ Enregistre le schéma XML : les chemins communs du broyeur sous `vehicle.woodCrusher`, plus `#moveColDisableCollisionPairs` et `#fillUnitIndex`. |
| `WoodCrusher.registerWoodCrusherXMLPaths(schema: any, key: any)` | 39 | ✍ Enregistre sous une clé donnée les chemins XML du broyeur : nœuds de coupe et de tambour, déclencheurs et collisions de déplacement, vitesse (m/s) et force (kN), nœuds de force vers le bas, mise en marche auto, effets, nœuds d'animation et sons start/stop/work/idle. |
| `WoodCrusher.registerFunctions(vehicleType: any)` | 72 | ✍ Enregistre la fonction de véhicule `onCrushedSplitShape`. |
| `WoodCrusher.registerOverwrittenFunctions(vehicleType: any)` | 78 | ✍ Surcharge `getDirtMultiplier`, `getWearMultiplier`, `getCanBeTurnedOn`, `getConsumingLoad` et `getRequiresPower`. |
| `WoodCrusher.registerEventListeners(vehicleType: any)` | 88 | ✍ S'abonne à onLoad, onDelete, aux flux de lecture/écriture de mise à jour, onUpdate, onUpdateTick, onTurnedOn et onTurnedOff. |
| `WoodCrusher:onLoad(savegame: table)` | 102 | ✍ Charge le broyeur depuis le XML du véhicule. Si `#moveColDisableCollisionPairs` est vrai (défaut), désactive la collision entre chaque composant et chaque nœud de collision de déplacement. Lit l'indice d'unité de remplissage (1 par défaut). |
| `WoodCrusher:onDelete()` | 121 | ✍ Libère déclencheurs, effets, sons et animations via `deleteWoodCrusher`. |
| `WoodCrusher:onReadUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 130 | ✍ Côté client : lit un booléen envoyé par le serveur et met le minuteur de broyage à 1000 ms ou 0. |
| `WoodCrusher:onWriteUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 146 | ✍ Côté serveur : écrit un booléen indiquant si le minuteur de broyage est supérieur à zéro. |
| `WoodCrusher:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 158 | ✍ Exécute `updateWoodCrusher` avec l'état allumé courant du véhicule. |
| `WoodCrusher:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 167 | ✍ Exécute `updateTickWoodCrusher`, puis côté serveur, si le démarrage moteur automatique est activé dans la sauvegarde et `#automaticallyTurnOn` défini : démarre le moteur (le sien ou celui de l'attelage) et allume le broyeur tant que des grumes sont dans les déclencheurs sans conducteur, puis l'éteint après 3 s une fois vide. |
| `WoodCrusher:onTurnedOn()` | 224 | ✍ Gestionnaire d'événement : délègue à `turnOnWoodCrusher`. |
| `WoodCrusher:onTurnedOff()` | 231 | ✍ Gestionnaire d'événement : délègue à `turnOffWoodCrusher`. |
| `WoodCrusher:getCanBeTurnedOn(superFunc: any) → boolean` | 238 | ✍ Renvoie false quand le broyeur est configuré pour s'allumer automatiquement (commutation manuelle bloquée) ; sinon s'en remet à l'implémentation parente. |
| `WoodCrusher:getConsumingLoad(superFunc: any)` | 249 | ✍ Ajoute une unité de charge (et un au compteur) au résultat parent pendant le broyage. Le compteur est incrémenté même au repos. |
| `WoodCrusher:getRequiresPower(superFunc: any)` | 262 | ✍ Renvoie true dès que le broyeur est allumé ; sinon utilise le résultat parent. |
| `WoodCrusher:getDirtMultiplier(superFunc: any) → number` | 273 | ✍ Ajoute le multiplicateur de salissure de travail du véhicule à la valeur parente pendant le broyage. |
| `WoodCrusher:getWearMultiplier(superFunc: any) → number` | 287 | ✍ Ajoute le multiplicateur d'usure de travail du véhicule à la valeur parente pendant le broyage. |
| `WoodCrusher:onCrushedSplitShape(splitType: table, volume: number)` | 302 | ✍ Ajoute des plaquettes à l'unité de remplissage pour un volume broyé (volume x litres par volume x plaquettes par litre du type de bois). Le volume est réduit selon l'endommagement du véhicule multiplié par `WoodCrusher.DAMAGED_YIELD_DECREASE`. |
| `WoodCrusher.loadWoodCrusher(self: table, woodCrusher: table, xmlFile: XMLFile, rootNode: integer, i3dMappings: table)` | 319 | ✍ Charge toutes les données du broyeur depuis le XML dans une table de spec : nœuds, déclencheurs de déplacement (avertit si le bit de collision TREE manque), collisions, nœuds de force, effets, animations et sons. Enregistre les déclencheurs côté serveur. Signale aussi les clés XML obsolètes FS17/FS19. |
| `WoodCrusher.deleteWoodCrusher(self: any, woodCrusher: any)` | 453 | ✍ Retire les déclencheurs de déplacement et de force et supprime effets, sons et animations d'une table de broyeur. |
| `WoodCrusher.updateWoodCrusher(self: number, woodCrusher: any, dt: number, isTurnedOn: any)` | 474 | ✍ Serveur, en marche : broie les formes en file dans `crushNodes`, applique la force vers le bas aux grumes dans le déclencheur, suit la hauteur de grume maximale pour déplacer en douceur le nœud de tambour (0,0003 m par ms) et garde le véhicule actif tant qu'il y a des grumes ou un broyage. |
| `WoodCrusher.updateTickWoodCrusher(self: number, woodCrusher: any, dt: number, isTurnedOn: any)` | 541 | ✍ Serveur, en marche : teste chaque grume face au plan de coupe ; la broie entière s'il reste 0,4 ou moins en dessous, ou la coupe si 0,2 ou plus se trouve au-dessus ; fait vibrer les nœuds de collision. Décrémente ensuite le minuteur et, côté client, démarre ou arrête l'effet de plaquettes et le son de travail. |
| `WoodCrusher.turnOnWoodCrusher(self: any, woodCrusher: any)` | 608 | ✍ À l'allumage : le serveur règle la vitesse de friction des nœuds de collision (entraîne les grumes) ; le client arrête les sons, joue le son de démarrage puis le ralenti, et lance les animations. |
| `WoodCrusher.turnOffWoodCrusher(self: any, woodCrusher: any)` | 629 | ✍ À l'extinction : le serveur broie les formes en file et remet la vitesse de friction à zéro ; le client arrête effets, sons et animations et joue le son d'arrêt. |
| `WoodCrusher.crushSplitShape(self: integer, woodCrusher: any, shape: integer)` | 657 | ✍ Serveur : si le type de bois produit des plaquettes, lit le volume de la forme, la supprime, arme le minuteur de 1000 ms et appelle `onCrushedSplitShape`. Sans effet pour les autres types. |
| `WoodCrusher.woodCrusherSplitShapeCallback(self: integer, shape: integer, isBelow: boolean, isAbove: boolean, minY: number, maxY: number, minZ: number, maxZ: number)` | 676 | ✍ Callback de `splitShape` : met en file de broyage la forme obtenue si ce n'est pas la partie sous la coupe, et informe `g_treePlantManager` de la nouvelle forme. |
| `WoodCrusher.woodCrusherMoveTriggerCallback(self: integer, triggerId: integer, otherActorId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean, otherShapeId: integer)` | 691 | ✍ Callback du déclencheur de déplacement : pour les corps dynamiques hors véhicules dont le type de bois donne des plaquettes, compte les entrées et sorties par corps dans `moveTriggerNodes` et active le véhicule à l'entrée. |
| `WoodCrusher.woodCrusherDownForceTriggerCallback(self: integer, triggerId: integer, otherActorId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean, otherShapeId: integer)` | 722 | ✍ Même suivi que le callback de déplacement, mais par nœud de force dont le déclencheur supplémentaire correspond, avec les comptes stockés dans les `triggerNodes` du nœud. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `onCrushedSplitShape` | 73 |
| registerOverwrittenFunction | `getDirtMultiplier` | 79 |
| registerOverwrittenFunction | `getWearMultiplier` | 80 |
| registerOverwrittenFunction | `getCanBeTurnedOn` | 81 |
| registerOverwrittenFunction | `getConsumingLoad` | 82 |
| registerOverwrittenFunction | `getRequiresPower` | 83 |
| registerEventListener | `onLoad` | 89 |
| registerEventListener | `onDelete` | 90 |
| registerEventListener | `onReadUpdateStream` | 91 |
| registerEventListener | `onWriteUpdateStream` | 92 |
| registerEventListener | `onUpdate` | 93 |
| registerEventListener | `onUpdateTick` | 94 |
| registerEventListener | `onTurnedOn` | 95 |
| registerEventListener | `onTurnedOff` | 96 |

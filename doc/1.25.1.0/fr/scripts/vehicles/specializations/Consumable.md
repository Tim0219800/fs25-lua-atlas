# vehicles/specializations/Consumable.lua

*[English version](../../../../scripts/vehicles/specializations/Consumable.md)*

Source: `dataS/scripts/vehicles/specializations/Consumable.lua` — FS25 1.25.1.0

✍ Spécialisation de véhicule pour les outils utilisant des consommables interchangeables (par exemple balles, sacs ou palettes de film, de semences ou d'objets similaires), qui exige `FillUnit`. Chaque type de consommable est lié à une unité de remplissage, avec des emplacements visuels de stockage et de consommation dont les maillages viennent de `g_consumableManager`. Elle suit le niveau consommé et la variante, pilote échelle des maillages, paramètres de shader et animations, sauvegarde et synchronise cet état, affiche un avertissement de vide et propose un dialogue de recharge via un `ConsumableActivatable`. Les configurations peuvent définir le consommable par défaut. La définition de la table de classe et la constante `Consumable.CONFIG_NAMES` ne figurent pas dans le dump (en-tête supprimé).


## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Consumable.prerequisitesPresent(specializations: table) → boolean` | 26 | ✍ Renvoie vrai uniquement si le type de véhicule possède la spécialisation `FillUnit`. |
| `Consumable.initSpecialization()` | 32 | ✍ Enregistre un type de configuration de boutique pour chaque nom de `Consumable.CONFIG_NAMES`, ainsi que le schéma XML sous `vehicle.consumable` (types, emplacements, animations de consommation, nœuds de shader, changements d'objets) et le schéma de sauvegarde. |
| `Consumable.registerEvents(vehicleType: table)` | 82 | ✍ Enregistre l'événement de véhicule `onConsumableVariationChanged`, déclenché lorsque la variante en cours de consommation change. |
| `Consumable.registerFunctions(vehicleType: table)` | 89 | ✍ Enregistre six fonctions de véhicule : recherche de variante par unité de remplissage, définition de la variante d'un emplacement, `updateConsumable`, test de disponibilité, test d'avertissement de vide et facteur de vitesse du déclencheur de remplissage. |
| `Consumable.registerOverwrittenFunctions(vehicleType: table)` | 101 | ✍ Surcharge `addFillUnitFillLevel`, `getFillUnitFreeCapacity` et `collectPalletTensionBeltNodes`. |
| `Consumable.registerEventListeners(vehicleType: table)` | 110 | ✍ S'abonne aux événements de chargement, post-chargement, suppression, lecture/écriture de flux, flux de mise à jour, effacement du masque de modification, mise à jour, affichage et aux événements d'unité de remplissage (niveau modifié, état de remplissage, ajout ou retrait de déclencheur). |
| `Consumable:onLoad(savegame: table)` | 130 | ✍ Lit chaque type de consommable dans le XML (unité de remplissage, emplacements, paramètres de consommation, animations, changements d'objets, nœuds de shader), en ignorant les types invalides avec un avertissement. Fixe la capacité de l'unité au nombre d'emplacements, applique les noms par défaut des configurations et crée l'activable. |
| `Consumable:onPostLoad(savegame: table)` | 259 | ✍ Restaure le niveau consommé, la variante et celles des emplacements de stockage depuis la sauvegarde, sauf réinitialisation des véhicules. Pour un véhicule neuf non créé vide, remplit l'unité avec le consommable par défaut. Puis met à jour l'activable. |
| `Consumable:onDelete()` | 308 | ✍ Retire l'activable de recharge du système d'objets activables. |
| `Consumable:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 315 | ✍ Sauvegarde, pour chaque type, le nom, le niveau de consommation et le nom de la variante en cours, ainsi que le nom de la variante de chaque emplacement de stockage. |
| `Consumable:onReadStream(streamId: any, connection: any)` | 333 | ✍ Côté client : lors de la synchronisation initiale, lit niveau et variante de consommation, puis la variante de chaque emplacement de stockage, et met à jour maillages et sangles de palette. |
| `Consumable:onWriteStream(streamId: any, connection: any)` | 358 | ✍ Côté serveur : écrit les mêmes données de niveau, variante de consommation et variantes des emplacements de stockage que lit `onReadStream`, dans le même ordre. |
| `Consumable:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 377 | ✍ Côté client : lorsque le drapeau de modification est présent, lit les données de consommation par type et les variantes des emplacements si elles sont signalées, puis les applique aux maillages. |
| `Consumable:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 406 | ✍ Côté serveur : écrit les données de consommation par type et toutes les variantes des emplacements, chacune précédée d'un booléen indiquant si elle a changé. |
| `Consumable:onDirtyMaskCleared()` | 437 | ✍ Réinitialise les marqueurs de modification par type et par emplacement une fois le masque de modification effacé. |
| `Consumable:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 455 | ✍ Fait avancer chaque animation de consommation en attente vers son temps cible selon son échelle de vitesse, avec bouclage à 1 ou 0, et garde le véhicule actif jusqu'à ce que toutes atteignent leur cible. |
| `Consumable:onDraw(isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 494 | ✍ Affiche un avertissement clignotant pour le premier type à emplacements de consommation dont le niveau de consommation et celui de l'unité sont nuls, si le test d'avertissement de vide l'autorise. |
| `Consumable:onFillUnitFillLevelChanged(fillUnitIndex: any, fillLevelDelta: any, fillType: any, toolType: any, fillPositionData: any, appliedDelta: any)` | 513 | ✍ Serveur uniquement. Quand l'unité du type change, remplit ou vide les emplacements de stockage un par un. La variante vient de la source du déclencheur de remplissage, puis de la variante en cours, puis de celle par défaut ; les emplacements de consommation sont rechargés s'il n'y a pas d'emplacement de stockage. |
| `Consumable:onFillUnitIsFillingStateChanged(isFilling: any)` | 605 | ✍ À la fin du remplissage, recharge les emplacements de consommation des types dont le niveau est nul, sinon ne fait que rafraîchir l'affichage. |
| `Consumable:onAddedFillUnitTrigger(fillTypeIndex: any, fillUnitIndex: any, numTriggers: any)` | 624 | ✍ Met à jour l'activable de recharge lorsqu'un déclencheur de remplissage devient disponible. |
| `Consumable:onRemovedFillUnitTrigger(numTriggers: any)` | 630 | ✍ Met à jour l'activable de recharge lorsqu'un déclencheur de remplissage est retiré. |
| `Consumable:getConsumableVariationIndexByFillUnitIndex(fillUnitIndex: any)` | 636 | ✍ Renvoie l'index de variante du premier emplacement de stockage rempli du type utilisant cette unité, sinon la dernière variante consommée, ou nil si aucun type ne correspond. |
| `Consumable:setConsumableSlotVariationIndex(typeIndex: any, slotIndex: any, variationIndex: any)` | 657 | ✍ Définit la variante d'un emplacement de stockage (0 = vide), remplace son maillage par celui de `g_consumableManager` et met à jour les nœuds lavables, usables et de sangle. Marque l'emplacement et lève le drapeau de modification du véhicule. |
| `Consumable:updateConsumable(typeName: any, delta: any, consumingInProgress: any, fillConsumingSlots: any)` | 724 | ✍ Mise à jour centrale : ajoute `delta` au niveau de consommation et, si besoin, prélève une nouvelle unité dans l'unité de remplissage. Rafraîchit maillages, paramètres de shader, échelle, cibles d'animation, changements d'objets et niveau affiché, déclenche `onConsumableVariationChanged` et signale la synchronisation. |
| `Consumable:getConsumableIsAvailable(typeName: any)` | 870 | ✍ Renvoie vrai s'il reste de la matière à consommer pour le type nommé, ou vrai si le nom de type est inconnu. |
| `Consumable:getShowConsumableEmptyWarning(typeName: any)` | 882 | ✍ Renvoie vrai si le niveau de consommation du type nommé est exactement nul, faux pour un type inconnu. |
| `Consumable:getCustomFillTriggerSpeedFactor(fillTrigger: any, fillUnitIndex: any, fillType: any)` | 894 | ✍ Renvoie 1 en temps normal, ou `math.huge` lorsque tous les emplacements de stockage sont pleins sur un type à emplacements de consommation, de sorte que ceux-ci se remplissent instantanément. |
| `Consumable:addFillUnitFillLevel(superFunc: any, farmId: any, fillUnitIndex: any, fillLevelDelta: any, fillTypeIndex: any, ...: any)` | 918 | ✍ Surcharge. Pour les deltas positifs, plafonne la quantité ajoutée à la place restante (emplacements de stockage plus partie non consommée des emplacements de consommation) avant d'appeler le parent. |
| `Consumable:getFillUnitFreeCapacity(superFunc: any, fillUnitIndex: any, ...: any)` | 938 | ✍ Surcharge. Pour les unités de consommables, renvoie la capacité libre basée sur les emplacements ; les emplacements de consommation ne se rechargent qu'une fois entièrement consommés s'il existe des emplacements de stockage. Les autres unités utilisent le parent. |
| `Consumable:collectPalletTensionBeltNodes(superFunc: any, nodes: any)` | 959 | ✍ Surcharge. Après le parent, ajoute à la liste de nœuds les maillages de sangles de tous les emplacements de stockage. |
| `Consumable.updateActivatable(self: any)` | 976 | ✍ Ajoute l'activable de recharge si un type est vide et autorise le dialogue de recharge, et qu'aucun déclencheur de remplissage n'est présent ; sinon le retire. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEvent | `onConsumableVariationChanged` | 83 |
| registerFunction | `getConsumableVariationIndexByFillUnitIndex` | 90 |
| registerFunction | `setConsumableSlotVariationIndex` | 91 |
| registerFunction | `updateConsumable` | 92 |
| registerFunction | `getConsumableIsAvailable` | 93 |
| registerFunction | `getShowConsumableEmptyWarning` | 94 |
| registerFunction | `getCustomFillTriggerSpeedFactor` | 95 |
| registerOverwrittenFunction | `addFillUnitFillLevel` | 102 |
| registerOverwrittenFunction | `getFillUnitFreeCapacity` | 103 |
| registerOverwrittenFunction | `collectPalletTensionBeltNodes` | 104 |
| registerEventListener | `onLoad` | 111 |
| registerEventListener | `onPostLoad` | 112 |
| registerEventListener | `onDelete` | 113 |
| registerEventListener | `onReadStream` | 114 |
| registerEventListener | `onWriteStream` | 115 |
| registerEventListener | `onReadUpdateStream` | 116 |
| registerEventListener | `onWriteUpdateStream` | 117 |
| registerEventListener | `onDirtyMaskCleared` | 118 |
| registerEventListener | `onUpdate` | 119 |
| registerEventListener | `onDraw` | 120 |
| registerEventListener | `onFillUnitFillLevelChanged` | 121 |
| registerEventListener | `onFillUnitIsFillingStateChanged` | 122 |
| registerEventListener | `onAddedFillUnitTrigger` | 123 |
| registerEventListener | `onRemovedFillUnitTrigger` | 124 |

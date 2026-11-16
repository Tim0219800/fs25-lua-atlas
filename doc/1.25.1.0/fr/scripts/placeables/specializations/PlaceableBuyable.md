# placeables/specializations/PlaceableBuyable.lua

*[English version](../../../../scripts/placeables/specializations/PlaceableBuyable.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableBuyable.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable pour les bâtiments existants que le joueur peut acheter sur la carte. Elle ajoute un déclencheur d'achat et un marqueur optionnels, affiche un `BuyBuildingActivatable` quand le joueur local entre dans le déclencheur, demande confirmation et envoie un `BuyExistingPlaceableEvent` au serveur. Le déclencheur n'est actif que tant que le propriétaire est `AccessHandler.EVERYONE`.

- **PlaceableBuyable** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableBuyable.prerequisitesPresent(specializations: table) → boolean` | 19 | ✍ Renvoie toujours true : aucune spécialisation prérequise. |
| `PlaceableBuyable.registerFunctions(placeableType: any)` | 25 | ✍ Enregistre `onBuyingTriggerCallback`, `setIsBuyingTriggerActive`, `buyRequest` et `getHasBuyingTrigger`. Les corps de `setIsBuyingTriggerActive` et `getHasBuyingTrigger` ne sont pas dans le dump : NON VÉRIFIÉ. |
| `PlaceableBuyable.registerOverwrittenFunctions(placeableType: any)` | 34 | ✍ Surcharge `setOwnerFarmId`. |
| `PlaceableBuyable.registerEventListeners(placeableType: any)` | 40 | ✍ S'abonne à `onLoad` et `onDelete`. |
| `PlaceableBuyable.registerXMLPaths(schema: any, basePath: any)` | 47 | ✍ Déclare les clés XML optionnelles `buyable.trigger#node` et `buyable.marker#node`. |
| `PlaceableBuyable:onLoad(savegame: table)` | 57 | ✍ Crée le `BuyBuildingActivatable`, charge les nœuds de déclencheur et de marqueur optionnels, enregistre le rappel du déclencheur et marque le déclencheur comme actif. |
| `PlaceableBuyable:onDelete()` | 73 | ✍ Retire l'activable, le marqueur de déclencheur (s'il existe) et le nœud de déclencheur. |
| `PlaceableBuyable:onBuyingTriggerCallback(triggerId: any, otherId: any, onEnter: any, onLeave: any, onStay: any, otherShapeId: any)` | 111 | ✍ Rappel du déclencheur pour le joueur local : à l'entrée, ajoute l'activable (ou l'exécute directement si la plateforme active automatiquement les déclencheurs), à la sortie le retire. Sans effet si le déclencheur est inactif. |
| `PlaceableBuyable:buyRequest(requestCallback: any, target: any)` | 133 | ✍ Côté client : refusé pendant une visite guidée. Calcule le prix (plus celui du terrain non possédé si le placeable achète des terres), demande confirmation, puis envoie `BuyExistingPlaceableEvent` au serveur et appelle `onBuy` à l'arrivée de la réponse. |
| `PlaceableBuyable:setOwnerFarmId(superFunc: any, farmId: any, noEventSend: any)` | 184 | ✍ Appelle le parent puis n'active le déclencheur d'achat que si le nouveau propriétaire est `AccessHandler.EVERYONE`. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `onBuyingTriggerCallback` | 26 |
| registerFunction | `setIsBuyingTriggerActive` | 27 |
| registerFunction | `buyRequest` | 28 |
| registerFunction | `getHasBuyingTrigger` | 29 |
| registerOverwrittenFunction | `setOwnerFarmId` | 35 |
| registerEventListener | `onLoad` | 41 |
| registerEventListener | `onDelete` | 42 |

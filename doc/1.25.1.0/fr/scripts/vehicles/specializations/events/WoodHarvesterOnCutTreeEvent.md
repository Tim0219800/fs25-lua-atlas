# vehicles/specializations/events/WoodHarvesterOnCutTreeEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/WoodHarvesterOnCutTreeEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/WoodHarvesterOnCutTreeEvent.lua` — FS25 1.25.1.0

✍ Événement serveur vers client qui déclenche l'événement de spécialisation `onCutTree` avec le rayon de coupe afin que les clients jouent les effets de coupe. Il n'a pas de fonction sendEvent. Fait partie des événements des spécialisations de véhicule ; le récepteur n'agit que si l'objet cible est synchronisé.

- **WoodHarvesterOnCutTreeEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `WoodHarvesterOnCutTreeEvent.emptyNew() → table` | 14 | ✍ Crée une instance d'événement vide avec la métatable de l'événement, utilisée quand la couche réseau reçoit cet événement. |
| `WoodHarvesterOnCutTreeEvent.new(object: table, radius: number)` | 23 | ✍ Construit l'événement avec les données à envoyer (un objet nœud et un rayon float32) ; elles sont conservées sur l'instance pour `writeStream`. |
| `WoodHarvesterOnCutTreeEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Lit un objet nœud et un rayon float32 depuis le flux, puis appelle `run(connection)`. |
| `WoodHarvesterOnCutTreeEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Écrit un objet nœud et un rayon float32 dans le flux (même ordre que `readStream`). |
| `WoodHarvesterOnCutTreeEvent:run(connection: Connection)` | 52 | ✍ Applique l'événement côté récepteur : appelle `SpecializationUtil.raiseEvent(objet, 'onCutTree', rayon)` si synchronisé ; sur le serveur, il retransmet d'abord un nouvel événement. |

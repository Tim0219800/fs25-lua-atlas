# vehicles/specializations/events/WoodHarvesterOnDelimbTreeEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/WoodHarvesterOnDelimbTreeEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/WoodHarvesterOnDelimbTreeEvent.lua` — FS25 1.25.1.0

✍ Événement serveur vers client qui indique aux clients qu'une abatteuse commence ou arrête d'ébrancher, afin de mettre à jour les effets. Il n'a pas de fonction sendEvent. Fait partie des événements des spécialisations de véhicule ; le récepteur n'agit que si l'objet cible est synchronisé.

- **WoodHarvesterOnDelimbTreeEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `WoodHarvesterOnDelimbTreeEvent.emptyNew() → table` | 14 | ✍ Crée une instance d'événement vide avec la métatable de l'événement, utilisée quand la couche réseau reçoit cet événement. |
| `WoodHarvesterOnDelimbTreeEvent.new(object: table, state: boolean)` | 22 | ✍ Construit l'événement avec les données à envoyer (un objet nœud et un booléen d'état) ; elles sont conservées sur l'instance pour `writeStream`. |
| `WoodHarvesterOnDelimbTreeEvent:readStream(streamId: integer, connection: Connection)` | 33 | ✍ Lit un objet nœud et un booléen d'état depuis le flux, puis appelle `run(connection)`. |
| `WoodHarvesterOnDelimbTreeEvent:writeStream(streamId: integer, connection: Connection)` | 43 | ✍ Écrit un objet nœud et un booléen d'état dans le flux (même ordre que `readStream`). |
| `WoodHarvesterOnDelimbTreeEvent:run(connection: Connection)` | 51 | ✍ Applique l'événement côté récepteur : appelle `onDelimbTree(état)` sur l'objet s'il est synchronisé ; sur le serveur, il retransmet d'abord un nouvel événement. |

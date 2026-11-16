# vehicles/specializations/events/WoodHarvesterDropTreeEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/WoodHarvesterDropTreeEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/WoodHarvesterDropTreeEvent.lua` — FS25 1.25.1.0

✍ Événement réseau qui fait lâcher à une abatteuse l'arbre qu'elle tient, synchronisé entre serveur et clients. Fait partie des événements des spécialisations de véhicule ; le récepteur n'agit que si l'objet cible est synchronisé.

- **WoodHarvesterDropTreeEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `WoodHarvesterDropTreeEvent.emptyNew() → table` | 14 | ✍ Crée une instance d'événement vide avec la métatable de l'événement, utilisée quand la couche réseau reçoit cet événement. |
| `WoodHarvesterDropTreeEvent.new(object: table)` | 23 | ✍ Construit l'événement avec les données à envoyer (uniquement l'objet nœud) ; elles sont conservées sur l'instance pour `writeStream`. |
| `WoodHarvesterDropTreeEvent:readStream(streamId: integer, connection: Connection)` | 33 | ✍ Lit uniquement l'objet nœud depuis le flux, puis appelle `run(connection)`. |
| `WoodHarvesterDropTreeEvent:writeStream(streamId: integer, connection: Connection)` | 42 | ✍ Écrit uniquement l'objet nœud dans le flux (même ordre que `readStream`). |
| `WoodHarvesterDropTreeEvent:run(connection: Connection)` | 49 | ✍ Applique l'événement côté récepteur : appelle `dropWoodHarvesterTree(true)` sur l'objet s'il est synchronisé ; sur le serveur, il retransmet d'abord un nouvel événement aux autres clients. |
| `WoodHarvesterDropTreeEvent.sendEvent(object: table, noEventSend: boolean)` | 64 | ✍ Fonction utilitaire d'envoi : diffuse l'événement depuis le serveur, ou l'envoie au serveur quand elle est appelée sur un client. Ne fait rien si noEventSend est vrai. |

# vehicles/specializations/events/WoodHarvesterCutTreeEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/WoodHarvesterCutTreeEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/WoodHarvesterCutTreeEvent.lua` — FS25 1.25.1.0

✍ Événement réseau qui fait couper à une abatteuse l'arbre tenu à une longueur donnée, synchronisé entre serveur et clients. Fait partie des événements des spécialisations de véhicule ; le récepteur n'agit que si l'objet cible est synchronisé.

- **WoodHarvesterCutTreeEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `WoodHarvesterCutTreeEvent.emptyNew() → table` | 14 | ✍ Crée une instance d'événement vide avec la métatable de l'événement, utilisée quand la couche réseau reçoit cet événement. |
| `WoodHarvesterCutTreeEvent.new(object: table, length: number)` | 23 | ✍ Construit l'événement avec les données à envoyer (un objet nœud et une longueur de coupe float32) ; elles sont conservées sur l'instance pour `writeStream`. |
| `WoodHarvesterCutTreeEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Lit un objet nœud et une longueur de coupe float32 depuis le flux, puis appelle `run(connection)`. |
| `WoodHarvesterCutTreeEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Écrit un objet nœud et une longueur de coupe float32 dans le flux (même ordre que `readStream`). |
| `WoodHarvesterCutTreeEvent:run(connection: Connection)` | 52 | ✍ Applique l'événement côté récepteur : appelle `cutTree(longueur, true)` sur l'objet s'il est synchronisé ; sur le serveur, il retransmet d'abord un nouvel événement aux autres clients. |
| `WoodHarvesterCutTreeEvent.sendEvent(object: table, length: number, noEventSend: boolean)` | 67 | ✍ Fonction utilitaire d'envoi : diffuse l'événement depuis le serveur, ou l'envoie au serveur quand elle est appelée sur un client. Ne fait rien si noEventSend est vrai. |

# vehicles/specializations/events/SetPipeStateEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/SetPipeStateEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/SetPipeStateEvent.lua` — FS25 1.25.1.0

✍ Événement réseau qui synchronise l'indice d'état (ouvert/fermé) du tuyau d'un véhicule entre serveur et clients. L'état est envoyé sur 3 bits (valeurs 0 à 7). Fait partie des événements des spécialisations de véhicule ; le récepteur n'agit que si l'objet cible est synchronisé.

- **SetPipeStateEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SetPipeStateEvent.emptyNew() → table` | 14 | ✍ Crée une instance d'événement vide avec la métatable de l'événement, utilisée quand la couche réseau reçoit cet événement. |
| `SetPipeStateEvent.new(object: table, pipeState: integer)` | 23 | ✍ Construit l'événement avec les données à envoyer (un objet nœud et un état de tuyau sur 3 bits) ; elles sont conservées sur l'instance pour `writeStream`. |
| `SetPipeStateEvent:readStream(streamId: integer, connection: Connection)` | 35 | ✍ Lit un objet nœud et un état de tuyau sur 3 bits depuis le flux, puis appelle `run(connection)`. |
| `SetPipeStateEvent:writeStream(streamId: integer, connection: Connection)` | 45 | ✍ Écrit un objet nœud et un état de tuyau sur 3 bits dans le flux (même ordre que `readStream`). |
| `SetPipeStateEvent:run(connection: Connection)` | 53 | ✍ Applique l'événement côté récepteur : appelle `setPipeState(état, true)` sur l'objet s'il est synchronisé, puis le serveur retransmet aux autres clients. |

# vehicles/specializations/events/SetTurnedOnEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/SetTurnedOnEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/SetTurnedOnEvent.lua` — FS25 1.25.1.0

✍ Événement réseau qui synchronise l'état allumé/en marche d'un véhicule ou d'un outil entre serveur et clients. Fait partie des événements des spécialisations de véhicule ; le récepteur n'agit que si l'objet cible est synchronisé.

- **SetTurnedOnEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SetTurnedOnEvent.emptyNew() → table` | 14 | ✍ Crée une instance d'événement vide avec la métatable de l'événement, utilisée quand la couche réseau reçoit cet événement. |
| `SetTurnedOnEvent.new(object: table, isTurnedOn: boolean)` | 23 | ✍ Construit l'événement avec les données à envoyer (un objet nœud et un booléen d'état allumé) ; elles sont conservées sur l'instance pour `writeStream`. |
| `SetTurnedOnEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Lit un objet nœud et un booléen d'état allumé depuis le flux, puis appelle `run(connection)`. |
| `SetTurnedOnEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Écrit un objet nœud et un booléen d'état allumé dans le flux (même ordre que `readStream`). |
| `SetTurnedOnEvent:run(connection: Connection)` | 52 | ✍ Applique l'événement côté récepteur : sur le serveur, se retransmet aux autres clients, puis appelle `setIsTurnedOn(état, true)` sur l'objet s'il est synchronisé. |
| `SetTurnedOnEvent.sendEvent(vehicle: table, isTurnedOn: boolean, noEventSend: boolean)` | 67 | ✍ Fonction utilitaire d'envoi : diffuse l'événement depuis le serveur, ou l'envoie au serveur quand elle est appelée sur un client. Ne fait rien si noEventSend est vrai. |

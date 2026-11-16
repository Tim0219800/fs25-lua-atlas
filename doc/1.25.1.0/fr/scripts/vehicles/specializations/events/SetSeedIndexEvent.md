# vehicles/specializations/events/SetSeedIndexEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/SetSeedIndexEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/SetSeedIndexEvent.lua` — FS25 1.25.1.0

✍ Événement réseau qui synchronise l'indice de semence sélectionnée d'un semoir entre serveur et clients. Fait partie des événements des spécialisations de véhicule ; le récepteur n'agit que si l'objet cible est synchronisé.

- **SetSeedIndexEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SetSeedIndexEvent.emptyNew() → table` | 14 | ✍ Crée une instance d'événement vide avec la métatable de l'événement, utilisée quand la couche réseau reçoit cet événement. |
| `SetSeedIndexEvent.new(object: table, seedIndex: integer)` | 23 | ✍ Construit l'événement avec les données à envoyer (un objet nœud et un indice de semence sur 8 bits) ; elles sont conservées sur l'instance pour `writeStream`. |
| `SetSeedIndexEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Lit un objet nœud et un indice de semence sur 8 bits depuis le flux, puis appelle `run(connection)`. |
| `SetSeedIndexEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Écrit un objet nœud et un indice de semence sur 8 bits dans le flux (même ordre que `readStream`). |
| `SetSeedIndexEvent:run(connection: Connection)` | 52 | ✍ Applique l'événement côté récepteur : sur le serveur, se retransmet d'abord aux autres clients, puis appelle `setSeedIndex(indice, true)` sur l'objet s'il est synchronisé. |
| `SetSeedIndexEvent.sendEvent(object: table, seedIndex: integer, noEventSend: boolean)` | 67 | ✍ Fonction utilitaire d'envoi : diffuse l'événement depuis le serveur, ou l'envoie au serveur quand elle est appelée sur un client. Ne fait rien si noEventSend est vrai. |

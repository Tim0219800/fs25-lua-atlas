# vehicles/specializations/events/SetPipeDischargeToGroundEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/SetPipeDischargeToGroundEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/SetPipeDischargeToGroundEvent.lua` — FS25 1.25.1.0

✍ Événement réseau qui synchronise l'indicateur de déversement au sol d'un tuyau (par exemple le tuyau de vidange d'une moissonneuse). Fait partie des événements des spécialisations de véhicule ; le récepteur n'agit que si l'objet cible est synchronisé.

- **SetPipeDischargeToGroundEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SetPipeDischargeToGroundEvent.emptyNew() → table` | 14 | ✍ Crée une instance d'événement vide avec la métatable de l'événement, utilisée quand la couche réseau reçoit cet événement. |
| `SetPipeDischargeToGroundEvent.new(object: table, dischargeState: boolean)` | 23 | ✍ Construit l'événement avec les données à envoyer (un objet nœud et un booléen d'état de déversement) ; elles sont conservées sur l'instance pour `writeStream`. |
| `SetPipeDischargeToGroundEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Lit un objet nœud et un booléen d'état de déversement depuis le flux, puis appelle `run(connection)`. |
| `SetPipeDischargeToGroundEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Écrit un objet nœud et un booléen d'état de déversement dans le flux (même ordre que `readStream`). |
| `SetPipeDischargeToGroundEvent:run(connection: Connection)` | 52 | ✍ Applique l'événement côté récepteur : appelle `setPipeDischargeToGround(état, true)` sur l'objet s'il est synchronisé, puis le serveur retransmet aux autres clients. |
| `SetPipeDischargeToGroundEvent.sendEvent(object: table, dischargeState: boolean, noEventSend: boolean)` | 67 | ✍ Fonction utilitaire d'envoi : diffuse l'événement depuis le serveur, ou l'envoie au serveur quand elle est appelée sur un client. Ne fait rien si noEventSend est vrai. |

# vehicles/specializations/events/TrailerToggleManualDoorEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/TrailerToggleManualDoorEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/TrailerToggleManualDoorEvent.lua` — FS25 1.25.1.0

✍ Événement réseau qui synchronise la porte manuelle d'un côté de bennage de remorque (ouverte ou fermée) entre serveur et clients. Fait partie des événements des spécialisations de véhicule ; le récepteur n'agit que si l'objet cible est synchronisé.

- **TrailerToggleManualDoorEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `TrailerToggleManualDoorEvent.emptyNew() → table` | 14 | ✍ Crée une instance d'événement vide avec la métatable de l'événement, utilisée quand la couche réseau reçoit cet événement. |
| `TrailerToggleManualDoorEvent.new(object: table, tipSideIndex: boolean, state: boolean)` | 23 | ✍ Construit l'événement avec les données à envoyer (un objet nœud, un booléen d'état de porte et un indice de côté de bennage (Trailer.TIP_SIDE_NUM_BITS bits)) ; elles sont conservées sur l'instance pour `writeStream`. |
| `TrailerToggleManualDoorEvent:readStream(streamId: integer, connection: Connection)` | 35 | ✍ Lit un objet nœud, un booléen d'état de porte et un indice de côté de bennage (Trailer.TIP_SIDE_NUM_BITS bits) depuis le flux, puis appelle `run(connection)`. |
| `TrailerToggleManualDoorEvent:writeStream(streamId: integer, connection: Connection)` | 47 | ✍ Écrit un objet nœud, un booléen d'état de porte et un indice de côté de bennage (Trailer.TIP_SIDE_NUM_BITS bits) dans le flux (même ordre que `readStream`). |
| `TrailerToggleManualDoorEvent:run(connection: Connection)` | 56 | ✍ Applique l'événement côté récepteur : sur le serveur, se retransmet, puis appelle `setTrailerDoorState(indiceCôté, état, true)` sur l'objet s'il est synchronisé. |
| `TrailerToggleManualDoorEvent.sendEvent(vehicle: table, tipSideIndex: boolean, state: integer, noEventSend: boolean)` | 72 | ✍ Fonction utilitaire d'envoi : diffuse l'événement depuis le serveur, ou l'envoie au serveur quand elle est appelée sur un client. Ne fait rien si noEventSend est vrai. |

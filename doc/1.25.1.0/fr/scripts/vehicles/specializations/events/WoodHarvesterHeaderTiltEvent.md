# vehicles/specializations/events/WoodHarvesterHeaderTiltEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/WoodHarvesterHeaderTiltEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/WoodHarvesterHeaderTiltEvent.lua` — FS25 1.25.1.0

✍ Événement réseau qui synchronise l'état d'inclinaison de la tête d'une abatteuse entre serveur et clients. Fait partie des événements des spécialisations de véhicule ; le récepteur n'agit que si l'objet cible est synchronisé.

- **WoodHarvesterHeaderTiltEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `WoodHarvesterHeaderTiltEvent.emptyNew() → table` | 14 | ✍ Crée une instance d'événement vide avec la métatable de l'événement, utilisée quand la couche réseau reçoit cet événement. |
| `WoodHarvesterHeaderTiltEvent.new(object: table, state: number)` | 23 | ✍ Construit l'événement avec les données à envoyer (un objet nœud et un booléen d'état d'inclinaison) ; elles sont conservées sur l'instance pour `writeStream`. |
| `WoodHarvesterHeaderTiltEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Lit un objet nœud et un booléen d'état d'inclinaison depuis le flux, puis appelle `run(connection)`. |
| `WoodHarvesterHeaderTiltEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Écrit un objet nœud et un booléen d'état d'inclinaison dans le flux (même ordre que `readStream`). |
| `WoodHarvesterHeaderTiltEvent:run(connection: Connection)` | 52 | ✍ Applique l'événement côté récepteur : appelle `setWoodHarvesterTiltState(état, true)` sur l'objet s'il est synchronisé. Contrairement à la plupart des événements, il ne retransmet pas depuis `run`. |
| `WoodHarvesterHeaderTiltEvent.sendEvent(object: table, state: number, noEventSend: boolean)` | 63 | ✍ Fonction utilitaire d'envoi : diffuse l'événement depuis le serveur, ou l'envoie au serveur quand elle est appelée sur un client. Ne fait rien si noEventSend est vrai. |

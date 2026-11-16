# vehicles/specializations/events/SprayerDoubledAmountEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/SprayerDoubledAmountEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/SprayerDoubledAmountEvent.lua` — FS25 1.25.1.0

✍ Événement réseau qui synchronise le mode « dose doublée » d'un pulvérisateur entre serveur et clients. Fait partie des événements des spécialisations de véhicule ; le récepteur n'agit que si l'objet cible est synchronisé.

- **SprayerDoubledAmountEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SprayerDoubledAmountEvent.emptyNew() → table` | 14 | ✍ Crée une instance d'événement vide avec la métatable de l'événement, utilisée quand la couche réseau reçoit cet événement. |
| `SprayerDoubledAmountEvent.new(object: table, isActive: integer)` | 23 | ✍ Construit l'événement avec les données à envoyer (un objet nœud et un booléen d'activation) ; elles sont conservées sur l'instance pour `writeStream`. |
| `SprayerDoubledAmountEvent:readStream(streamId: integer, connection: Connection)` | 35 | ✍ Lit un objet nœud et un booléen d'activation depuis le flux, puis appelle `run(connection)`. |
| `SprayerDoubledAmountEvent:writeStream(streamId: integer, connection: Connection)` | 45 | ✍ Écrit un objet nœud et un booléen d'activation dans le flux (même ordre que `readStream`). |
| `SprayerDoubledAmountEvent:run(connection: Connection)` | 53 | ✍ Applique l'événement côté récepteur : appelle `setSprayerDoubledAmountActive(indicateur, true)` sur l'objet s'il est synchronisé, puis le serveur retransmet aux autres clients. |
| `SprayerDoubledAmountEvent.sendEvent(vehicle: table, isActive: boolean, noEventSend: boolean)` | 68 | ✍ Fonction utilitaire d'envoi : diffuse l'événement depuis le serveur, ou l'envoie au serveur quand elle est appelée sur un client. Ne fait rien si noEventSend est vrai. |

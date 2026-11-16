# vehicles/specializations/events/TrailerToggleManualTipEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/TrailerToggleManualTipEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/TrailerToggleManualTipEvent.lua` — FS25 1.25.1.0

✍ Événement réseau qui synchronise le démarrage ou l'arrêt du bennage manuel d'une remorque entre serveur et clients. Fait partie des événements des spécialisations de véhicule ; le récepteur n'agit que si l'objet cible est synchronisé.

- **TrailerToggleManualTipEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `TrailerToggleManualTipEvent.emptyNew() → table` | 14 | ✍ Crée une instance d'événement vide avec la métatable de l'événement, utilisée quand la couche réseau reçoit cet événement. |
| `TrailerToggleManualTipEvent.new(object: table, state: boolean) → TrailerToggleManualTipEvent` | 24 | ✍ Construit l'événement avec les données à envoyer (un objet nœud et un booléen d'état de bennage) ; elles sont conservées sur l'instance pour `writeStream`. |
| `TrailerToggleManualTipEvent:readStream(streamId: integer, connection: Connection)` | 35 | ✍ Lit un objet nœud et un booléen d'état de bennage depuis le flux, puis appelle `run(connection)`. |
| `TrailerToggleManualTipEvent:writeStream(streamId: integer, connection: Connection)` | 46 | ✍ Écrit un objet nœud et un booléen d'état de bennage dans le flux (même ordre que `readStream`). |
| `TrailerToggleManualTipEvent:run(connection: Connection)` | 54 | ✍ Applique l'événement côté récepteur : sur le serveur, se retransmet, puis appelle `startTipping(nil, true)` si l'état est vrai, sinon `stopTipping(true)`. |
| `TrailerToggleManualTipEvent.sendEvent(vehicle: table, state: boolean, noEventSend: boolean?)` | 73 | ✍ Fonction utilitaire d'envoi : diffuse l'événement depuis le serveur, ou l'envoie au serveur quand elle est appelée sur un client. Ne fait rien si noEventSend est vrai. |

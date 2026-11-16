# vehicles/specializations/events/TensionBeltsEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/TensionBeltsEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/TensionBeltsEvent.lua` — FS25 1.25.1.0

✍ Événement réseau qui synchronise les sangles de tension d'un véhicule : activation ou relâchement d'une sangle précise (par identifiant) ou de toutes (identifiant nil). Fait partie des événements des spécialisations de véhicule ; le récepteur n'agit que si l'objet cible est synchronisé.

- **TensionBeltsEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `TensionBeltsEvent.emptyNew() → table` | 14 | ✍ Crée une instance d'événement vide avec la métatable de l'événement, utilisée quand la couche réseau reçoit cet événement. |
| `TensionBeltsEvent.new(object: table, isActive: boolean, beltId: integer)` | 24 | ✍ Construit l'événement avec les données à envoyer (un objet nœud, un indicateur d'absence d'identifiant de sangle, l'identifiant optionnel (envoyé comme id-1 sur TensionBelts.NUM_SEND_BITS bits) et l'indicateur actif) ; elles sont conservées sur l'instance pour `writeStream`. |
| `TensionBeltsEvent:readStream(streamId: integer, connection: Connection)` | 36 | ✍ Lit un objet nœud, un indicateur d'absence d'identifiant de sangle, l'identifiant optionnel (envoyé comme id-1 sur TensionBelts.NUM_SEND_BITS bits) et l'indicateur actif depuis le flux, puis appelle `run(connection)`. |
| `TensionBeltsEvent:writeStream(streamId: integer, connection: Connection)` | 49 | ✍ Écrit un objet nœud, un indicateur d'absence d'identifiant de sangle, l'identifiant optionnel (envoyé comme id-1 sur TensionBelts.NUM_SEND_BITS bits) et l'indicateur actif dans le flux (même ordre que `readStream`). |
| `TensionBeltsEvent:run(connection: Connection)` | 61 | ✍ Applique l'événement côté récepteur : sur le serveur, se retransmet, puis appelle `setTensionBeltsActive(actif, idSangle, true)` sur l'objet s'il est synchronisé. |
| `TensionBeltsEvent.sendEvent(vehicle: table, isActive: boolean, beltId: integer, noEventSend: boolean)` | 77 | ✍ Fonction utilitaire d'envoi : diffuse l'événement depuis le serveur, ou l'envoie au serveur quand elle est appelée sur un client. Ne fait rien si noEventSend est vrai. |

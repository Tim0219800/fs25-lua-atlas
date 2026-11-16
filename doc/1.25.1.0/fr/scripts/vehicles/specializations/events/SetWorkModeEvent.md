# vehicles/specializations/events/SetWorkModeEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/SetWorkModeEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/SetWorkModeEvent.lua` — FS25 1.25.1.0

✍ Événement réseau qui synchronise le mode de travail sélectionné d'un véhicule entre serveur et clients. L'indice de mode utilise WorkMode.WORKMODE_SEND_NUM_BITS bits. Fait partie des événements des spécialisations de véhicule ; le récepteur n'agit que si l'objet cible est synchronisé.

- **SetWorkModeEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SetWorkModeEvent.emptyNew() → table` | 14 | ✍ Crée une instance d'événement vide avec la métatable de l'événement, utilisée quand la couche réseau reçoit cet événement. |
| `SetWorkModeEvent.new(vehicle: table, state: integer)` | 23 | ✍ Construit l'événement avec les données à envoyer (un objet nœud et un indice de mode de travail (WorkMode.WORKMODE_SEND_NUM_BITS bits)) ; elles sont conservées sur l'instance pour `writeStream`. |
| `SetWorkModeEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Lit un objet nœud et un indice de mode de travail (WorkMode.WORKMODE_SEND_NUM_BITS bits) depuis le flux, puis appelle `run(connection)`. |
| `SetWorkModeEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Écrit un objet nœud et un indice de mode de travail (WorkMode.WORKMODE_SEND_NUM_BITS bits) dans le flux (même ordre que `readStream`). |
| `SetWorkModeEvent:run(connection: Connection)` | 52 | ✍ Applique l'événement côté récepteur : appelle `setWorkMode(état, true)` sur le véhicule s'il est synchronisé, puis le serveur retransmet. À noter : la retransmission passe `self.object`, jamais défini sur cet événement (il utilise `self.vehicle`), donc nil. |
| `SetWorkModeEvent.sendEvent(vehicle: table, state: integer, noEventSend: boolean)` | 67 | ✍ Fonction utilitaire d'envoi : diffuse l'événement depuis le serveur, ou l'envoie au serveur quand elle est appelée sur un client. Ne fait rien si noEventSend est vrai. |

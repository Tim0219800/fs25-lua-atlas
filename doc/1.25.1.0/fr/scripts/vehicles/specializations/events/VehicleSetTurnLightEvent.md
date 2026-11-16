# vehicles/specializations/events/VehicleSetTurnLightEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/VehicleSetTurnLightEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/VehicleSetTurnLightEvent.lua` — FS25 1.25.1.0

✍ Événement réseau qui synchronise l'état des clignotants (éteint, gauche, droite, warning) d'un véhicule. Le constructeur vérifie que l'état est entre 0 et Lights.TURNLIGHT_HAZARD. Fait partie des événements des spécialisations de véhicule ; le récepteur n'agit que si l'objet cible est synchronisé.

- **VehicleSetTurnLightEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `VehicleSetTurnLightEvent.emptyNew() → table` | 14 | ✍ Crée une instance d'événement vide avec la métatable de l'événement, utilisée quand la couche réseau reçoit cet événement. |
| `VehicleSetTurnLightEvent.new(object: table, state: integer)` | 23 | ✍ Construit l'événement avec les données à envoyer (un objet nœud et un état de clignotant (Lights.turnLightSendNumBits bits)) ; elles sont conservées sur l'instance pour `writeStream`. |
| `VehicleSetTurnLightEvent:readStream(streamId: integer, connection: Connection)` | 35 | ✍ Lit un objet nœud et un état de clignotant (Lights.turnLightSendNumBits bits) depuis le flux, puis appelle `run(connection)`. |
| `VehicleSetTurnLightEvent:writeStream(streamId: integer, connection: Connection)` | 45 | ✍ Écrit un objet nœud et un état de clignotant (Lights.turnLightSendNumBits bits) dans le flux (même ordre que `readStream`). |
| `VehicleSetTurnLightEvent:run(connection: Connection)` | 53 | ✍ Applique l'événement côté récepteur : appelle `setTurnLightState(état, true, true)` sur l'objet s'il est synchronisé, puis le serveur retransmet aux autres clients. |

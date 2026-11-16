# vehicles/specializations/events/PalletFillerStateEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/PalletFillerStateEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/PalletFillerStateEvent.lua` — FS25 1.25.1.0

✍ Classe d'événement réseau `PalletFillerStateEvent` (hérite de `Event`) qui réplique l'état d'un remplisseur de palettes. Elle transporte le véhicule et un état sérialisé via `PalletFillerState`. Elle fait partie des événements de spécialisations de véhicules et ne définit rien d'autre.

- **PalletFillerStateEvent** hérite de `Event` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PalletFillerStateEvent.emptyNew() → table` | 19 | ✍ Crée une instance vide de `PalletFillerStateEvent` sans données, utilisée quand l'événement est lu depuis un flux réseau. |
| `PalletFillerStateEvent.new(object: table, state: table) → table` | 29 | ✍ Crée l'événement avec ses données : le véhicule et un état sérialisé via `PalletFillerState`. |
| `PalletFillerStateEvent:readStream(streamId: integer, connection: Connection)` | 41 | ✍ Lit les données de l'événement depuis le flux réseau (le véhicule et un état sérialisé via `PalletFillerState`), puis appelle `run`. |
| `PalletFillerStateEvent:writeStream(streamId: integer, connection: Connection)` | 52 | ✍ Écrit les données de l'événement dans le flux réseau (le véhicule et un état sérialisé via `PalletFillerState`). |
| `PalletFillerStateEvent:run(connection: Connection)` | 60 | ✍ Exécute l'événement côté réception : appelle `setPalletFillerState(state, false, true)` sur le véhicule. Sur le serveur, il retransmet aussi l'événement aux autres clients, sauf l'émetteur. |
| `PalletFillerStateEvent.sendEvent(vehicle: table, state: integer, noEventSend: boolean)` | 75 | ✍ Fonction utilitaire d'envoi : le serveur diffuse l'événement aux clients, un client l'envoie au serveur. Ignorée si `noEventSend` est activé. |

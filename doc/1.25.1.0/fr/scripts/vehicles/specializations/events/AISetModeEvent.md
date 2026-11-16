# vehicles/specializations/events/AISetModeEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/AISetModeEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/AISetModeEvent.lua` — FS25 1.25.1.0

✍ Événement réseau qui synchronise le mode IA sélectionné d'un véhicule (indice base 1, envoyé comme indice moins 1 sur `AIModeSelection.NUM_BITS` bits). Les clients l'envoient au serveur, qui l'applique et le relaie aux autres. Utiliser `sendEvent` pour l'émettre.

- **AISetModeEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AISetModeEvent.emptyNew() → table` | 14 | ✍ Crée une instance d'événement vide avec la métatable de la classe ; utilisée par la couche réseau avant que `readStream` ne la remplisse. |
| `AISetModeEvent.new(vehicle: table, aiMode: integer)` | 23 | ✍ Crée l'événement pour un véhicule avec l'indice de mode IA à sélectionner. |
| `AISetModeEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Lit le véhicule et le mode sous forme d'entier non signé de `AIModeSelection.NUM_BITS` bits, en ajoutant 1, puis appelle `run`. |
| `AISetModeEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Écrit le véhicule et le mode moins 1 sur `AIModeSelection.NUM_BITS` bits (les modes commencent à 1). |
| `AISetModeEvent:run(connection: Connection)` | 52 | ✍ Appelle `setAIModeSelection(mode, true)` sur un véhicule synchronisé ; sur le serveur il le rediffuse aux autres clients, en excluant l'émetteur. |
| `AISetModeEvent.sendEvent(vehicle: table, aiMode: integer, noEventSend: boolean)` | 67 | ✍ Envoie l'événement sauf si `noEventSend` vaut true : le serveur le diffuse, un client l'envoie au serveur. |

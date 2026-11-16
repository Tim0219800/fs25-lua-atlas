# vehicles/specializations/events/AIModeSelectionSettingsEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/AIModeSelectionSettingsEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/AIModeSelectionSettingsEvent.lua` — FS25 1.25.1.0

✍ Événement réseau qui synchronise les réglages de parcours de champ du mode IA (`FieldCourseSettings`) d'un véhicule. Les clients l'envoient au serveur, qui l'applique et le relaie aux autres. Utiliser `sendEvent` pour l'émettre.

- **AIModeSelectionSettingsEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIModeSelectionSettingsEvent.emptyNew() → table` | 14 | ✍ Crée une instance d'événement vide avec la métatable de la classe ; utilisée par la couche réseau avant que `readStream` ne la remplisse. |
| `AIModeSelectionSettingsEvent.new(vehicle: table, fieldCourseSettings: integer)` | 23 | ✍ Crée l'événement pour un véhicule avec l'objet `FieldCourseSettings` à synchroniser. |
| `AIModeSelectionSettingsEvent:readStream(streamId: integer, connection: Connection)` | 35 | ✍ Lit le véhicule et les attributs de réglages, reconstruit un `FieldCourseSettings` pour lui et appelle `run`. |
| `AIModeSelectionSettingsEvent:writeStream(streamId: integer, connection: Connection)` | 50 | ✍ Écrit le véhicule et les réglages de parcours de champ. |
| `AIModeSelectionSettingsEvent:run(connection: Connection)` | 59 | ✍ Appelle `setAIModeFieldCourseSettings` sur un véhicule synchronisé ; sur le serveur il le rediffuse aux autres clients, en excluant l'émetteur. |
| `AIModeSelectionSettingsEvent.sendEvent(vehicle: table, fieldCourseSettings: integer, noEventSend: boolean)` | 74 | ✍ Envoie l'événement sauf si `noEventSend` vaut true : le serveur le diffuse, un client l'envoie au serveur. |

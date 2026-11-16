# vehicles/specializations/events/AIConveyorBeltSetAngleEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/AIConveyorBeltSetAngleEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/AIConveyorBeltSetAngleEvent.lua` — FS25 1.25.1.0

✍ Événement réseau qui synchronise l'angle du tapis convoyeur IA d'un véhicule (8 bits signé). Un client l'envoie au serveur, qui l'applique et le relaie aux autres clients.

- **AIConveyorBeltSetAngleEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIConveyorBeltSetAngleEvent.emptyNew() → table` | 14 | ✍ Crée une instance d'événement vide avec la métatable de la classe ; utilisée par la couche réseau avant que `readStream` ne la remplisse. |
| `AIConveyorBeltSetAngleEvent.new(vehicle: table, currentAngle: integer)` | 23 | ✍ Crée l'événement pour un véhicule avec la valeur d'angle du tapis convoyeur à appliquer. |
| `AIConveyorBeltSetAngleEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Lit le véhicule et l'angle sous forme d'entier signé 8 bits, puis appelle `run`. |
| `AIConveyorBeltSetAngleEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Écrit le véhicule et l'angle sous forme d'entier signé 8 bits (la valeur doit tenir dans -128..127). |
| `AIConveyorBeltSetAngleEvent:run(connection: Connection)` | 52 | ✍ Appelle `setAIConveyorBeltAngle(angle, true)` sur un véhicule synchronisé ; sur le serveur il le rediffuse aux autres clients, en excluant la connexion émettrice. Il n'existe pas d'aide `sendEvent`. |

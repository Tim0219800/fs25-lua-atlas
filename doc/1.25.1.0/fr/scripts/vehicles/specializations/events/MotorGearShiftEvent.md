# vehicles/specializations/events/MotorGearShiftEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/MotorGearShiftEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/MotorGearShiftEvent.lua` — FS25 1.25.1.0

✍ Classe d'événement réseau `MotorGearShiftEvent` (hérite de `Event`) qui est une demande de changement de rapport, de groupe ou de sens sur un véhicule motorisé. Elle transporte le véhicule, un type de changement (4 bits) et, seulement pour la sélection de rapport ou de groupe, une valeur (5 bits). Elle fait partie des événements de spécialisations de véhicules et ne définit rien d'autre.

- **MotorGearShiftEvent** hérite de `Event` (l.21)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `MotorGearShiftEvent.emptyNew() → table` | 28 | ✍ Crée une instance vide de `MotorGearShiftEvent` sans données, utilisée quand l'événement est lu depuis un flux réseau. |
| `MotorGearShiftEvent.new(vehicle: table, shiftType: boolean, shiftValue: any)` | 37 | ✍ Crée l'événement avec ses données : le véhicule, un type de changement (4 bits) et, seulement pour la sélection de rapport ou de groupe, une valeur (5 bits). |
| `MotorGearShiftEvent:readStream(streamId: integer, connection: Connection)` | 49 | ✍ Lit les données de l'événement depuis le flux réseau (le véhicule, un type de changement (4 bits) et, seulement pour la sélection de rapport ou de groupe, une valeur (5 bits)), puis appelle `run`. |
| `MotorGearShiftEvent:writeStream(streamId: integer, connection: Connection)` | 64 | ✍ Écrit les données de l'événement dans le flux réseau (le véhicule, un type de changement (4 bits) et, seulement pour la sélection de rapport ou de groupe, une valeur (5 bits)). |
| `MotorGearShiftEvent:run(connection: Connection)` | 76 | ✍ Exécute l'événement côté réception : distribue selon le type vers `shiftGear`, `selectGear`, `shiftGroup`, `selectGroup` ou `changeDirection` de `spec_motorized.motor`. |
| `MotorGearShiftEvent.sendToServer(vehicle: table, shiftType: integer, shiftValue: integer?)` | 109 | ✍ Fonction utilitaire qui envoie un nouvel événement de changement de vitesse à la connexion serveur si `g_client` existe. |

# vehicles/specializations/events/BaleWrapperDropEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/BaleWrapperDropEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/BaleWrapperDropEvent.lua` — FS25 1.25.1.0

✍ Classe d'événement réseau `BaleWrapperDropEvent` (hérite de `Event`) qui réplique la dépose d'une balle enrubannée. Elle transporte le véhicule et un index d'animation de dépose (4 bits). Elle fait partie des événements de spécialisations de véhicules et ne définit rien d'autre.

- **BaleWrapperDropEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `BaleWrapperDropEvent.emptyNew() → table` | 14 | ✍ Crée une instance vide de `BaleWrapperDropEvent` sans données, utilisée quand l'événement est lu depuis un flux réseau. |
| `BaleWrapperDropEvent.new(object: table, dropAnimationIndex: integer) → BaleWrapperDropEvent` | 24 | ✍ Crée l'événement avec ses données : le véhicule et un index d'animation de dépose (4 bits). |
| `BaleWrapperDropEvent:readStream(streamId: integer, connection: Connection)` | 36 | ✍ Lit les données de l'événement depuis le flux réseau (le véhicule et un index d'animation de dépose (4 bits)), puis appelle `run`. |
| `BaleWrapperDropEvent:writeStream(streamId: integer, connection: Connection)` | 47 | ✍ Écrit les données de l'événement dans le flux réseau (le véhicule et un index d'animation de dépose (4 bits)). |
| `BaleWrapperDropEvent:run(connection: Connection)` | 55 | ✍ Exécute l'événement côté réception : définit l'animation de dépose via `setBaleWrapperDropAnimation`, puis appelle `doStateChange(BaleWrapper.CHANGE_WRAPPER_START_DROP_BALE)`. Sur le serveur, il retransmet aussi l'événement aux autres clients, sauf l'émetteur. |

# vehicles/specializations/events/JumpEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/JumpEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/JumpEvent.lua` — FS25 1.25.1.0

✍ Classe d'événement réseau `JumpEvent` (hérite de `Event`) qui est une demande client pour faire sauter un véhicule. Elle transporte le véhicule, écrit seulement quand le flux part vers le serveur. Elle fait partie des événements de spécialisations de véhicules et ne définit rien d'autre.

- **JumpEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `JumpEvent.emptyNew() → table` | 14 | ✍ Crée une instance vide de `JumpEvent` sans données, utilisée quand l'événement est lu depuis un flux réseau. |
| `JumpEvent.new(object: table)` | 23 | ✍ Crée l'événement avec ses données : le véhicule, écrit seulement quand le flux part vers le serveur. |
| `JumpEvent:readStream(streamId: integer, connection: Connection)` | 33 | ✍ Lit les données de l'événement depuis le flux réseau (le véhicule, écrit seulement quand le flux part vers le serveur), puis appelle `run`. |
| `JumpEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Écrit les données de l'événement dans le flux réseau (le véhicule, écrit seulement quand le flux part vers le serveur). |
| `JumpEvent:run(connection: Connection)` | 53 | ✍ Exécute l'événement côté réception : appelle `jump(true)` sur le véhicule une fois synchronisé ; `run` ne vérifie pas le côté client/serveur. |

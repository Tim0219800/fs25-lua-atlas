# vehicles/specializations/events/FillUnitUnloadEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/FillUnitUnloadEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/FillUnitUnloadEvent.lua` — FS25 1.25.1.0

✍ Classe d'événement réseau `FillUnitUnloadEvent` (hérite de `Event`) qui est une demande client de décharger les unités de remplissage d'un véhicule. Elle transporte le véhicule, écrit seulement quand le flux part vers le serveur. Elle fait partie des événements de spécialisations de véhicules et ne définit rien d'autre.

- **FillUnitUnloadEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FillUnitUnloadEvent.emptyNew() → table` | 14 | ✍ Crée une instance vide de `FillUnitUnloadEvent` sans données, utilisée quand l'événement est lu depuis un flux réseau. |
| `FillUnitUnloadEvent.new(object: table)` | 22 | ✍ Crée l'événement avec ses données : le véhicule, écrit seulement quand le flux part vers le serveur. |
| `FillUnitUnloadEvent.newServerToClient()` | 30 | ✍ Crée l'instance d'événement destinée à aller du serveur vers les clients ; elle ne porte aucune donnée de véhicule. |
| `FillUnitUnloadEvent:readStream(streamId: integer, connection: Connection)` | 39 | ✍ Lit les données de l'événement depuis le flux réseau (le véhicule, écrit seulement quand le flux part vers le serveur), puis appelle `run`. |
| `FillUnitUnloadEvent:writeStream(streamId: integer, connection: Connection)` | 50 | ✍ Écrit les données de l'événement dans le flux réseau (le véhicule, écrit seulement quand le flux part vers le serveur). |
| `FillUnitUnloadEvent:run(connection: Connection)` | 59 | ✍ Exécute l'événement côté réception : uniquement sur le serveur, appelle `unloadFillUnits(true)` sur le véhicule. |

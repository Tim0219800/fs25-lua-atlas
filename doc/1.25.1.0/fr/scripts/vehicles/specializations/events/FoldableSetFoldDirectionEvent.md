# vehicles/specializations/events/FoldableSetFoldDirectionEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/FoldableSetFoldDirectionEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/FoldableSetFoldDirectionEvent.lua` — FS25 1.25.1.0

✍ Classe d'événement réseau `FoldableSetFoldDirectionEvent` (hérite de `Event`) qui réplique le sens de pliage d'un outil repliable. Elle transporte le véhicule, un sens (-1, 0 ou 1, envoyé sur 2 bits) et un indicateur de déplacement au milieu. Elle fait partie des événements de spécialisations de véhicules et ne définit rien d'autre.

- **FoldableSetFoldDirectionEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FoldableSetFoldDirectionEvent.emptyNew() → table` | 14 | ✍ Crée une instance vide de `FoldableSetFoldDirectionEvent` sans données, utilisée quand l'événement est lu depuis un flux réseau. |
| `FoldableSetFoldDirectionEvent.new(object: table, direction: integer, moveToMiddle: boolean)` | 24 | ✍ Crée l'événement avec ses données : le véhicule, un sens (-1, 0 ou 1, envoyé sur 2 bits) et un indicateur de déplacement au milieu. |
| `FoldableSetFoldDirectionEvent:readStream(streamId: integer, connection: Connection)` | 36 | ✍ Lit les données de l'événement depuis le flux réseau (le véhicule, un sens (-1, 0 ou 1, envoyé sur 2 bits) et un indicateur de déplacement au milieu), puis appelle `run`. |
| `FoldableSetFoldDirectionEvent:writeStream(streamId: integer, connection: Connection)` | 47 | ✍ Écrit les données de l'événement dans le flux réseau (le véhicule, un sens (-1, 0 ou 1, envoyé sur 2 bits) et un indicateur de déplacement au milieu). |
| `FoldableSetFoldDirectionEvent:run(connection: Connection)` | 56 | ✍ Exécute l'événement côté réception : appelle `setFoldState(direction, moveToMiddle, true)` sur le véhicule. Sur le serveur, il retransmet aussi l'événement aux autres clients, sauf l'émetteur. |

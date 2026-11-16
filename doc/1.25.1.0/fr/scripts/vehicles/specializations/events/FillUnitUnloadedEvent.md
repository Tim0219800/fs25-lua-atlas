# vehicles/specializations/events/FillUnitUnloadedEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/FillUnitUnloadedEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/FillUnitUnloadedEvent.lua` — FS25 1.25.1.0

✍ Classe d'événement réseau `FillUnitUnloadedEvent` (hérite de `Event`) qui est le résultat serveur d'un déchargement d'unité de remplissage, portant soit la position d'une palette créée, soit un avertissement/résultat. Elle transporte le véhicule plus soit une palette avec position monde compressée et angles d'Euler, soit un indicateur d'avertissement et un résultat sur 2 bits (0 nil, 1 faux, 2 vrai). Elle fait partie des événements de spécialisations de véhicules et ne définit rien d'autre.

- **FillUnitUnloadedEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FillUnitUnloadedEvent.emptyNew() → table` | 14 | ✍ Crée une instance vide de `FillUnitUnloadedEvent` sans données, utilisée quand l'événement est lu depuis un flux réseau. |
| `FillUnitUnloadedEvent.new(object: table, pallet: any, showWarning: any, result: any)` | 22 | ✍ Crée l'événement avec ses données : le véhicule plus soit une palette avec position monde compressée et angles d'Euler, soit un indicateur d'avertissement et un résultat sur 2 bits (0 nil, 1 faux, 2 vrai). |
| `FillUnitUnloadedEvent:readStream(streamId: integer, connection: Connection)` | 36 | ✍ Lit les données de l'événement depuis le flux réseau (le véhicule plus soit une palette avec position monde compressée et angles d'Euler, soit un indicateur d'avertissement et un résultat sur 2 bits (0 nil, 1 faux, 2 vrai)), puis appelle `run`. |
| `FillUnitUnloadedEvent:writeStream(streamId: integer, connection: Connection)` | 70 | ✍ Écrit les données de l'événement dans le flux réseau (le véhicule plus soit une palette avec position monde compressée et angles d'Euler, soit un indicateur d'avertissement et un résultat sur 2 bits (0 nil, 1 faux, 2 vrai)). |
| `FillUnitUnloadedEvent:run(connection: Connection)` | 101 | ✍ Exécute l'événement côté réception : avec une palette, la démonte si besoin, la place via `setWorldPositionQuaternion` et lève `onFillUnitUnloadPallet` ; sinon peut afficher une notification de manque de place et lève `onFillUnitUnloaded` avec le résultat. |

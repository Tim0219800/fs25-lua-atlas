# vehicles/specializations/events/MixerWagonBaleNotAcceptedEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/MixerWagonBaleNotAcceptedEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/MixerWagonBaleNotAcceptedEvent.lua` — FS25 1.25.1.0

✍ Classe d'événement réseau `MixerWagonBaleNotAcceptedEvent` (hérite de `Event`) qui indique à un client qu'un mélangeur a refusé une balle. Elle transporte aucune donnée. Elle fait partie des événements de spécialisations de véhicules et ne définit rien d'autre.

- **MixerWagonBaleNotAcceptedEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `MixerWagonBaleNotAcceptedEvent.emptyNew() → table` | 14 | ✍ Crée une instance vide de `MixerWagonBaleNotAcceptedEvent` sans données, utilisée quand l'événement est lu depuis un flux réseau. |
| `MixerWagonBaleNotAcceptedEvent.new()` | 22 | ✍ Crée l'événement avec ses données : aucune donnée. |
| `MixerWagonBaleNotAcceptedEvent:readStream(streamId: integer, connection: Connection)` | 31 | ✍ Lit les données de l'événement depuis le flux réseau (aucune donnée), puis appelle `run`. |
| `MixerWagonBaleNotAcceptedEvent:writeStream(streamId: integer, connection: Connection)` | 39 | ✍ Écrit les données de l'événement dans le flux réseau (aucune donnée). |
| `MixerWagonBaleNotAcceptedEvent:run(connection: any)` | 44 | ✍ Exécute l'événement côté réception : affiche une notification critique en jeu avec la clé de texte `warning_baleNotSupported`. |

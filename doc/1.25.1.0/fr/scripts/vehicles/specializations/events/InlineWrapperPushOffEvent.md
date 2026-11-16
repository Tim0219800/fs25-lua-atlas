# vehicles/specializations/events/InlineWrapperPushOffEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/InlineWrapperPushOffEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/InlineWrapperPushOffEvent.lua` — FS25 1.25.1.0

✍ Classe d'événement réseau `InlineWrapperPushOffEvent` (hérite de `Event`) qui est une demande client de pousser la balle hors d'une enrubanneuse en ligne. Elle transporte le véhicule enrubanneur, écrit seulement quand le flux part vers le serveur. Elle fait partie des événements de spécialisations de véhicules et ne définit rien d'autre.

- **InlineWrapperPushOffEvent** hérite de `Event` (l.6)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `InlineWrapperPushOffEvent.emptyNew() → table` | 13 | ✍ Crée une instance vide de `InlineWrapperPushOffEvent` sans données, utilisée quand l'événement est lu depuis un flux réseau. |
| `InlineWrapperPushOffEvent.new(inlineWrapper: table) → table` | 22 | ✍ Crée l'événement avec ses données : le véhicule enrubanneur, écrit seulement quand le flux part vers le serveur. |
| `InlineWrapperPushOffEvent:readStream(streamId: integer, connection: Connection)` | 32 | ✍ Lit les données de l'événement depuis le flux réseau (le véhicule enrubanneur, écrit seulement quand le flux part vers le serveur), puis appelle `run`. |
| `InlineWrapperPushOffEvent:writeStream(streamId: integer, connection: Connection)` | 43 | ✍ Écrit les données de l'événement dans le flux réseau (le véhicule enrubanneur, écrit seulement quand le flux part vers le serveur). |
| `InlineWrapperPushOffEvent:run(connection: Connection)` | 52 | ✍ Exécute l'événement côté réception : uniquement sur le serveur, appelle `pushOffInlineBale()` sur l'enrubanneuse. |

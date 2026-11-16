# placeables/PlaceablePreplacedInfoEvent.lua

*[English version](../../../scripts/placeables/PlaceablePreplacedInfoEvent.md)*

Source: `dataS/scripts/placeables/PlaceablePreplacedInfoEvent.lua` — FS25 1.25.1.0

✍ Événement réseau utilisé lorsqu'un client rejoint la partie, pour transférer les informations sur les placeables préplacés. Il ne contient aucune donnée et délègue entièrement aux fonctions de flux du système de placeables.

- **PlaceablePreplacedInfoEvent** hérite de `Event` (l.6)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceablePreplacedInfoEvent.emptyNew()` | 12 | ✍ Crée une instance d'événement vide pour la couche réseau. |
| `PlaceablePreplacedInfoEvent.new()` | 19 | ✍ Crée l'événement ; il ne prend aucun argument et ne stocke rien. |
| `PlaceablePreplacedInfoEvent:readStream(streamId: any, connection: any)` | 27 | ✍ Transmet le flux à `g_currentMission.placeableSystem:readStreamPreplacedInfo`, qui lit les informations des placeables préplacés. |
| `PlaceablePreplacedInfoEvent:writeStream(streamId: any, connection: any)` | 33 | ✍ Transmet le flux à `g_currentMission.placeableSystem:writeStreamPreplacedInfo`, qui écrit les informations des placeables préplacés. |

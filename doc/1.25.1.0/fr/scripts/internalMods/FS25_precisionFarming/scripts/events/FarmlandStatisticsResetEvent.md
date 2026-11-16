# internalMods/FS25_precisionFarming/scripts/events/FarmlandStatisticsResetEvent.lua

*[English version](../../../../../../scripts/internalMods/FS25_precisionFarming/scripts/events/FarmlandStatisticsResetEvent.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/events/FarmlandStatisticsResetEvent.lua` — FS25 1.25.1.0

✍ Événement réseau (sous-classe de Event) qui ordonne à un client de réinitialiser les statistiques d'une parcelle. Sa charge utile est uniquement l'id de parcelle.

- **FarmlandStatisticsResetEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FarmlandStatisticsResetEvent.emptyNew() → table` | 14 | ✍ Crée une instance vide de FarmlandStatisticsResetEvent avec la métatable Event ; la couche réseau l'appelle avant que readStream ne remplisse les champs. |
| `FarmlandStatisticsResetEvent.new(farmlandId: table)` | 22 | ✍ Crée l'événement pour un id de parcelle. |
| `FarmlandStatisticsResetEvent:readStream(streamId: integer, connection: Connection)` | 32 | ✍ Côté client : lit l'id de parcelle et appelle g_precisionFarming.farmlandStatistics:resetStatistic dessus, si l'objet existe. Il n'appelle pas run. |
| `FarmlandStatisticsResetEvent:writeStream(streamId: integer, connection: Connection)` | 47 | ✍ Écrit uniquement l'id de parcelle. |

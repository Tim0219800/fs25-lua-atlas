# internalMods/FS25_precisionFarming/scripts/events/FarmlandStatisticsEvent.lua

*[English version](../../../../../../scripts/internalMods/FS25_precisionFarming/scripts/events/FarmlandStatisticsEvent.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/events/FarmlandStatisticsEvent.lua` — FS25 1.25.1.0

✍ Événement réseau (sous-classe de Event) qui envoie les statistiques d'une parcelle du serveur vers un client, en réponse à RequestFarmlandStatisticsEvent.

- **FarmlandStatisticsEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FarmlandStatisticsEvent.emptyNew() → table` | 14 | ✍ Crée une instance vide de FarmlandStatisticsEvent avec la métatable Event ; la couche réseau l'appelle avant que readStream ne remplisse les champs. |
| `FarmlandStatisticsEvent.new(farmlandId: table)` | 22 | ✍ Crée l'événement pour un id de parcelle. |
| `FarmlandStatisticsEvent:readStream(streamId: integer, connection: Connection)` | 32 | ✍ Côté client : lit l'id de parcelle, puis g_precisionFarming.farmlandStatistics:readStatisticFromStream lit les statistiques, si l'objet existe. |
| `FarmlandStatisticsEvent:writeStream(streamId: integer, connection: Connection)` | 47 | ✍ Côté serveur : écrit l'id de parcelle, puis g_precisionFarming.farmlandStatistics:writeStatisticToStream écrit les statistiques, si l'objet existe. |

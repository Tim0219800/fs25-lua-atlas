# internalMods/FS25_precisionFarming/scripts/events/AdditionalFieldBuyInfoEvent.lua

*[English version](../../../../../../scripts/internalMods/FS25_precisionFarming/scripts/events/AdditionalFieldBuyInfoEvent.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/events/AdditionalFieldBuyInfoEvent.lua` — FS25 1.25.1.0

✍ Événement réseau (sous-classe de Event) qui transporte les informations supplémentaires d'achat de champ (données Precision Farming affichées à l'achat d'une parcelle) du serveur vers un client demandeur. Il est envoyé en réponse à RequestFieldBuyInfoEvent.

- **AdditionalFieldBuyInfoEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AdditionalFieldBuyInfoEvent.emptyNew() → table` | 14 | ✍ Crée une instance vide de AdditionalFieldBuyInfoEvent avec la métatable Event ; la couche réseau l'appelle avant que readStream ne remplisse les champs. |
| `AdditionalFieldBuyInfoEvent.new(farmlandId: table)` | 22 | ✍ Crée l'événement pour un id de parcelle. |
| `AdditionalFieldBuyInfoEvent:readStream(streamId: integer, connection: Connection)` | 32 | ✍ Côté client : lit l'id de parcelle, puis laisse g_precisionFarming.additionalFieldBuyInfo lire les données avec readInfoFromStream, si cet objet existe. |
| `AdditionalFieldBuyInfoEvent:writeStream(streamId: integer, connection: Connection)` | 47 | ✍ Côté serveur : écrit l'id de parcelle, puis laisse g_precisionFarming.additionalFieldBuyInfo écrire les données avec writeInfoToStream, si cet objet existe. |

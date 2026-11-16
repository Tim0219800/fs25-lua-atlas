# internalMods/FS25_precisionFarming/scripts/events/EnvironmentalScoreEvent.lua

*[English version](../../../../../../scripts/internalMods/FS25_precisionFarming/scripts/events/EnvironmentalScoreEvent.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/events/EnvironmentalScoreEvent.lua` — FS25 1.25.1.0

✍ Événement réseau (sous-classe de Event) qui envoie les données de score environnemental d'une ferme du serveur vers un client, en réponse à RequestEnvironmentalScoreEvent.

- **EnvironmentalScoreEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `EnvironmentalScoreEvent.emptyNew() → table` | 14 | ✍ Crée une instance vide de EnvironmentalScoreEvent avec la métatable Event ; la couche réseau l'appelle avant que readStream ne remplisse les champs. |
| `EnvironmentalScoreEvent.new(farmId: table)` | 22 | ✍ Crée l'événement pour un id de ferme. |
| `EnvironmentalScoreEvent:readStream(streamId: integer, connection: Connection)` | 32 | ✍ Côté client : lit l'id de ferme, puis transmet le flux à g_precisionFarming.environmentalScore:readStream, s'il existe. |
| `EnvironmentalScoreEvent:writeStream(streamId: integer, connection: Connection)` | 47 | ✍ Côté serveur : écrit l'id de ferme, puis laisse g_precisionFarming.environmentalScore:writeStream écrire les données de score de cette ferme. |

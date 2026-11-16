# internalMods/FS25_precisionFarming/scripts/events/ResetYieldMapEvent.lua

*[English version](../../../../../../scripts/internalMods/FS25_precisionFarming/scripts/events/ResetYieldMapEvent.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/events/ResetYieldMapEvent.lua` — FS25 1.25.1.0

✍ Événement réseau (sous-classe de Event) envoyé par un client pour réinitialiser les données de la carte de rendement d'une parcelle. Le serveur l'applique via l'objet yieldMap de g_precisionFarming.

- **ResetYieldMapEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ResetYieldMapEvent.emptyNew() → table` | 14 | ✍ Crée une instance vide de ResetYieldMapEvent avec la métatable Event ; la couche réseau l'appelle avant que readStream ne remplisse les champs. |
| `ResetYieldMapEvent.new(farmlandId: table)` | 22 | ✍ Crée l'événement pour un id de parcelle. |
| `ResetYieldMapEvent:readStream(streamId: integer, connection: Connection)` | 32 | ✍ Côté serveur : lit l'id de parcelle, puis appelle run. |
| `ResetYieldMapEvent:writeStream(streamId: integer, connection: Connection)` | 41 | ✍ Côté client : écrit l'id de parcelle. |
| `ResetYieldMapEvent:run(connection: Connection)` | 48 | ✍ S'exécute uniquement sur le serveur : appelle g_precisionFarming.yieldMap:resetFarmlandYieldArea pour la parcelle, puis updatePrecisionFarmingOverlays. |

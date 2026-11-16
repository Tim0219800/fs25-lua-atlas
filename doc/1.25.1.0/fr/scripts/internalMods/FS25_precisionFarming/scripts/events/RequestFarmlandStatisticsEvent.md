# internalMods/FS25_precisionFarming/scripts/events/RequestFarmlandStatisticsEvent.lua

*[English version](../../../../../../scripts/internalMods/FS25_precisionFarming/scripts/events/RequestFarmlandStatisticsEvent.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/events/RequestFarmlandStatisticsEvent.lua` — FS25 1.25.1.0

✍ Événement réseau (sous-classe de Event) envoyé par un client pour demander au serveur les statistiques d'une parcelle. Le serveur répond par un FarmlandStatisticsEvent à cette seule connexion.

- **RequestFarmlandStatisticsEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `RequestFarmlandStatisticsEvent.emptyNew() → table` | 14 | ✍ Crée une instance vide de RequestFarmlandStatisticsEvent avec la métatable Event ; la couche réseau l'appelle avant que readStream ne remplisse les champs. |
| `RequestFarmlandStatisticsEvent.new(farmlandId: table)` | 22 | ✍ Crée la requête pour un id de parcelle. |
| `RequestFarmlandStatisticsEvent:readStream(streamId: integer, connection: Connection)` | 32 | ✍ Côté serveur : lit l'id de parcelle, puis appelle run. |
| `RequestFarmlandStatisticsEvent:writeStream(streamId: integer, connection: Connection)` | 41 | ✍ Côté client : écrit l'id de parcelle. |
| `RequestFarmlandStatisticsEvent:run(connection: Connection)` | 48 | ✍ S'exécute uniquement sur le serveur : répond par un FarmlandStatisticsEvent pour cette parcelle à la seule connexion demandeuse. |

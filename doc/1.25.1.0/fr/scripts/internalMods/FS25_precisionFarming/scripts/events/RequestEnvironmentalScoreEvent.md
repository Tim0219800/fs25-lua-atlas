# internalMods/FS25_precisionFarming/scripts/events/RequestEnvironmentalScoreEvent.lua

*[English version](../../../../../../scripts/internalMods/FS25_precisionFarming/scripts/events/RequestEnvironmentalScoreEvent.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/events/RequestEnvironmentalScoreEvent.lua` — FS25 1.25.1.0

✍ Événement réseau (sous-classe de Event) envoyé par un client pour demander au serveur les données de score environnemental de sa ferme. Le serveur répond par un EnvironmentalScoreEvent à cette seule connexion.

- **RequestEnvironmentalScoreEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `RequestEnvironmentalScoreEvent.emptyNew() → table` | 14 | ✍ Crée une instance vide de RequestEnvironmentalScoreEvent avec la métatable Event ; la couche réseau l'appelle avant que readStream ne remplisse les champs. |
| `RequestEnvironmentalScoreEvent.new(farmId: table)` | 22 | ✍ Crée la requête pour un id de ferme. |
| `RequestEnvironmentalScoreEvent:readStream(streamId: integer, connection: Connection)` | 32 | ✍ Côté serveur : lit l'id de ferme (FarmManager.FARM_ID_SEND_NUM_BITS bits), puis appelle run. |
| `RequestEnvironmentalScoreEvent:writeStream(streamId: integer, connection: Connection)` | 41 | ✍ Côté client : écrit l'id de ferme sur FarmManager.FARM_ID_SEND_NUM_BITS bits. |
| `RequestEnvironmentalScoreEvent:run(connection: Connection)` | 48 | ✍ S'exécute uniquement sur le serveur : renvoie un EnvironmentalScoreEvent pour la ferme demandée à la seule connexion demandeuse. |

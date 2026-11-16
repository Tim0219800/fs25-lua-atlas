# internalMods/FS25_precisionFarming/scripts/events/RequestFieldBuyInfoEvent.lua

*[English version](../../../../../../scripts/internalMods/FS25_precisionFarming/scripts/events/RequestFieldBuyInfoEvent.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/events/RequestFieldBuyInfoEvent.lua` — FS25 1.25.1.0

✍ Événement réseau (sous-classe de Event) envoyé par un client pour demander au serveur les informations supplémentaires d'achat d'une parcelle. Le serveur répond par un AdditionalFieldBuyInfoEvent à cette seule connexion.

- **RequestFieldBuyInfoEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `RequestFieldBuyInfoEvent.emptyNew() → table` | 14 | ✍ Crée une instance vide de RequestFieldBuyInfoEvent avec la métatable Event ; la couche réseau l'appelle avant que readStream ne remplisse les champs. |
| `RequestFieldBuyInfoEvent.new(farmlandId: table)` | 22 | ✍ Crée la requête pour un id de parcelle. |
| `RequestFieldBuyInfoEvent:readStream(streamId: integer, connection: Connection)` | 32 | ✍ Côté serveur : lit l'id de parcelle, puis appelle run. |
| `RequestFieldBuyInfoEvent:writeStream(streamId: integer, connection: Connection)` | 41 | ✍ Côté client : écrit l'id de parcelle. |
| `RequestFieldBuyInfoEvent:run(connection: Connection)` | 48 | ✍ S'exécute uniquement sur le serveur : répond par un AdditionalFieldBuyInfoEvent pour cette parcelle à la seule connexion demandeuse. À noter : le test serveur est écrit deux fois de façon imbriquée, ce qui est redondant. |

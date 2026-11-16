# internalMods/FS25_precisionFarming/scripts/events/ExtendedSprayerDefaultFruitTypeEvent.lua

*[English version](../../../../../../scripts/internalMods/FS25_precisionFarming/scripts/events/ExtendedSprayerDefaultFruitTypeEvent.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/events/ExtendedSprayerDefaultFruitTypeEvent.lua` — FS25 1.25.1.0

✍ Événement réseau (sous-classe de Event) qui synchronise l'indice d'exigence de culture par défaut qu'un pulvérisateur étendu utilise pour calculer sa quantité appliquée.

- **ExtendedSprayerDefaultFruitTypeEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ExtendedSprayerDefaultFruitTypeEvent.emptyNew() → table` | 14 | ✍ Crée une instance vide de ExtendedSprayerDefaultFruitTypeEvent avec la métatable Event ; la couche réseau l'appelle avant que readStream ne remplisse les champs. |
| `ExtendedSprayerDefaultFruitTypeEvent.new(object: table, fruitRequirementIndex: integer)` | 23 | ✍ Crée l'événement pour un objet pulvérisateur et un indice d'exigence de culture. |
| `ExtendedSprayerDefaultFruitTypeEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Lit l'objet et l'indice (FruitTypeManager.SEND_NUM_BITS bits), puis appelle run. |
| `ExtendedSprayerDefaultFruitTypeEvent:writeStream(streamId: integer, connection: Connection)` | 45 | ✍ Écrit l'objet et l'indice d'exigence de culture sur FruitTypeManager.SEND_NUM_BITS bits. |
| `ExtendedSprayerDefaultFruitTypeEvent:run(connection: Connection)` | 53 | ✍ Côté réception. Sur le serveur, il rediffuse d'abord l'événement aux autres clients (pas à l'expéditeur) ; puis, si l'objet cible existe et est synchronisé, il applique le changement localement sans renvoyer d'événement. Il appelle object:setSprayAmountDefaultFruitRequirementIndex(index, true). |
| `ExtendedSprayerDefaultFruitTypeEvent.sendEvent(object: table, fruitRequirementIndex: boolean, noEventSend: boolean)` | 67 | ✍ Point d'entrée pour synchroniser l'indice d'exigence de culture par défaut. Serveur : diffuse un nouvel ExtendedSprayerDefaultFruitTypeEvent aux clients (lié à l'objet) ; client : l'envoie au serveur. Ne fait rien si noEventSend vaut true. |

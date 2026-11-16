# internalMods/FS25_precisionFarming/scripts/events/ExtendedSprayerAmountEvent.lua

*[English version](../../../../../../scripts/internalMods/FS25_precisionFarming/scripts/events/ExtendedSprayerAmountEvent.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/events/ExtendedSprayerAmountEvent.lua` — FS25 1.25.1.0

✍ Événement réseau (sous-classe de Event) qui synchronise la quantité appliquée d'un pulvérisateur étendu : mode automatique actif ou non et, en mode manuel, une valeur dont la largeur est NitrogenMap.NUM_BITS.

- **ExtendedSprayerAmountEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ExtendedSprayerAmountEvent.emptyNew() → table` | 14 | ✍ Crée une instance vide de ExtendedSprayerAmountEvent avec la métatable Event ; la couche réseau l'appelle avant que readStream ne remplisse les champs. |
| `ExtendedSprayerAmountEvent.new(object: table, automaticMode: boolean, manualValue: integer)` | 24 | ✍ Crée l'événement pour un objet pulvérisateur, un indicateur de mode automatique et une valeur de quantité manuelle. |
| `ExtendedSprayerAmountEvent:readStream(streamId: integer, connection: Connection)` | 36 | ✍ Lit l'objet, l'indicateur automatique et, seulement si l'automatique est désactivé, la valeur manuelle (NitrogenMap.NUM_BITS bits) ; puis appelle run. |
| `ExtendedSprayerAmountEvent:writeStream(streamId: integer, connection: Connection)` | 50 | ✍ Écrit l'objet et l'indicateur automatique, puis la valeur manuelle seulement si le mode automatique est désactivé. |
| `ExtendedSprayerAmountEvent:run(connection: Connection)` | 60 | ✍ Côté réception. Sur le serveur, il rediffuse d'abord l'événement aux autres clients (pas à l'expéditeur) ; puis, si l'objet cible existe et est synchronisé, il applique le changement localement sans renvoyer d'événement. Il appelle object:setSprayAmountAutoMode et, en mode manuel, object:setSprayAmountManualValue. |
| `ExtendedSprayerAmountEvent.sendEvent(object: table, automaticMode: boolean, manualValue: any, noEventSend: boolean)` | 77 | ✍ Point d'entrée pour synchroniser la quantité pulvérisée. Serveur : diffuse un nouvel ExtendedSprayerAmountEvent aux clients (lié à l'objet) ; client : l'envoie au serveur. Ne fait rien si noEventSend vaut true. |

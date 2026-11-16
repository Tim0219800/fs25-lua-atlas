# internalMods/FS25_precisionFarming/scripts/events/ExtendedSowingMachineRateEvent.lua

*[English version](../../../../../../scripts/internalMods/FS25_precisionFarming/scripts/events/ExtendedSowingMachineRateEvent.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/events/ExtendedSowingMachineRateEvent.lua` — FS25 1.25.1.0

✍ Événement réseau (sous-classe de Event) qui synchronise le réglage de dose de semis d'un semoir étendu : mode automatique actif ou non et, en mode manuel, une valeur de dose sur 2 bits.

- **ExtendedSowingMachineRateEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ExtendedSowingMachineRateEvent.emptyNew() → table` | 14 | ✍ Crée une instance vide de ExtendedSowingMachineRateEvent avec la métatable Event ; la couche réseau l'appelle avant que readStream ne remplisse les champs. |
| `ExtendedSowingMachineRateEvent.new(object: table, automaticMode: boolean, manualValue: integer)` | 24 | ✍ Crée l'événement pour un objet machine, un indicateur de mode automatique et une valeur de dose manuelle. |
| `ExtendedSowingMachineRateEvent:readStream(streamId: integer, connection: Connection)` | 36 | ✍ Lit l'objet, l'indicateur automatique et, seulement si l'automatique est désactivé, la valeur manuelle sur 2 bits ; puis appelle run. |
| `ExtendedSowingMachineRateEvent:writeStream(streamId: integer, connection: Connection)` | 50 | ✍ Écrit l'objet et l'indicateur automatique, suivis de la valeur manuelle sur 2 bits seulement si le mode automatique est désactivé. |
| `ExtendedSowingMachineRateEvent:run(connection: Connection)` | 60 | ✍ Côté réception. Sur le serveur, il rediffuse d'abord l'événement aux autres clients (pas à l'expéditeur) ; puis, si l'objet cible existe et est synchronisé, il applique le changement localement sans renvoyer d'événement. Il appelle object:setSeedRateAutoMode et, en mode manuel, object:setManualSeedRate. |
| `ExtendedSowingMachineRateEvent.sendEvent(object: table, automaticMode: boolean, manualValue: any, noEventSend: boolean)` | 77 | ✍ Point d'entrée pour synchroniser la dose de semis. Serveur : diffuse un nouvel ExtendedSowingMachineRateEvent aux clients (lié à l'objet) ; client : l'envoie au serveur. Ne fait rien si noEventSend vaut true. |

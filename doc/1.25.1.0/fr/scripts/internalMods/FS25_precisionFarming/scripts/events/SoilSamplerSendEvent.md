# internalMods/FS25_precisionFarming/scripts/events/SoilSamplerSendEvent.lua

*[English version](../../../../../../scripts/internalMods/FS25_precisionFarming/scripts/events/SoilSamplerSendEvent.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/events/SoilSamplerSendEvent.lua` — FS25 1.25.1.0

✍ Événement réseau (sous-classe de Event) qui ordonne à un véhicule préleveur de sol d'envoyer ses échantillons prélevés à l'analyse. Synchronisé entre clients et serveur par le schéma habituel de rediffusion.

- **SoilSamplerSendEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SoilSamplerSendEvent.emptyNew() → table` | 14 | ✍ Crée une instance vide de SoilSamplerSendEvent avec la métatable Event ; la couche réseau l'appelle avant que readStream ne remplisse les champs. |
| `SoilSamplerSendEvent.new(object: table)` | 22 | ✍ Crée l'événement pour un objet préleveur de sol. |
| `SoilSamplerSendEvent:readStream(streamId: integer, connection: Connection)` | 32 | ✍ Lit la référence de l'objet réseau, puis appelle run. |
| `SoilSamplerSendEvent:writeStream(streamId: integer, connection: Connection)` | 41 | ✍ Écrit la référence de l'objet réseau. |
| `SoilSamplerSendEvent:run(connection: Connection)` | 48 | ✍ Côté réception. Sur le serveur, il rediffuse d'abord l'événement aux autres clients (pas à l'expéditeur) ; puis, si l'objet cible existe et est synchronisé, il applique le changement localement sans renvoyer d'événement. Il appelle object:sendTakenSoilSamples(true). |
| `SoilSamplerSendEvent.sendEvent(object: table, noEventSend: boolean)` | 62 | ✍ Point d'entrée pour synchroniser l'envoi des échantillons de sol prélevés. Serveur : diffuse un nouvel SoilSamplerSendEvent aux clients (lié à l'objet) ; client : l'envoie au serveur. Ne fait rien si noEventSend vaut true. |

# internalMods/FS25_precisionFarming/scripts/events/SoilSamplerStartEvent.lua

*[English version](../../../../../../scripts/internalMods/FS25_precisionFarming/scripts/events/SoilSamplerStartEvent.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/events/SoilSamplerStartEvent.lua` — FS25 1.25.1.0

✍ Événement réseau (sous-classe de Event) qui ordonne à un véhicule préleveur de sol de démarrer un prélèvement. Synchronisé entre clients et serveur par le schéma habituel de rediffusion.

- **SoilSamplerStartEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SoilSamplerStartEvent.emptyNew() → table` | 14 | ✍ Crée une instance vide de SoilSamplerStartEvent avec la métatable Event ; la couche réseau l'appelle avant que readStream ne remplisse les champs. |
| `SoilSamplerStartEvent.new(object: table)` | 22 | ✍ Crée l'événement pour un objet préleveur de sol. |
| `SoilSamplerStartEvent:readStream(streamId: integer, connection: Connection)` | 32 | ✍ Lit la référence de l'objet réseau, puis appelle run. |
| `SoilSamplerStartEvent:writeStream(streamId: integer, connection: Connection)` | 41 | ✍ Écrit la référence de l'objet réseau. |
| `SoilSamplerStartEvent:run(connection: Connection)` | 48 | ✍ Côté réception. Sur le serveur, il rediffuse d'abord l'événement aux autres clients (pas à l'expéditeur) ; puis, si l'objet cible existe et est synchronisé, il applique le changement localement sans renvoyer d'événement. Il appelle object:startSoilSampling(true). |
| `SoilSamplerStartEvent.sendEvent(object: table, noEventSend: boolean)` | 62 | ✍ Point d'entrée pour synchroniser le démarrage du prélèvement de sol. Serveur : diffuse un nouvel SoilSamplerStartEvent aux clients (lié à l'objet) ; client : l'envoie au serveur. Ne fait rien si noEventSend vaut true. |

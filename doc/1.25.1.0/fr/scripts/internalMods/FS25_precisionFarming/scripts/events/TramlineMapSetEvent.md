# internalMods/FS25_precisionFarming/scripts/events/TramlineMapSetEvent.lua

*[English version](../../../../../../scripts/internalMods/FS25_precisionFarming/scripts/events/TramlineMapSetEvent.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/events/TramlineMapSetEvent.lua` — FS25 1.25.1.0

✍ Événement réseau (sous-classe de Event) qui synchronise une modification de jalonnement sur une parcelle : largeur de travail, direction, espacement, indicateur d'activation et effacement ou non de la culture. Les clients l'envoient au serveur, qui le rediffuse.

- **TramlineMapSetEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `TramlineMapSetEvent.emptyNew() → table` | 14 | ✍ Crée une instance vide de TramlineMapSetEvent avec la métatable Event ; la couche réseau l'appelle avant que readStream ne remplisse les champs. |
| `TramlineMapSetEvent.new(farmlandId: table, workingWidth: any, workDirection: any, spacing: any, enabled: any, clearFruit: any)` | 22 | ✍ Crée l'événement avec l'id de parcelle, la largeur de travail, la direction de travail, l'espacement, l'indicateur d'activation et l'indicateur clearFruit. |
| `TramlineMapSetEvent:readStream(streamId: integer, connection: Connection)` | 38 | ✍ Lit l'id de parcelle, trois flottants 32 bits et deux booléens (enabled, clearFruit), puis appelle run. |
| `TramlineMapSetEvent:writeStream(streamId: integer, connection: Connection)` | 53 | ✍ Écrit les mêmes champs dans le même ordre que readStream. |
| `TramlineMapSetEvent:run(connection: Connection)` | 65 | ✍ Côté réception. Le serveur rediffuse aux autres clients, puis chaque côté appelle tramlineMap:setFarmlandTramlines(...) avec noEventSend, si la carte de jalonnement existe. |
| `TramlineMapSetEvent.sendEvent(farmlandId: table, workingWidth: boolean, workDirection: any, spacing: any, enabled: any, clearFruit: any, noEventSend: boolean)` | 81 | ✍ Point d'entrée pour synchroniser une modification de jalonnement. Serveur : diffuse un nouveau TramlineMapSetEvent à tous les clients ; client : l'envoie au serveur. Ne fait rien si noEventSend vaut true. |

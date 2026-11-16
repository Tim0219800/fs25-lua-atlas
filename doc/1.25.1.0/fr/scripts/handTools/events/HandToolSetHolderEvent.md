# handTools/events/HandToolSetHolderEvent.lua

*[English version](../../../../scripts/handTools/events/HandToolSetHolderEvent.md)*

Source: `dataS/scripts/handTools/events/HandToolSetHolderEvent.lua` — FS25 1.25.1.0

✍ Événement réseau qui change le holder d'un outil à main (un joueur ou un `HandToolHolder`) ou l'efface. Un client l'envoie au serveur, qui le rediffuse ; après application, il publie la classe d'événement sur le message center.

- **HandToolSetHolderEvent** hérite de `Event` (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `HandToolSetHolderEvent.emptyNew() → table` | 18 | ✍ Crée une instance d'événement vide que la couche réseau remplira dans `readStream`. |
| `HandToolSetHolderEvent.new(handTool: any, holder: any)` | 25 | ✍ Crée l'événement pour un outil à main et un holder (nil pour l'effacer) ; `hasHolder` est vrai quand un holder est fourni. |
| `HandToolSetHolderEvent:readStream(streamId: integer, connection: Connection)` | 39 | ✍ Lit l'outil à main, un booléen indiquant la présence d'un holder, et le holder le cas échéant, puis exécute l'événement. |
| `HandToolSetHolderEvent:writeStream(streamId: integer, connection: Connection)` | 54 | ✍ Écrit l'outil à main, un booléen de présence et, s'il y a un holder, le holder, sous forme d'objets-noeuds. |
| `HandToolSetHolderEvent:run(connection: Connection)` | 64 | ✍ Si le serveur le reçoit, le rediffuse. Quand l'outil est synchronisé et que le holder a pu être résolu (ou qu'aucun n'a été envoyé), appelle `setHolder(holder, true)`. Publie toujours `HandToolSetHolderEvent` sur `g_messageCenter`. |
| `HandToolSetHolderEvent.sendEvent(handTool: table, holder: table, noEventSend: boolean)` | 83 | ✍ Aide, sauf si `noEventSend` est vrai : un serveur diffuse l'événement à tous les clients, un client l'envoie au serveur. |

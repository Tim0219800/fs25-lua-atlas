# handTools/events/FlashlightToggleLightEvent.lua

*[English version](../../../../scripts/handTools/events/FlashlightToggleLightEvent.md)*

Source: `dataS/scripts/handTools/events/FlashlightToggleLightEvent.lua` — FS25 1.25.1.0

✍ Événement réseau qui synchronise l'état allumé/éteint d'un outil à main lampe torche. Un client l'envoie au serveur, qui le rediffuse aux autres ; un serveur appelle `sendEvent` pour diffuser directement.

- **FlashlightToggleLightEvent** hérite de `Event` (l.4)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FlashlightToggleLightEvent.emptyNew() → table` | 11 | ✍ Crée une instance d'événement vide que la couche réseau remplira dans `readStream`. |
| `FlashlightToggleLightEvent.new(flashlight: HandTool, isActive: boolean) → table` | 21 | ✍ Crée l'événement pour un outil lampe torche et un booléen indiquant s'il est allumé. |
| `FlashlightToggleLightEvent:readStream(streamId: integer, connection: table)` | 34 | ✍ Lit la lampe torche (objet-noeud) et l'indicateur d'activation dans le flux, puis exécute l'événement. |
| `FlashlightToggleLightEvent:writeStream(streamId: integer, connection: table)` | 44 | ✍ Écrit la lampe torche comme objet-noeud et l'indicateur d'activation dans le flux. |
| `FlashlightToggleLightEvent:run(connection: table)` | 52 | ✍ Si le serveur le reçoit, le rediffuse aux autres clients. Quand la lampe existe et est synchronisée, appelle `setFlashlightIsActive(isActive, true)`. |
| `FlashlightToggleLightEvent.sendEvent(flashlight: any, isActive: any, noEventSend: any)` | 64 | ✍ Aide, sauf si `noEventSend` est vrai : un serveur diffuse l'événement à tous les clients, un client l'envoie au serveur. |

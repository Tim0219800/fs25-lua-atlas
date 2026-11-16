# vehicles/specializations/events/TreeDetachEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/TreeDetachEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/TreeDetachEvent.lua` — FS25 1.25.1.0

✍ Événement réseau qui synchronise le détachement d'un arbre d'un chariot ou d'un treuil forestier, éventuellement pour un indice de câble donné. Fait partie des événements des spécialisations de véhicule ; le récepteur n'agit que si l'objet cible est synchronisé.

- **TreeDetachEvent** hérite de `Event` (l.14)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `TreeDetachEvent.emptyNew() → table` | 21 | ✍ Crée une instance d'événement vide avec la métatable de l'événement, utilisée quand la couche réseau reçoit cet événement. |
| `TreeDetachEvent.new(object: table, ropeIndex: table) → table` | 31 | ✍ Construit l'événement avec les données à envoyer (un objet nœud et un indice de câble optionnel sur 4 bits) ; elles sont conservées sur l'instance pour `writeStream`. |
| `TreeDetachEvent:readStream(streamId: integer, connection: Connection)` | 43 | ✍ Lit un objet nœud et un indice de câble optionnel sur 4 bits depuis le flux, puis appelle `run(connection)`. |
| `TreeDetachEvent:writeStream(streamId: integer, connection: Connection)` | 57 | ✍ Écrit un objet nœud et un indice de câble optionnel sur 4 bits dans le flux (même ordre que `readStream`). |
| `TreeDetachEvent:run(connection: Connection)` | 68 | ✍ Applique l'événement côté récepteur : sur le serveur, se retransmet, puis appelle `detachTreeFromCarriage` ou `detachTreeFromWinch` avec l'indice de câble. |
| `TreeDetachEvent.sendEvent(vehicle: table, ropeIndex: boolean, noEventSend: boolean)` | 86 | ✍ Fonction utilitaire d'envoi : diffuse l'événement depuis le serveur, ou l'envoie au serveur quand elle est appelée sur un client. Ne fait rien si noEventSend est vrai. |

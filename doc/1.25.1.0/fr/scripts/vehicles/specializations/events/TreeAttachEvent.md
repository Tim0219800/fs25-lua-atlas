# vehicles/specializations/events/TreeAttachEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/TreeAttachEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/TreeAttachEvent.lua` — FS25 1.25.1.0

✍ Événement réseau qui synchronise la fixation d'un arbre (split shape) à un chariot ou un treuil forestier à une position monde, éventuellement pour un indice de câble donné. Fait partie des événements des spécialisations de véhicule ; le récepteur n'agit que si l'objet cible est synchronisé.

- **TreeAttachEvent** hérite de `Event` (l.14)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `TreeAttachEvent.emptyNew() → table` | 21 | ✍ Crée une instance d'événement vide avec la métatable de l'événement, utilisée quand la couche réseau reçoit cet événement. |
| `TreeAttachEvent.new(object: table, splitShapeId: table, x: any, y: any, z: any, ropeIndex: any) → table` | 31 | ✍ Construit l'événement avec les données à envoyer (un objet nœud, un identifiant de split shape, trois coordonnées float32 et un indice de câble optionnel sur 4 bits) ; elles sont conservées sur l'instance pour `writeStream`. |
| `TreeAttachEvent:readStream(streamId: integer, connection: Connection)` | 47 | ✍ Lit un objet nœud, un identifiant de split shape, trois coordonnées float32 et un indice de câble optionnel sur 4 bits depuis le flux, puis appelle `run(connection)`. |
| `TreeAttachEvent:writeStream(streamId: integer, connection: Connection)` | 65 | ✍ Écrit un objet nœud, un identifiant de split shape, trois coordonnées float32 et un indice de câble optionnel sur 4 bits dans le flux (même ordre que `readStream`). |
| `TreeAttachEvent:run(connection: Connection)` | 80 | ✍ Applique l'événement côté récepteur : appelle `attachTreeToCarriage` si l'objet l'a, sinon `attachTreeToWinch`, avec noEventSend. Il ne se retransmet pas ici. |
| `TreeAttachEvent.sendEvent(vehicle: table, splitShapeId: boolean, x: any, y: any, z: any, ropeIndex: any, noEventSend: boolean)` | 94 | ✍ Fonction utilitaire d'envoi : diffuse l'événement depuis le serveur, ou l'envoie au serveur quand elle est appelée sur un client. Ne fait rien si noEventSend est vrai. |

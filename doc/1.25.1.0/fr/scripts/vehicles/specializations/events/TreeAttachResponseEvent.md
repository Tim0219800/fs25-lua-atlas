# vehicles/specializations/events/TreeAttachResponseEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/TreeAttachResponseEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/TreeAttachResponseEvent.lua` — FS25 1.25.1.0

✍ Réponse serveur vers client à une demande de fixation d'arbre refusée. Elle contient un code de raison d'échec pour que le client affiche un avertissement. Fait partie des événements des spécialisations de véhicule ; le récepteur n'agit que si l'objet cible est synchronisé.

- **TreeAttachResponseEvent** hérite de `Event` (l.20)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `TreeAttachResponseEvent.emptyNew() → table` | 27 | ✍ Crée une instance d'événement vide avec la métatable de l'événement, utilisée quand la couche réseau reçoit cet événement. |
| `TreeAttachResponseEvent.new(object: table, failedReason: table, ropeIndex: any) → table` | 37 | ✍ Construit l'événement avec les données à envoyer (un objet nœud, une raison d'échec (TreeAttachResponseEvent.TREE_ATTACH_FAIL_REASON_NUM_BITS bits) et un indice de câble optionnel (3 bits)) ; elles sont conservées sur l'instance pour `writeStream`. |
| `TreeAttachResponseEvent:readStream(streamId: integer, connection: Connection)` | 50 | ✍ Lit un objet nœud, une raison d'échec (TreeAttachResponseEvent.TREE_ATTACH_FAIL_REASON_NUM_BITS bits) et un indice de câble optionnel (3 bits) depuis le flux, puis appelle `run(connection)`. |
| `TreeAttachResponseEvent:writeStream(streamId: integer, connection: Connection)` | 65 | ✍ Écrit un objet nœud, une raison d'échec (TreeAttachResponseEvent.TREE_ATTACH_FAIL_REASON_NUM_BITS bits) et un indice de câble optionnel (3 bits) dans le flux (même ordre que `readStream`). |
| `TreeAttachResponseEvent:run(connection: Connection)` | 77 | ✍ Applique l'événement côté récepteur : appelle `showCarriageTreeMountFailedWarning` ou `showWinchTreeMountFailedWarning` sur l'objet, selon celui qu'il possède. |

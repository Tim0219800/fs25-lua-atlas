# vehicles/specializations/events/TreeAttachRequestEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/TreeAttachRequestEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/TreeAttachRequestEvent.lua` — FS25 1.25.1.0

✍ Requête client vers serveur pour fixer un arbre à un chariot ou un treuil forestier. Le serveur vérifie l'autorisation puis fixe l'arbre ou répond par un TreeAttachResponseEvent contenant la raison de l'échec. Fait partie des événements des spécialisations de véhicule ; le récepteur n'agit que si l'objet cible est synchronisé.

- **TreeAttachRequestEvent** hérite de `Event` (l.14)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `TreeAttachRequestEvent.emptyNew() → table` | 21 | ✍ Crée une instance d'événement vide avec la métatable de l'événement, utilisée quand la couche réseau reçoit cet événement. |
| `TreeAttachRequestEvent.new(object: table, splitShapeId: table, x: any, y: any, z: any, ropeIndex: any, setupRope: any) → table` | 31 | ✍ Construit l'événement avec les données à envoyer (un objet nœud, un identifiant de split shape, trois coordonnées float32, un indice de câble optionnel (3 bits) et des données optionnelles de montage du câble (ForestryPhysicsRope)) ; elles sont conservées sur l'instance pour `writeStream`. |
| `TreeAttachRequestEvent:readStream(streamId: integer, connection: Connection)` | 48 | ✍ Lit un objet nœud, un identifiant de split shape, trois coordonnées float32, un indice de câble optionnel (3 bits) et des données optionnelles de montage du câble (ForestryPhysicsRope) depuis le flux, puis appelle `run(connection)`. |
| `TreeAttachRequestEvent:writeStream(streamId: integer, connection: Connection)` | 70 | ✍ Écrit un objet nœud, un identifiant de split shape, trois coordonnées float32, un indice de câble optionnel (3 bits) et des données optionnelles de montage du câble (ForestryPhysicsRope) dans le flux (même ordre que `readStream`). |
| `TreeAttachRequestEvent:run(connection: Connection)` | 89 | ✍ Applique l'événement côté récepteur : interroge `getIsCarriageTreeAttachAllowed` ou `getIsWinchTreeAttachAllowed` ; si autorisé il appelle `attachTreeToCarriage` ou `attachTreeToWinch`, sinon il envoie un TreeAttachResponseEvent uniquement à la connexion demandeuse. |

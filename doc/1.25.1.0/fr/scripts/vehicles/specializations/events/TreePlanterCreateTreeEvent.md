# vehicles/specializations/events/TreePlanterCreateTreeEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/TreePlanterCreateTreeEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/TreePlanterCreateTreeEvent.lua` — FS25 1.25.1.0

✍ Événement réseau qui déclenche la création d'un arbre sur une planteuse d'arbres chez tous les participants. Le constructeur accepte le type d'arbre et la variation, mais ils sont ignorés et non envoyés. Fait partie des événements des spécialisations de véhicule ; le récepteur n'agit que si l'objet cible est synchronisé.

- **TreePlanterCreateTreeEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `TreePlanterCreateTreeEvent.emptyNew() → table` | 14 | ✍ Crée une instance d'événement vide avec la métatable de l'événement, utilisée quand la couche réseau reçoit cet événement. |
| `TreePlanterCreateTreeEvent.new(object: table, treeTypeIndex: integer, treeVariationIndex: any)` | 23 | ✍ Construit l'événement avec les données à envoyer (uniquement l'objet nœud) ; elles sont conservées sur l'instance pour `writeStream`. |
| `TreePlanterCreateTreeEvent:readStream(streamId: integer, connection: Connection)` | 33 | ✍ Lit uniquement l'objet nœud depuis le flux, puis appelle `run(connection)`. |
| `TreePlanterCreateTreeEvent:writeStream(streamId: integer, connection: Connection)` | 42 | ✍ Écrit uniquement l'objet nœud dans le flux (même ordre que `readStream`). |
| `TreePlanterCreateTreeEvent:run(connection: Connection)` | 49 | ✍ Applique l'événement côté récepteur : sur le serveur, se retransmet, puis appelle `createTree(true)` sur l'objet s'il est synchronisé. |
| `TreePlanterCreateTreeEvent.sendEvent(object: table, noEventSend: boolean)` | 64 | ✍ Fonction utilitaire d'envoi : diffuse l'événement depuis le serveur, ou l'envoie au serveur quand elle est appelée sur un client. Ne fait rien si noEventSend est vrai. |

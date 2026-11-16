# vehicles/specializations/events/TreePlanterTreeTypeEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/TreePlanterTreeTypeEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/TreePlanterTreeTypeEvent.lua` — FS25 1.25.1.0

✍ Événement réseau qui synchronise le type d'arbre et la variation sélectionnés d'une planteuse d'arbres. La variation vaut 1 à l'écriture si elle est nil. Fait partie des événements des spécialisations de véhicule ; le récepteur n'agit que si l'objet cible est synchronisé.

- **TreePlanterTreeTypeEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `TreePlanterTreeTypeEvent.emptyNew() → table` | 14 | ✍ Crée une instance d'événement vide avec la métatable de l'événement, utilisée quand la couche réseau reçoit cet événement. |
| `TreePlanterTreeTypeEvent.new(object: table, treeTypeIndex: integer, treeVariationIndex: any)` | 23 | ✍ Construit l'événement avec les données à envoyer (un objet nœud, un indice de type d'arbre sur 32 bits et un indice de variation (TreePlantManager.VARIATION_NUM_BITS bits)) ; elles sont conservées sur l'instance pour `writeStream`. |
| `TreePlanterTreeTypeEvent:readStream(streamId: integer, connection: Connection)` | 35 | ✍ Lit un objet nœud, un indice de type d'arbre sur 32 bits et un indice de variation (TreePlantManager.VARIATION_NUM_BITS bits) depuis le flux, puis appelle `run(connection)`. |
| `TreePlanterTreeTypeEvent:writeStream(streamId: integer, connection: Connection)` | 47 | ✍ Écrit un objet nœud, un indice de type d'arbre sur 32 bits et un indice de variation (TreePlantManager.VARIATION_NUM_BITS bits) dans le flux (même ordre que `readStream`). |
| `TreePlanterTreeTypeEvent:run(connection: Connection)` | 56 | ✍ Applique l'événement côté récepteur : sur le serveur, se retransmet, puis appelle `setTreePlanterTreeTypeIndex(type, variation, true)` sur l'objet s'il est synchronisé. |
| `TreePlanterTreeTypeEvent.sendEvent(object: table, treeTypeIndex: integer, treeVariationIndex: boolean, noEventSend: boolean)` | 71 | ✍ Fonction utilitaire d'envoi : diffuse l'événement depuis le serveur, ou l'envoie au serveur quand elle est appelée sur un client. Ne fait rien si noEventSend est vrai. |

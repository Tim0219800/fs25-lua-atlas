# vehicles/specializations/events/TreePlanterLoadPalletEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/TreePlanterLoadPalletEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/TreePlanterLoadPalletEvent.lua` — FS25 1.25.1.0

✍ Événement réseau qui synchronise le chargement d'une palette de plants sur une planteuse d'arbres, la palette étant identifiée par son identifiant d'objet réseau. Fait partie des événements des spécialisations de véhicule ; le récepteur n'agit que si l'objet cible est synchronisé.

- **TreePlanterLoadPalletEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `TreePlanterLoadPalletEvent.emptyNew() → table` | 14 | ✍ Crée une instance d'événement vide avec la métatable de l'événement, utilisée quand la couche réseau reçoit cet événement. |
| `TreePlanterLoadPalletEvent.new(object: table, palletObjectId: integer)` | 23 | ✍ Construit l'événement avec les données à envoyer (un objet nœud et un identifiant d'objet réseau de palette) ; elles sont conservées sur l'instance pour `writeStream`. |
| `TreePlanterLoadPalletEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Lit un objet nœud et un identifiant d'objet réseau de palette depuis le flux, puis appelle `run(connection)`. |
| `TreePlanterLoadPalletEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Écrit un objet nœud et un identifiant d'objet réseau de palette dans le flux (même ordre que `readStream`). |
| `TreePlanterLoadPalletEvent:run(connection: Connection)` | 52 | ✍ Applique l'événement côté récepteur : sur le serveur, se retransmet, puis appelle `loadPallet(idPalette, true)` sur l'objet s'il est synchronisé. |
| `TreePlanterLoadPalletEvent.sendEvent(object: table, palletObjectId: integer, noEventSend: boolean)` | 67 | ✍ Fonction utilitaire d'envoi : diffuse l'événement depuis le serveur, ou l'envoie au serveur quand elle est appelée sur un client. Ne fait rien si noEventSend est vrai. |

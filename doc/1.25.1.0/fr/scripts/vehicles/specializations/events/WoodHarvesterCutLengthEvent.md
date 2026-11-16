# vehicles/specializations/events/WoodHarvesterCutLengthEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/WoodHarvesterCutLengthEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/WoodHarvesterCutLengthEvent.lua` — FS25 1.25.1.0

✍ Événement réseau qui synchronise l'indice de longueur de coupe sélectionné d'une abatteuse entre serveur et clients. Fait partie des événements des spécialisations de véhicule ; le récepteur n'agit que si l'objet cible est synchronisé.

- **WoodHarvesterCutLengthEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `WoodHarvesterCutLengthEvent.emptyNew() → table` | 14 | ✍ Crée une instance d'événement vide avec la métatable de l'événement, utilisée quand la couche réseau reçoit cet événement. |
| `WoodHarvesterCutLengthEvent.new(object: table, index: number)` | 23 | ✍ Construit l'événement avec les données à envoyer (un objet nœud et un indice de longueur de coupe (WoodHarvester.NUM_BITS_CUT_LENGTH bits)) ; elles sont conservées sur l'instance pour `writeStream`. |
| `WoodHarvesterCutLengthEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Lit un objet nœud et un indice de longueur de coupe (WoodHarvester.NUM_BITS_CUT_LENGTH bits) depuis le flux, puis appelle `run(connection)`. |
| `WoodHarvesterCutLengthEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Écrit un objet nœud et un indice de longueur de coupe (WoodHarvester.NUM_BITS_CUT_LENGTH bits) dans le flux (même ordre que `readStream`). |
| `WoodHarvesterCutLengthEvent:run(connection: Connection)` | 52 | ✍ Applique l'événement côté récepteur : sur le serveur, se retransmet, puis appelle `setWoodHarvesterCutLengthIndex(indice, true)` sur l'objet s'il est synchronisé. |
| `WoodHarvesterCutLengthEvent.sendEvent(object: table, index: number, noEventSend: boolean)` | 67 | ✍ Fonction utilitaire d'envoi : diffuse l'événement depuis le serveur, ou l'envoie au serveur quand elle est appelée sur un client. Ne fait rien si noEventSend est vrai. |

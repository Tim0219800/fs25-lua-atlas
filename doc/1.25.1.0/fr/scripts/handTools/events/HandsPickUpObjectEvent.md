# handTools/events/HandsPickUpObjectEvent.lua

*[English version](../../../../scripts/handTools/events/HandsPickUpObjectEvent.md)*

Source: `dataS/scripts/handTools/events/HandsPickUpObjectEvent.lua` — FS25 1.25.1.0

✍ Événement réseau pour l'outil à main « mains » qui ramasse un objet ou un split shape (tronc). Un client envoie la demande au serveur ; le serveur exécute `pickUpTarget` et rediffuse aux clients, et répond par `HandsPickUpFailedEvent` en cas d'échec. Les cibles sont envoyées sous forme de distance compressée plus un identifiant de split shape ou un objet-noeud.

- **HandsPickUpObjectEvent** hérite de `Event` (l.4)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `HandsPickUpObjectEvent.emptyNew() → table` | 11 | ✍ Crée une instance d'événement vide que la couche réseau remplira dans `readStream`. |
| `HandsPickUpObjectEvent.new(hands: HandTool, target: table) → table` | 21 | ✍ Crée l'événement pour un outil mains et une table cible (avec `node` et `distance`). |
| `HandsPickUpObjectEvent:readStream(streamId: integer, connection: table)` | 34 | ✍ Lit les mains, la distance de ramassage (compressée de 0 à `HandToolHands.PICKUP_DISTANCE`, 10 bits), un indicateur de split shape, puis un identifiant de split shape ou un objet-noeud pour reconstruire `target.node`. Journalise une erreur si la forme ou l'objet est introuvable. Puis exécute l'événement. |
| `HandsPickUpObjectEvent:writeStream(streamId: integer, connection: table)` | 70 | ✍ Écrit les mains, la distance compressée, un indicateur de split shape puis l'identifiant du split shape ou l'objet-noeud de la cible ; journalise une erreur si la cible n'est ni l'un ni l'autre. |
| `HandsPickUpObjectEvent:run(connection: table)` | 99 | ✍ Si le serveur le reçoit, le rediffuse (filtré sur l'objet cible, ou sur les mains si la cible est un split shape). Quand les mains sont synchronisées, appelle `pickUpTarget(target, true)` ; en cas d'échec sur le serveur, renvoie `HandsPickUpFailedEvent` au demandeur. |
| `HandsPickUpObjectEvent.sendEvent(hands: HandTool, target: table, noEventSend: boolean?)` | 123 | ✍ Aide, sauf si `noEventSend` est vrai : un serveur diffuse l'événement (avec le même filtrage par objet fantôme que `run`), un client l'envoie au serveur. |
| `HandsPickUpObjectEvent.getTargetGhostObject(target: table?) → table?` | 146 | ✍ Renvoie l'objet réseau du noeud cible, utilisé comme filtre de diffusion, ou nil si la cible est absente, 0 ou un split shape (qui n'a pas d'objet réseau). |

# handTools/events/HandsPickUpFailedEvent.lua

*[English version](../../../../scripts/handTools/events/HandsPickUpFailedEvent.md)*

Source: `dataS/scripts/handTools/events/HandsPickUpFailedEvent.lua` — FS25 1.25.1.0

✍ Événement réseau serveur vers client indiquant à un client que son outil à main (les mains) n'a pas pu ramasser l'objet demandé. Il n'est autorisé que dans le sens serveur vers client (assertion dans `run`).

- **HandsPickUpFailedEvent** hérite de `Event` (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `HandsPickUpFailedEvent.emptyNew() → table` | 18 | ✍ Crée une instance d'événement vide que la couche réseau remplira dans `readStream`. |
| `HandsPickUpFailedEvent.new(hands: any)` | 26 | ✍ Crée l'événement pour l'outil à main (mains) donné. |
| `HandsPickUpFailedEvent:readStream(streamId: integer, connection: Connection)` | 38 | ✍ Lit les mains (objet-noeud) dans le flux, puis exécute l'événement. |
| `HandsPickUpFailedEvent:writeStream(streamId: integer, connection: Connection)` | 49 | ✍ Écrit les mains comme objet-noeud dans le flux. |
| `HandsPickUpFailedEvent:run(connection: Connection)` | 56 | ✍ Vérifie par assertion qu'il vient du serveur ; si les mains existent et sont synchronisées, appelle `pickupFailed()` dessus. |

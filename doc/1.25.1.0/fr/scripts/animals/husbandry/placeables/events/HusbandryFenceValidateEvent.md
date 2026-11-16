# animals/husbandry/placeables/events/HusbandryFenceValidateEvent.lua

*[English version](../../../../../../scripts/animals/husbandry/placeables/events/HusbandryFenceValidateEvent.md)*

Source: `dataS/scripts/animals/husbandry/placeables/events/HusbandryFenceValidateEvent.lua` — FS25 1.25.1.0

✍ Paire requête/réponse pour valider la clôture d'un élevage. Un client envoie le placeable au serveur, qui tente de finaliser la clôture et répond par un booléen de réussite que le client publie sur le message center.

- **HusbandryFenceValidateEvent** hérite de `Event` (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `HusbandryFenceValidateEvent.emptyNew()` | 17 | ✍ Crée une instance d'événement vide que la couche réseau remplira dans `readStream`. |
| `HusbandryFenceValidateEvent.new(placeable: any)` | 24 | ✍ Crée la requête client vers serveur contenant le placeable à valider. À noter : `run` appelle aussi `HusbandryFenceValidateEvent.newServerToClient`, qui n'est pas définie dans ce fichier (NON VÉRIFIÉ, absente du dump ou bug). |
| `HusbandryFenceValidateEvent:readStream(streamId: any, connection: any)` | 42 | ✍ Si l'émetteur est un client, lit l'objet-noeud du placeable ; si c'est le serveur, lit le booléen de réussite. Puis exécute l'événement. |
| `HusbandryFenceValidateEvent:writeStream(streamId: any, connection: any)` | 54 | ✍ Sur une connexion client vers serveur, écrit l'objet-noeud du placeable ; sinon écrit `self.success` comme booléen. |
| `HusbandryFenceValidateEvent:run(connection: any)` | 64 | ✍ Client : publie `HusbandryFenceValidateEvent` avec la valeur de réussite sur `g_messageCenter`. Serveur : appelle `tryFinalizeFence()` sur le placeable et renvoie le résultat à la connexion demandeuse. |

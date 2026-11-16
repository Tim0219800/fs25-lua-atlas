# animals/husbandry/placeables/events/HusbandryCancelCreationEvent.lua

*[English version](../../../../../../scripts/animals/husbandry/placeables/events/HusbandryCancelCreationEvent.md)*

Source: `dataS/scripts/animals/husbandry/placeables/events/HusbandryCancelCreationEvent.lua` — FS25 1.25.1.0

✍ Événement réseau envoyé par un client au serveur quand le joueur annule l'étape de création de l'élevage ; le serveur crée alors le placeable sans prairie. Il ne va que du client vers le serveur : `run` vérifie par assertion qu'il ne vient pas d'une connexion serveur.

- **HusbandryCancelCreationEvent** hérite de `Event` (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `HusbandryCancelCreationEvent.emptyNew()` | 17 | ✍ Crée une instance d'événement vide que la couche réseau remplira dans `readStream`. |
| `HusbandryCancelCreationEvent.new(placeableId: any)` | 24 | ✍ Crée l'événement et range la valeur donnée dans `placeableId`, que `writeStream` enverra comme identifiant d'objet-noeud. À noter : l'appelant doit fournir un identifiant (NON VÉRIFIÉ, aucun appelant dans ce fichier). |
| `HusbandryCancelCreationEvent:readStream(streamId: any, connection: any)` | 34 | ✍ Lit un identifiant d'objet-noeud dans le flux, le range dans `self.placeable`, puis exécute aussitôt l'événement. À noter : `readNodeObjectId` est utilisé, donc `self.placeable` est un objet ou un simple identifiant selon cette fonction (NON VÉRIFIÉ, absente du dump). |
| `HusbandryCancelCreationEvent:writeStream(streamId: any, connection: any)` | 42 | ✍ Écrit `self.placeableId` dans le flux avec `NetworkUtil.writeNodeObjectId`. |
| `HusbandryCancelCreationEvent:run(connection: any)` | 48 | ✍ Côté serveur : si le placeable existe et possède `createMeadow`, appelle `createMeadow(false)` pour terminer la création sans prairie, comme si la boîte de dialogue avait été fermée. Vérifie par assertion que l'événement vient d'un client. |

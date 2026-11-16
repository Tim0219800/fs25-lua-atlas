# ship/ferry/FerryStartEvent.lua

*[English version](../../../../scripts/ship/ferry/FerryStartEvent.md)*

Source: `dataS/scripts/ship/ferry/FerryStartEvent.lua` — FS25 1.25.1.0

✍ Événement réseau pour démarrer un ferry. Le client demande, le serveur exécute `ferry:start(connection)` et répond avec un code d'erreur ; le client appelle alors `onStarted` ou `onStartFailed`. La classe `Ferry` et ses constantes `ERROR_*` ne sont pas dans ce fichier (NON VÉRIFIÉ). À noter : le commentaire de doc parle de stations de lavage, apparemment copié.

- **FerryStartEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FerryStartEvent.emptyNew() → table` | 14 | ✍ Crée un événement vide, utilisé lors de la lecture d'un flux. |
| `FerryStartEvent.new(ferry: table) → table` | 23 | ✍ Crée l'événement pour le ferry donné. Le code d'erreur n'est pas défini ici ; le serveur doit renseigner `errorCode` avant d'envoyer sa réponse. |
| `FerryStartEvent:readStream(streamId: integer, connection: Connection)` | 40 | ✍ Lit l'objet node du ferry et, côté client, aussi le code d'erreur (`Ferry.ERROR_SEND_NUM_BITS` bits), puis appelle `run`. |
| `FerryStartEvent:writeStream(streamId: integer, connection: Connection)` | 54 | ✍ Écrit l'objet node du ferry ; quand l'envoi vient du serveur, écrit aussi `errorCode`. |
| `FerryStartEvent:run(connection: Connection)` | 65 | ✍ Serveur : appelle `ferry:start(connection)`. Client : appelle `ferry:onStarted()` pour `Ferry.ERROR_SUCCESS`, sinon `ferry:onStartFailed(errorCode)`. |

# construction/events/OrchardBuildCancelEvent.lua

*[English version](../../../../scripts/construction/events/OrchardBuildCancelEvent.md)*

Source: `dataS/scripts/construction/events/OrchardBuildCancelEvent.lua` — FS25 1.25.1.0

✍ Événement réseau envoyé par un client pour demander au serveur d'arrêter une construction de verger en cours, identifiée par un id de requête (un octet). Il passe sur le canal principal et n'agit que côté serveur, qui transmet à `g_currentMission.orchardBuildManager:cancelRequest`. La classe du manager n'est pas dans le dump, son comportement est NON VÉRIFIÉ.

- **OrchardBuildCancelEvent** hérite de `Event` (l.17)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `OrchardBuildCancelEvent.emptyNew() → OrchardBuildCancelEvent` | 24 | ✍ Crée un événement vide sur le canal réseau principal, utilisé lors de la lecture d'un flux. |
| `OrchardBuildCancelEvent.new(requestId: integer) → OrchardBuildCancelEvent` | 34 | ✍ Crée une demande d'annulation pour l'id de construction donné. |
| `OrchardBuildCancelEvent:readStream(streamId: integer, connection: Connection)` | 46 | ✍ Lit l'id de requête (UInt8) puis appelle aussitôt `run`. Exécuté sur le serveur à l'arrivée d'une demande client. |
| `OrchardBuildCancelEvent:writeStream(streamId: integer, connection: Connection)` | 56 | ✍ Écrit l'id de requête en UInt8. Utilisé par le client à l'envoi. |
| `OrchardBuildCancelEvent:run(connection: Connection)` | 63 | ✍ Serveur uniquement : sort tôt si la connexion mène à un serveur ou si la mission n'a pas d'`orchardBuildManager` ; sinon demande au manager d'annuler la requête de cette connexion. |

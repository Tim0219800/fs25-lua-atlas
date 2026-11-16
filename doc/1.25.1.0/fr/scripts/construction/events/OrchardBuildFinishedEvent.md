# construction/events/OrchardBuildFinishedEvent.lua

*[English version](../../../../scripts/construction/events/OrchardBuildFinishedEvent.md)*

Source: `dataS/scripts/construction/events/OrchardBuildFinishedEvent.lua` — FS25 1.25.1.0

✍ Événement réseau envoyé du serveur au client demandeur pour clore une construction de verger et rapporter le résultat sous forme de code d'état et de nombre d'étapes terminées. Côté client il publie un message via `g_messageCenter`. La table `STATUS` et la constante `STATUS_NUM_BITS` sont référencées mais absentes du dump, leurs valeurs sont NON VÉRIFIÉ.

- **OrchardBuildFinishedEvent** hérite de `Event` (l.17)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `OrchardBuildFinishedEvent.emptyNew() → OrchardBuildFinishedEvent` | 39 | ✍ Crée un événement vide sur le canal réseau principal, utilisé lors de la lecture d'un flux. |
| `OrchardBuildFinishedEvent.new(requestId: integer, statusCode: integer, builtSteps: integer) → OrchardBuildFinishedEvent` | 51 | ✍ Crée la réponse avec l'id de construction, un code d'état et le nombre d'étapes de construction terminées. |
| `OrchardBuildFinishedEvent:readStream(streamId: integer, connection: Connection)` | 65 | ✍ Côté client : lit l'id de requête (UInt8), l'état (UIntN de `STATUS_NUM_BITS` bits) et les étapes construites (UInt16), puis appelle `run`. |
| `OrchardBuildFinishedEvent:writeStream(streamId: integer, connection: Connection)` | 77 | ✍ Côté serveur : écrit l'id de requête, l'état et les étapes construites dans la même disposition que celle attendue par `readStream`. |
| `OrchardBuildFinishedEvent:run(connection: Connection)` | 86 | ✍ Publie `OrchardBuildFinishedEvent` sur `g_messageCenter` avec l'id de requête, le code d'état et les étapes construites ; les abonnés (interface, hors dump) y réagissent. |

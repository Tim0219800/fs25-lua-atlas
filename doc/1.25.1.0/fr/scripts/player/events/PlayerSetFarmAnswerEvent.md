# player/events/PlayerSetFarmAnswerEvent.lua

*[English version](../../../../scripts/player/events/PlayerSetFarmAnswerEvent.md)*

Source: `dataS/scripts/player/events/PlayerSetFarmAnswerEvent.lua` — FS25 1.25.1.0

✍ Réponse serveur vers client à un `PlayerSetFarmEvent`. Elle contient un état de résultat (table `STATE`, définie ailleurs, p. ex. OK ou PASSWORD_REQUIRED), l'identifiant de la ferme et, en cas de succès, le mot de passe utilisé. Côté client, elle est republiée via le message center.

- **PlayerSetFarmAnswerEvent** hérite de `Event` (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlayerSetFarmAnswerEvent.emptyNew() → table` | 28 | ✍ Crée une instance d'événement vide pour la lecture depuis un flux. |
| `PlayerSetFarmAnswerEvent.new(answerState: integer, farmId: integer, password: string?) → table` | 39 | ✍ Construit une réponse avec l'état, l'identifiant de ferme et le mot de passe optionnel utilisé dans la requête. |
| `PlayerSetFarmAnswerEvent:writeStream(streamId: integer, connection: table)` | 53 | ✍ Écrit l'état et l'identifiant de ferme sous forme d'entiers à largeur fixe. Le mot de passe n'est écrit (derrière un booléen) que si l'état est OK et qu'un mot de passe existe. |
| `PlayerSetFarmAnswerEvent:readStream(streamId: integer, connection: table)` | 68 | ✍ Lit l'état, l'identifiant de ferme et le mot de passe optionnel, puis exécute l'événement. |
| `PlayerSetFarmAnswerEvent:run(connection: table)` | 82 | ✍ Client uniquement : pour OK ou PASSWORD_REQUIRED, publie le message `PlayerSetFarmAnswerEvent` sur `g_messageCenter` (le mot de passe n'est transmis que pour OK). Sur le serveur, seul un avertissement de développement est journalisé. |

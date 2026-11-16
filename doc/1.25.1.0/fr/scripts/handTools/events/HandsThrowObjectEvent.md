# handTools/events/HandsThrowObjectEvent.lua

*[English version](../../../../scripts/handTools/events/HandsThrowObjectEvent.md)*

Source: `dataS/scripts/handTools/events/HandsThrowObjectEvent.lua` — FS25 1.25.1.0

✍ Événement réseau qui indique aux autres machines que les mains d'un joueur ont lâché l'objet tenu, soit simplement posé, soit lancé avec une direction et une force. Le client du joueur propriétaire l'envoie au serveur, qui le rediffuse aux autres clients. L'effet est appliqué via la spécialisation HandToolHands de l'objet « mains » référencé.

- **HandsThrowObjectEvent** hérite de `Event` (l.4)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `HandsThrowObjectEvent.emptyNew() → table` | 14 | ✍ Crée une instance d'événement vide, utilisée par la couche réseau avant que `readStream` ne la remplisse. |
| `HandsThrowObjectEvent:readStream(streamId: integer, connection: table)` | 44 | ✍ Lit l'objet « mains », puis un indicateur précisant s'il s'agit d'un lancer. Dans ce cas, lit une direction compressée (3 composantes entre -1 et 1) et un coefficient de force (0 à 1), puis appelle `run`. |
| `HandsThrowObjectEvent:writeStream(streamId: integer, connection: table)` | 66 | ✍ Écrit l'objet « mains » et l'indicateur de lancer ; la direction et le coefficient de force ne sont écrits que si l'indicateur est actif. Les nombres de bits de compression viennent de constantes de la classe définies ailleurs. |
| `HandsThrowObjectEvent:run(connection: table)` | 84 | ✍ Applique l'événement. Sur le serveur, il le rediffuse d'abord aux autres clients. Sans lancer, appelle `dropHeldItem(true)` ; avec lancer, appelle `throwHeldItemWithForceVector` en désactivant l'envoi d'événement, ce qui évite une boucle. |

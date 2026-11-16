# fence/FenceNewSegmentEvent.lua

*[English version](../../../scripts/fence/FenceNewSegmentEvent.md)*

Source: `dataS/scripts/fence/FenceNewSegmentEvent.lua` — FS25 1.25.1.0

✍ Requête client vers serveur pour construire un nouveau segment de clôture, avec une réponse serveur vers client donnant un code de statut, l'identifiant du segment et la position de fin. Le serveur revalide, facture la ferme, finalise le segment et diffuse un FenceSegmentEvent. Les codes de statut viennent de FenceNewSegmentEvent.STATUS_CODE, non défini dans ce fichier (NON VÉRIFIÉ).

- **FenceNewSegmentEvent** hérite de `Event` (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FenceNewSegmentEvent.emptyNew() → table` | 20 | ✍ Crée un événement vide sur le canal réseau principal. Les constructeurs `new`/`newServerToClient` appelés dans run ne sont pas définis dans ce fichier (provenance NON VÉRIFIÉE). |
| `FenceNewSegmentEvent:readStream(streamId: integer, connection: Connection)` | 50 | ✍ Côté serveur : lit le placeable, l'index de modèle et les données du segment, construit le segment et appelle run. Côté client : lit le code de statut, l'identifiant du segment et la position de fin (3 flottants) et les publie sur le message center. |
| `FenceNewSegmentEvent:writeStream(streamId: integer, connection: Connection)` | 75 | ✍ Client vers serveur : écrit le placeable, l'index de modèle et les données du segment. Serveur vers client : écrit le code de statut, l'identifiant du segment et la position de fin en trois flottants. |
| `FenceNewSegmentEvent:run(connection: Connection)` | 96 | ✍ Autorité serveur : met à jour les maillages, vérifie la restriction optionnelle getCanBeBuilt, débite le prix du segment à la ferme du joueur (achat de propriété), le finalise, diffuse un FenceSegmentEvent et répond avec le statut et la position de fin (ou publie localement pour une connexion locale). |

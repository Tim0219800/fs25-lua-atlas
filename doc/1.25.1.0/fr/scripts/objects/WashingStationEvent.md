# objects/WashingStationEvent.lua

*[English version](../../../scripts/objects/WashingStationEvent.md)*

Source: `dataS/scripts/objects/WashingStationEvent.lua` — FS25 1.25.1.0

✍ Événement réseau envoyé par un client pour demander au serveur de lancer un lavage à une station. Le serveur retrouve la ferme de l'expéditeur via la connexion et appelle `startWashing` avec son identifiant.

- **WashingStationEvent** hérite de `Event` (l.6)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `WashingStationEvent.emptyNew() → table` | 13 | ✍ Crée une instance d'événement vide, utilisée lors de la lecture depuis un flux. |
| `WashingStationEvent.new(washingStation: table) → table` | 22 | ✍ Crée un événement contenant la station de lavage à démarrer. |
| `WashingStationEvent:readStream(streamId: integer, connection: Connection)` | 32 | ✍ Lit l'objet noeud de la station depuis le flux lorsqu'il est reçu côté serveur (expéditeur client), puis exécute l'événement. |
| `WashingStationEvent:writeStream(streamId: integer, connection: Connection)` | 43 | ✍ Écrit l'objet noeud de la station dans le flux, uniquement pour un envoi du client vers le serveur. |
| `WashingStationEvent:run(connection: Connection)` | 52 | ✍ Côté serveur uniquement : retrouve l'utilisateur et la ferme de la connexion et appelle `startWashing(farmId)` sur la station. Ne fait rien si l'utilisateur ou la ferme est inconnu. |

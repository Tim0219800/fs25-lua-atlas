# vehicles/VehicleAttachEvent.lua

*[English version](../../../scripts/vehicles/VehicleAttachEvent.md)*

Source: `dataS/scripts/vehicles/VehicleAttachEvent.lua` — FS25 1.25.1.0

✍ Événement réseau envoyé par le serveur pour signaler aux clients qu'un outil a été attelé à un véhicule. Il transporte les deux objets, les deux indices d'articulation (7 bits chacun) et l'indicateur de démarrage en position basse. Sous-classe de `Event` ; à la réception il appelle `attachImplement` sans renvoyer d'événement.

- **VehicleAttachEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `VehicleAttachEvent.emptyNew() → table` | 14 | ✍ Crée une instance d'événement vide, utilisée quand l'événement est reconstruit depuis un flux réseau. |
| `VehicleAttachEvent.new(vehicle: table, implement: table, inputJointIndex: integer, jointIndex: integer, startLowered: boolean) → table` | 27 | ✍ Construit l'événement à partir du véhicule, de l'outil, des deux indices d'articulation et de l'indicateur de position basse. Vérifie par `assert` que `jointIndex` est entre 0 et 126 (envoi sur 7 bits). |
| `VehicleAttachEvent:readStream(streamId: integer, connection: Connection)` | 42 | ✍ Lit le véhicule, l'outil, les indices d'articulation et l'indicateur de position basse depuis le flux, puis appelle aussitôt `run`. |
| `VehicleAttachEvent:writeStream(streamId: integer, connection: Connection)` | 55 | ✍ Écrit dans le flux les objets véhicule et outil, les deux indices d'articulation sur 7 bits et l'indicateur de position basse. |
| `VehicleAttachEvent:run(connection: Connection)` | 66 | ✍ Si le véhicule est synchronisé, attelle localement l'outil (sans renvoyer d'événement) ; journalise une erreur si l'outil est inconnu. Reçu par le serveur, l'événement est rediffusé aux autres clients. |

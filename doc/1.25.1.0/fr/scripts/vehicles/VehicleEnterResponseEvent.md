# vehicles/VehicleEnterResponseEvent.lua

*[English version](../../../scripts/vehicles/VehicleEnterResponseEvent.md)*

Source: `dataS/scripts/vehicles/VehicleEnterResponseEvent.lua` — FS25 1.25.1.0

✍ Événement réseau envoyé par le serveur en réponse à une demande d'entrée dans un véhicule. Il indique à chaque machine quel utilisateur est monté dans quel véhicule, avec le style du joueur, la ferme et un indicateur `isOwner`. À la réception il appelle `onEnterVehicle` sur le joueur concerné. Envoyé sur le canal principal.

- **VehicleEnterResponseEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `VehicleEnterResponseEvent.emptyNew() → table` | 14 | ✍ Crée une instance d'événement vide sur le canal réseau principal. |
| `VehicleEnterResponseEvent.new(id: table, isOwner: boolean, playerStyle: table, farmId: integer, userId: integer) → VehicleEnterResponseEvent` | 27 | ✍ Construit la réponse à partir de l'identifiant d'objet du véhicule, de `isOwner`, `playerStyle`, `farmId` et `userId`. |
| `VehicleEnterResponseEvent:readStream(streamId: integer, connection: Connection)` | 43 | ✍ Lit l'identifiant d'objet, l'indicateur propriétaire, le style du joueur (crée un `PlayerStyle` si besoin), la ferme et l'utilisateur, puis appelle `run`. |
| `VehicleEnterResponseEvent:writeStream(streamId: integer, connection: Connection)` | 62 | ✍ Écrit dans le flux l'identifiant d'objet, l'indicateur propriétaire, le style du joueur, la ferme et l'utilisateur. |
| `VehicleEnterResponseEvent:run(connection: Connection)` | 76 | ✍ Retrouve le véhicule et le joueur par identifiant d'utilisateur ; abandonne avec un avertissement de développement si l'un manque ou si le véhicule n'est pas synchronisé. Sinon appelle `player:onEnterVehicle(vehicle)`. L'indicateur `isOwner` n'est pas utilisé ici. |

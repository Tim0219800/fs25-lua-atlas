# vehicles/VehicleEnterRequestEvent.lua

*[English version](../../../scripts/vehicles/VehicleEnterRequestEvent.md)*

Source: `dataS/scripts/vehicles/VehicleEnterRequestEvent.lua` — FS25 1.25.1.0

✍ Événement réseau qu'un client envoie au serveur pour demander à monter dans un véhicule, avec le style du joueur, l'identifiant de ferme et un indicateur de forçage. Le serveur valide la demande, enregistre le contrôleur (connexion propriétaire, ferme, utilisateur) et répond par `VehicleEnterResponseEvent`. Envoyé sur le canal principal.

- **VehicleEnterRequestEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `VehicleEnterRequestEvent.emptyNew() → table` | 14 | ✍ Crée une instance d'événement vide sur le canal réseau principal. |
| `VehicleEnterRequestEvent.new(object: table, playerStyle: table, farmId: integer, force: boolean?) → VehicleEnterRequestEvent` | 26 | ✍ Construit la demande à partir du véhicule, de `playerStyle`, `farmId` et de `force` optionnel (faux par défaut) ; stocke aussi l'identifiant réseau du véhicule. |
| `VehicleEnterRequestEvent:writeStream(streamId: integer, connection: Connection)` | 40 | ✍ Écrit l'identifiant réseau du véhicule, l'identifiant de ferme, le style du joueur et l'indicateur de forçage. |
| `VehicleEnterRequestEvent:readStream(streamId: integer, connection: Connection)` | 52 | ✍ Lit l'identifiant d'objet, la ferme, le style du joueur (crée un `PlayerStyle` si besoin) et l'indicateur de forçage, retrouve le véhicule puis appelle `run`. |
| `VehicleEnterRequestEvent:run(connection: Connection)` | 70 | ✍ Côté serveur : ignore la demande si le véhicule n'est pas synchronisé, pas encore un objet fantôme pour cette connexion (sauf forçage), sans `spec_enterable` ou déjà contrôlé. Sinon définit connexion propriétaire, ferme et utilisateur, puis envoie `VehicleEnterResponseEvent` au demandeur (propriétaire) et en diffuse un aux autres. |

# vehicles/specializations/events/VehiclePlayerStyleChangedEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/VehiclePlayerStyleChangedEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/VehiclePlayerStyleChangedEvent.lua` — FS25 1.25.1.0

✍ Événement réseau servant à synchroniser le style du joueur (apparence du personnage) affiché dans un véhicule. Les données sont appliquées directement à la lecture, donc `run` est vide. Fait partie des événements des spécialisations de véhicule ; le récepteur n'agit que si l'objet cible est synchronisé.

- **VehiclePlayerStyleChangedEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `VehiclePlayerStyleChangedEvent.emptyNew() → table` | 14 | ✍ Crée une instance d'événement vide avec la métatable de l'événement, utilisée quand la couche réseau reçoit cet événement. |
| `VehiclePlayerStyleChangedEvent.new(vehicle: table, playerStyle: table) → table` | 24 | ✍ Construit l'événement avec les données à envoyer (un objet nœud suivi d'un PlayerStyle sérialisé) ; elles sont conservées sur l'instance pour `writeStream`. |
| `VehiclePlayerStyleChangedEvent:readStream(streamId: integer, connection: Connection)` | 37 | ✍ Lit un objet nœud suivi d'un PlayerStyle sérialisé depuis le flux et l'applique directement si l'objet est synchronisé ; n'appelle pas `run`. |
| `VehiclePlayerStyleChangedEvent:writeStream(streamId: integer, connection: Connection)` | 53 | ✍ Écrit un objet nœud suivi d'un PlayerStyle sérialisé dans le flux (même ordre que `readStream`). |
| `VehiclePlayerStyleChangedEvent:run(connection: Connection)` | 61 | ✍ Applique l'événement côté récepteur : vide ; le travail est fait dans `readStream`. |

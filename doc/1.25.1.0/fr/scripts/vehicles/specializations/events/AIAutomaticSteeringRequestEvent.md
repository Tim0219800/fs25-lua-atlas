# vehicles/specializations/events/AIAutomaticSteeringRequestEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/AIAutomaticSteeringRequestEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/AIAutomaticSteeringRequestEvent.lua` — FS25 1.25.1.0

✍ Événement réseau demandant la génération d'un parcours de champ de guidage automatique pour un véhicule à une position de champ avec des réglages donnés. Le traitement appelle directement `generateSteeringFieldCourse` du véhicule.

- **AIAutomaticSteeringRequestEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIAutomaticSteeringRequestEvent.emptyNew() → table` | 14 | ✍ Crée une instance d'événement vide avec la métatable de la classe ; utilisée par la couche réseau avant que `readStream` ne la remplisse. |
| `AIAutomaticSteeringRequestEvent.new(vehicle: table, x: integer, z: any, fieldCourseSettings: any)` | 23 | ✍ Crée une demande pour un véhicule avec une position de champ (x, z) et les réglages de parcours de champ à utiliser. |
| `AIAutomaticSteeringRequestEvent:readStream(streamId: integer, connection: Connection)` | 36 | ✍ Lit le véhicule, une position en pixel de détail du terrain via `g_fieldCourseManager` et les attributs `FieldCourseSettings`, construit l'objet de réglages, puis appelle `run`. |
| `AIAutomaticSteeringRequestEvent:writeStream(streamId: integer, connection: Connection)` | 52 | ✍ Écrit le véhicule, la position en pixel du terrain et les réglages de parcours de champ. |
| `AIAutomaticSteeringRequestEvent:run(connection: Connection)` | 62 | ✍ Si le véhicule est synchronisé, appelle `generateSteeringFieldCourse(x, z, settings)` sur lui. Prévu pour le côté récepteur (vraisemblablement le serveur ; NON VÉRIFIÉ, aucun contrôle de côté ici). |

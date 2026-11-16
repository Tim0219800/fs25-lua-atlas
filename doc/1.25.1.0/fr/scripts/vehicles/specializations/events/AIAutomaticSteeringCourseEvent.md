# vehicles/specializations/events/AIAutomaticSteeringCourseEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/AIAutomaticSteeringCourseEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/AIAutomaticSteeringCourseEvent.lua` — FS25 1.25.1.0

✍ Événement réseau qui synchronise entre serveur et clients le parcours de champ du guidage automatique d'un véhicule (défini ou effacé). L'application se fait dans `readStream` ; `run` est vide. Il n'a pas d'aide `sendEvent` : l'émetteur le construit et le diffuse lui-même. Utilise `SteeringFieldCourse` (défini ailleurs, NON VÉRIFIÉ).

- **AIAutomaticSteeringCourseEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIAutomaticSteeringCourseEvent.emptyNew() → table` | 14 | ✍ Crée une instance d'événement vide avec la métatable de la classe ; utilisée par la couche réseau avant que `readStream` ne la remplisse. |
| `AIAutomaticSteeringCourseEvent.new(vehicle: table, steeringFieldCourse: integer)` | 23 | ✍ Crée l'événement portant un véhicule et son parcours de champ de guidage (peut être nil pour l'effacer). |
| `AIAutomaticSteeringCourseEvent:readStream(streamId: integer, connection: Connection)` | 35 | ✍ Lit le véhicule, efface d'abord son parcours de guidage automatique, puis si un parcours est présent le lit de façon asynchrone (`SteeringFieldCourse.readStream`) et l'applique avec `setAIAutomaticSteeringCourse`, uniquement si le véhicule est synchronisé. |
| `AIAutomaticSteeringCourseEvent:writeStream(streamId: integer, connection: Connection)` | 56 | ✍ Écrit la référence du véhicule, un indicateur de présence et, s'il existe, le parcours de champ de guidage. |
| `AIAutomaticSteeringCourseEvent:run(connection: Connection)` | 67 | ✍ Vide ; tout le travail est fait dans `readStream`. |

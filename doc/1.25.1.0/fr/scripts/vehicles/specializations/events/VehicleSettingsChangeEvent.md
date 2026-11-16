# vehicles/specializations/events/VehicleSettingsChangeEvent.lua

*[English version](../../../../../scripts/vehicles/specializations/events/VehicleSettingsChangeEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/VehicleSettingsChangeEvent.lua` — FS25 1.25.1.0

✍ Événement réseau qui envoie les réglages de véhicule modifiés (dirty) sous forme de liste indice plus valeur booléenne ou sur 8 bits. `run` est vide : les réglages sont appliqués à la lecture. Fait partie des événements des spécialisations de véhicule ; le récepteur n'agit que si l'objet cible est synchronisé.

- **VehicleSettingsChangeEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `VehicleSettingsChangeEvent.emptyNew() → table` | 14 | ✍ Crée une instance d'événement vide avec la métatable de l'événement, utilisée quand la couche réseau reçoit cet événement. |
| `VehicleSettingsChangeEvent.new(vehicle: table, settings: boolean, state: any)` | 23 | ✍ Construit l'événement avec les données à envoyer (un objet nœud, le nombre de réglages modifiés, puis pour chacun son indice, un indicateur booléen/entier et la valeur) ; elles sont conservées sur l'instance pour `writeStream`. |
| `VehicleSettingsChangeEvent:readStream(streamId: integer, connection: Connection)` | 35 | ✍ Lit un objet nœud, le nombre de réglages modifiés, puis pour chacun son indice, un indicateur booléen/entier et la valeur depuis le flux et l'applique directement si l'objet est synchronisé ; n'appelle pas `run`. |
| `VehicleSettingsChangeEvent:writeStream(streamId: integer, connection: Connection)` | 61 | ✍ Écrit un objet nœud, le nombre de réglages modifiés, puis pour chacun son indice, un indicateur booléen/entier et la valeur dans le flux (même ordre que `readStream`). |
| `VehicleSettingsChangeEvent:run(connection: Connection)` | 92 | ✍ Applique l'événement côté récepteur : vide ; les réglages sont appliqués dans `readStream` via `setVehicleSettingState(indice, état, true)`. |

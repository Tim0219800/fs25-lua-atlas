# vehicles/ai/AIDriveStrategyStonePicker.lua

*[English version](../../../../scripts/vehicles/ai/AIDriveStrategyStonePicker.md)*

Source: `dataS/scripts/vehicles/ai/AIDriveStrategyStonePicker.lua` — FS25 1.25.1.0

✍ Stratégie de conduite IA (sous-classe d'AIDriveStrategy) qui arrête l'assistant IA quand un ramasse-pierres est plein ou en cours de déchargement. Elle regroupe le véhicule et les outils IA attelés possédant la spécialisation StonePicker, affiche une notification de cuve pleine et démarre ou arrête le déchargement vers un objet cible.

- **AIDriveStrategyStonePicker** hérite de `AIDriveStrategy` (l.9)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIDriveStrategyStonePicker.new(reconstructionData: any, customMt: any)` | 13 | ✍ Constructeur. Crée la liste vide de ramasse-pierres et l'indicateur de notification de cuve pleine. |
| `AIDriveStrategyStonePicker:setAIVehicle(vehicle: any)` | 25 | ✍ Appelle la méthode parente, puis range le véhicule lui-même et chaque outil IA attelé possédant la spécialisation StonePicker. |
| `AIDriveStrategyStonePicker:update(dt: any)` | 40 | ✍ Surcharge vide, ne fait rien. |
| `AIDriveStrategyStonePicker:getDriveData(dt: any, vX: any, vY: any, vZ: any)` | 45 | ✍ Interdit d'avancer pendant un déchargement, tant que le basculement n'est pas fermé, ou quand le ramasse-pierres est plein. Une fois plein, notifie une fois et lance le déchargement si une cible existe ; le déchargement s'arrête sans cible ou cuve vide. Renvoie un arrêt (0, 1, true, 0, huge) ou seulement une vitesse illimitée. |
| `AIDriveStrategyStonePicker:updateDriving(dt: any)` | 108 | ✍ Surcharge vide, ne fait rien. |

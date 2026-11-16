# vehicles/ai/AIDriveStrategyCombine.lua

*[English version](../../../../scripts/vehicles/ai/AIDriveStrategyCombine.md)*

Source: `dataS/scripts/vehicles/ai/AIDriveStrategyCombine.lua` — FS25 1.25.1.0

✍ Stratégie de conduite IA (sous-classe d'AIDriveStrategy) qui supervise les moissonneuses-batteuses et ensileuses pendant le travail IA. Elle regroupe les véhicules avec la spécialisation Combine de l'arbre du véhicule racine, et gère l'état du tuyau, les gyrophares, les notifications de cuve pleine, le ralentissement près du plein et un mode d'attente de la paille en bout de champ. Elle fonctionne en complément de la stratégie de parcours de champ et ne renvoie via getDriveData qu'un forçage (arrêt, plafond de vitesse ou point cible).

- **AIDriveStrategyCombine** hérite de `AIDriveStrategy` (l.10)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIDriveStrategyCombine.new(reconstructionData: any, customMt: any)` | 14 | ✍ Constructeur. Initialise la liste des moissonneuses, les indicateurs de notification et de gyrophare, les seuils de ralentissement (niveau 200, vitesse de départ 20) et les variables du mode d'attente de la paille. |
| `AIDriveStrategyCombine:setAIVehicle(vehicle: any)` | 40 | ✍ Appelle la méthode parente, puis parcourt tous les véhicules enfants du véhicule racine et range dans self.combines ceux qui possèdent la spécialisation Combine. |
| `AIDriveStrategyCombine:update(dt: any)` | 52 | ✍ Pour les unités à tuyau dont la capacité de déchargement est infinie (ensileuses) et hors virage, choisit un type de remplissage forcé d'après la remorque la plus proche dans les triggers du tuyau, ou le retire si l'ensileuse contient déjà un type. Appelée à chaque frame. |
| `AIDriveStrategyCombine:getDriveData(dt: any, vX: any, vY: any, vZ: any)` | 89 | ✍ Logique principale. Les ensileuses attendent qu'une remorque soit à portée et que le tuyau la touche. Les moissonneuses-batteuses ouvrent ou replient le tuyau, allument les gyrophares et avertissent à 80 % de remplissage, affichent une notification de cuve pleine, ralentissent près de la capacité et s'arrêtent quand elles sont pleines ou en déchargement. Renvoie un arrêt, un plafond de vitesse ou un point cible (arrière ou retour). |
| `AIDriveStrategyCombine:updateDriving(dt: any)` | 354 | ✍ Surcharge vide, ne fait rien dans cette classe. |

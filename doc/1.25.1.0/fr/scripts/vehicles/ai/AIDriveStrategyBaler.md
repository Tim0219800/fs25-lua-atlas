# vehicles/ai/AIDriveStrategyBaler.lua

*[English version](../../../../scripts/vehicles/ai/AIDriveStrategyBaler.md)*

Source: `dataS/scripts/vehicles/ai/AIDriveStrategyBaler.lua` — FS25 1.25.1.0

✍ Stratégie de conduite IA (étend `AIDriveStrategy`) pour les presses. Elle rassemble le véhicule et les outils IA attelés ayant la spécialisation `Baler`, ralentit l'IA quand la chambre se remplit et l'arrête tant qu'une balle est pleine ou en éjection. Pour les presses à enchaînement continu, elle ne limite la vitesse que pendant la dépose sur plateforme.

- **AIDriveStrategyBaler** hérite de `AIDriveStrategy` (l.9)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIDriveStrategyBaler.new(reconstructionData: any, customMt: any)` | 13 | ✍ Constructeur ; initialise la liste des presses et les réglages de ralentissement (seuil de capacité libre 200, vitesse de départ 20). |
| `AIDriveStrategyBaler:setAIVehicle(vehicle: any)` | 26 | ✍ Appelle le parent, puis range dans la liste des presses le véhicule et ses outils IA attelés possédant la spécialisation `Baler`. |
| `AIDriveStrategyBaler:update(dt: any)` | 41 | ✍ Surcharge vide appelée à chaque image. |
| `AIDriveStrategyBaler:getDriveData(dt: any, vX: any, vY: any, vZ: any)` | 46 | ✍ Pour chaque presse, limite la vitesse à 2 km/h plus une part de la vitesse de départ quand la capacité libre est faible, et interdit d'avancer si elle est pleine ou en éjection. Retourne une demande d'arrêt (0, 1, true, 0, math.huge) si bloqué, sinon seulement une vitesse max. |
| `AIDriveStrategyBaler:updateDriving(dt: any)` | 90 | ✍ Surcharge vide. |

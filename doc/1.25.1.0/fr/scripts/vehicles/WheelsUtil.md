# vehicles/WheelsUtil.lua

*[English version](../../../scripts/vehicles/WheelsUtil.md)*

Source: `dataS/scripts/vehicles/WheelsUtil.lua` — FS25 1.25.1.0

✍ Table utilitaire pour la physique des roues et de la transmission. Elle enregistre des types de pneus avec des coefficients de frottement par type de sol (sec, humide, neige), convertit les informations de terrain en type de sol, et `updateWheelsPhysics` transforme la demande d'accélération du conducteur en pédales d'accélérateur et de frein pour piloter le moteur et les freins. Les constantes `WheelsUtil.tireTypes`, `NUM_GROUNDS`, `GROUND_*` et `SMOOTHING_SPEED_SCALE` sont définies hors des fonctions montrées (NON VÉRIFIÉ).

- **WheelsUtil** (l.10)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `WheelsUtil.registerTireType(name: string, frictionCoeffs: table, frictionCoeffsWet: table, frictionCoeffsSnow: any)` | 27 | ✍ Enregistre un type de pneu sous un nom en majuscules avec des tables de frottement sec, humide et neige. Les entrées manquantes sont reprises du type de sol précédent (la première vaut 1.15 par défaut ou la première valeur fournie). Avertit et ignore les doublons. |
| `WheelsUtil.unregisterTireType(name: any)` | 63 | ✍ Retire du registre le premier type de pneu portant ce nom, s'il existe. |
| `WheelsUtil.getTireType(name: string) → integer` | 77 | ✍ Retourne l'index d'un type de pneu dans le registre d'après son nom (insensible à la casse), ou nil. |
| `WheelsUtil.getTireTypeName(index: integer) → string` | 91 | ✍ Retourne le nom du type de pneu pour un index, ou la chaîne `unknown`. |
| `WheelsUtil.getSmoothedAcceleratorAndBrakePedals(self: any, acceleratorPedal: any, brakePedal: any, dt: any)` | 226 | ✍ Applique une rampe aux entrées d'accélérateur et de frein, en stockant les valeurs lissées sur le véhicule. Les pédales montent progressivement et redescendent à une vitesse dépendant de l'autre pédale ; retourne les valeurs appliquées. |
| `WheelsUtil.updateWheelsPhysics(self: number, dt: number, currentSpeed: number, acceleration: number, doHandbrake: boolean, stopAndGoBraking: boolean)` | 287 | ✍ Convertit l'accélération demandée en pédales avec gestion du sens de marche, des rapports, du freinage automatique à basse vitesse, du frein à main et de la limite de vitesse. Lève `onVehiclePhysicsUpdate`, puis appelle `controlVehicle` et `brake` sur le véhicule. La vitesse est signée, en m/ms. |
| `WheelsUtil.computeDifferentialRotSpeedNonMotor(self: any) → number` | 474 | ✍ Retourne la vitesse non motrice du différentiel : côté serveur, la moyenne de la vitesse d'axe fois le rayon des roues au contact du sol ; sinon la dernière vitesse réelle du véhicule fois 1000. |
| `WheelsUtil.getTireFriction(tireType: integer, groundType: integer, wetScale: number, snowScale: any) → number` | 503 | ✍ Retourne le frottement d'un type de pneu sur un type de sol : valeur sèche interpolée vers les valeurs humide et neige selon les échelles correspondantes. L'échelle de neige doit être fournie (nil provoquerait une erreur). |
| `WheelsUtil.getGroundType(isField: boolean, isRoad: boolean, depth: number) → integer` | 519 | ✍ Convertit les informations de terrain en type de sol : champ d'abord, puis route (indicateur ou profondeur sous 0.1), puis sol meuble au-delà de 0.8 de profondeur, sinon sol dur. |

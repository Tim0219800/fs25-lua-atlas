# vehicles/ai/AIDriveStrategyConveyor.lua

*[English version](../../../../scripts/vehicles/ai/AIDriveStrategyConveyor.md)*

Source: `dataS/scripts/vehicles/ai/AIDriveStrategyConveyor.lua` — FS25 1.25.1.0

✍ Stratégie de conduite IA (sous-classe d'AIDriveStrategy) qui fait avancer et reculer un véhicule disposant d'une définition aiConveyorBelt entre deux cibles du monde, en s'appuyant sur ses noeuds de roues. Destinée aux machines de type convoyeur qui balaient latéralement en se déplaçant ; elle utilise les champs vehicle.aiConveyorBelt (indices de roues, angle courant, vitesse).

- **AIDriveStrategyConveyor** hérite de `AIDriveStrategy` (l.8)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIDriveStrategyConveyor.new(reconstructionData: any, customMt: any)` | 12 | ✍ Constructeur, construit simplement l'objet à partir de la classe parente avec la métatable de la stratégie. |
| `AIDriveStrategyConveyor:setAIVehicle(vehicle: any)` | 20 | ✍ Appelle la méthode parente, puis, à partir des noeuds de roue arrière et centrale et de l'angle du convoyeur, calcule la distance à parcourir et deux cibles monde (gauche et droite). Réinitialise l'indice de cible et la distance parcourue. |
| `AIDriveStrategyConveyor:update(dt: any)` | 47 | ✍ Surcharge vide, ne fait rien. |
| `AIDriveStrategyConveyor:getDriveData(dt: any, vX: any, vY: any, vZ: any)` | 52 | ✍ Cumule la distance parcourue par la roue arrière et alterne entre les deux cibles (en inversant le sens) une fois la distance atteinte, la première fois en la doublant. Renvoie x, z de la cible, le sens et une vitesse modulée par un sinus de la progression (bornée de 0,1 à 0,5, puis doublée). |

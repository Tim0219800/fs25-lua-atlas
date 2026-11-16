# vehicles/specializations/Motorbike.lua

*[English version](../../../../scripts/vehicles/specializations/Motorbike.md)*

Source: `dataS/scripts/vehicles/specializations/Motorbike.lua` — FS25 1.25.1.0

✍ Spécialisation des motos. Elle exige AnimatedVehicle et Motorized. Elle incline un nœud dans les virages, joue une animation de pieds à basse vitesse et une animation de marche arrière, et réduit la plage de braquage à haute vitesse ; à la descente, une moto couchée est remise debout côté serveur.

- **Motorbike** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Motorbike.prerequisitesPresent(specializations: any)` | 15 | ✍ Retourne true seulement si le type de véhicule possède AnimatedVehicle et Motorized. |
| `Motorbike.initSpecialization()` | 21 | ✍ Enregistre les chemins XML sous vehicle.motorbike : inclinaison (node, maxTilt, idleTilt, backwardTilt, tiltSpeed), animations de pieds et de marche arrière, échelle et seuil de braquage à haute vitesse. |
| `Motorbike.registerFunctions(vehicleType: any)` | 46 | ✍ Vide : n'enregistre aucune nouvelle fonction de véhicule. |
| `Motorbike.registerOverwrittenFunctions(vehicleType: any)` | 51 | ✍ Vide : ne surcharge aucune fonction de véhicule. |
| `Motorbike.registerEventListeners(vehicleType: any)` | 56 | ✍ S'abonne aux événements de chargement, post-chargement, mise à jour et sortie du véhicule. |
| `Motorbike:onLoad(savegame: any)` | 65 | ✍ Lit les réglages XML d'inclinaison, d'animation et de braquage, convertit tiltSpeed par milliseconde, applique l'inclinaison au repos au nœud et mémorise la vitesse maximale en marche arrière du moteur. À noter : le nœud d'inclinaison est utilisé sans test nil. |
| `Motorbike:onPostLoad(savegame: any)` | 96 | ✍ Mémorise les limites de braquage d'origine du véhicule (minRotTime, maxRotTime, wheelSteeringDuration) comme référence pour la mise à l'échelle selon la vitesse. |
| `Motorbike:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 108 | ✍ À chaque image, déplace le nœud d'inclinaison vers une cible selon la vitesse et le braquage (valeurs de repos ou de marche arrière si lent ou en recul), bascule les animations de pieds et de marche arrière, et réduit les limites de braquage quand la vitesse augmente. |
| `Motorbike:onLeaveVehicle()` | 167 | ✍ Serveur uniquement : si l'axe vertical de la moto pointe surtout de côté ou vers le bas (Y inférieur à 0,5), elle est retirée de la physique puis replacée au même endroit en ne gardant que son cap, donc remise debout. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEventListener | `onLoad` | 57 |
| registerEventListener | `onPostLoad` | 58 |
| registerEventListener | `onUpdate` | 59 |
| registerEventListener | `onLeaveVehicle` | 60 |

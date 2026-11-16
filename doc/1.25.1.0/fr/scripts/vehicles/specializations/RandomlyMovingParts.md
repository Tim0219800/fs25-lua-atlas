# vehicles/specializations/RandomlyMovingParts.lua

*[English version](../../../../scripts/vehicles/specializations/RandomlyMovingParts.md)*

Source: `dataS/scripts/vehicles/specializations/RandomlyMovingParts.lua` — FS25 1.25.1.0

✍ Spécialisation de véhicule qui fait osciller des nœuds (rotation et/ou translation) de façon pseudo-aléatoire pendant le déplacement, par exemple des éléments de semoir qui sautillent sur le sol. Elle se configure sous vehicle.randomlyMovingParts dans le XML du véhicule, avec des préréglages pour la forme du bruit. Uniquement côté client à l'exécution : l'écouteur d'update est retiré s'il n'y a pas de client ou si aucune pièce n'est chargée. Peut dépendre d'un nœud de référence au sol d'une autre spécialisation.

- **RandomlyMovingParts** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `RandomlyMovingParts.prerequisitesPresent(specializations: table) → boolean` | 34 | ✍ Retourne toujours true : cette spécialisation n'exige aucune autre spécialisation. |
| `RandomlyMovingParts.initSpecialization()` | 40 | ✍ Enregistre dans le schéma XML du véhicule les entrées randomlyMovingParts : distance d'update max, nœud, vitesse, fondu, préréglage, bruit, secousses, rotation et translation, ainsi que les sous-nœuds qui suivent la même valeur. |
| `RandomlyMovingParts.registerFunctions(vehicleType: any)` | 97 | ✍ Enregistre loadRandomlyMovingPartFromXML, updateRandomlyMovingPart et getIsRandomlyMovingPartActive sur le type de véhicule. |
| `RandomlyMovingParts.registerEventListeners(vehicleType: any)` | 105 | ✍ Abonne la spécialisation aux événements de véhicule onLoad et onUpdate. |
| `RandomlyMovingParts:onLoad(savegame: table)` | 113 | ✍ Lit la distance d'update max et chaque entrée randomlyMovingPart du XML dans spec.nodes. Retire l'écouteur onUpdate si ce n'est pas un client ou si aucune pièce n'a été chargée. |
| `RandomlyMovingParts:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 137 | ✍ À chaque frame, si le véhicule est plus proche que la distance d'update max et que sa dernière vitesse dépasse 0,1, met à jour chaque pièce via updateRandomlyMovingPart. |
| `RandomlyMovingParts:loadRandomlyMovingPartFromXML(part: table, xmlFile: XMLFile, key: string) → boolean` | 154 | ✍ Charge une pièce : nœud, nœud de référence au sol optionnel (l'index commence à 0 dans la clé XML, 0 provoque un avertissement), échelle de vitesse avec variance aléatoire, temps de fondu, préréglage de bruit, secousses, limites de rotation et de translation et sous-nœuds liés. Retourne false si le nœud est inconnu ou sans axe. À noter : les attributs de rotation et de translation des sous-nœuds sont lus sur la clé de la pièce et non du sous-nœud, ce qui ressemble à un bug. |
| `RandomlyMovingParts:updateRandomlyMovingPart(part: table, dt: number) → boolean` | 328 | ✍ Fait avancer une pièce : calcule la vitesse (distance parcourue, ou dt si non dépendante de la vitesse), fait entrer ou sortir le poids en fondu selon l'activité, gère les secousses aléatoires, additionne trois sinusoïdes en un delta et l'applique à la pièce et à ses sous-nœuds via une fonction locale (updateNodeData, dont le corps n'est pas dans le dump). |
| `RandomlyMovingParts:getIsRandomlyMovingPartActive(part: table) → boolean` | 386 | ✍ Retourne true, ou, si la pièce a un nœud de référence au sol, l'état actif de ce nœud via getIsGroundReferenceNodeActive. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `loadRandomlyMovingPartFromXML` | 98 |
| registerFunction | `updateRandomlyMovingPart` | 99 |
| registerFunction | `getIsRandomlyMovingPartActive` | 100 |
| registerEventListener | `onLoad` | 106 |
| registerEventListener | `onUpdate` | 107 |

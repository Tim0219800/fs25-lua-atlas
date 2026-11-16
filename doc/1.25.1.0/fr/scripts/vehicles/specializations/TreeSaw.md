# vehicles/specializations/TreeSaw.lua

*[English version](../../../../scripts/vehicles/specializations/TreeSaw.md)*

Source: `dataS/scripts/vehicles/specializations/TreeSaw.lua` — FS25 1.25.1.0

✍ Spécialisation des scies montées sur véhicule qui coupent du bois sur pied ou à terre (à ne pas confondre avec la tronçonneuse portative). Une fois allumée, le serveur cherche une forme coupable au nœud de coupe configuré, attend un délai puis la coupe avec ChainsawUtil. Les clients jouent l'effet et les sons de coupe et reçoivent l'indicateur de coupe via le flux de mise à jour. Elle exige TurnOnVehicle ; EffectManager et les fonctions moteur de découpe ne sont pas dans le dump, leur comportement exact est NON VÉRIFIÉ.

- **TreeSaw** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `TreeSaw.prerequisitesPresent(specializations: table) → boolean` | 17 | ✍ Renvoie true seulement si le type de véhicule possède la spécialisation TurnOnVehicle. |
| `TreeSaw.initSpecialization()` | 23 | ✍ Enregistre les clés XML `vehicle.treeSaw` : sons de coupe et de scie, nœuds d'animation, effets, et nœud de coupe avec sa taille, les longueurs minimales au-dessus/au-dessous de la coupe et le délai de coupe en secondes. |
| `TreeSaw.registerEventListeners(vehicleType: any)` | 45 | ✍ S'abonne à onLoad, onDelete, aux flux de mise à jour, onUpdate, onUpdateTick, onDraw, onDeactivate, onTurnedOn et onTurnedOff. |
| `TreeSaw:onLoad(savegame: table)` | 61 | ✍ Charge les nœuds d'animation, effets et sons côté client, lit les paramètres du nœud de coupe (délai converti en millisecondes) et réinitialise l'état de coupe. |
| `TreeSaw:onDelete()` | 95 | ✍ Supprime les effets, échantillons sonores et nœuds d'animation. |
| `TreeSaw:onReadUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 107 | ✍ Client uniquement : lit l'indicateur `isCutting` envoyé par le serveur. |
| `TreeSaw:onWriteUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 119 | ✍ Serveur uniquement : écrit l'indicateur `isCutting` à chaque mise à jour, sans utiliser de masque dirty. |
| `TreeSaw:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 131 | ✍ Serveur : abandonne la cible si elle n'existe plus, décompte le minuteur de coupe et effectue la coupe via ChainsawUtil à 0. Client : joue l'effet de copeaux et le son de coupe tant que le minuteur tourne, les arrête sinon. |
| `TreeSaw:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 187 | ✍ Une fois allumée, cherche une forme coupable au nœud de coupe, vérifie l'accès au terrain de la ferme (sinon active un avertissement) et valide la cible : coupe réalisable, pas trop basse près de la base de l'arbre, et longueurs minimales restantes de part et d'autre. Démarre ou annule le minuteur de coupe en conséquence. |
| `TreeSaw:onDraw(isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 250 | ✍ Affiche le texte d'info « coupe en cours » pendant la coupe et un avertissement clignotant quand l'arbre se trouve sur un terrain inaccessible à la ferme. |
| `TreeSaw:onDeactivate()` | 264 | ✍ Efface la cible courante et annule le minuteur de coupe. |
| `TreeSaw:onTurnedOn()` | 273 | ✍ Client uniquement : démarre les nœuds d'animation et le son de la scie. |
| `TreeSaw:onTurnedOff()` | 283 | ✍ Efface la cible et annule le minuteur ; côté client, arrête aussi animations, effets et sons. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEventListener | `onLoad` | 46 |
| registerEventListener | `onDelete` | 47 |
| registerEventListener | `onReadUpdateStream` | 48 |
| registerEventListener | `onWriteUpdateStream` | 49 |
| registerEventListener | `onUpdate` | 50 |
| registerEventListener | `onUpdateTick` | 51 |
| registerEventListener | `onDraw` | 52 |
| registerEventListener | `onDeactivate` | 53 |
| registerEventListener | `onTurnedOn` | 54 |
| registerEventListener | `onTurnedOff` | 55 |

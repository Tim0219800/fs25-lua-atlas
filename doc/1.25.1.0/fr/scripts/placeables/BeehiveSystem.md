# placeables/BeehiveSystem.lua

*[English version](../../../scripts/placeables/BeehiveSystem.md)*

Source: `dataS/scripts/placeables/BeehiveSystem.lua` — FS25 1.25.1.0

✍ Gestionnaire au niveau mission des placeables de ruches : il garde les ruches triées par rayon d'action, les générateurs de palettes de miel par ferme et l'état global de production et d'effets (arrêt en hiver, la nuit ou sous la pluie). Il calcule l'influence cumulée des ruches à une position du monde (plafonnée à 1, utilisée pour le bonus de rendement), distribue le miel aux générateurs de palettes chaque heure côté serveur et avertit le propriétaire quand aucun générateur n'est disponible. Les méthodes des ruches comme `getHoneyAmountToSpawn` et `getBeehiveInfluenceFactor` sont dans la spécialisation du placeable (absente de ce fichier, NON VÉRIFIÉ).

- **BeehiveSystem** (l.14)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `BeehiveSystem.new(mission: any, customMt: any)` | 18 | ✍ Constructeur : mémorise la mission, initialise les listes de ruches et de générateurs vides, les états inactifs et les compteurs, et sur le serveur enregistre la commande console `gsBeehiveDebug` si les commandes de test sont actives. `COOLDOWN_DURATION` n'est pas défini dans ce fichier (NON VÉRIFIÉ). |
| `BeehiveSystem:delete()` | 45 | ✍ Retire la commande console `gsBeehiveDebug`. |
| `BeehiveSystem:addBeehive(beehiveToAdd: any)` | 51 | ✍ Ajoute une ruche : pour la première, met à jour l'état et s'abonne aux changements d'heure et de jour/nuit, affiche l'avertissement d'absence de générateur une fois la mission démarrée et retrie la liste par rayon d'action décroissant pour que les boucles d'influence s'arrêtent tôt. |
| `BeehiveSystem:removeBeehive(beehive: any)` | 71 | ✍ Retire une ruche et, quand la liste devient vide, se désabonne des messages d'heure et de jour/nuit. |
| `BeehiveSystem:onHourChanged()` | 83 | ✍ Gestionnaire du message horaire : met à jour la production de miel puis l'état des ruches. |
| `BeehiveSystem:update()` | 90 | ✍ Serveur uniquement, si des générateurs existent : après un délai compté en appels, met à jour un générateur de palettes par appel en tournant, puis relance le délai en fin de liste. |
| `BeehiveSystem:updateBeehivesOutput(farmId: integer?)` | 112 | ✍ Serveur uniquement : pour chaque ruche (filtrée éventuellement par ferme) ayant un générateur de palettes pour son propriétaire, ajoute la quantité de miel renvoyée par `getHoneyAmountToSpawn` au niveau de ce générateur. |
| `BeehiveSystem:updateState()` | 132 | ✍ Recalcule les drapeaux globaux : la production est active hors hiver, et les effets seulement si la production est active, que le soleil est levé et qu'il ne pleut pas. Utilise l'environnement de la mission (classe absente du dump, NON VÉRIFIÉ). |
| `BeehiveSystem:updateBeehivesState()` | 144 | ✍ Rafraîchit l'état global puis appelle `updateBeehiveState` sur chaque ruche. |
| `BeehiveSystem:getFarmHasBeehive(farmId: any)` | 154 | ✍ Renvoie true si la ferme possède au moins une ruche. |
| `BeehiveSystem:getBeehives()` | 166 | ✍ Renvoie la liste interne des ruches triée par rayon (pas une copie). |
| `BeehiveSystem:getBeehiveInfluenceFactorAt(wx: any, wz: any)` | 173 | ✍ Renvoie l'influence cumulée de toutes les ruches à la position monde (x, z), quelle que soit la ferme, avec arrêt anticipé et plafond à 1. Contient un affichage de texte réservé au debug. |
| `BeehiveSystem:addBeehivePalletSpawner(beehivePalletSpawner: any)` | 194 | ✍ Enregistre un générateur de palettes et met aussitôt à jour la production de miel de sa ferme propriétaire. |
| `BeehiveSystem:removeBeehivePalletSpawner(beehivePalletSpawner: any)` | 202 | ✍ Retire un générateur de palettes et affiche l'avertissement d'absence de générateur le concernant. |
| `BeehiveSystem:showNoSpawnerWarning(placeable: any)` | 210 | ✍ Côté client, au plus toutes les 5 secondes : si la ferme locale possède le placeable et des ruches mais aucun générateur de palettes, ajoute une notification critique en jeu sur l'absence d'emplacement de palettes. |
| `BeehiveSystem:getFarmBeehivePalletSpawner(farmId: any)` | 224 | ✍ Renvoie le générateur de palettes appartenant à la ferme donnée, ou nil. |
| `BeehiveSystem:consoleCommandBeehiveDebug()` | 235 | ✍ Commande console : bascule `BeehiveSystem.DEBUG_ENABLED` et renvoie sa nouvelle valeur sous forme de texte. |

## Messages

- s'abonne à `MessageType.HOUR_CHANGED` (l.55)
- s'abonne à `MessageType.DAY_NIGHT_CHANGED` (l.56)

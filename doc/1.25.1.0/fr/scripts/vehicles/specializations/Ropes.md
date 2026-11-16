# vehicles/specializations/Ropes.lua

*[English version](../../../../scripts/vehicles/specializations/Ropes.md)*

Source: `dataS/scripts/vehicles/specializations/Ropes.lua` — FS25 1.25.1.0

✍ Spécialisation pour les véhicules avec des cordes visuelles dessinées par un shader sur un nœud de base. Côté client, elle lit les entrées `vehicle.ropes.rope` et envoie à chaque frame des paramètres de shader (cv0, cv2, cv3, cv4) pour que la corde s'étire du nœud de base au nœud cible, avec des ajusteurs de paramètres optionnels pilotés par la rotation ou la translation d'un nœud. Aucun prérequis, et rien n'est fait sur un serveur dédié.

- **Ropes** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Ropes.prerequisitesPresent(specializations: table) → boolean` | 17 | ✍ Retourne toujours true : aucune autre spécialisation n'est requise. |
| `Ropes.initSpecialization()` | 23 | ✍ Déclare le schéma XML `vehicle.ropes.rope` : nœuds et paramètres de base/cible, ainsi que les enfants `baseParameterAdjuster` et `targetParameterAdjuster` (nœud, axe et plage de rotation ou translation, paramètres cibles min/max). |
| `Ropes.registerFunctions(vehicleType: any)` | 53 | ✍ Enregistre `loadAdjusterNode`, `updateRopes` et `updateAdjusterNodes` sur le type de véhicule. |
| `Ropes.registerEventListeners(vehicleType: any)` | 61 | ✍ S'abonne à onLoad, onLoadFinished et onPostUpdate. |
| `Ropes:onLoad(savegame: table)` | 70 | ✍ Client uniquement : lit chaque corde (en ignorant avec un avertissement celles sans paramètres de base/cible), fixe les paramètres de shader initiaux sur le nœud de base et charge les ajusteurs. Retire les écouteurs de fin de chargement et de post-update hors client ou sans corde chargée. À noter : les clés d'ajusteurs sont construites sans point (`ropeKey .. "baseParameterAdjuster"`), ce qui semble empêcher leur lecture. |
| `Ropes:onLoadFinished(savegame: table)` | 127 | ✍ Force un rafraîchissement complet des cordes en appelant `updateRopes(9999)` à la fin du chargement. |
| `Ropes:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 136 | ✍ Point d'entrée hérité conservé pour la compatibilité ; il appelle simplement `Ropes.onPostUpdate` (non enregistré comme écouteur dans ce fichier). |
| `Ropes:onPostUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 146 | ✍ Appelle `updateRopes(dt)` à chaque frame pour rafraîchir les paramètres de shader des cordes. |
| `Ropes:loadAdjusterNode(adjusterNode: any, xmlFile: any, key: any)` | 152 | ✍ Charge un ajusteur (nœud, axe et plage de rotation ou translation, paramètres cibles min/max). Retourne false avec un avertissement XML si le nœud ou l'un des jeux de paramètres min/max manque. |
| `Ropes:updateRopes(dt: any)` | 187 | ✍ Pour chaque corde, fixe les paramètres de shader cv0 (base plus décalage des ajusteurs), cv2, cv3 (position de la cible dans l'espace de la base) et cv4 (paramètres cibles plus décalage des ajusteurs dans l'espace de la base). L'argument `dt` n'est pas utilisé. |
| `Ropes:updateAdjusterNodes(adjusterNodes: any)` | 205 | ✍ Additionne les contributions d'une liste d'ajusteurs : chacun convertit la rotation ou translation de son nœud sur un axe en valeur 0..1 sur sa plage et interpole entre ses paramètres cibles min et max. Retourne la somme x, y, z. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `loadAdjusterNode` | 54 |
| registerFunction | `updateRopes` | 55 |
| registerFunction | `updateAdjusterNodes` | 56 |
| registerEventListener | `onLoad` | 62 |
| registerEventListener | `onLoadFinished` | 63 |
| registerEventListener | `onPostUpdate` | 64 |

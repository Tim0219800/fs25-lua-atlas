# handTools/specializations/HandToolBob.lua

*[English version](../../../../scripts/handTools/specializations/HandToolBob.md)*

Source: `dataS/scripts/handTools/specializations/HandToolBob.lua` — FS25 1.25.1.0

✍ Spécialisation d'outil à main qui ajoute un balancement procédural en vue à la première personne à des nœuds choisis de l'outil : un léger mouvement permanent à l'arrêt plus un balancement de marche proportionnel à la vitesse du joueur. Il n'est appliqué que pour le joueur local en première personne ; sinon le nœud revient à sa position de repos. Les nœuds se configurent sous `handTool.bob.node(?)` ; HandToolMotorized peut surcharger `updateBobNode` pour y ajouter ses vibrations.

- **HandToolBob** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `HandToolBob.registerXMLPaths(xmlSchema: table)` | 46 | ✍ Enregistre les entrées de schéma XML de `handTool.bob.node(?)` : nœud cible, amplitudes verticale et horizontale, fréquence, vitesse de référence et les trois paramètres d'inactivité, avec les constantes de la classe comme valeurs par défaut. |
| `HandToolBob.registerFunctions(handToolType: table)` | 62 | ✍ Enregistre sur le type d'outil à main les fonctions `getIsBobActive`, `updateBobNode` et `resetBobNode`. |
| `HandToolBob.registerEventListeners(handToolType: table)` | 71 | ✍ Abonne la spécialisation à `onLoad`, `onUpdate` et `onHeldEnd`. |
| `HandToolBob.prerequisitesPresent(specializations: table) → boolean` | 81 | ✍ Renvoie toujours true : cette spécialisation n'a aucun prérequis. |
| `HandToolBob:onLoad(xmlFile: table)` | 89 | ✍ Lit chaque entrée `handTool.bob.node`, résout son nœud (avertissement et saut s'il est introuvable), mémorise sa translation de repos et ses paramètres, puis initialise l'état de phase. La vitesse de référence est bornée à 0,0001 minimum. |
| `HandToolBob:onUpdate(dt: number)` | 128 | ✍ À chaque image, si l'outil a des nœuds de balancement, détermine si l'effet est actif et lit la vitesse graphique du joueur porteur, puis appelle `updateBobNode` pour chaque nœud. |
| `HandToolBob:onHeldEnd()` | 149 | ✍ Remet tous les nœuds à leur pose de repos quand l'outil n'est plus tenu, car `onUpdate` ne s'exécute plus alors. |
| `HandToolBob:getIsBobActive() → boolean` | 162 | ✍ Renvoie true uniquement si l'outil est tenu par le joueur local et que sa caméra est en première personne. |
| `HandToolBob:updateBobNode(bobNode: table, dt: number, isActive: boolean, speed: number)` | 184 | ✍ Fait avancer les phases d'inactivité et de marche d'un nœud, lisse le facteur de vitesse et place le nœud à sa position de repos plus des décalages sinusoïdaux en X et Y. Si inactif, il le réinitialise une fois. `speed` est en m/s. |
| `HandToolBob:resetBobNode(bobNode: table)` | 219 | ✍ Replace le nœud à sa translation de repos mémorisée et remet à zéro la phase, le facteur de vitesse, l'indicateur et les décalages. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `getIsBobActive` | 63 |
| registerFunction | `updateBobNode` | 64 |
| registerFunction | `resetBobNode` | 65 |
| registerEventListener | `onLoad` | 72 |
| registerEventListener | `onUpdate` | 73 |
| registerEventListener | `onHeldEnd` | 74 |

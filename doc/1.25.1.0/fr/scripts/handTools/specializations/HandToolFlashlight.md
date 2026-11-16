# handTools/specializations/HandToolFlashlight.lua

*[English version](../../../../scripts/handTools/specializations/HandToolFlashlight.md)*

Source: `dataS/scripts/handTools/specializations/HandToolFlashlight.lua` — FS25 1.25.1.0

✍ Spécialisation d'outil à main pour une lampe torche éclairant depuis un nœud de lumière. Ce nœud est relié au nœud racine pour ne pas être masqué avec l'outil, et repositionné à chaque image selon l'état tenu et la caméra (main, caméra première personne ou tête en troisième personne). L'allumage est synchronisé via FlashlightToggleLightEvent. Les clés XML sont sous `handTool.flashlight`.

- **HandToolFlashlight** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `HandToolFlashlight.registerXMLPaths(xmlSchema: any)` | 17 | ✍ Enregistre les entrées de schéma XML de `handTool.flashlight.light` (nœud, maillage auto-éclairé, distance, angle du cône, couleur, atténuation, profil IES) et le son d'allumage. |
| `HandToolFlashlight.registerFunctions(handToolType: any)` | 32 | ✍ Enregistre `setFlashlightIsActive` et `updateTransform` sur le type d'outil à main. |
| `HandToolFlashlight.registerEventListeners(handToolType: any)` | 39 | ✍ Abonne la spécialisation à `onLoad`, `onDelete`, `onUpdate` et `onHeldEnd`. |
| `HandToolFlashlight.prerequisitesPresent(specializations: any)` | 48 | ✍ Renvoie toujours true : aucun prérequis. |
| `HandToolFlashlight:onLoad(xmlFile: any)` | 54 | ✍ Résout les nœuds de lumière et de maillage, mémorise le décalage et l'axe avant de la lumière dans son parent, relie la lumière au nœud racine, applique portée, couleur, atténuation, angle de cône et profil IES éventuel, charge le son sur les clients et démarre éteinte. À noter : le parent et la translation du nœud de lumière sont lus avant le test de nullité de ce nœud. |
| `HandToolFlashlight:onDelete()` | 105 | ✍ Supprime le nœud de lumière (relié ailleurs, donc non libéré avec l'outil), les échantillons sonores et le nœud parent d'origine de la lumière. |
| `HandToolFlashlight:onUpdate(dt: any)` | 123 | ✍ À chaque image, met à jour la transformation de la lumière selon l'état tenu et garde l'objet actif via `raiseActive`. |
| `HandToolFlashlight:onHeldEnd()` | 130 | ✍ Éteint la lumière, sans envoyer d'événement, quand l'outil n'est plus tenu. |
| `HandToolFlashlight:setFlashlightIsActive(isActive: any, noEventSend: any)` | 136 | ✍ Définit l'état actif, change la visibilité des nœuds de lumière et de maillage, joue le son lors d'un changement (client) et envoie un FlashlightToggleLightEvent sauf si `noEventSend` est défini. |
| `HandToolFlashlight:updateTransform(isHeld: any)` | 160 | ✍ Positionne et oriente le nœud de lumière. Tenu : au décalage de lumière de l'outil. Non tenu : depuis la caméra première personne, sinon depuis la tête du modèle en troisième personne, dans l'axe du lacet sans inclinaison. Ne fait rien si des nœuds ou le joueur manquent. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `setFlashlightIsActive` | 33 |
| registerFunction | `updateTransform` | 34 |
| registerEventListener | `onLoad` | 40 |
| registerEventListener | `onDelete` | 41 |
| registerEventListener | `onUpdate` | 42 |
| registerEventListener | `onHeldEnd` | 43 |

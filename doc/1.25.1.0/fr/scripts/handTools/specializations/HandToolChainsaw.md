# handTools/specializations/HandToolChainsaw.lua

*[English version](../../../../scripts/handTools/specializations/HandToolChainsaw.md)*

Source: `dataS/scripts/handTools/specializations/HandToolChainsaw.lua` — FS25 1.25.1.0

✍ Spécialisation d'outil à main pour la tronçonneuse. Elle exige HandToolMotorized. Le joueur propriétaire vise un arbre (split shape) ; un anneau indique si la coupe est valide, et maintenir l'entrée d'activation tranche le tronc pendant une durée proportionnelle à sa section, puis le découpe (directement sur le serveur, ou via ChainsawCutEvent depuis un client). Sans arbre visé, elle monte en régime et ébranche, ce qui retire les attachements du split shape sur le serveur. L'état est synchronisé dans le flux de mise à jour. Les constantes (distances, seuils) sont définies ailleurs (valeurs NON VÉRIFIÉES).

- **HandToolChainsaw** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `HandToolChainsaw.registerXMLPaths(xmlSchema: any)` | 52 | ✍ Enregistre les clés XML `handTool.chainsaw` : préréglage de posture de travail, diamètres maximaux de coupe et d'ébranchage, durée de coupe par mètre carré, i3d de l'anneau, nœuds de coupe et de main, animation de chaîne, effets et sons de coupe. |
| `HandToolChainsaw.registerFunctions(handToolType: any)` | 70 | ✍ Enregistre sur le type d'outil à main les fonctions de plan de coupe, de test de validité, de coupe, d'ébranchage, d'état, d'animation, de plan de séparation et d'anneau de sélection. |
| `HandToolChainsaw.registerEventListeners(handToolType: any)` | 88 | ✍ Abonne la spécialisation au chargement, post-chargement, suppression, mise à jour, affichage, lecture/écriture du flux de mise à jour, début/fin de prise en main et enregistrement des actions. |
| `HandToolChainsaw.prerequisitesPresent(specializations: any)` | 103 | ✍ Renvoie true uniquement si HandToolMotorized fait partie des spécialisations. |
| `HandToolChainsaw:onLoad(xmlFile: any, baseDirectory: any)` | 109 | ✍ Crée au premier appel les paramètres de compression partagés, lit les limites, la durée de coupe (stockée en ms), les nœuds et l'i3d de l'anneau éventuel (chargement asynchrone), crée les nœuds de guidage, de rotation de caméra et de plan de séparation, et charge effets, animation de chaîne, sons et réticule sur les clients. Fixe `walkMultiplier` à 0,5. |
| `HandToolChainsaw:onPostLoad(savegame: any)` | 231 | ✍ Règle la vitesse de gain de régime du moteur pour atteindre le plein régime pendant le temps de démarrage, et la vitesse de perte à 1,2 fois celle-ci. |
| `HandToolChainsaw:onRingLoadFinished(ringNode: any, failedReason: any)` | 243 | ✍ Rappel de chargement asynchrone : termine la tâche de chargement, prend le premier enfant de l'i3d chargé comme anneau indicateur, le masque et le relie sous le nœud de rotation de caméra. Journalise une erreur en cas d'échec. |
| `HandToolChainsaw:onDelete()` | 263 | ✍ Libère l'i3d partagé de l'anneau, les animations, effets, sons, nœuds auxiliaires et le réticule, et retire ce type de cible du ciblage du joueur porteur. |
| `HandToolChainsaw:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 307 | ✍ Quand l'indicateur de modification est actif, écrit l'état de coupe (et l'indicateur vertical en coupe). D'un client vers le serveur pendant l'ébranchage, écrit position, normale et vecteur haut du plan compressés ; le serveur écrit si des attachements ont été retirés. |
| `HandToolChainsaw:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 337 | ✍ Lit l'état de coupe et l'applique sauf si le joueur local est propriétaire de l'outil. Le serveur lit les données du plan d'ébranchage ; un client lit l'indicateur d'attachement retiré et, pour le propriétaire, déclenche la durée de l'effet d'ébranchage. |
| `HandToolChainsaw:onUpdate(dt: any)` | 377 | ✍ Boucle principale. Pour le propriétaire : met à jour l'arbre visé, le plan de séparation, le roulis et l'orientation de l'outil, vérifie la validité de la coupe, met à jour le texte d'action et l'anneau, et exécute la coupe. En ébranchage, calcule le plan ; le serveur y retire les attachements du split shape. Les clients démarrent ou arrêtent effets, sons et animation de chaîne. |
| `HandToolChainsaw:onDraw()` | 524 | ✍ Affiche le réticule uniquement au repos. |
| `HandToolChainsaw:onHeldStart()` | 534 | ✍ Pour le propriétaire, ajoute un type de cible arbre avec un filtre sur les maillages split shape ; pour les autres, réinitialise le nœud graphique. Applique le préréglage de posture et l'indicateur de tronçonneuse au joueur porteur. |
| `HandToolChainsaw:onHeldEnd()` | 560 | ✍ Retire le type de cible, restaure la posture du joueur, arrête ébranchage ou coupe en cours, arrête l'animation de chaîne, masque l'anneau et remet à zéro l'entrée de roulis. |
| `HandToolChainsaw:onRegisterActionEvents()` | 593 | ✍ Enregistre AXIS_ROTATE_HANDTOOL (roulis du plan de coupe) et ACTIVATE_HANDTOOL (couper ou accélérer), avec textes et priorité. Ignoré si l'outil n'est pas actif pour les entrées. |
| `HandToolChainsaw:onRollAction(_: any, inputDelta: any)` | 612 | ✍ Rappel d'entrée : cumule l'entrée de roulis appliquée à la prochaine mise à jour. |
| `HandToolChainsaw:onCutAction(_: any, inputValue: any)` | 619 | ✍ Rappel d'entrée. Au relâchement, arrête la coupe ou l'ébranchage et revient au repos. À l'appui, lance la coupe si un arbre est visé, avec repli sur l'ébranchage (montée en régime) si la coupe ne peut démarrer, ou ébranche si aucun arbre n'est visé. |
| `HandToolChainsaw:setCurrentCutState(cutState: any, isVerticalCut: any)` | 656 | ✍ Mémorise l'état de coupe et l'indicateur vertical, signale une mise à jour réseau sur le serveur ou le joueur propriétaire, et indique au joueur porteur si une coupe est en cours. |
| `HandToolChainsaw:testIfCutAllowed(treeNode: any, cutX: any, cutZ: any)` | 676 | ✍ Renvoie true uniquement si un joueur porte l'outil, possède la permission de ferme CUT_TREES et que le gestionnaire de split shapes autorise la coupe de cette forme à cette position. |
| `HandToolChainsaw:testIfCutValid(treeNode: any, cutX: any, cutZ: any, minY: any, maxY: any, minZ: any, maxZ: any)` | 696 | ✍ Renvoie true si la coupe n'est pas trop basse (`testIfTooLow`) et si les bornes du plan restent sous le diamètre de coupe maximal sur les deux axes. |
| `HandToolChainsaw:testIfTooLow(treeNode: integer, minY: number, maxY: number, minZ: number, maxZ: number) → boolean` | 719 | ✍ Vérifie les quatre coins des bornes de coupe. Pour un arbre encore enraciné (statique), chacun doit dépasser un seuil de hauteur des racines et un seuil de distance au sol ; un arbre abattu passe toujours. Renvoie false si l'arbre ou les bornes manquent ; dessine du debug si activé. |
| `HandToolChainsaw:getChainSpeedFactor()` | 797 | ✍ Renvoie un facteur 0..1 dérivé du régime courant, remappé entre 0,3 et 1 de la plage de régime. |
| `HandToolChainsaw:beginDelimbing()` | 804 | ✍ Propriétaire seulement : passe à l'état DELIMBING, remet la charge à zéro, vise le régime max et masque le texte d'action. |
| `HandToolChainsaw:stopDelimbing()` | 823 | ✍ Revient à IDLE, termine la minuterie d'effet, remet la charge à zéro et fixe le régime cible au ralenti. |
| `HandToolChainsaw:beginCutting()` | 837 | ✍ Propriétaire seulement. Vérifie un arbre possible et la permission (sinon avertissement), passe à CUTTING, calcule la durée de coupe depuis l'aire de section ovale plus la montée en régime, fixe les positions de début et de fin, relie l'outil au guide de coupe et verrouille les entrées du joueur. |
| `HandToolChainsaw:stopCutting(sliceTree: any)` | 900 | ✍ Propriétaire seulement. Revient à IDLE, remet charge et régime à zéro, déverrouille les entrées et relie de nouveau l'outil. Si `sliceTree` est true, tranche la forme : directement sur le serveur, ou en envoyant un ChainsawCutEvent depuis un client. |
| `HandToolChainsaw:updateCutting(dt: any)` | 945 | ✍ Étape de coupe par image : anime l'outil, vise le régime max, avance le temps de coupe, abandonne si le point visé par le joueur est trop loin de la coupe, et tranche l'arbre à l'atteinte de la durée cible. |
| `HandToolChainsaw:updateCuttingAnimation(dt: any)` | 976 | ✍ Déplace le nœud de guidage de coupe. Pendant la montée en régime, il approche le début de coupe à charge nulle ; ensuite il suit la ligne de coupe avec une progression lissée par courbe de Bézier, déduit la charge de la vitesse lissée comparée à la linéaire et maintient les effets. |
| `HandToolChainsaw:updateSplitPlane()` | 1024 | ✍ Oriente le nœud de rotation de caméra (selon la caméra en ébranchage, seulement le lacet sinon), applique le roulis, puis recalcule les bornes de coupe avec `testSplitShape` pour l'arbre en cours ou visé. |
| `HandToolChainsaw:updateRingSelector(targetedTree: any, isCutPossible: any, cutMinimumY: any, cutMaximumY: any, cutMinimumZ: any, cutMaximumZ: any)` | 1076 | ✍ Affiche ou masque l'anneau indicateur, le colore selon la validité, l'adapte à la section du tronc et le centre sur les bornes de coupe. |
| `HandToolChainsaw:calculateCutPlane()` | 1113 | ✍ Renvoie la position du plan de séparation, ses directions bas et gauche, ainsi que sa largeur et sa profondeur (diamètre de coupe maximal plus une constante de décalage). |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `calculateCutPlane` | 71 |
| registerFunction | `getChainSpeedFactor` | 72 |
| registerFunction | `testIfTooLow` | 73 |
| registerFunction | `testIfCutAllowed` | 74 |
| registerFunction | `testIfCutValid` | 75 |
| registerFunction | `beginCutting` | 76 |
| registerFunction | `stopCutting` | 77 |
| registerFunction | `beginDelimbing` | 78 |
| registerFunction | `stopDelimbing` | 79 |
| registerFunction | `setCurrentCutState` | 80 |
| registerFunction | `updateCutting` | 81 |
| registerFunction | `updateCuttingAnimation` | 82 |
| registerFunction | `updateSplitPlane` | 83 |
| registerFunction | `updateRingSelector` | 84 |
| registerEventListener | `onDelete` | 89 |
| registerEventListener | `onLoad` | 90 |
| registerEventListener | `onPostLoad` | 91 |
| registerEventListener | `onUpdate` | 92 |
| registerEventListener | `onDraw` | 93 |
| registerEventListener | `onWriteUpdateStream` | 94 |
| registerEventListener | `onReadUpdateStream` | 95 |
| registerEventListener | `onHeldStart` | 96 |
| registerEventListener | `onHeldEnd` | 97 |
| registerEventListener | `onRegisterActionEvents` | 98 |

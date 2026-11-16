# graphics/HumanModel.lua

*[English version](../../../scripts/graphics/HumanModel.md)*

Source: `dataS/scripts/graphics/HumanModel.lua` — FS25 1.25.1.0

✍ Enveloppe le modèle 3D d'un personnage humain : il charge le fichier i3d référencé par un XML de joueur, retrouve les nœuds de squelette, maillage, mains, pieds, tête, hanches, colonne et suspension, et les rattache à la scène. Il crée aussi les nœuds de particules de nage et de plongeon et garde les nœuds des parties de style (cheveux, haut, chaussures...). Plusieurs méthodes (reset, applyFromStyle, updateVisibility, loadIKChains, loadFromStyleAsync...) sont appelées ici mais absentes de ce dump (NON VÉRIFIÉ).

- **HumanModel** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `HumanModel.registerXMLPaths(xmlSchema: XMLSchema, baseKey: string)` | 18 | ✍ Enregistre sur le schéma donné les chemins XML lus par cette classe : mappings i3d, nœuds du modèle (mesh, skeleton, animationRoot, hips, suspension, mains, pieds, head, spine et son décalage), et noms de fichiers de sons et d'animation. |
| `HumanModel.new(customMt: any) → table` | 43 | ✍ Crée un modèle vide avec les drapeaux de chargement à false, toutes les références de nœuds à nil, des tables vides pour parties de modèle, correspondances de clips, chaînes IK, mappings i3d et composants, et une table d'infos de particules de nage et plongeon vide. |
| `HumanModel:load(xmlFilename: string, isRealPlayer: boolean, isOwner: boolean, isAnimated: boolean, asyncCallbackFunction: function, asyncCallbackObject: table, asyncCallbackArguments: table)` | 228 | ✍ Ouvre le XML du joueur et charge le modèle de façon asynchrone, puis ferme le XML. Si le XML est introuvable, le rappel est appelé aussitôt avec false. Sinon il reçoit une valeur HumanModelLoadingState et non un booléen. |
| `HumanModel:loadFromXMLFileAsync(xmlFile: XMLFile, isRealPlayer: boolean, isOwner: boolean, isAnimated: boolean, asyncCallbackFunction: function, asyncCallbackObject: table, asyncCallbackArguments: table)` | 260 | ✍ Lance le chargement asynchrone depuis un XML déjà ouvert : mémorise le nom du fichier, résout le chemin i3d, libère les demandes i3d partagées précédentes et demande la nouvelle ; loadFileFinished s'exécute à la fin. L'appelant reste responsable de fermer le XML. |
| `HumanModel:loadFileFinished(rootNode: any, failedReason: any, arguments: any)` | 294 | ✍ Rappel de fin du chargement i3d. Signale FAILED si l'i3d ou le XML a disparu. Sinon réinitialise, lit composants, mappings, noms de fichiers d'animation et de sons et nœuds du corps, puis rattache le squelette (pour un vrai joueur, crée aussi les systèmes de particules de nage et de plongeon). Signale INVALID_CONTENT si un vrai joueur n'a pas de racine d'animation, sinon OK. |
| `HumanModel:onAllModelPartsLoaded(playerStyle: any)` | 541 | ✍ Appelée quand toutes les parties de style sont chargées : applique le style sauf si le modèle a été supprimé entre-temps, marque le style chargé, supprime les nœuds de parties temporaires, puis déclenche le rappel de fin à usage unique avec OK ou FAILED. |
| `HumanModel:getVisibility() → boolean` | 964 | ✍ Retourne la visibilité moteur du nœud racine du modèle. |
| `HumanModel:setVisibility(isVisible: boolean)` | 978 | ✍ Mémorise la visibilité demandée et appelle updateVisibility (défini ailleurs, NON VÉRIFIÉ) pour l'appliquer. |
| `HumanModel:debugDraw(x: number, y: number, textSize: number) → number` | 1059 | ✍ Dessine le squelette sous forme de lignes de débogage rouges d'os en os, récursivement à partir du premier enfant du nœud de squelette. Les paramètres x, y et textSize sont inutilisés et rien n'est retourné. |

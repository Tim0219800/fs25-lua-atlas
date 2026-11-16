# debug/DebugManager.lua

*[English version](../../../scripts/debug/DebugManager.md)*

Source: `dataS/scripts/debug/DebugManager.lua` — FS25 1.25.1.0

✍ DebugManager est le gestionnaire qui possède et dessine les éléments de débogage (DebugLine, DebugText, DebugSpline, etc.). Il dérive de AbstractManager et s'obtient via le global `g_debugManager`. Les éléments sont rangés par identifiant et par groupe, peuvent être masqués par groupe, et sont dessinés en deux passes : les éléments 3D avant l'interface, puis les objets dotés de `drawDebug` après elle. Ce dump ne contient qu'une partie du fichier (initialisation, les deux passes de dessin et deux commandes console) ; les autres méthodes sont absentes, l'API éléments/groupes est donc NON VÉRIFIÉE ici.

- **DebugManager** hérite de `AbstractManager` (l.16)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `DebugManager:initDataStructures()` | 29 | ✍ Réinitialise toutes les tables d'éléments, le matériau de débogage et les drapeaux de débogage des splines et des occluders. Au premier appel, il enregistre aussi les commandes console `gsDebugManagerClearElements`, `gsDebugManagerGroupsList`, `gsDebugManagerGroupVisibilitySet`, `gsDebugManagerGroupRemove`, `gsSplineDebug` et `gsTerrainLayerDebug`. |
| `DebugManager:unloadMapData()` | 75 | ✍ Remet à faux l'indicateur de carte chargée et reconstruit des structures vides, ce qui supprime tous les éléments de débogage enregistrés lors du déchargement d'une carte. |
| `DebugManager:drawPreUI()` | 266 | ✍ Dessine chaque élément de chaque groupe non masqué (s'il possède `draw` et que son `getShouldBeDrawn` l'autorise), puis dessine et retire les éléments valables une seule image. Prévu pour le contenu 3D, rendu avant l'interface. |
| `DebugManager:drawPostUI()` | 286 | ✍ Appelle `drawDebug` sur chaque objet dessinable enregistré, après le rendu de l'interface, afin qu'il puisse dessiner par-dessus. |
| `DebugManager:consoleCommandRemoveElements() → string` | 362 | ✍ Gestionnaire de commande console : appelle `delete` sur chaque élément qui en possède une, vide les tables d'identifiants, de groupes et de durées de vie, et renvoie une chaîne de confirmation. Les éléments d'une image et les objets dessinables ne sont pas touchés. |
| `DebugManager:consoleCommandSplineToggleDebug(displayEPsStr: string) → string` | 444 | ✍ Gestionnaire de commande console qui active ou désactive le débogage des splines. À l'activation, il parcourt toute la scène depuis le noeud racine, recolore chaque spline avec le matériau de débogage et ajoute un DebugSpline (distance de clip 500) au groupe `splineDebug` ; à la désactivation, il retire ce groupe. Renvoie une chaîne d'état. |

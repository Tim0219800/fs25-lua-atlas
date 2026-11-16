# ai/NavigationSystem.lua

*[English version](../../../scripts/ai/NavigationSystem.md)*

Source: `dataS/scripts/ai/NavigationSystem.lua` — FS25 1.25.1.0

✍ Aide côté client qui affiche un marqueur de navigation (un modèle I3D plus un objet `NavigationMarker`) à une position cible, avec éventuellement une flèche de direction, et le dessine à chaque image via `g_currentMission:addDrawable`. Elle peut sauvegarder la cible courante dans un fichier XML. `NavigationMarker` et `XMLFile` ne sont pas dans le dump (NON VÉRIFIÉ).

- **NavigationSystem** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `NavigationSystem.new(customMt: any)` | 25 | ✍ Crée le système avec un nouveau `NavigationMarker` et des noeuds de position/direction vides. |
| `NavigationSystem:loadMapData(xmlFile: any, missionInfo: any, baseDirectory: any) → boolean` | 39 | ✍ Lance le chargement asynchrone de `$data/shared/assets/marker/navigationMarker.i3d` et garde l'id de requête. Renvoie toujours true. |
| `NavigationSystem:onNavigationMarkerLoaded(i3dNode: any, failedReason: any, args: any)` | 49 | ✍ Callback de chargement : en cas de succès prend le premier enfant comme noeud de position et son enfant comme noeud de direction, les masque, lie le noeud de position au noeud racine, rafraîchit le marqueur et supprime la racine I3D chargée. |
| `NavigationSystem:delete()` | 67 | ✍ Annule un chargement I3D en cours, supprime le noeud de position et le `NavigationMarker`. |
| `NavigationSystem:saveToXMLFile(xmlFilename: any)` | 86 | ✍ Crée un fichier XML au schéma `navigationSystem`, y écrit la position cible et, si définie, la direction, puis l'enregistre et le ferme. N'écrit pas de cible si aucune n'est active. |
| `NavigationSystem:updateMarker()` | 103 | ✍ Affiche ou masque le marqueur et les noeuds selon l'existence d'une cible et d'une direction, et déplace le noeud de position et oriente le noeud de direction (vecteur haut 0,1,0) vers la cible. |
| `NavigationSystem:draw()` | 126 | ✍ Callback de dessin qui affiche le `NavigationMarker` ; enregistré auprès de la mission pendant la navigation. |
| `NavigationSystem:navigateTo(x: any, y: any, z: any, dirX: any, dirY: any, dirZ: any)` | 132 | ✍ Définit la position cible (marqueur dessiné 1,4 m au-dessus de y) et une direction optionnelle, affiche le marqueur, enregistre le système comme dessinable sur `g_currentMission` et rafraîchit les noeuds. |
| `NavigationSystem:stop()` | 151 | ✍ Efface la cible et la direction, retire le dessinable de `g_currentMission` et masque le marqueur. |

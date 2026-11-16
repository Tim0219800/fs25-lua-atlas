# triggers/FillPlane.lua

*[English version](../../../scripts/triggers/FillPlane.md)*

Source: `dataS/scripts/triggers/FillPlane.lua` — FS25 1.25.1.0

✍ Petite classe utilitaire qui pilote un noeud de plan de remplissage visuel (la surface montrant une charge dans un conteneur). Elle déplace le noeud verticalement et peut l'incliner selon un état de remplissage de 0 à 1, et peut changer son matériau de type de remplissage et son shader de couleur. La configuration vient d'un bloc XML (node, minY/maxY, minRotX/maxRotX, changeVisibility, colorChange) déclaré via registerXMLPaths.

- **FillPlane** (l.17)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FillPlane.new(customMt: table?) → table` | 23 | ✍ Crée une instance de plan de remplissage sans noeud, avec une plage nulle et rien de chargé ; appeler load ensuite. Accepte une métatable personnalisée optionnelle pour l'héritage. |
| `FillPlane:delete()` | 38 | ✍ Destructeur ; corps vide, il ne libère rien. |
| `FillPlane:load(components: table, xmlFile: table, xmlNode: string, i3dMappings: table) → boolean` | 48 | ✍ Lit le noeud et les réglages depuis la clé XML, en résolvant le noeud via components et i3dMappings. Retourne false si aucun noeud n'est trouvé. Inverse minY/maxY avec un avertissement s'ils sont inversés, désactive colorChange si le noeud n'a pas le paramètre de shader `colorScale`, puis place le noeud à minY et le masque si changeVisibility est actif. |
| `FillPlane:setState(state: number) → boolean` | 87 | ✍ Interpole la hauteur du noeud entre minY et maxY et sa rotation X entre minRotX et maxRotX selon l'état 0 à 1. Avec changeVisibility, le noeud n'est visible que si l'état est supérieur à 0. Retourne true si la hauteur a changé ; sans effet si rien n'est chargé. |
| `FillPlane:setFillType(fillTypeIndex: integer)` | 107 | ✍ Applique au noeud le matériau du type de remplissage donné, à partir des matériaux par défaut du noeud de terrain, et fixe le paramètre de shader `isCustomShape`. La logique des matériaux est dans FillPlaneUtil, absent du dump (NON VÉRIFIÉ). |
| `FillPlane:setColorScale(colorScale: array)` | 119 | ✍ Fixe le paramètre de shader `colorScale` du noeud à partir d'un tableau de trois composantes (r, g, b). Sans effet si le plan n'est pas chargé. |
| `FillPlane.registerXMLPaths(schema: XMLFile, basePath: string)` | 129 | ✍ Enregistre dans le schéma les attributs XML lus par la classe sous le chemin de base donné : node, minY, maxY, minRotX, maxRotX, changeVisibility et colorChange. |

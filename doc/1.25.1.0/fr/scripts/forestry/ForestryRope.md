# forestry/ForestryRope.lua

*[English version](../../../scripts/forestry/ForestryRope.md)*

Source: `dataS/scripts/forestry/ForestryRope.lua` — FS25 1.25.1.0

✍ Classe simple pour une corde forestière purement visuelle : une seule forme étirée entre un repère de référence et un point cible via des paramètres de shader, sans physique. Elle charge un i3d de corde (partagé), garde la corde orientée vers un nœud ou une position cible, et permet de changer longueur, nœud de liaison, visibilité et couleur émissive (valide ou invalide). Sœur de ForestryPhysicsRope et ForestryHook.

- **ForestryRope** (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ForestryRope.new(vehicle: any, linkNode: any, customMt: any)` | 17 | ✍ Constructeur. Mémorise le véhicule (peut être nil) et le nœud de liaison, et initialise position et rotation locales, visibilité, données de cible et rayon englobant. |
| `ForestryRope.registerXMLPaths(schema: any, baseKey: any)` | 38 | ✍ Déclare les attributs XML de la corde : fichier i3d, chemin du nœud de corde, diamètre, échelle uv, et couleurs émissives des états valide et invalide. À noter : les couleurs par défaut déclarées diffèrent de celles utilisées dans loadFromXML. |
| `ForestryRope:loadFromXML(xmlFile: any, key: any, baseDirectory: any)` | 49 | ✍ Lit les réglages de la corde dans le XML et lance un chargement i3d partagé asynchrone, via le véhicule s'il existe, sinon g_i3DManager. onI3DLoaded termine l'initialisation. |
| `ForestryRope:loadFromConfigXML(xmlFile: any)` | 69 | ✍ Point d'extension vide, rien n'est chargé ici. |
| `ForestryRope:clone(linkNode: any)` | 74 | ✍ Crée une copie avec les mêmes réglages, éventuellement sur un autre nœud de liaison, en rechargeant l'i3d en cache de façon synchrone. Retourne le clone, ou rien s'il n'y a pas de fichier i3d. |
| `ForestryRope:delete()` | 93 | ✍ Retire la corde des éléments mis à jour de la mission, supprime le repère de référence s'il existe encore et libère l'i3d partagé. |
| `ForestryRope:update(dt: any)` | 108 | ✍ Si une cible est définie, la convertit dans l'espace local du repère de référence, oriente la corde vers elle et règle la longueur sur la distance. Rafraîchit d'abord la position de la cible quand un nœud cible est utilisé. |
| `ForestryRope:setLength(length: any)` | 124 | ✍ Écrit la longueur dans le paramètre de shader de la corde (avec diamètre et échelle uv) et redimensionne la sphère englobante de la forme quand le rayon change. Ne fait rien tant que le repère de référence n'existe pas. |
| `ForestryRope:setTargetNode(nodeId: any, isActiveDirty: any)` | 139 | ✍ Définit un nœud comme cible de la corde et met à jour immédiatement. Avec isActiveDirty à true, la corde est inscrite aux mises à jour à chaque image (pour suivre un nœud mobile), sinon elle en est retirée. Le nœud ne doit pas être nil. |
| `ForestryRope:setTargetPosition(x: any, y: any, z: any)` | 155 | ✍ Définit une position monde fixe comme cible et met à jour immédiatement. |
| `ForestryRope:link(node: any, x: any, y: any, z: any, rx: any, ry: any, rz: any)` | 163 | ✍ Change le nœud de liaison et, au besoin, la position et la rotation locales (nil conserve les anciennes valeurs), puis relie de nouveau et repositionne le repère de référence s'il existe. |
| `ForestryRope:setPositionAndDirection(x: any, y: any, z: any, dx: any, dz: any)` | 178 | ✍ Définit le départ de la corde à partir d'une position monde et, si dx et dz sont fournis, d'une direction horizontale, converties dans l'espace local du nœud de liaison ; l'applique au repère de référence s'il existe. |
| `ForestryRope:setVisibility(visibility: any)` | 194 | ✍ Mémorise l'indicateur de visibilité et l'applique au repère de référence s'il existe. |
| `ForestryRope:setEmissiveColor(valid: any)` | 203 | ✍ Règle la couleur émissive du shader de la corde sur la couleur valide si valid vaut true, sinon sur la couleur invalide. Ne fait rien si la forme de la corde n'est pas chargée. |
| `ForestryRope:onI3DLoaded(i3dNode: any, failedReason: any)` | 212 | ✍ Rappel du chargement de l'i3d partagé. Trouve la forme de corde par son chemin, l'enveloppe dans un nouveau repère de référence lié sous le nœud de liaison, applique la couleur émissive, met à jour, puis supprime la racine i3d temporaire. |

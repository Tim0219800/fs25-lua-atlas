# vehicles/specializations/components/ToolConnectionHoseMount.lua

*[English version](../../../../../scripts/vehicles/specializations/components/ToolConnectionHoseMount.md)*

Source: `dataS/scripts/vehicles/specializations/components/ToolConnectionHoseMount.lua` — FS25 1.25.1.0

✍ Charge un asset de support de flexibles (XML plus i3d partagé) placé entre deux cibles de flexible d'un véhicule, afin que les flexibles d'un outil attelé puissent passer par un support intermédiaire. Après chargement il enregistre de nouvelles cibles de flexible et de connecteurs d'outil dans `spec_connectionHoses` du véhicule (spécialisation ConnectionHoses, définie ailleurs, NON VÉRIFIÉ) et peut s'étirer à une longueur demandée. Aide de mise en place/visuelle côté client.

- **ToolConnectionHoseMount** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ToolConnectionHoseMount.new(vehicle: any, customMt: any)` | 16 | ✍ Crée un objet de support de flexibles pour un véhicule avec des tables de composants et de mappings i3d vides. |
| `ToolConnectionHoseMount:delete()` | 30 | ✍ Supprime le fichier XML en attente et le nœud du support, et libère la requête i3d partagée. |
| `ToolConnectionHoseMount:setCallback(callback: any, callbackTarget: any)` | 49 | ✍ Mémorise un callback (et une cible optionnelle) appelé avec l'indicateur de succès après le chargement. |
| `ToolConnectionHoseMount:onFinished(success: any)` | 56 | ✍ Appelle le callback enregistré, avec ou sans cible, en lui passant l'indicateur de succès. |
| `ToolConnectionHoseMount:setReferenceTargets(startTarget: any, endTarget: any)` | 68 | ✍ Mémorise les cibles de flexible de début et de fin entre lesquelles se place le support et recherche le flexible de connexion parent de la cible de début dans `spec_connectionHoses`. |
| `ToolConnectionHoseMount:setLinkNode(linkNode: any, x: any, y: any, z: any, rx: any, ry: any, rz: any)` | 78 | ✍ Mémorise le nœud sous lequel lier le support ainsi que sa translation et rotation locales (0 par défaut). |
| `ToolConnectionHoseMount:loadFromXML(xmlFilename: any, baseDirectory: any)` | 86 | ✍ Charge le XML du support et lance le chargement i3d partagé asynchrone. Exige des cibles de début/fin et un nœud d'attache, sinon journalise un avertissement, appelle `onFinished(false)` et renvoie false. |
| `ToolConnectionHoseMount:onI3DLoaded(i3dNode: any, failedReason: any, args: any)` | 129 | ✍ Callback asynchrone : lit la longueur par défaut, les cibles de flexible (nœuds arrière/avant/montage, nom de type, options), les flexibles supplémentaires, les nœuds d'ajustement et d'échelle ; lie et place la racine, crée les flexibles et applique une longueur en attente. |
| `ToolConnectionHoseMount:setLength(length: any)` | 215 | ✍ Étire le support à la longueur donnée en mettant à l'échelle les translations z des nœuds d'ajustement et les échelles z des nœuds d'échelle par rapport à la longueur par défaut. Si pas encore chargé, la longueur est conservée et appliquée après le chargement. |
| `ToolConnectionHoseMount:addHoseTarget(node: any, sourceTarget: any, newType: any)` | 236 | ✍ Ajoute une cible de flexible pour un nœud dans la liste de cibles du véhicule et l'index par type, en copiant articulations, facteur de redressement et nom d'adaptateur d'une cible source. Renvoie le nouvel indice de cible. |
| `ToolConnectionHoseMount:createToolConnectionHoses()` | 263 | ✍ Pour chaque cible configurée, crée des cibles de flexible avant et arrière et une nouvelle entrée de flexible de connexion d'outil les reliant (en masquant le nœud de montage) et l'enregistre dans `toolConnectorHoses` et `targetNodeToToolConnection`. |
| `ToolConnectionHoseMount.registerExternalXMLPaths(schema: any)` | 296 | ✍ Enregistre les chemins XML de l'asset de support de flexibles (mappings i3d sous `toolConnectionHoseMount` ; d'autres lignes d'enregistrement peuvent exister mais ne sont pas détaillées). |

# vehicles/specializations/components/AttacherJointTopArm.lua

*[English version](../../../../../scripts/vehicles/specializations/components/AttacherJointTopArm.md)*

Source: `dataS/scripts/vehicles/specializations/components/AttacherJointTopArm.lua` — FS25 1.25.1.0

✍ Bras supérieur (top link) visuel d'une articulation d'attelage trois points. Il peut être chargé depuis un asset XML/i3d partagé lié à un nœud du véhicule, ou construit à partir de nœuds déjà présents, et se réoriente vers un nœud cible à chaque mise à jour en ajustant translation et échelle selon la distance. Il applique aussi des modèles de matériaux de marque et des changements d'objets. Purement cosmétique et côté client ; `RENAMED_UPPER_LINKS` et `xmlSchema` sont utilisés ici mais non définis dans ce fichier (NON VÉRIFIÉ : où ils sont définis).

- **AttacherJointTopArm** (l.23)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AttacherJointTopArm.new(vehicle: any, customMt: any)` | 27 | ✍ Crée un objet de bras supérieur lié à un véhicule avec les réglages par défaut : échelle z -1, bras de montage et décalque de marque activés, pas de bascule de visibilité, tables de composants et de changements d'objets vides. |
| `AttacherJointTopArm:delete()` | 45 | ✍ Supprime le nœud du bras supérieur et libère la requête de chargement i3d partagée le cas échéant. |
| `AttacherJointTopArm:setCallback(callback: any, callbackTarget: any)` | 59 | ✍ Mémorise un callback (et une cible optionnelle) appelé avec l'indicateur de succès à la fin du chargement. |
| `AttacherJointTopArm:onFinished(success: any)` | 66 | ✍ Appelé en fin de chargement : supprime le fichier XML temporaire, exécute `finalize` puis appelle le callback enregistré avec l'indicateur de succès. |
| `AttacherJointTopArm.loadFromVehicleXML(vehicle: any, key: any)` | 85 | ✍ Construit un bras supérieur depuis une clé XML de véhicule : soit via `#baseNode` et `#filename` (un asset XML, avec avertissements pour les chemins i3d et les bras renommés), soit via des nœuds existants `#rotationNode`/`#translationNode`. Lit ensuite zScale, visibilité, bras de montage, modèles de matériaux et changements d'objets. Renvoie le bras ou nil. |
| `AttacherJointTopArm:loadFromXML(linkNode: any, xmlFilename: any, baseDirectory: any)` | 144 | ✍ Charge le XML de définition du bras, lit le nom du fichier i3d et lance le chargement i3d partagé asynchrone (via le véhicule s'il existe). Renvoie false et termine en échec si le XML ou le nom de fichier manque. |
| `AttacherJointTopArm:onI3DLoaded(i3dNode: any, failedReason: any, args: any)` | 180 | ✍ Callback asynchrone du chargement i3d : lie le nœud racine sous le nœud d'attache, résout les nœuds de translation, d'échelle, de décalque et de bras de montage, masque les parties inutiles et applique les matériaux de marque. À noter : le matériau de décalque calculé d'après la luminosité du matériau principal n'est jamais affecté à `self.decalMaterial`, il reste sans effet. |
| `AttacherJointTopArm:finalize()` | 258 | ✍ Calcule la distance de référence et la translation par défaut de la partie coulissante, ainsi que la longueur de référence de la partie mise à l'échelle, utilisées ensuite par `update`. |
| `AttacherJointTopArm:setIsActive(isActive: any)` | 273 | ✍ Bascule entre pose attelée et détachée : règle la rotation du bras de montage, bascule éventuellement la visibilité, réinitialise rotation, translation et échelle si inactif, et applique les changements d'objets configurés. |
| `AttacherJointTopArm:update(dt: any, targetNode: any)` | 300 | ✍ Oriente le nœud du bras vers `targetNode` (direction plus vecteur haut selon que le nœud est dans la moitié avant ou arrière du véhicule) et ajuste translation et échelle selon la distance courante. |
| `AttacherJointTopArm.registerVehicleXMLPaths(schema: any, baseKey: any)` | 334 | ✍ Enregistre les chemins XML côté véhicule pour un bras supérieur (fichier, baseNode, zScale, visibilité, bras de montage, modèles de matériaux, décalque, nœuds de repli) ainsi que les chemins de changements d'objets. |
| `AttacherJointTopArm.registerXMLPaths(schema: any)` | 360 | ✍ Enregistre les chemins XML du fichier d'asset du bras (`topArm.*` : fichier, racine, translation, échelle, décalque de marque et bras de montage) et les mappings i3d. |

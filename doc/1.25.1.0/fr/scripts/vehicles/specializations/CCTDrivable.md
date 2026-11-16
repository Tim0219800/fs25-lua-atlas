# vehicles/specializations/CCTDrivable.lua

*[English version](../../../../scripts/vehicles/specializations/CCTDrivable.md)*

Source: `dataS/scripts/vehicles/specializations/CCTDrivable.lua` — FS25 1.25.1.0

✍ Spécialisation pour les véhicules pilotés comme un contrôleur de personnage (CCT) plutôt que comme un corps rigide, par exemple des montures cinématiques. Elle lit les valeurs XML cctDrivable (rayon, hauteur, pente max, hauteur de marche), construit les groupes et masques de collision et, côté serveur, maintient un groupe de transformation qui suit le véhicule et déplace le contrôleur. Plusieurs fonctions enregistrées (getTouchingNode, moveCCTExternal) et le remplacement de addToPhysics n'ont aucune définition dans ce fichier, NON VÉRIFIÉ.

- **CCTDrivable** (l.14)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `CCTDrivable.prerequisitesPresent(specializations: table) → boolean` | 20 | ✍ Renvoie toujours true : aucune autre spécialisation n'est requise. |
| `CCTDrivable.initSpecialization()` | 26 | ✍ Ouvre et ferme le type de spécialisation XML CCTDrivable ; aucune clé n'est enregistrée dans ce dump. |
| `CCTDrivable.registerFunctions(vehicleType: table)` | 41 | ✍ Enregistre getTouchingNode, moveCCTExternal, moveCCT, getIsCCTOnGround, getCCTCollisionMask, getCCTWorldTranslation et getIsAIMovingObstacle. À noter : getTouchingNode et moveCCTExternal ne sont pas définies dans ce fichier, elles s'enregistrent donc à nil (NON VÉRIFIÉ). |
| `CCTDrivable.registerOverwrittenFunctions(vehicleType: any)` | 53 | ✍ Remplace addToPhysics, removeFromPhysics, setWorldPosition et setWorldPositionQuaternion. À noter : CCTDrivable.addToPhysics n'est pas défini dans ce fichier (NON VÉRIFIÉ). |
| `CCTDrivable.registerEventListeners(vehicleType: table)` | 63 | ✍ Enregistre onLoad et onDelete. |
| `CCTDrivable:onLoad(savegame: table)` | 71 | ✍ Lit cctRadius, cctHeight, cctSlopeLimit et cctStepOffset depuis le XML, fixe le décalage du centre du CCT à moins le rayon et construit les groupes et masques de collision cinématique et de déplacement (en excluant véhicules, eau, déclencheurs dans un cas, drapeaux de blocage). Côté serveur, crée le groupe de transformation cctDrivable sous le nœud racine. |
| `CCTDrivable:onDelete()` | 119 | ✍ Supprime le contrôleur CCT s'il existe et détruit le groupe de transformation. |
| `CCTDrivable:moveCCT(moveX: any, moveY: any, moveZ: any)` | 135 | ✍ Serveur uniquement : déplace le contrôleur du décalage donné avec le groupe et le masque de collision de déplacement, puis active le véhicule. Ne fait rien si aucun contrôleur n'a été créé. |
| `CCTDrivable:getIsCCTOnGround() → integer` | 167 | ✍ Serveur uniquement : renvoie l'indicateur de contact au sol fourni par le moteur pour le contrôleur, false côté client ou sans contrôleur. |
| `CCTDrivable:getCCTCollisionMask() → integer` | 179 | ✍ Renvoie le masque de collision cinématique construit dans onLoad. |
| `CCTDrivable:getCCTWorldTranslation() → number, number, number` | 189 | ✍ Renvoie x, y, z du centre du contrôleur : la position du nœud avec le décalage du centre ajouté à y. |
| `CCTDrivable:getIsAIMovingObstacle() → boolean` | 199 | ✍ Renvoie toujours true pour que les assistants IA traitent le véhicule comme un obstacle mobile bien que son corps soit cinématique. |
| `CCTDrivable:setWorldPosition(superFunc: number, x: number, y: number, z: number, xRot: number, yRot: number, zRot: number, i: integer, changeInterp: boolean)` | 213 | ✍ Appelle le parent puis, côté serveur et pour le composant 1, déplace le nœud CCT à la même position décalée du décalage de centre. La rotation n'est pas appliquée au nœud. |
| `CCTDrivable:setWorldPositionQuaternion(superFunc: number, x: number, y: number, z: number, qx: number, qy: number, qz: number, qw: number, i: integer, changeInterp: boolean)` | 232 | ✍ Comme setWorldPosition mais avec une rotation en quaternion : appelle le parent puis, côté serveur pour le composant 1, déplace le nœud CCT à la position décalée. |
| `CCTDrivable:removeFromPhysics(superFunc: function) → boolean` | 265 | ✍ Côté serveur, retire le contrôleur CCT avant d'appeler l'implémentation parente et de renvoyer son résultat. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `getTouchingNode` | 42 |
| registerFunction | `moveCCTExternal` | 43 |
| registerFunction | `moveCCT` | 44 |
| registerFunction | `getIsCCTOnGround` | 45 |
| registerFunction | `getCCTCollisionMask` | 46 |
| registerFunction | `getCCTWorldTranslation` | 47 |
| registerFunction | `getIsAIMovingObstacle` | 48 |
| registerOverwrittenFunction | `addToPhysics` | 54 |
| registerOverwrittenFunction | `removeFromPhysics` | 55 |
| registerOverwrittenFunction | `setWorldPosition` | 56 |
| registerOverwrittenFunction | `setWorldPositionQuaternion` | 57 |
| registerEventListener | `onLoad` | 64 |
| registerEventListener | `onDelete` | 65 |

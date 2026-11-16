# objects/MountableObject.lua

*[English version](../../../scripts/objects/MountableObject.md)*

Source: `dataS/scripts/objects/MountableObject.lua` — FS25 1.25.1.0

✍ Sous-classe de PhysicsObject pour les objets pouvant être montés (attachés par un joint dynamique) sur un véhicule ou un autre support. Seuls quelques membres ont un corps dans le dump du SDK : un raycast périodique vers le haut qui compte la masse des autres objets montables empilés au-dessus pour adapter la force du joint de montage, et une surcharge de la pose réseau. La plus grande partie de la logique de montage (types de montage, création du joint, getAdditionalMountingDistance, constantes FORCE_LIMIT_*) est absente du dump : NON VÉRIFIÉ.

- **MountableObject** hérite de `PhysicsObject` (l.15)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `MountableObject:updateDynamicMountJointForceLimit(dt: any)` | 331 | ✍ Appelée avec dt pendant le montage : décompte un minuteur et, à son expiration sans raycast en attente, lance un raycast asynchrone vers le haut contre les objets dynamiques pour mesurer la masse empilée. Le résultat est appliqué dans le callback du raycast. |
| `MountableObject:getAdditionalMountingMass()` | 350 | ✍ Retourne toujours 0 ; conservée uniquement pour la compatibilité avec d'anciens appelants. |
| `MountableObject:additionalMountingMassRaycastCallback(hitObjectId: integer, x: number, y: number, z: number, distance: number, nx: number, ny: number, nz: number, subShapeIndex: integer, shapeId: integer, isLast: boolean) → boolean` | 368 | ✍ Callback du raycast : ajoute la masse de chaque autre MountableObject trouvé à la distance d'empilement attendue. Au dernier impact, il remet à l'échelle la limite de force d'entraînement linéaire du joint de montage selon le rapport de masse total. Retourne true pour continuer le raycast. |
| `MountableObject:setWorldPositionQuaternion(x: number, y: number, z: number, quatX: number, quatY: number, quatZ: number, quatW: number, changeInterp: any)` | 430 | ✍ Appelle le setter de pose parent toujours sur le serveur, mais sur un client seulement si le type de montage n'est ni cinématique ni par défaut, afin que les objets montés ne soient pas déplacés par les mises à jour de pose réseau. |

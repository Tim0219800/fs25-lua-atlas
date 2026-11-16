# vehicles/ai/AICollisionTriggerHandler.lua

*[English version](../../../../scripts/vehicles/ai/AICollisionTriggerHandler.md)*

Source: `dataS/scripts/vehicles/ai/AICollisionTriggerHandler.lua` — FS25 1.25.1.0

✍ Utilitaire des stratégies IA pour détecter les obstacles devant un ensemble de véhicules piloté par l'IA. Côté serveur, il rassemble les déclencheurs de collision de tous les véhicules enfants, lance périodiquement une requête de collision le long de chaque trajet et suit les points d'impact dynamiques et statiques. Il signale l'état bloqué, la collision statique et la distance de collision la plus proche via des rappels fournis par la stratégie.

- **AICollisionTriggerHandler** (l.8)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AICollisionTriggerHandler.new(customMt: any)` | 20 | ✍ Constructeur ; initialise des tables de déclencheurs vides, aucune collision et des distances d'impact infinies. |
| `AICollisionTriggerHandler:init(vehicle: any, strategy: any)` | 40 | ✍ Côté serveur uniquement : rassemble les déclencheurs de collision de tous les véhicules enfants du véhicule racine via `getAICollisionTriggers` et `getAIImplementCollisionTriggers`, initialise l'état de chaque déclencheur et échelonne leurs indices de mise à jour. |
| `AICollisionTriggerHandler:update(dt: any, movingDirection: any)` | 97 | ✍ Met à jour les distances d'impact à chaque image et, au tour échelonné de chaque déclencheur, reconstruit son trajet et lance la requête moteur `getVehicleCollisionDistance`. Appelle le rappel de distance avec le minimum et dessine des lignes de debug en mode debug IA. |
| `AICollisionTriggerHandler:setStaticCollisionCallback(callback: any)` | 151 | ✍ Définit le rappel appelé quand la présence d'une collision statique change. |
| `AICollisionTriggerHandler:updateStaticCollisionCallback()` | 157 | ✍ Recalcule si un déclencheur a une collision statique et n'appelle le rappel statique que si cet état a changé. |
| `AICollisionTriggerHandler:setIsBlockedCallback(callback: any)` | 177 | ✍ Définit le rappel appelé quand l'état bloqué change. |
| `AICollisionTriggerHandler:updateBlockedCallback()` | 183 | ✍ Recalcule si un déclencheur a une collision dynamique et n'appelle le rappel de blocage que si cet état a changé. |
| `AICollisionTriggerHandler:setCollisionDistanceCallback(callback: any)` | 203 | ✍ Définit le rappel qui reçoit la plus petite distance de collision à chaque mise à jour. |
| `AICollisionTriggerHandler:generateTriggerPath(vehicle: any, trigger: any, movingDirection: any)` | 209 | ✍ Remplit les points échantillonnés du trajet du déclencheur sur sa longueur (nœud avant ou arrière selon le sens de marche), chacun placé à la hauteur du terrain plus la moitié de la hauteur du déclencheur. |
| `AICollisionTriggerHandler:countHitObject(objectId: integer, trigger: table)` | 227 | ✍ Classe un nœud touché : joueurs, objets du groupe véhicule ou obstacles mobiles incrémentent le compteur dynamique, les corps non dynamiques le compteur statique. Véhicules propres, déclencheurs et autres objets dynamiques comme les balles sont ignorés. |
| `AICollisionTriggerHandler:onVehicleCollisionDistanceCallback(distance: any, objectId: any, subShapeIndex: any, isLast: any, trigger: any)` | 268 | ✍ Rappel asynchrone du moteur pour la requête de collision. Compte chaque impact et, au dernier, met à jour les indicateurs de collision et les points d'impact du déclencheur, puis notifie les rappels. Retourne false pour arrêter, true pour continuer, et ignore les appels après suppression d'un véhicule. |

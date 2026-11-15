# vehicles/specializations/Weeder.lua

Source: `dataS/scripts/vehicles/specializations/Weeder.lua` — FS25 1.25.1.0

✍ Spécialisation des bineuses / herses étrilles (désherbage), avec option binage (isHoe) et option prairie (isGrasslandWeeder). Pas de chargement d'effets EffectManager ; l'originalité côté visuel est la coloration des particules de sol : pour chaque correspondance de particules de sol déclarée avec adjustColor (clé XML sur le noeud de WorkParticles), onUpdateTick recolore le shader de ce système de particules. TRAVAIL : processWeederArea (serveur, ou client à distance <= Weeder.CLIENT_DM_UPDATE_RADIUS, constante non définie ici : NON VÉRIFIÉ) appelle FSDensityMapUtil.updateWeederArea (carte des mauvaises herbes ; corps absent du dump, NON VÉRIFIÉ) et, en mode prairie, updateGrassRollerArea ; isWorking = vitesse > 0.5. getStoneArea est lu pour l'usure (pierres). CONDITIONS de zone : getIsWorkAreaActive exige le contact sol du noeud de référence (si requiresGroundContact) et, si disableBackwards, movingDirection > 0 ; l'état abaissé n'est pas testé ici (la limite de vitesse suit getIsImplementChainLowered). À noter : startActivationTime est armé à l'attelage (2000 ms) mais n'est jamais consulté dans ce fichier (non vérifié en jeu : peut-être sans effet). COLORATION (onUpdateTick, client et serveur, tant que isWorking) : la couleur de base est lue à la position monde du noeud : sur un champ, getFieldGroundTyreTrackColor(densityBits) du fieldGroundSystem (couleur de trace de pneu du type de sol), sinon getTerrainAttributesAtWorldPos (couleur d'attribut de terrain) ; une transition lissée sur 1 s (alpha += dt/1000, interpolation vector3ArrayLerp) puis setShaderParameter psColor (alpha final 1). Le paramètre psColor du shader de particules n'est pas vérifiable dans le dump. À noter : la condition de relance de transition (lignes 144-147) compare les composantes par ET logique de différences, ce qui ne se déclenche que si les trois canaux changent à la fois (non vérifié en jeu). MÉTÉO/HUMIDITÉ : aucune donnée lue ; la couleur du sol est celle des cartes de terrain, donc indirectement liée à ce qu'elles encodent (pas relu). RÉSEAU : aucun flux ni dirtyFlag ; la coloration et l'état isWorking sont recalculés localement par chaque client. dt : utilisé pour la transition de couleur (secondes = dt/1000). POINTS D'EXTENSION : fonctions processWeederArea, updateWeederAIRequirements ; surcharges doCheckSpeedLimit, getDirtMultiplier, getWearMultiplier, loadWorkAreaFromXML (type WEEDER), getIsWorkAreaActive, loadGroundParticleMapping (ajoute adjustColor). Les particules de sol elles-mêmes sont chargées/pilotées par WorkParticles (WorkParticles.lua:238 : actif si getDoGroundManipulation() et sur champ ; Weeder ne surcharge pas getDoGroundManipulation, donc la valeur par défaut vrai de WorkParticles.lua:311 s'applique). Vitesse limite par défaut : 15.

- **Weeder** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `Weeder.initSpecialization()` | 17 | ✍ Déclare le type de zone de travail weeder, le schéma XML (sons de travail, vehicle.weeder#isHoe, #isGrasslandWeeder) et ajoute à la table de correspondance de WorkParticles la clé adjustColor. |
| `Weeder.prerequisitesPresent(specializations: table) → boolean` | 36 | ✍ Exige WorkArea et AttacherJoints. |
| `Weeder.registerFunctions(vehicleType: any)` | 43 | ✍ Enregistre processWeederArea et updateWeederAIRequirements. |
| `Weeder.registerOverwrittenFunctions(vehicleType: any)` | 50 | ✍ Surcharge doCheckSpeedLimit, getDirtMultiplier, getWearMultiplier, loadWorkAreaFromXML, getIsWorkAreaActive et loadGroundParticleMapping. |
| `Weeder.registerEventListeners(vehicleType: any)` | 61 | ✍ S'abonne à onLoad, onDelete, onUpdateTick, onDeactivate, onPostAttach, onStartWorkAreaProcessing, onEndWorkAreaProcessing et onStateChange. |
| `Weeder:onLoad(savegame: table)` | 75 | ✍ Charge les sons (client), lit isHoe et isGrasslandWeeder, initialise les accumulateurs de surface, le délai d'activation et les données de multiplicateur d'usure liées aux pierres (type WEEDER du stoneSystem), puis les besoins IA. |
| `Weeder:onDelete()` | 104 | ✍ Libère les sons de travail s'ils existent. |
| `Weeder:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 113 | ✍ Si l'outil travaille et possède des particules à couleur ajustable : relit la couleur du sol sous chaque noeud (couleur de trace de pneu si champ, attribut de terrain sinon), fait une transition de 1 s et l'envoie au paramètre de shader psColor du système de particules. Exécuté sur tout participant qui a ces particules (client ou hôte). Aucune lecture météo. |
| `Weeder:processWeederArea(workArea: any, dt: any)` | 157 | ✍ Applique le désherbage (et le rouleau prairie si isGrasslandWeeder) à la carte de densité, cumule les surfaces, met isWorking (vitesse > 0.5) et lit la présence de pierres si l'outil travaille. Renvoie la surface deux fois (réelle et totale identiques). |
| `Weeder:updateWeederAIRequirements()` | 190 | ✍ Déclare à l'IA les états de mauvaises herbes ciblés (via weedSystem:getWeederReplacements) sauf si un semoir est attelé ; sans lien avec les effets. Fin de fonction (lignes 230-240) non relue. |
| `Weeder:loadWorkAreaFromXML(superFunc: table, workArea: table, xmlFile: integer, key: string) → boolean` | 251 | ✍ Force le type de zone WEEDER lorsque le type lu est DEFAULT. |
| `Weeder:getIsWorkAreaActive(superFunc: table, workArea: table) → boolean` | 263 | ✍ Pour WEEDER : actif si contact sol (quand exigé) et, le cas échéant, marche avant uniquement ; ne regarde ni l'allumage ni le délai post-attelage. |
| `Weeder:doCheckSpeedLimit(superFunc: any) → boolean` | 281 | ✍ Applique la limite de vitesse dès que la chaîne d'outils est abaissée. |
| `Weeder:getDirtMultiplier(superFunc: any) → number` | 288 | ✍ Ajoute la salissure de travail pondérée par vitesse / limite de vitesse quand isWorking. |
| `Weeder:getWearMultiplier(superFunc: any) → number` | 302 | ✍ Ajoute l'usure de travail pondérée par vitesse / limite et par le multiplicateur de pierres (spec.stoneLastState). |
| `Weeder:loadGroundParticleMapping(superFunc: XMLFile, xmlFile: XMLFile, key: string, mapping: table, index: integer, i3dNode: integer) → boolean` | 326 | ✍ Étend le chargement d'une correspondance de particules de sol : lit adjustColor et, s'il est vrai, enregistre la correspondance dans spec.colorParticleSystems avec un tampon de couleur. |
| `Weeder:onStartWorkAreaProcessing(dt: any)` | 347 | ✍ Réinitialise isWorking et les surfaces avant la passe. |
| `Weeder:onEndWorkAreaProcessing(dt: any, hasProcessed: any)` | 356 | ✍ Serveur : déclare la surface travaillée (updateLastWorkedArea). Client : démarre/arrête le son de travail selon isWorking. |
| `Weeder:onStateChange(state: any, data: any)` | 382 | ✍ À l'attelage ou au dételage, recalcule les besoins IA. |
| `Weeder:onDeactivate()` | 390 | ✍ Coupe le son de travail. |
| `Weeder:onPostAttach(attacherVehicle: table, inputJointDescIndex: integer, jointDescIndex: integer)` | 403 | ✍ Arme startActivationTime (2000 ms), valeur non consultée ailleurs dans ce fichier. |
| `Weeder.getDefaultSpeedLimit() → number` | 411 | ✍ Limite de vitesse par défaut : 15. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `processWeederArea` | 44 |
| registerFunction | `updateWeederAIRequirements` | 45 |
| registerOverwrittenFunction | `doCheckSpeedLimit` | 51 |
| registerOverwrittenFunction | `getDirtMultiplier` | 52 |
| registerOverwrittenFunction | `getWearMultiplier` | 53 |
| registerOverwrittenFunction | `loadWorkAreaFromXML` | 54 |
| registerOverwrittenFunction | `getIsWorkAreaActive` | 55 |
| registerOverwrittenFunction | `loadGroundParticleMapping` | 56 |
| registerEventListener | `onLoad` | 62 |
| registerEventListener | `onDelete` | 63 |
| registerEventListener | `onUpdateTick` | 64 |
| registerEventListener | `onDeactivate` | 65 |
| registerEventListener | `onPostAttach` | 66 |
| registerEventListener | `onStartWorkAreaProcessing` | 67 |
| registerEventListener | `onEndWorkAreaProcessing` | 68 |
| registerEventListener | `onStateChange` | 69 |

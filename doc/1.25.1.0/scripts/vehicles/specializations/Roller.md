# vehicles/specializations/Roller.lua

Source: `dataS/scripts/vehicles/specializations/Roller.lua` — FS25 1.25.1.0

✍ Spécialisation des rouleaux (sol et prairie). Aucun effet ni particule propre : le fichier ne charge ni EffectManager, ni animationNodes ; seul un échantillon sonore de travail (vehicle.roller.sounds.work) est géré côté client. Les poussières/terre éventuelles d'un rouleau viennent donc d'autres spécialisations (WorkParticles, via getDoGroundManipulation, voir ci-dessous). TRAVAIL : processRollerArea efface d'abord les traces de pneus (eraseTireTrack, y compris sur un client éloigné), puis, sauf sur un client plus loin que Roller.CLIENT_DM_UPDATE_RADIUS (constante non définie dans ce fichier : valeur NON VÉRIFIÉE), appelle updateGrassRollerArea (rouleau prairie) et/ou updateRollerArea (rouleau sol, avec l'angle de la direction de l'outil converti en angle de carte de densité). Les fonctions FSDensityMapUtil étant sans corps dans le dump, leur effet exact sur le terrain est NON VÉRIFIÉ. CONDITIONS : zone active seulement si l'outil est abaissé (onlyActiveWhenLowered, vrai par défaut) et si 2000 ms se sont écoulées depuis l'attelage (startActivationTimeout) ; spec.isWorking = vitesse > 0.5 (unité de getLastSpeed : km/h, selon l'usage vanilla, non relu dans Vehicle). getDoGroundManipulation (surcharge) renvoie vrai seulement si isWorking : c'est l'interrupteur que WorkParticles.lua:238 consulte avec isOnField pour activer ses particules de sol (WorkParticles.getDoGroundManipulation renvoie vrai par défaut, WorkParticles.lua:311). MÉTÉO/HUMIDITÉ : aucune donnée lue. RÉSEAU : aucune variable synchronisée ; le dirtyFlag est alloué mais jamais levé dans ce fichier. dt : non utilisé hors signature. POINTS D'EXTENSION : fonctions enregistrées processRollerArea, updateRollerAIRequirements ; surcharges doCheckSpeedLimit, getDoGroundManipulation, getDirtMultiplier, getWearMultiplier, getIsWorkAreaActive ; événements onLoad, onDelete, onPostAttach, onDeactivate, onStartWorkAreaProcessing, onEndWorkAreaProcessing. Type de zone de travail : roller. Vitesse limite par défaut : 15.

- **Roller** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `Roller.initSpecialization()` | 31 | ✍ Déclare la configuration « roller » (choix de design) et le type de zone de travail roller (3 booléens de addWorkAreaType, signification non relue), puis enregistre le schéma XML sous vehicle.roller et sous chaque rollerConfiguration. |
| `Roller.registerRollerXMLPaths(schema: any, basePath: any)` | 46 | ✍ Enregistre les clés XML d'un rouleau : directionNode, onlyActiveWhenLowered (vrai), isSoilRoller (vrai), isGrassRoller (faux), usingAIRequirements (vrai) et les sons de travail. |
| `Roller.prerequisitesPresent(specializations: any)` | 57 | ✍ Exige la spécialisation WorkArea. |
| `Roller.registerFunctions(vehicleType: any)` | 63 | ✍ Enregistre processRollerArea et updateRollerAIRequirements sur le type de véhicule. |
| `Roller.registerOverwrittenFunctions(vehicleType: any)` | 70 | ✍ Surcharge doCheckSpeedLimit, getDoGroundManipulation, getDirtMultiplier, getWearMultiplier et getIsWorkAreaActive. |
| `Roller.registerEventListeners(vehicleType: any)` | 80 | ✍ S'abonne à onLoad, onDelete, onPostAttach, onDeactivate, onStartWorkAreaProcessing et onEndWorkAreaProcessing. |
| `Roller:onLoad(savegame: any)` | 91 | ✍ Lit la configuration de rouleau (ou vehicle.roller à défaut), le noeud de direction, les modes sol/prairie (sol par défaut si rien n'est indiqué), l'option onlyActiveWhenLowered, charge le son de travail côté client, fixe le délai d'activation (2000 ms) et initialise les besoins IA. |
| `Roller:onDelete()` | 142 | ✍ Libère les échantillons sonores. À noter : si aucun son n'a été chargé (serveur dédié), spec.samples est nil ; le comportement de deleteSamples sur nil n'est pas vérifié (non vérifié en jeu). |
| `Roller:processRollerArea(workArea: any, dt: any)` | 149 | ✍ Efface les traces de pneus de la zone, puis (hors client lointain) applique le rouleau à la carte de densité : prairie et/ou sol avec l'angle de l'outil. Met spec.isWorking à vrai si vitesse > 0.5. Renvoie la surface réellement traitée (peut valoir nil si ni mode sol ni mode prairie n'est actif : cas non relu). |
| `Roller:updateRollerAIRequirements()` | 177 | ✍ Déclare à l'IA les types de sol requis et les cultures interdites selon le mode (sol/prairie) ; ignoré si le rouleau est combiné à un semoir utilisant les exigences IA. Sans rapport avec les effets. |
| `Roller:doCheckSpeedLimit(superFunc: any)` | 239 | ✍ Applique la limite de vitesse du véhicule aussi lorsque le rouleau est en travail (isWorking), en plus de la logique parente. |
| `Roller:getDoGroundManipulation(superFunc: any)` | 247 | ✍ Ne renvoie vrai que si le rouleau travaille (isWorking) ; utilisé par WorkParticles pour autoriser les particules de sol. Pas de condition de culture ni de météo. |
| `Roller:getDirtMultiplier(superFunc: any)` | 254 | ✍ Ajoute le multiplicateur de salissure de travail quand isWorking (non proportionnel à la vitesse, contrairement à d'autres outils). |
| `Roller:getWearMultiplier(superFunc: any) → number` | 268 | ✍ Ajoute le multiplicateur d'usure de travail quand isWorking. |
| `Roller:getIsWorkAreaActive(superFunc: any, workArea: any)` | 281 | ✍ Pour la zone ROLLER : inactive pendant le délai post-attelage, ou si l'outil doit être abaissé et ne l'est pas ; sinon délègue au parent. |
| `Roller:onStartWorkAreaProcessing(dt: any)` | 298 | ✍ Avant chaque passe de traitement : calcule l'angle de la carte de densité depuis la direction de l'outil et remet isWorking à faux. |
| `Roller:onEndWorkAreaProcessing(dt: any, hasProcessed: any)` | 309 | ✍ Côté client : démarre ou arrête le son de travail selon isWorking. Pas d'effet visuel. |
| `Roller:onPostAttach(attacherVehicle: table, inputJointDescIndex: integer, jointDescIndex: integer)` | 332 | ✍ Arme le délai d'activation de 2000 ms après l'attelage. |
| `Roller:onDeactivate()` | 339 | ✍ Coupe le son de travail. |
| `Roller.getDefaultSpeedLimit()` | 347 | ✍ Limite de vitesse par défaut : 15. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `processRollerArea` | 64 |
| registerFunction | `updateRollerAIRequirements` | 65 |
| registerOverwrittenFunction | `doCheckSpeedLimit` | 71 |
| registerOverwrittenFunction | `getDoGroundManipulation` | 72 |
| registerOverwrittenFunction | `getDirtMultiplier` | 73 |
| registerOverwrittenFunction | `getWearMultiplier` | 74 |
| registerOverwrittenFunction | `getIsWorkAreaActive` | 75 |
| registerEventListener | `onLoad` | 81 |
| registerEventListener | `onDelete` | 82 |
| registerEventListener | `onPostAttach` | 83 |
| registerEventListener | `onDeactivate` | 84 |
| registerEventListener | `onStartWorkAreaProcessing` | 85 |
| registerEventListener | `onEndWorkAreaProcessing` | 86 |

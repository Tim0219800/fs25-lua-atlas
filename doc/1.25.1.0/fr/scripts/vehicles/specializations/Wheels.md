# vehicles/specializations/Wheels.lua

*[English version](../../../../scripts/vehicles/specializations/Wheels.md)*

Source: `dataS/scripts/vehicles/specializations/Wheels.lua` — FS25 1.25.1.0

✍ Spécialisation de véhicule (sans prérequis) qui possède la liste des roues (spec_wheels.wheels, objets Wheel), les moyeux, essieux, nœuds de direction (Ackermann), sons de surface et configurations de roues. C'est le point d'entrée de toute la chaîne roue : Wheels -> Wheel -> WheelPhysics / WheelEffects / WheelDestruction. DONNÉES MÉTÉO : lit weather:getGroundWetness() à chaque frame (onUpdate, Wheels.lua:844) et à chaque tick (onUpdateTick, Wheels.lua:935) puis la distribue aux roues ; une valeur numérique unique, dont l'implémentation (Weather) est absente du dump : NON VÉRIFIÉ (plage et unité non confirmées ici). La neige : abonnement au message MessageType.SNOW_HEIGHT_CHANGED (onWheelSnowHeightChanged). La pluie, le vent et la température ne sont pas lus ici ; ils arrivent aux fonctions de saleté (updateWheelDirtAmount, updateWheelMudAmount) comme paramètres rainScale / timeSinceLastRain / temperature fournis par Washable.lua (voir cette spécialisation). CONTACT PNEU/SOL : voir WheelPhysics (contact, densityType, hasSnowContact, hasWaterContact), utilisés ici pour les sons de surface (getCurrentSurfaceSound), la saleté des roues et la pente du véhicule (getVehicleWorldXRot, getVehicleWorldDirection, basés sur hasGroundContact). SALETÉ / BOUE : validateWashableNode détecte, par paramètres de shader dans les enfants de la roue, les nœuds « scratches_dirt_snow_wetness » (saleté + neige + humidité) et « mudAmount » (boue 3D) et leur associe des fonctions de mise à jour de saleté spécifiques aux roues. EFFET SUR LE MONDE : destruction des cultures et neige par les roues (WheelDestruction.update appelé ici, Wheels.lua:865, seulement si le véhicule est actif, option de sauvegarde fruitDestruction active, sans IA, et sans blocage par le véhicule) ; déformation du terrain désactivée pendant le travail d'une IA (onAIFieldWorkerStart/End, onAIImplementStart/End). CADENCE : le compteur currentUpdateIndex cycle de 1 à 4 à chaque frame pour répartir la mesure de contact entre les roues ; dt est en ms. RÉSEAU : seules les roues avec physics.isSynchronized sont envoyées (flux initial et flux de mise à jour, drapeau sale levé en continu côté serveur dès qu'il y a des roues) ; le client interpole (networkTimeInterpolator) et n'exécute pas la physique. Événements déclarés : onBrake, onFinishedWheelLoading, onWheelConfigurationChanged. Points d'extension pour un moddeur : fonctions enregistrées surchargeables par type de véhicule (updateWheelDirtAmount et updateWheelMudAmount sont des registerFunction, donc remplaçables pour changer la logique de boue/saleté de roue ; getCurrentSurfaceSound, getBrakeForce, brake, getWheels), surcharges déclarées (validateWashableNode, addToPhysics, getVehicleWorldXRot...), événements ci-dessus et listeners onUpdate/onUpdateTick. À noter : setCustomBrakeForce est enregistré par registerFunction mais aucune définition de Wheels.setCustomBrakeForce n'existe dans ce fichier (non vérifié en jeu : fonction nil ou définie ailleurs) ; Wheels:getBrakeForce renvoie spec.customBrakeForce (0 par défaut). Le fichier fait 2489 lignes : le chargement XML des roues, des essieux, des moyeux et des valeurs de magasin n'a pas été relu en détail.

- **Wheels** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Wheels.prerequisitesPresent(specializations: any)` | 29 | ✍ Aucun prérequis (renvoie toujours vrai). |
| `Wheels.registerEvents(vehicleType: any)` | 35 | ✍ Déclare les événements onBrake, onFinishedWheelLoading et onWheelConfigurationChanged. |
| `Wheels.registerFunctions(vehicleType: any)` | 43 | ✍ Enregistre les fonctions de la spécialisation (chargement de roues/moyeux, accès, freinage, sons de surface, updateWheelDirtAmount, updateWheelMudAmount, onWheelSnowHeightChanged, direction...). Elles sont donc remplaçables par un mod via les mécanismes de SpecializationUtil. Enregistre aussi setCustomBrakeForce, non définie dans ce fichier. |
| `Wheels.registerOverwrittenFunctions(vehicleType: any)` | 79 | ✍ Déclare les surcharges : addToPhysics, removeFromPhysics, getComponentMass, getVehicleWorldXRot, getVehicleWorldDirection, validateWashableNode, getAIDirectionNode, getAIRootNode, getSupportsMountKinematic, loadBendingNodeFromXML. |
| `Wheels.registerEventListeners(vehicleType: any)` | 94 | ✍ Abonne la spécialisation à onPreLoad, onLoad, onLoadFinished, onRegisterDashboardValueTypes, onDelete, flux réseau, onUpdate, onPostUpdate, onUpdateTick, onUpdateEnd, onLeaveVehicle, onPreAttach, onPostDetach, onRegisterAnimationValueTypes, onPostAttachImplement et événements IA. |
| `Wheels.initSpecialization()` | 121 | ✍ Enregistre le schéma XML de la spécialisation (wheels, roues, moyeux, configurations, essieux, sons de surface, Ackermann) et les chemins de sauvegarde. Non relu en détail. |
| `Wheels.registerAckermannSteeringXMLPaths(schema: any, key: any)` | 288 | ✍ Déclare les clés XML de la direction Ackermann. |
| `Wheels:onPreLoad(savegame: any)` | 301 | ✍ Lit l'identifiant de configuration de roues et applique une configuration générée si elle existe. |
| `Wheels:onLoad(savegame: any)` | 318 | ✍ Charge la configuration de roues : matériaux de jante/moyeu, roues (loadWheelsFromXML), moyeux, nœuds de direction, essieux, sons de surface par type de pneu (type wheel_<nom> ou wheel), drapeau réseau, abonnement à SNOW_HEIGHT_CHANGED . Non relu intégralement. |
| `Wheels:onLoadFinished(savegame: any)` | 547 | ✍ Serveur : ajoute la masse des roues à la masse par défaut du véhicule ; si la configuration de roues sauvegardée a changé, remet à zéro la saleté et la boue des roues et lève onWheelConfigurationChanged ; applique les matériaux de jante, moyeu et boulons ; appelle ensuite Wheel:update une fois avec dt = 99999, groundWetness = 0 et force vrai pour placer les roues visuelles (Wheels.lua:633). |
| `Wheels:onRegisterDashboardValueTypes()` | 639 | ✍ Déclare des valeurs de tableau de bord liées aux roues. Non relu. |
| `Wheels:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 690 | ✍ Sauvegarde l'identifiant de configuration de roues (#lastConfigId). |
| `Wheels:onDelete()` | 699 | ✍ Libère fichiers I3D partagés, moyeux, roues, roues chargées dynamiquement et sons de surface. |
| `Wheels:onReadStream(streamId: any, connection: any)` | 731 | ✍ Client : réinitialise l'interpolateur temporel et lit l'état de chaque roue synchronisée (avec mise à jour directe). |
| `Wheels:onWriteStream(streamId: any, connection: any)` | 748 | ✍ Serveur : écrit l'état de chaque roue synchronisée. |
| `Wheels:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 762 | ✍ Client : lit, si le drapeau est présent, l'état de chaque roue synchronisée et le temps de rotation (rotatedTime, 8 bits) comme cibles d'interpolation. Non relu entièrement. |
| `Wheels:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 793 | ✍ Serveur : écrit l'état des roues synchronisées et rotatedTime (8 bits) quand le drapeau sale est levé. |
| `Wheels:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 819 | ✍ Par frame. Client pur : interpolation réseau des roues et de rotatedTime. Après la première mise à jour : lit weather:getGroundWetness() une fois, appelle Wheel:update pour chaque roue (avec le compteur cyclique 1..4), puis, si le véhicule est actif, la destruction des cultures/neige (sauf IA, option de sauvegarde désactivée ou blocage), les essieux (serveur), les sons de surface et les nœuds de direction. Le serveur lève le drapeau réseau à chaque frame s'il y a des roues. |
| `Wheels:onPostUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 917 | ✍ Serveur : appelle postUpdate des roues pour appliquer position/friction en attente. |
| `Wheels:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 932 | ✍ Par tick : relit weather:getGroundWetness() et appelle Wheel:updateTick avec la distance de mise à jour du véhicule (pilote couleur/saleté de piste et effets de roue). |
| `Wheels:onUpdateEnd(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 947 | ✍ Client : appelle onUpdateEnd des roues (arrêt d'effets) et coupe le son de surface en cours. |
| `Wheels:loadHubsFromXML()` | 963 | ✍ Charge tous les moyeux déclarés dans vehicle.wheels.hubs.hub. |
| `Wheels.loadHubMaterial(vehicle: any, xmlFile: any, key: any, hub: any, materialName: any)` | 974 | ✍ Charge le matériau d'un moyeu (base, jante ou couleur de design selon les options XML). |
| `Wheels:loadHubFromXML(xmlFile: any, key: any)` | 1004 | ✍ Charge un moyeu : modèle I3D partagé, lien, matériaux. Non relu en détail. |
| `Wheels:onWheelHubI3DLoaded(i3dNode: integer, failedReason: table, args: table)` | 1054 | ✍ Rappel de chargement I3D d'un moyeu : l'attache au nœud de roue. Non relu en détail. |
| `Wheels:loadAckermannSteeringFromXML(xmlFile: any, ackermannSteeringIndex: any, ackermannSteeringAngle: any)` | 1120 | ✍ Charge un réglage de direction Ackermann. Non relu en détail. |
| `Wheels:loadWheelsFromXML(xmlFile: any, key: any, wheelConfigurationId: any)` | 1287 | ✍ Charge toutes les roues de la configuration donnée en instanciant Wheel.new. Non relu en détail. |
| `Wheels:loadWheelFromXML(wheel: any)` | 1314 | ✍ Charge une roue en appelant wheel:loadFromXML ; renvoie son résultat (fonction enregistrée, donc remplaçable). |
| `Wheels:onLoadWheelChockFromXML(wheelChock: any)` | 1320 | ✍ Crochet appelé pour chaque cale de roue chargée (corps vide : point d'extension). |
| `Wheels:getIsWheelChockAllowed(wheelChock: any)` | 1325 | ✍ Indique si une cale de roue est autorisée (renvoie vrai par défaut). |
| `Wheels:addToPhysics(superFunc: any)` | 1331 | ✍ Surcharge : après le parent, ajoute chaque roue à la physique avec la force de freinage courante, puis serre le frein à fond côté serveur. |
| `Wheels:removeFromPhysics(superFunc: any)` | 1352 | ✍ Surcharge : retire les roues de la physique côté serveur. |
| `Wheels:getComponentMass(superFunc: boolean, component: any) → number` | 1369 | ✍ Surcharge : ajoute la masse des roues portées par le composant. |
| `Wheels:getVehicleWorldXRot(superFunc: any) → number` | 1385 | ✍ Surcharge : estime l'inclinaison longitudinale du véhicule à partir de la hauteur des roues en contact avec le sol (hasGroundContact). Non relu en détail. |
| `Wheels:getVehicleWorldDirection(superFunc: any) → number, number, number` | 1433 | ✍ Surcharge : estime la direction du véhicule à partir des roues en contact avec le sol. Non relu en détail. |
| `Wheels:validateWashableNode(superFunc: any, node: any)` | 1502 | ✍ Surcharge pour Washable : une fois le véhicule chargé, repère dans chaque roue les nœuds de shader « scratches_dirt_snow_wetness » (saleté, neige, humidité) et « mudAmount » (boue) et leur associe des données de saleté propres à la roue (multiplicateurs champ/route, facteur d'eau, vitesse de changement de couleur) et les fonctions updateWheelDirtAmount ou updateWheelMudAmount. Sauvegarde la valeur snowScale de la roue. Pour la boue, fait pivoter aléatoirement le maillage et applique un multiplicateur de nettoyage de 4. Sinon, délègue au parent. |
| `Wheels:getAIDirectionNode(superFunc: any)` | 1575 | ✍ Surcharge : renvoie le nœud de centre de direction des roues s'il existe, sinon le résultat du parent. |
| `Wheels:getAIRootNode(superFunc: any)` | 1581 | ✍ Surcharge : idem getAIDirectionNode (centre de direction des roues, sinon parent). |
| `Wheels:getSupportsMountKinematic(superFunc: any)` | 1587 | ✍ Surcharge : montage cinématique supporté seulement si le véhicule n'a aucune roue et que le parent l'autorise. |
| `Wheels:loadBendingNodeFromXML(superFunc: any, xmlFile: any, key: any, bendingNode: any, ...: any)` | 1593 | ✍ Surcharge : lit #wheelIndices d'un nœud de déformation de feuillage pour l'associer à des roues. Non relu en détail. |
| `Wheels:updateWheelDirtAmount(nodeData: any, dt: any, allowsWashingByRain: any, rainScale: any, timeSinceLastRain: any, temperature: any)` | 1633 | ✍ Fonction de saleté pour un nœud de roue, appelée par Washable avec rainScale, timeSinceLastRain et temperature. Retourne la variation de saleté et d'humidité. N'agit que si la roue touche quelque chose (ou mise à jour forcée). Sur sol de champ, saleté x fieldDirtMultiplier ; hors champ et hors herbage, la saleté diminue proportionnellement à la vitesse (streetDirtMultiplier), multipliée par 0.15 quand rainScale > 0.1 (la boue colle plus par temps de pluie, d'après le commentaire du code). Limite l'écart entre la saleté de la roue et la saleté globale du véhicule. Fait évoluer snowScale (vers 1 avec contact neige et température < 1, sinon retour lent) et la couleur du nœud entre couleur de saleté et couleur de neige (environment:getDirtColors, non vérifié). L'humidité augmente avec waterWetnessFactor en cas de contact avec l'eau, diminue avec la vitesse sinon (séchage par rotation). |
| `Wheels:updateWheelMudAmount(nodeData: any, dt: any, allowsWashingByRain: any, rainScale: any, timeSinceLastRain: any, temperature: any)` | 1712 | ✍ Fonction de boue 3D pour les nœuds mudAmount : suit la saleté de la roue associée. Quantité maximale de boue = WheelEffects.MAX_MUD_AMOUNT[type de sol] (table non définie ici : NON VÉRIFIÉ), réduite de moitié quand rainScale <= 0.1 (boue pleine seulement par temps de pluie). Dépose de la boue si la saleté de roue dépasse 0.75 et que le maximum n'est pas atteint, retire sinon, selon la vitesse. L'humidité et la couleur suivent celles du nœud de roue. |
| `Wheels:forceUpdateWheelPhysics(dt: any)` | 1758 | ✍ Réapplique frein et propriétés physiques à toutes les roues. |
| `Wheels:onWheelSnowHeightChanged(heightPct: any, heightAbs: any)` | 1767 | ✍ Message SNOW_HEIGHT_CHANGED : quand la hauteur de neige tombe à 0 ou moins, remet snowScale des roues à zéro, force la mise à jour de la saleté et réveille le véhicule. |
| `Wheels:getSteeringNodeByNode(node: any)` | 1788 | ✍ Retourne le nœud de direction associé à un nœud donné (non relu). |
| `Wheels:updateSteeringNodes(dt: any)` | 1801 | ✍ Met à jour les nœuds de direction à partir de rotatedTime et de leurs limites (non relu en détail). |
| `Wheels:updateSteeringNodeBar(steeringNode: table, steeringAngle: number)` | 1861 | ✍ Applique la rotation/translation de la barre de direction visuelle (non relu en détail). |
| `Wheels:getCurrentSurfaceSound()` | 1890 | ✍ Renvoie l'échantillon sonore correspondant à la surface sous la première roue à état de contact synchronisé (ou la dernière roue), d'après WheelPhysics:getSurfaceSoundAttributes. |
| `Wheels:getAreSurfaceSoundsActive()` | 1910 | ✍ Les sons de surface sont actifs si le véhicule est actif pour le son local (isActiveForLocalSound). |
| `Wheels:getIsVersatileYRotActive(wheel: any)` | 1916 | ✍ Renvoie vrai : les roues pivotantes libres sont toujours actives (peut être surchargé). |
| `Wheels:getWheelFromWheelIndex(wheelIndex: any)` | 1922 | ✍ Renvoie la roue d'indice donné (1..n). |
| `Wheels:getWheelByWheelNode(wheelNode: any)` | 1928 | ✍ Retrouve une roue par nœud (repr, driveNode ou linkNode) ou nom i3dMapping. |
| `Wheels:getWheels()` | 1952 | ✍ Renvoie la liste des roues du véhicule (spec_wheels.wheels). Point d'accès standard pour un mod qui veut lire contact, sol, glissement par roue. |
| `Wheels:brake(brakePedal: any)` | 1958 | ✍ Fixe la pédale de frein (0..1) sur toutes les roues et lève onBrake si elle change. |
| `Wheels:getBrakeForce()` | 1978 | ✍ Renvoie la force de freinage personnalisée (0 par défaut). |
| `Wheels:onLeaveVehicle()` | 1985 | ✍ Serveur : à la sortie du véhicule, met couple à zéro et applique le freinage courant aux roues. |
| `Wheels:onPreAttach()` | 1997 | ✍ Appelle onPreAttach de chaque roue (cales de roue). |
| `Wheels:onPostDetach()` | 2006 | ✍ Appelle onPostDetach de chaque roue (cales de roue). |
| `Wheels:getSteeringRotTimeByCurvature(curvature: any)` | 2015 | ✍ Convertit une courbure en temps de rotation de volant (Ackermann) ; non relu en détail. |
| `Wheels:getTurningRadiusByRotTime(rotTime: any)` | 2050 | ✍ Convertit un temps de rotation du volant en rayon de braquage ; non relu en détail. |
| `Wheels:onRegisterAnimationValueTypes()` | 2074 | ✍ Déclare des valeurs d'animation liées aux roues ; non relu en détail. |
| `Wheels:onPostAttachImplement(object: any, inputJointDescIndex: any, jointDescIndex: any, loadFromSavegame: any)` | 2227 | ✍ Relance l'événement onBrake pour que la force de freinage du nouvel outil soit prise en compte. |
| `Wheels:onAIFieldWorkerStart()` | 2235 | ✍ Désactive la déformation du terrain et sa collision pour toutes les roues pendant le travail de l'IA. |
| `Wheels:onAIImplementStart()` | 2245 | ✍ Idem : désactive la déformation du terrain pour l'outil conduit par l'IA. |
| `Wheels:onAIFieldWorkerEnd()` | 2255 | ✍ Réactive la déformation du terrain et sa collision. |
| `Wheels:onAIImplementEnd()` | 2265 | ✍ Réactive la déformation du terrain et sa collision. |
| `Wheels:getWheelSuspensionModfier()` | 2275 | ✍ Mesure la dispersion de compression de suspension entre roues (écart maximal à la moyenne) ; le nom est écrit ainsi dans le code (Modfier). |
| `Wheels.getTireNames(instance: any)` | 2303 | ✍ Liste les noms de pneus des roues d'une instance de véhicule (utilisé pour la fiche magasin). |
| `Wheels.getBrands(items: any)` | 2330 | ✍ Liste les marques de pneus d'après une liste d'éléments (magasin) ; non relu en détail. |
| `Wheels.getWheelsByBrand(items: any, brand: any)` | 2345 | ✍ Filtre des éléments de roue par marque ; non relu en détail. |
| `Wheels.loadSpecValueWheelWeight(xmlFile: any, customEnvironment: any, baseDir: any)` | 2358 | ✍ Valeur de fiche magasin : masse des roues d'après la configuration de roues par défaut ou sélectionnable ; non relu en détail. |
| `Wheels.loadSpecValueWheels(xmlFile: any, customEnvironment: any, baseDir: any)` | 2408 | ✍ Valeur de fiche magasin : liste de roues (non relu en détail). |
| `Wheels.getSpecValueWheels(storeItem: any, realItem: any)` | 2415 | ✍ Valeur de fiche magasin : noms de pneus de l'objet réel, séparés par « / »; nil sans objet réel. |
| `Wheels.createConfigToParentConfigMapping(xmlFile: table) → table, table` | 2465 | ✍ Construit la correspondance entre configurations de roues et configuration de base (#baseConfig) ; signale une auto-référence comme erreur XML. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEvent | `onBrake` | 36 |
| registerEvent | `onFinishedWheelLoading` | 37 |
| registerEvent | `onWheelConfigurationChanged` | 38 |
| registerFunction | `getSteeringRotTimeByCurvature` | 44 |
| registerFunction | `getTurningRadiusByRotTime` | 45 |
| registerFunction | `loadHubsFromXML` | 47 |
| registerFunction | `loadHubFromXML` | 48 |
| registerFunction | `onWheelHubI3DLoaded` | 49 |
| registerFunction | `loadAckermannSteeringFromXML` | 51 |
| registerFunction | `loadWheelsFromXML` | 53 |
| registerFunction | `loadWheelFromXML` | 54 |
| registerFunction | `onLoadWheelChockFromXML` | 56 |
| registerFunction | `getIsWheelChockAllowed` | 57 |
| registerFunction | `getIsVersatileYRotActive` | 59 |
| registerFunction | `getWheelFromWheelIndex` | 60 |
| registerFunction | `getWheelByWheelNode` | 61 |
| registerFunction | `getWheels` | 62 |
| registerFunction | `getCurrentSurfaceSound` | 63 |
| registerFunction | `getAreSurfaceSoundsActive` | 64 |
| registerFunction | `brake` | 65 |
| registerFunction | `getBrakeForce` | 66 |
| registerFunction | `setCustomBrakeForce` | 67 |
| registerFunction | `updateWheelDirtAmount` | 68 |
| registerFunction | `updateWheelMudAmount` | 69 |
| registerFunction | `forceUpdateWheelPhysics` | 70 |
| registerFunction | `onWheelSnowHeightChanged` | 71 |
| registerFunction | `getSteeringNodeByNode` | 72 |
| registerFunction | `updateSteeringNodes` | 73 |
| registerFunction | `updateSteeringNodeBar` | 74 |
| registerOverwrittenFunction | `addToPhysics` | 80 |
| registerOverwrittenFunction | `removeFromPhysics` | 81 |
| registerOverwrittenFunction | `getComponentMass` | 82 |
| registerOverwrittenFunction | `getVehicleWorldXRot` | 83 |
| registerOverwrittenFunction | `getVehicleWorldDirection` | 84 |
| registerOverwrittenFunction | `validateWashableNode` | 85 |
| registerOverwrittenFunction | `getAIDirectionNode` | 86 |
| registerOverwrittenFunction | `getAIRootNode` | 87 |
| registerOverwrittenFunction | `getSupportsMountKinematic` | 88 |
| registerOverwrittenFunction | `loadBendingNodeFromXML` | 89 |
| registerEventListener | `onPreLoad` | 95 |
| registerEventListener | `onLoad` | 96 |
| registerEventListener | `onLoadFinished` | 97 |
| registerEventListener | `onRegisterDashboardValueTypes` | 98 |
| registerEventListener | `onDelete` | 99 |
| registerEventListener | `onReadStream` | 100 |
| registerEventListener | `onWriteStream` | 101 |
| registerEventListener | `onReadUpdateStream` | 102 |
| registerEventListener | `onWriteUpdateStream` | 103 |
| registerEventListener | `onUpdate` | 104 |
| registerEventListener | `onPostUpdate` | 105 |
| registerEventListener | `onUpdateTick` | 106 |
| registerEventListener | `onUpdateEnd` | 107 |
| registerEventListener | `onLeaveVehicle` | 108 |
| registerEventListener | `onPreAttach` | 109 |
| registerEventListener | `onPostDetach` | 110 |
| registerEventListener | `onRegisterAnimationValueTypes` | 111 |
| registerEventListener | `onPostAttachImplement` | 112 |
| registerEventListener | `onAIFieldWorkerStart` | 113 |
| registerEventListener | `onAIImplementStart` | 114 |
| registerEventListener | `onAIFieldWorkerEnd` | 115 |
| registerEventListener | `onAIImplementEnd` | 116 |

## Messages

- s'abonne à `MessageType.SNOW_HEIGHT_CHANGED` (l.542)

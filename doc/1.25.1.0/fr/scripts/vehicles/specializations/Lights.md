# vehicles/specializations/Lights.lua

*[English version](../../../../scripts/vehicles/specializations/Lights.md)*

Source: `dataS/scripts/vehicles/specializations/Lights.lua` — FS25 1.25.1.0

✍ Spécialisation d'éclairage des véhicules (spec_lights) : feux de croisement/route, feux de travail, de stop, de recul, clignotants, gyrophares, feux d'intérieur, feux de jour, feux hauts/bas. Elle pilote deux familles de feux décrites dans le XML du véhicule : les feux statiques (StaticLight : matériaux/shaders émissifs, sans source lumineuse) et les feux réels (RealLight : sources de lumière du moteur). Les classes StaticLight, SharedLight, StaticLightCompound et BeaconLight sont dans d'autres fichiers ; seul RealLight.lua est présent dans le dump (vehicles/specializations/components/RealLight.lua).

MODÈLE DE DONNÉES. L'état est un masque de bits spec.lightsTypesMask : le bit n correspond au type de lumière n. Les valeurs des constantes Lights.LIGHT_TYPE_* et Lights.TURNLIGHT_* sont NON VÉRIFIÉES : elles sont définies dans l'en-tête du fichier, dont les lignes sont vides dans le dump (on voit seulement que LIGHT_TYPE_DEFAULT, LIGHT_TYPE_WORK_BACK, LIGHT_TYPE_WORK_FRONT et LIGHT_TYPE_HIGHBEAM existent). Les types « de base » vont jusqu'à maxLightState (au moins HIGHBEAM) ; la spécialisation ajoute huit types juste après : bottomLight, topLight, brakeLight, turnLightLeft, turnLightRight, turnLightAny, reverseLight, interiorLight (limite totale de 31 bits, onLoad). Les états successifs de la touche de lumière viennent de vehicle.lights.states.state(?)#lightTypes ; automaticState#lightTypes (défaut « 0 ») et #lightTypesWork (défaut « 0 1 2 ») servent aux éclairages automatiques.

FEUX RÉELS ET PROFILS. Deux jeux de feux réels sont chargés : realLights.low et realLights.high. Un seul est actif : getUseHighProfile compare le réglage LIGHTS_PROFILE à GS_PROFILE_HIGH (réglage forçable par Platform.gameplay.lightsProfile). Dans setLightsTypesMask le profil inactif reçoit un masque nul. Pour un mod de brouillard : pour savoir si un phare est allumé, lire getLightsTypesMask() et tester le bit voulu, ou écouter l'événement onLightsTypesMaskChanged ; pour retrouver la source de lumière d'un phare, getRealLightFromNode puis les champs de l'objet RealLight. À noter dans RealLight.lua : la diffusion de lumière dans l'air (setLightUseLightScattering, setLightScatteringConeAngle, setLightScatteringIntensity fixée à 1) est activée par RealLight:updateLightScattering (components/RealLight.lua:212-258) seulement si la source a une portée supérieure à 7.5, avec le profil haut pour les feux par défaut/route et le profil très haut pour les autres feux typés. C'est l'effet natif de « faisceau visible » ; son rendu dans un brouillard et son interaction avec le brouillard du moteur sont NON VÉRIFIÉS (code moteur et classe Environment absents du dump).

RÉSEAU. Le serveur ajoute lui-même les bits supplémentaires (clignotants, haut/bas, stop, recul, intérieur) et diffuse VehicleSetLightEvent (masque sur totalNumLightTypes bits) ; le client reçoit le masque complet mais recalcule localement les bits haut/bas et intérieur. Clignotants (VehicleSetTurnLightEvent) et gyrophares (VehicleSetBeaconLightEvent) ont leur propre événement. À la connexion, onWriteStream envoie masque et état des gyrophares.

TEMPS. Aucun dt dans ce fichier : le clignotement est calculé à partir de getShaderTimeSec() ; onUpdate relance raiseActive tant qu'un clignotant est actif. Les feux de jour suivent onStartMotor / onStopMotor. L'éclairage automatique (updateAutomaticLights) ne dépend que de environment.isSunOn (Environment absent du dump) : aucune lecture de brouillard, pluie ou visibilité n'apparaît ici. La luminosité des feux d'intérieur dépend de l'heure (voir getInteriorLightBrightness).

POINTS D'EXTENSION. Événements déclarés : onTurnLightStateChanged, onTopLightsVisibilityChanged, onBrakeLightsVisibilityChanged, onReverseLightsVisibilityChanged, onLightsTypesMaskChanged, onBeaconLightsVisibilityChanged. Fonctions surchargées ici : loadDashboardGroupFromXML, getIsDashboardGroupActive. Fonctions prévues pour être surchargées par d'autres spécialisations : getIsActiveForInteriorLights (faux ici, surchargée par Motorized) et getDeactivateLightsOnLeave (vrai ici, surchargée par Motorized). Abonnements au centre de messages : DAY_NIGHT_CHANGED, changement du réglage LIGHTS_PROFILE, changement du réglage REAL_BEACON_LIGHTS. À noter : ils sont faits dans onLoad et aucun désabonnement n'apparaît dans ce fichier, y compris dans onDelete (non vérifié en jeu).

- **Lights** (l.21)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Lights.prerequisitesPresent(specializations: table) → boolean` | 68 | ✍ Renvoie toujours vrai : aucun prérequis de spécialisation. |
| `Lights.initSpecialization()` | 74 | ✍ Enregistre le type de configuration « beaconLight » et les chemins XML : états de lumière, feux statiques par catégorie (par défaut, haut, bas, stop, recul, jour, clignotants), compounds, feux partagés, gyrophares (avec #alwaysActive et configurations), sons, tableaux de bord et attributs #isTopLight / #isBottomLight. #reverseLightActivationSpeed vaut 1 km/h par défaut. |
| `Lights.registerRealLightSetupXMLPath(schema: any, basePath: any)` | 132 | ✍ Enregistre pour un profil réel (low ou high) les sous-clés light, topLight, bottomLight, brakeLight, reverseLight, dayTimeLight, turnLightLeft, turnLightRight et interiorLight via RealLight.registerXMLPaths. |
| `Lights.registerEvents(vehicleType: any)` | 146 | ✍ Déclare les six événements publiés par la spécialisation (clignotants, feux hauts, stop, recul, masque des types, gyrophares). |
| `Lights.registerFunctions(vehicleType: any)` | 157 | ✍ Enregistre les fonctions publiques d'éclairage (masque, gyrophares, clignotants, feux hauts/stop/recul/intérieur, accès aux feux par nœud, éclairage automatique). |
| `Lights.registerOverwrittenFunctions(vehicleType: any)` | 192 | ✍ Surcharge loadDashboardGroupFromXML et getIsDashboardGroupActive pour y ajouter les filtres de types de lumière. |
| `Lights.registerEventListeners(vehicleType: any)` | 199 | ✍ Abonne la spécialisation au cycle de vie, au réseau, aux actions d'entrée, à l'entrée/sortie du véhicule, au moteur (onStartMotor/onStopMotor), à l'attelage, à l'IA et au train automatique, à la physique du véhicule (onVehiclePhysicsUpdate) et au changement d'exigence des feux hauts. |
| `Lights:onLoad(savegame: table)` | 233 | ✍ Lit le seuil de vitesse de recul (valeur XML en km/h divisée par 3600), les états de lumière, les masques automatiques, charge les feux réels (profils low et high), feux statiques, compounds, feux partagés et gyrophares (configuration et toujours-actifs), calcule maxLightState et les huit types supplémentaires, charge les sons et s'abonne aux messages jour/nuit et réglages de lumière. À noter : le test « self.isClient ~= nil » avant le chargement des sons est vrai même sur serveur (intention probable : self.isClient ; non vérifié en jeu). |
| `Lights:onLoadFinished(savegame: table)` | 414 | ✍ Ajoute les types supplémentaires aux listes de types des feux haut/bas/stop/recul/clignotants/intérieur (clignotants marqués clignotants), finalise chaque feu réel (realLight:finalize) et, dans la salle d'exposition, allume les feux de jour. |
| `Lights:onRegisterDashboardValueTypes()` | 453 | ✍ Enregistre les valeurs de tableau de bord d'éclairage (état de lumière, clignotants, gyrophare). Non relu en détail. |
| `Lights:onDelete()` | 525 | ✍ Supprime feux partagés, gyrophares, fichiers XML de feux en cours de chargement, libère les I3D partagés, vide les compounds et supprime les sons. Aucun désabonnement du centre de messages n'y figure. |
| `Lights:onReadStream(streamId: integer, connection: Connection)` | 573 | ✍ Lecture à la connexion : masque de types (totalNumLightTypes bits) puis état des gyrophares, appliqués sans renvoi réseau. |
| `Lights:onWriteStream(streamId: integer, connection: Connection)` | 587 | ✍ Écriture à la connexion du masque de types et de l'état des gyrophares. |
| `Lights:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 599 | ✍ Client : tant qu'un clignotant est actif, calcule un coefficient de charge de 0 à 1 à partir de la fraction du temps de shader (période d'une seconde) et l'applique aux feux de clignotant gauche/droite ; joue le son de clignotant à chaque période pour le véhicule actif ; maintient le véhicule actif. Aucun dt utilisé. |
| `Lights:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 635 | ✍ Client : active ou coupe les gyrophares « toujours actifs » quand le véhicule devient actif pour les feux, met à jour les feux intérieurs, l'activité des actions d'entrée et, si Platform.gameplay.automaticLights, l'éclairage automatique du véhicule racine non conduit par l'IA selon environment.isSunOn et le sens de marche. |
| `Lights:getIsActiveForLights(onlyPowered: any) → boolean` | 670 | ✍ Vrai si le joueur est dans le véhicule et peut commander les lumières, ou si le véhicule attelant l'est (récursif). Avec onlyPowered, exige getIsPowered. |
| `Lights:getIsActiveForInteriorLights() → boolean` | 691 | ✍ Renvoie faux par défaut ; Motorized le surcharge pour renvoyer vrai quand le contact est mis. |
| `Lights:getCanToggleLight() → boolean` | 698 | ✍ Faux si l'IA conduit ou si aucun type de lumière n'est défini ; sinon vrai uniquement pour le véhicule actuellement occupé par le joueur local. |
| `Lights:getUseHighProfile() → boolean` | 719 | ✍ Vrai si le réglage LIGHTS_PROFILE (ou Platform.gameplay.lightsProfile s'il est défini) est supérieur ou égal à GS_PROFILE_HIGH : sélectionne les feux réels du profil haut. |
| `Lights:setNextLightsState(increment: any)` | 728 | ✍ Passe à l'état de lumière suivant (ou précédent) dans la liste des états du XML, revient à zéro après le dernier ou si des feux étaient allumés depuis l'état 0, recompose le masque en conservant les bits supplémentaires puis appelle setLightsTypesMask. |
| `Lights:setLightsTypesMask(lightsTypesMask: integer, force: boolean, noEventSend: boolean) → boolean` | 761 | ✍ Cœur du système : compose les bits supplémentaires (serveur : clignotants, haut/bas, stop, recul, intérieur ; client : haut/bas et intérieur localement), diffuse VehicleSetLightEvent sauf noEventSend, joue le son de commutation si les bits de base changent, applique le masque à tous les feux statiques et compounds et aux feux réels du profil actif (masque 0 pour l'autre), met à jour le tableau de bord et lève onLightsTypesMaskChanged. Point d'entrée à observer pour synchroniser un effet de brouillard sur les phares. |
| `Lights:getLightsTypesMask() → integer` | 871 | ✍ Renvoie le masque courant des types de lumière actifs. |
| `Lights:setBeaconLightsVisibility(visibility: boolean, force: boolean, noEventSend: boolean) → boolean` | 881 | ✍ Active ou coupe les gyrophares, diffuse VehicleSetBeaconLightEvent, active aussi l'état « dispositif » si le véhicule est actif pour l'entrée, met à jour le tableau de bord et lève onBeaconLightsVisibilityChanged. |
| `Lights:getBeaconLightsVisibility() → boolean` | 919 | ✍ Renvoie l'état des gyrophares. |
| `Lights:setTurnLightState(state: integer, force: boolean, noEventSend: boolean) → boolean` | 929 | ✍ Définit l'état des clignotants (constantes Lights.TURNLIGHT_*), diffuse VehicleSetTurnLightEvent, mémorise le profil de feux actif pour les clignotants, réinitialise le compteur de répétition du son, recalcule le masque côté serveur et lève onTurnLightStateChanged. |
| `Lights:getTurnLightState() → integer` | 967 | ✍ Renvoie l'état des clignotants. |
| `Lights:setTopLightsVisibility(visibility: boolean) → boolean` | 975 | ✍ Choisit entre feux hauts et feux bas, recalcule le masque sans diffusion réseau et lève onTopLightsVisibilityChanged. |
| `Lights:setBrakeLightsVisibility(visibility: boolean) → boolean` | 993 | ✍ Active ou coupe le bit des feux stop, recalcule le masque et lève onBrakeLightsVisibilityChanged. |
| `Lights:setReverseLightsVisibility(visibility: boolean) → boolean` | 1011 | ✍ Active ou coupe le bit des feux de recul, recalcule le masque et lève onReverseLightsVisibilityChanged. |
| `Lights:setInteriorLightsVisibility(visibility: boolean) → boolean` | 1029 | ✍ Active ou coupe les feux d'intérieur selon la luminosité horaire (éteints si elle vaut 0) ; force le recalcul du masque sans diffusion. |
| `Lights:getInteriorLightBrightness(updateState: boolean) → number, boolean` | 1051 | ✍ Renvoie la luminosité d'intérieur de 0 à 1 d'après l'heure du jeu (currentHour et currentMinute de environment, absent du dump) : décroissance linéaire jusqu'à 10 h, nulle entre 10 h et 16 h, croissante après 16 h ; avec updateState, la recalcule et signale si elle a changé. |
| `Lights:deactivateLights(keepHazardLightsOn: any)` | 1076 | ✍ Éteint tout : masque à 0, gyrophares et clignotants (sauf warning conservé si demandé), stop, recul, intérieur ; remet l'état de lumière à zéro. |
| `Lights:deactivateBeaconLights()` | 1093 | ✍ Désactive les gyrophares réels et leur état dispositif. |
| `Lights:loadDashboardGroupFromXML(superFunc: any, xmlFile: any, key: any, group: any)` | 1103 | ✍ Surcharge : lit en plus #lightTypes et #excludedLightTypes pour un groupe de tableau de bord. |
| `Lights:getIsDashboardGroupActive(superFunc: any, group: any)` | 1116 | ✍ Surcharge : un groupe n'est actif que si au moins un type de lumière demandé est allumé et qu'aucun type exclu ne l'est. |
| `Lights:getDeactivateLightsOnLeave()` | 1149 | ✍ Renvoie vrai par défaut (surchargée par Motorized) : les lumières s'éteignent à la sortie du véhicule. |
| `Lights:loadSharedLight(xmlFile: any, key: any)` | 1155 | ✍ Charge un feu partagé (SharedLight) depuis le XML ; en cas de succès l'ajoute à la liste et, s'il a un compound, à celle des compounds. |
| `Lights:loadAdditionalLightAttributesFromXML(xmlFile: any, key: any, light: any)` | 1171 | ✍ Lit #isTopLight et #isBottomLight (faux par défaut) d'un feu. |
| `Lights:getIsLightActive(light: any)` | 1180 | ✍ Un feu « haut » n'est actif que si les feux hauts sont visibles, un feu « bas » seulement s'ils ne le sont pas, les autres toujours. |
| `Lights:getStaticLightFromNode(node: any)` | 1196 | ✍ Cherche un feu statique par son nœud dans toutes les catégories ; nil sinon. |
| `Lights:getRealLightFromNode(node: any)` | 1209 | ✍ Cherche un feu réel par son nœud dans les deux profils ; nil sinon. |
| `Lights:updateAutomaticLights(isTurnedOn: any, isWorking: any)` | 1224 | ✍ Applique le masque automatique (travail ou non) si allumé, sinon coupe tout si un masque non nul est présent. |
| `Lights:lightsWeatherChanged()` | 1241 | ✍ Rappel du message jour/nuit : affiche le texte de l'action « lumières » seulement quand le soleil est couché (environment.isSunOn faux). |
| `Lights:onLightsProfileChanged(lightsProfile: any)` | 1248 | ✍ Rappel du changement de profil d'éclairage : informe chaque feu réel, puis réapplique le masque sans diffusion (bascule les feux réels actifs). |
| `Lights:onLightsRealBeaconLightChanged()` | 1264 | ✍ Rappel du réglage « gyrophares réels » : informe chaque gyrophare. |
| `Lights:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 1273 | ✍ Enregistre les touches de lumière (feux, arrière, avant, travail avant/arrière, route, clignotants, warning, gyrophare) pour le véhicule occupé ; masque leur texte d'aide sauf celui des lumières, visible la nuit. |
| `Lights:onRegisterExternalActionEvents(trigger: any, name: any, xmlFile: any, key: any)` | 1311 | ✍ Enregistre l'action externe « lights » d'un déclencheur si le véhicule a des états de lumière. |
| `Lights:onEnterVehicle(isControlling: any)` | 1322 | ✍ À l'entrée, réapplique masque, gyrophares et clignotants en forçant l'état. |
| `Lights:onLeaveVehicle()` | 1332 | ✍ À la sortie, éteint lumières et gyrophares si getDeactivateLightsOnLeave, et coupe l'état dispositif des gyrophares. |
| `Lights:onDeactivate()` | 1346 | ✍ Désactive les gyrophares si getDeactivateLightsOnLeave. |
| `Lights:onRequiresTopLightsChanged(requiresTopLights: any)` | 1354 | ✍ Réagit à l'événement d'exigence de feux hauts en appelant setTopLightsVisibility. |
| `Lights:onStartMotor()` | 1360 | ✍ Réapplique le masque et allume les feux de jour. |
| `Lights:onStopMotor()` | 1371 | ✍ Réapplique le masque et éteint les feux de jour (sauf en salle d'exposition). |
| `Lights:onStartReverseDirectionChange()` | 1382 | ✍ Réapplique le masque (force) si des feux sont allumés. |
| `Lights:onPostAttach(attacherVehicle: any, inputJointDescIndex: any, jointDescIndex: any)` | 1392 | ✍ Un outil attelé copie masque, gyrophares et clignotants du véhicule attelant, s'il expose getLightsTypesMask. |
| `Lights:onPostDetach()` | 1402 | ✍ Éteint tous les feux de l'outil détaché. |
| `Lights:onAutomatedTrainTravelActive()` | 1408 | ✍ Train automatique : éclairage automatique selon environment.isSunOn, sans mode travail. |
| `Lights:onAIDriveableActive()` | 1414 | ✍ Conduite IA : éclairage automatique selon environment.isSunOn, sans mode travail. |
| `Lights:onAIDriveableEnd()` | 1420 | ✍ Fin de conduite IA : éteint les lumières si personne ne contrôle le véhicule et coupe les gyrophares. |
| `Lights:onAIFieldWorkerStart()` | 1432 | ✍ Début de travail IA : coupe les gyrophares. |
| `Lights:onAIFieldWorkerActive()` | 1438 | ✍ Travail IA en cours : éclairage automatique selon environment.isSunOn, en mode travail. |
| `Lights:onAIJobVehicleBlock()` | 1444 | ✍ IA bloquée par un obstacle : allume les gyrophares. |
| `Lights:onAIJobVehicleContinue()` | 1450 | ✍ IA reprend la route : coupe les gyrophares. |
| `Lights:onAIFieldWorkerEnd()` | 1456 | ✍ Fin de travail IA : éteint les lumières si personne ne contrôle le véhicule et coupe les gyrophares. |
| `Lights:onVehiclePhysicsUpdate(acceleratorPedal: any, brakePedal: any, automaticBrake: any, currentSpeed: any)` | 1468 | ✍ Appelé par la physique : feux de stop selon la pédale de frein (hors frein automatique) et feux de recul selon la vitesse (seuil reverseLightActivationSpeed) ou la pédale d'accélérateur négative, si le sens du reverser est normal. |
| `Lights:loadRealLightSetup(xmlFile: any, key: any, lightTable: any, realLightToLight: any)` | 1480 | ✍ Charge un profil de feux réels (par défaut, haut, bas, stop, recul, clignotants, intérieur) via RealLight.loadLightsFromXML ; les feux d'intérieur reçoivent getInteriorLightBrightness comme fonction de charge. |
| `Lights:applyAdditionalActiveLightType(lights: any, lightType: any, isBlinking: any)` | 1498 | ✍ Ajoute un type de lumière supplémentaire aux feux d'une liste et, si demandé, les marque clignotants. |
| `Lights.actionEventToggleLightFront(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1510 | ✍ Rappel d'entrée : bascule le bit du type LIGHT_TYPE_DEFAULT dans le masque. |
| `Lights.actionEventToggleLights(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1522 | ✍ Rappel d'entrée : passe à l'état de lumière suivant (setNextLightsState(1)). |
| `Lights.actionEventToggleLightsBack(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1530 | ✍ Rappel d'entrée : passe à l'état de lumière précédent (setNextLightsState(-1)). |
| `Lights.actionEventToggleWorkLightBack(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1538 | ✍ Rappel d'entrée : bascule le bit des feux de travail arrière. |
| `Lights.actionEventToggleWorkLightFront(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1548 | ✍ Rappel d'entrée : bascule le bit des feux de travail avant. |
| `Lights.actionEventToggleHighBeamLight(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1558 | ✍ Rappel d'entrée : bascule le bit des feux de route. |
| `Lights.actionEventToggleTurnLightHazard(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1568 | ✍ Rappel d'entrée : active ou coupe les feux de détresse. |
| `Lights.actionEventToggleTurnLightLeft(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1581 | ✍ Rappel d'entrée : active ou coupe le clignotant gauche. |
| `Lights.actionEventToggleTurnLightRight(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1594 | ✍ Rappel d'entrée : active ou coupe le clignotant droit. |
| `Lights.actionEventToggleBeaconLights(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1607 | ✍ Rappel d'entrée : bascule les gyrophares. |
| `Lights.externalActionEventRegister(data: any, vehicle: any)` | 1616 | ✍ Enregistre l'action d'entrée TOGGLE_LIGHTS_EXTERNAL d'un déclencheur externe ; son rappel passe le véhicule à l'état de lumière suivant. |
| `Lights.externalActionEventUpdate(data: any, vehicle: any)` | 1629 | ✍ Mise à jour de l'action externe : corps vide. |
| `Lights.dashboardLightAttributes(self: any, xmlFile: any, key: any, dashboard: any, isActive: any)` | 1634 | ✍ Lit les attributs de tableau de bord d'éclairage (#lightTypes, #excludedLightTypes) et initialise l'état de chaque type. |
| `Lights.dashboardLightState(self: any, dashboard: any, newValue: any, minValue: any, maxValue: any, isActive: any)` | 1647 | ✍ Calcule l'état d'un tableau de bord d'éclairage : multi-états (un état par type allumé) ou valeur simple. |
| `Lights.consoleCommandTopLights()` | 1669 | ✍ Commande console de développement : inverse feux hauts/bas du véhicule occupé. |
| `Lights.consoleCommandProfile()` | 1680 | ✍ Commande console de développement : bascule le réglage LIGHTS_PROFILE entre bas et très haut (journalise le résultat). |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEvent | `onTurnLightStateChanged` | 147 |
| registerEvent | `onTopLightsVisibilityChanged` | 148 |
| registerEvent | `onBrakeLightsVisibilityChanged` | 149 |
| registerEvent | `onReverseLightsVisibilityChanged` | 150 |
| registerEvent | `onLightsTypesMaskChanged` | 151 |
| registerEvent | `onBeaconLightsVisibilityChanged` | 152 |
| registerFunction | `loadRealLightSetup` | 158 |
| registerFunction | `applyAdditionalActiveLightType` | 159 |
| registerFunction | `getIsActiveForLights` | 160 |
| registerFunction | `getIsActiveForInteriorLights` | 161 |
| registerFunction | `getCanToggleLight` | 162 |
| registerFunction | `getUseHighProfile` | 163 |
| registerFunction | `setNextLightsState` | 164 |
| registerFunction | `setLightsTypesMask` | 165 |
| registerFunction | `getLightsTypesMask` | 166 |
| registerFunction | `setTurnLightState` | 167 |
| registerFunction | `getTurnLightState` | 168 |
| registerFunction | `setTopLightsVisibility` | 169 |
| registerFunction | `setBrakeLightsVisibility` | 170 |
| registerFunction | `setBeaconLightsVisibility` | 171 |
| registerFunction | `getBeaconLightsVisibility` | 172 |
| registerFunction | `setReverseLightsVisibility` | 173 |
| registerFunction | `setInteriorLightsVisibility` | 174 |
| registerFunction | `getInteriorLightBrightness` | 175 |
| registerFunction | `deactivateLights` | 176 |
| registerFunction | `getDeactivateLightsOnLeave` | 177 |
| registerFunction | `loadSharedLight` | 178 |
| registerFunction | `loadAdditionalLightAttributesFromXML` | 179 |
| registerFunction | `getIsLightActive` | 180 |
| registerFunction | `getStaticLightFromNode` | 181 |
| registerFunction | `getRealLightFromNode` | 182 |
| registerFunction | `updateAutomaticLights` | 183 |
| registerFunction | `lightsWeatherChanged` | 184 |
| registerFunction | `onLightsProfileChanged` | 185 |
| registerFunction | `onLightsRealBeaconLightChanged` | 186 |
| registerFunction | `deactivateBeaconLights` | 187 |
| registerOverwrittenFunction | `loadDashboardGroupFromXML` | 193 |
| registerOverwrittenFunction | `getIsDashboardGroupActive` | 194 |
| registerEventListener | `onLoad` | 200 |
| registerEventListener | `onLoadFinished` | 201 |
| registerEventListener | `onRegisterDashboardValueTypes` | 202 |
| registerEventListener | `onDelete` | 203 |
| registerEventListener | `onReadStream` | 204 |
| registerEventListener | `onWriteStream` | 205 |
| registerEventListener | `onUpdate` | 206 |
| registerEventListener | `onUpdateTick` | 207 |
| registerEventListener | `onRegisterActionEvents` | 208 |
| registerEventListener | `onRegisterExternalActionEvents` | 209 |
| registerEventListener | `onEnterVehicle` | 210 |
| registerEventListener | `onLeaveVehicle` | 211 |
| registerEventListener | `onStartMotor` | 212 |
| registerEventListener | `onStopMotor` | 213 |
| registerEventListener | `onStartReverseDirectionChange` | 214 |
| registerEventListener | `onPostAttach` | 215 |
| registerEventListener | `onPostDetach` | 216 |
| registerEventListener | `onAutomatedTrainTravelActive` | 217 |
| registerEventListener | `onAIDriveableActive` | 218 |
| registerEventListener | `onAIDriveableEnd` | 219 |
| registerEventListener | `onAIFieldWorkerStart` | 220 |
| registerEventListener | `onAIFieldWorkerActive` | 221 |
| registerEventListener | `onAIJobVehicleBlock` | 222 |
| registerEventListener | `onAIJobVehicleContinue` | 223 |
| registerEventListener | `onAIFieldWorkerEnd` | 224 |
| registerEventListener | `onVehiclePhysicsUpdate` | 225 |
| registerEventListener | `onDeactivate` | 226 |
| registerEventListener | `onRequiresTopLightsChanged` | 227 |

## Messages

- s'abonne à `MessageType.DAY_NIGHT_CHANGED` (l.404)
- s'abonne à `MessageType.SETTING_CHANGED` (l.407)
- s'abonne à `MessageType.SETTING_CHANGED` (l.408)

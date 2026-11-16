# vehicles/specializations/CrabSteering.lua

*[English version](../../../../scripts/vehicles/specializations/CrabSteering.md)*

Source: `dataS/scripts/vehicles/specializations/CrabSteering.lua` — FS25 1.25.1.0

✍ Spécialisation pour les véhicules à plusieurs modes de direction sélectionnables (toutes roues, crabe, roues arrière, etc.). Chaque mode, chargé depuis 'vehicle.crabSteering', peut décaler ou verrouiller roues et noeuds de direction, déplacer des noeuds, jouer des animations, changer le centre de direction et l'axe articulé ; l'indice du mode actif est sauvegardé et synchronisé, et une extension de HUD est créée. Nécessite Drivable, Wheels et AnimatedVehicle. Plusieurs fonctions enregistrées ici (getCrabSteeringModeAvailable, getNumCrabSteeringModesAvailable, getCrabSteeringMode, setNextCrabSteeringMode, onDelete, onDraw) n'ont pas de corps dans le dump du SDK : NON VÉRIFIÉ.

- **CrabSteering** (l.10)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `CrabSteering.prerequisitesPresent(specializations: table) → boolean` | 20 | ✍ Renvoie true seulement si le type de véhicule possède Drivable, Wheels et AnimatedVehicle. |
| `CrabSteering.initSpecialization()` | 28 | ✍ Enregistre le schéma XML de la direction crabe (distance roues arrière, mode IA, vitesse de bascule, modes, modes par configuration, tableaux de bord avec liste 'states'), l'indice 'crabSteeringIndex' de configuration de roues et la clé de sauvegarde de l'état. |
| `CrabSteering.registerSteeringModeXMLPaths(schema: any, basePath: any)` | 55 | ✍ Enregistre les chemins XML d'un mode de direction sous un chemin de base : nom, action d'entrée, roues, centre de direction, anticipation IA, noeuds de direction, noeuds, axe articulé, animations et volant. |
| `CrabSteering.registerFunctions(vehicleType: any)` | 94 | ✍ Enregistre les fonctions de direction crabe sur le type de véhicule (chargement de mode, autorisation de bascule, disponibilité, mode courant, mode suivant, axe articulé). Certaines n'ont pas de corps dans le dump. |
| `CrabSteering.registerOverwrittenFunctions(vehicleType: any)` | 107 | ✍ Enregistre des surcharges : chargement des roues, angle de braquage, sélection, mise à jour du volant, démarrage du travailleur IA et distance d'anticipation IA. |
| `CrabSteering.registerEventListeners(vehicleType: any)` | 119 | ✍ S'abonne aux événements de chargement, post-chargement, suppression, enregistrement des tableaux de bord, lecture/écriture de flux, flux de mise à jour, update tick, affichage et enregistrement des actions. |
| `CrabSteering:onLoad(savegame: table)` | 136 | ✍ Lit les réglages de direction crabe et les modes de la configuration active, avertit s'il y a plus de modes que les bits réseau n'en permettent, crée l'extension de HUD et applique le mode 1. Sans mode, retire ses écouteurs réseau, tick, affichage et entrée. |
| `CrabSteering:onPostLoad(savegame: any)` | 195 | ✍ Restaure le mode de direction sauvegardé (borné à la plage valide) sauf réinitialisation des véhicules, puis avance animations et physique des roues. |
| `CrabSteering:onRegisterDashboardValueTypes()` | 220 | ✍ Enregistre la valeur de tableau de bord 'crabSteering.state' : l'indice du mode courant, ou un booléen indiquant si le mode figure dans la liste 'states' du tableau de bord. |
| `CrabSteering:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 249 | ✍ Écrit l'indice du mode de direction courant dans la sauvegarde si le véhicule a des modes. |
| `CrabSteering:onReadStream(streamId: integer, connection: Connection)` | 261 | ✍ Client à la connexion : lit l'indice de mode, l'applique sans événement et avance animations et physique des roues. |
| `CrabSteering:onWriteStream(streamId: integer, connection: Connection)` | 273 | ✍ Serveur à la connexion : écrit l'indice du mode courant dans le flux. |
| `CrabSteering:onReadUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 283 | ✍ Lit la rotation courante de l'axe articulé (flottant) dans le flux de mise à jour quand un axe articulé avec articulation de composant existe. |
| `CrabSteering:onWriteUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 295 | ✍ Écrit la rotation courante de l'axe articulé dans le flux de mise à jour quand un axe articulé avec articulation de composant existe. |
| `CrabSteering:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 307 | ✍ Serveur uniquement : si le mode courant n'est plus disponible selon getCrabSteeringModeAvailable (corps absent du dump), passe au mode suivant. |
| `CrabSteering:loadCrabSteeringModeFromXML(xmlFile: any, key: any, mode: any)` | 326 | ✍ Charge un mode de direction dans la table fournie : nom, action d'entrée, centre et rayon de braquage, anticipation IA, roues, noeuds de direction, poses de noeuds, axe articulé, animations et volant. Les références invalides sont journalisées et ignorées ; renvoie toujours true. |
| `CrabSteering:getCanToggleCrabSteering() → boolean, string` | 451 | ✍ Renvoie si la bascule est autorisée et un texte d'avertissement optionnel ; par défaut true, nil. Point d'extension pour d'autres spécialisations. |
| `CrabSteering:setCrabSteering(state: integer, noEventSend: boolean)` | 480 | ✍ Passe au mode donné. Envoie SetCrabSteeringEvent (diffusion côté serveur, envoi au serveur côté client) sauf noEventSend, joue ou inverse les animations du mode, fixe les décalages et échelles de rotation cibles des noeuds de direction et roues, applique les poses de noeuds et met à jour le tableau de bord côté client. |
| `CrabSteering:loadWheelFromXML(superFunc: any, wheel: any)` | 616 | ✍ Après le chargement parent d'une roue, initialise son décalage de braquage à 0 et force une mise à jour de l'angle. Renvoie false si le parent échoue. |
| `CrabSteering:updateSteeringAngle(superFunc: table, wheel: table, dt: number, steeringAngle: number) → number` | 633 | ✍ Remplace l'angle de braquage des roues listées dans le mode courant : déplace progressivement le décalage, met la rotation à l'échelle, change graduellement la vitesse de rotation et borne aux limites de la roue ; les roues verrouillées convergent vers leur décalage. Les autres roues gardent l'angle donné. |
| `CrabSteering:updateArticulatedAxisRotation(steeringAngle: number, dt: number) → number` | 719 | ✍ Calcule l'angle de l'axe articulé pour le mode courant (décalage, verrouillage, fondu de vitesse). Côté client renvoie la rotation synchronisée ; côté serveur, avec roues et distance arrière configurées, déduit l'angle de la vitesse et du glissement des roues, sinon fait un fondu sur 2,5 s. |
| `CrabSteering:getCanBeSelected(superFunc: any)` | 838 | ✍ Renvoie true si le véhicule a des modes de direction, sinon délègue au parent. |
| `CrabSteering:loadWheelsFromXML(superFunc: any, xmlFile: any, key: any, wheelConfigurationI: any)` | 844 | ✍ Après le chargement parent des roues, mémorise le 'crabSteeringIndex' de la configuration de roues active comme indice de configuration de direction crabe. |
| `CrabSteering:updateSteeringWheel(superFunc: any, steeringWheel: any, dt: any, direction: any)` | 852 | ✍ Si le mode courant définit son propre volant, l'utilise à la place de celui fourni, puis appelle le parent. |
| `CrabSteering:startFieldWorker(superFunc: any)` | 866 | ✍ Passe au mode de direction IA configuré (aiSteeringModeIndex), en envoyant l'événement, avant de démarrer le travailleur IA via le parent. |
| `CrabSteering:getAIAutomaticSteeringLookAheadDistance(superFunc: any)` | 875 | ✍ Renvoie la distance d'anticipation définie par le mode courant si elle existe ; sinon la valeur du parent. |
| `CrabSteering:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 889 | ✍ Client uniquement : enregistre les entrées de mode suivant/précédent et une entrée directe par mode définissant une action, quand le véhicule a des modes et est actif pour les entrées. |
| `CrabSteering.actionEventToggleCrabSteeringModes(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 916 | ✍ Rappel d'entrée : si getCanToggleCrabSteering l'autorise, passe au mode suivant ou précédent (callbackState donne le sens) ; sinon affiche l'avertissement pendant 2 s. |
| `CrabSteering.actionEventSetCrabSteeringMode(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 927 | ✍ Rappel d'entrée : sélectionne le mode lié à l'action pressée si la bascule est autorisée et le mode disponible ; sinon affiche l'avertissement pendant 2 s. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `loadCrabSteeringModeFromXML` | 95 |
| registerFunction | `getCanToggleCrabSteering` | 96 |
| registerFunction | `getCrabSteeringModeAvailable` | 97 |
| registerFunction | `getNumCrabSteeringModesAvailable` | 98 |
| registerFunction | `setCrabSteering` | 99 |
| registerFunction | `getCrabSteeringMode` | 100 |
| registerFunction | `setNextCrabSteeringMode` | 101 |
| registerFunction | `updateArticulatedAxisRotation` | 102 |
| registerOverwrittenFunction | `loadWheelFromXML` | 108 |
| registerOverwrittenFunction | `updateSteeringAngle` | 109 |
| registerOverwrittenFunction | `getCanBeSelected` | 110 |
| registerOverwrittenFunction | `loadWheelsFromXML` | 111 |
| registerOverwrittenFunction | `updateSteeringWheel` | 112 |
| registerOverwrittenFunction | `startFieldWorker` | 113 |
| registerOverwrittenFunction | `getAIAutomaticSteeringLookAheadDistance` | 114 |
| registerEventListener | `onLoad` | 120 |
| registerEventListener | `onPostLoad` | 121 |
| registerEventListener | `onDelete` | 122 |
| registerEventListener | `onRegisterDashboardValueTypes` | 123 |
| registerEventListener | `onReadStream` | 124 |
| registerEventListener | `onWriteStream` | 125 |
| registerEventListener | `onReadUpdateStream` | 126 |
| registerEventListener | `onWriteUpdateStream` | 127 |
| registerEventListener | `onUpdateTick` | 128 |
| registerEventListener | `onDraw` | 129 |
| registerEventListener | `onRegisterActionEvents` | 130 |

# vehicles/specializations/AIVehicle.lua

*[English version](../../../../scripts/vehicles/specializations/AIVehicle.md)*

Source: `dataS/scripts/vehicles/specializations/AIVehicle.lua` — FS25 1.25.1.0

✍ Spécialisation IA de base présente sur tous les véhicules (aucun prérequis). Elle charge les définitions optionnelles vehicle.ai.agentAttachment qui décrivent l'empreinte (taille, centre de rotation, articulation) que le planificateur de trajet IA doit utiliser pour un outil attelé. Elle fournit aussi la diffusion des événements IA à toute la combinaison de véhicules et des réponses par défaut prêt/en préparation que d'autres spécialisations peuvent surcharger.

- **AIVehicle** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIVehicle.prerequisitesPresent(specializations: table) → boolean` | 17 | ✍ Renvoie toujours vrai : cette spécialisation n'a aucun prérequis. |
| `AIVehicle.initSpecialization()` | 23 | ✍ Déclare les chemins XML des attachements d'agent sous vehicle.ai, y compris les sous-attachements imbriqués. |
| `AIVehicle.registerAgentAttachmentPaths(schema: any, basePath: any, includeSubAttachments: any)` | 34 | ✍ Déclare les clés XML agentAttachment (jointNode, centre de rotation par roues/nœud/position, largeur, hauteur, longueur, décalages, hasCollision, useSize) et recommence une fois pour les sous-attachements si demandé. |
| `AIVehicle.registerEvents(vehicleType: any)` | 58 | ✍ Enregistre les événements onAIFieldCourseSettingsInitialized et onPostAIFieldCourseSettingsInitialized. |
| `AIVehicle.registerFunctions(vehicleType: any)` | 65 | ✍ Enregistre sur le type de véhicule les aides d'attachements d'agent, les émetteurs d'événements IA et les requêtes prêt/en préparation. |
| `AIVehicle.registerOverwrittenFunctions(vehicleType: any)` | 80 | ✍ Vide : aucune fonction de base n'est surchargée. |
| `AIVehicle.registerEventListeners(vehicleType: any)` | 85 | ✍ Abonne la spécialisation à onLoad et onPostLoad. |
| `AIVehicle:onLoad(savegame: table)` | 93 | ✍ Pour les véhicules ayant des articulations d'attache entrantes, charge les attachements d'agent depuis le XML et crée une boîte de débogage servant à les visualiser. |
| `AIVehicle:onPostLoad(savegame: table)` | 111 | ✍ Si des attachements d'agent existent, les valide par rapport aux articulations d'attache entrantes du véhicule. |
| `AIVehicle:collectAIAgentAttachments(aiDrivableVehicle: any)` | 121 | ✍ Appelée sur un outil attelé pour enregistrer ses attachements auprès du véhicule IA : d'abord ceux liés à l'articulation d'entrée active, sinon le premier attachement direct, puis tous les attachements non directs. |
| `AIVehicle:registerAIAgentAttachment(aiDrivableVehicle: any, agentAttachment: any)` | 163 | ✍ Ajoute un attachement et tous ses sous-attachements au véhicule IA conduisible via addAIAgentAttachment. |
| `AIVehicle:loadAIAgentAttachmentsFromXML(xmlFile: any, baseKey: any, agentAttachments: any, loadSubAttachments: any, requiresJointNode: any)` | 174 | ✍ Lit les entrées agentAttachment (articulation, centre de rotation, taille, collision, sous-attachements optionnels) dans une table, avec 3 m par défaut ou la taille du véhicule si useSize est activé. Avertit si un attelable n'a aucune définition. |
| `AIVehicle:validateAIAgentAttachments(agentAttachments: any, inputAttacherJoints: any)` | 232 | ✍ Marque les attachements directs et construit les nœuds de centre de rotation à partir d'une position ou de la moyenne des roues listées. Calcule ensuite les décalages d'attelage, avec récursion sur les sous-attachements. Crée des nœuds de scène. |
| `AIVehicle:drawAIAgentAttachments(agentAttachments: any)` | 315 | ✍ Dessin de débogage : affiche une boîte par attachement d'agent (verte avec un centre de rotation, bleue sinon), récursivement. |
| `AIVehicle:raiseAIEvent(eventName: any, implementName: any, ...: any)` | 336 | ✍ Déclenche un événement IA sur toute la combinaison du véhicule racine : l'événement propre à l'outil sur chaque autre véhicule enfant, puis sur celui-ci, puis l'événement principal, en prévenant à chaque fois l'action controller. |
| `AIVehicle:safeRaiseAIEvent(vehicle: any, eventName: any, ...: any)` | 361 | ✍ Déclenche l'événement sur le véhicule seulement s'il a des écouteurs pour ce nom, ce qui évite les erreurs pour les événements inconnus. |
| `AIVehicle:getIsAIReadyToDrive()` | 369 | ✍ Réponse par défaut : toujours vrai. D'autres spécialisations peuvent la surcharger pour retarder le démarrage de l'IA. |
| `AIVehicle:getIsAIPreparingToDrive()` | 375 | ✍ Réponse par défaut : toujours faux. Destinée à être surchargée par les véhicules qui nécessitent une phase de préparation. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEvent | `onAIFieldCourseSettingsInitialized` | 59 |
| registerEvent | `onPostAIFieldCourseSettingsInitialized` | 60 |
| registerFunction | `collectAIAgentAttachments` | 66 |
| registerFunction | `registerAIAgentAttachment` | 67 |
| registerFunction | `loadAIAgentAttachmentsFromXML` | 68 |
| registerFunction | `validateAIAgentAttachments` | 69 |
| registerFunction | `drawAIAgentAttachments` | 70 |
| registerFunction | `raiseAIEvent` | 72 |
| registerFunction | `safeRaiseAIEvent` | 73 |
| registerFunction | `getIsAIReadyToDrive` | 74 |
| registerFunction | `getIsAIPreparingToDrive` | 75 |
| registerEventListener | `onLoad` | 86 |
| registerEventListener | `onPostLoad` | 87 |

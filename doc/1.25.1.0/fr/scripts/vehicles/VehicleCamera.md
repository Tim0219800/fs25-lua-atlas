# vehicles/VehicleCamera.lua

*[English version](../../../scripts/vehicles/VehicleCamera.md)*

Source: `dataS/scripts/vehicles/VehicleCamera.lua` — FS25 1.25.1.0

✍ Caméra à la troisième personne ou de cabine d'un véhicule (côté client). Elle enveloppe un noeud caméra du XML du véhicule et gère rotation, limites de zoom, suivi et visée lissés, suivi de tête optionnel et suspension du siège, zoom évitant les collisions par lancers de rayons, actions d'entrée (souris, manette, tactile), champ de vision et sauvegarde de la pose. Elle s'enregistre auprès de `g_cameraManager`, lit `GameSettings` et définit `g_activeVehicleCamera` quand elle est active. Plusieurs méthodes appelées ici (par ex. `updatePrecipitationCollisions`, les gestionnaires de commandes console) ne figurent pas dans le dump du SDK.

- **VehicleCamera** (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `VehicleCamera.new(vehicle: Vehicle, customMt: table?) → table` | 23 | ✍ Crée une caméra pour un véhicule avec pose et état d'entrée à zéro, et s'abonne aux changements de réglages (caméra à suspension active, champ de vision ; réglage de collision seulement si le mod FS22 de collision est chargé ou en version de développement). |
| `VehicleCamera:loadFromXML(xmlFile: XMLFile, key: string, savegame: any, cameraIndex: any) → boolean` | 69 | ✍ Charge la caméra depuis le XML : valide le noeud caméra, la boîte de focus d'ombre optionnelle, les indicateurs intérieur/extérieur, le champ de vision, les limites de rotation et de zoom, le lissage, le suivi de tête, les noeuds de rayons et les changements d'objets. Restaure la pose sauvegardée sauf si le réglage de réinitialisation s'applique. Renvoie faux si le noeud est invalide ou si des limites manquent. À noter : le contrôle de la boîte de focus lit `isInside` avant son affectation depuis le XML. |
| `VehicleCamera:onPostLoad(savegame: table)` | 320 | ✍ Résout le noeud de suspension du siège via `suspensionNodeIndex` ; s'il est valide, ajoute son décalage Y à l'origine de la caméra et crée des noeuds parents pour que la caméra suive la suspension. Avertit si l'indice est invalide ou s'il s'agit d'une suspension de torse. |
| `VehicleCamera:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 368 | ✍ Écrit la rotation, la translation, le zoom et le champ de vision Y courant de la caméra, ainsi que l'état du mode de débogage LOD s'il est actif. |
| `VehicleCamera:delete()` | 386 | ✍ Retire la caméra de `g_cameraManager`, la désactive, supprime le noeud caméra (seulement si le lissage de position a créé une structure parent séparée) et le noeud parent monde, et se désabonne des messages de réglages. |
| `VehicleCamera:zoomSmoothly(offset: number)` | 409 | ✍ Modifie la cible de zoom de `offset`, bornée à `transMin`..`transMax` si définis ; le zoom réel s'en rapproche ensuite dans `update`. Le décalage est multiplié par 10 en mode de débogage LOD. |
| `VehicleCamera:raycastCallback(transformId: integer, x: number, y: number, z: number, distance: number, nx: number, ny: number, nz: number)` | 441 | ✍ Rappel de lancer de rayon qui mémorise la distance de l'impact, la normale et l'identifiant de transformation utilisés par `getCollisionDistance`. |
| `VehicleCamera:update(dt: number)` | 452 | ✍ Mise à jour par image : adoucit le zoom, applique l'entrée de regard aux rotations X/Y (seulement si active et sans interface affichée), gère le suivi de tête, ajuste la rotation pour rester au-dessus du terrain, raccourcit le zoom en cas de collision, puis met à jour la pose lissée. Réinitialise la caméra si la rotation devient NaN. `dt` est en millisecondes. |
| `VehicleCamera:onActivate()` | 693 | ✍ Active la caméra : la réinitialise éventuellement, la rend active dans `g_cameraManager`, initialise les positions lissées, enregistre les événements d'entrée de regard haut/bas et gauche/droite (et les gestes tactiles si disponibles), applique les changements d'objets, définit `g_activeVehicleCamera`. Avec les commandes de triche actives, enregistre trois commandes console. |
| `VehicleCamera:setLODDebugState(state: any, zoom: any)` | 791 | ✍ Active ou désactive le mode de débogage LOD : activé, autorise un zoom jusqu'à 350 et force à 1 les coefficients de distance de vue, de LOD et de LOD du terrain ; désactivé, restaure le zoom, le champ de vision et les coefficients issus des réglages graphiques. |
| `VehicleCamera:setCameraYDebugState(state: any, height: any)` | 817 | ✍ Active ou désactive une vue de débogage orthographique de dessus avec une hauteur donnée, verrouillant la rotation et masquant l'interface ; la désactivation rétablit la perspective et l'interface. Usage de débogage uniquement. |
| `VehicleCamera:onDeactivate()` | 844 | ✍ Désactive la caméra : retire les commandes console, les événements d'entrée, les écouteurs tactiles et les changements d'objets, efface les bits de collision de précipitations, quitte le mode de débogage LOD et vide `g_activeVehicleCamera` s'il s'agissait de cette caméra. |
| `VehicleCamera:actionEventLookUpDown(actionName: any, inputValue: any, callbackState: any, isAnalog: any, isMouse: any)` | 899 | ✍ Gestionnaire d'entrée du regard vertical : met la valeur à l'échelle de 16,666 ms pour la souris ou du temps d'image courant sinon, et l'accumule pour le prochain `update`. |
| `VehicleCamera:touchEventLookUpDown(value: any)` | 918 | ✍ Gestionnaire de geste tactile pour le regard vertical ; convertit la valeur avec un facteur de hauteur d'écran et la transmet si la caméra est active. |
| `VehicleCamera:touchEventZoomInOut(value: any)` | 927 | ✍ Gestionnaire de pincement tactile : appelle `zoomSmoothly(value * 15)` si la caméra est active. |
| `VehicleCamera:touchEventLookLeftRight(value: any)` | 935 | ✍ Gestionnaire de geste tactile pour le regard horizontal ; convertit la valeur avec un facteur de rapport d'aspect de l'écran et la transmet si la caméra est active. |
| `VehicleCamera:actionEventLookLeftRight(actionName: any, inputValue: any, callbackState: any, isAnalog: any, isMouse: any)` | 944 | ✍ Gestionnaire d'entrée du regard horizontal, mis à l'échelle comme le vertical et accumulé pour `update`. |
| `VehicleCamera:resetCamera()` | 964 | ✍ Restaure la rotation, la translation et le zoom d'origine de la caméra, efface le zoom limité par collision et réaligne les positions lissées. |
| `VehicleCamera:updateRotateNodeRotation()` | 997 | ✍ Applique rotX/rotY/rotZ au noeud de rotation. Ajoute une rotation Y liée à la direction pour les véhicules articulés ; en mode XZ monde, construit une direction alignée sur l'axe vertical du monde et revient à une rotation simple près des pôles. |
| `VehicleCamera:setSeparateCameraPose()` | 1030 | ✍ Écrit la position et la direction de visée lissées sur le vrai noeud caméra (depuis les vecteurs position/cible/haut ou depuis le noeud de rotation). En mode de débogage LOD, ajuste aussi le champ de vision et affiche le texte de distance. |
| `VehicleCamera:getTiltDirectionOffset()` | 1076 | ✍ Renvoie une inclinaison horizontale du vecteur haut issue de la gravité de l'appareil quand la caméra extérieure a l'inclinaison activée et qu'un pavé tactile est présent, sinon 0. |
| `VehicleCamera:getCollisionDistance() → boolean, number, number, number, number, number` | 1094 | ✍ Lance des rayons depuis les noeuds de rayons vers la position cible de la caméra, en ignorant la chaîne du véhicule, les objets montés, les formes découpées et les déclencheurs. Renvoie hasCollision, la distance, la normale de l'impact et le produit normale·direction ; renvoie faux si les collisions sont désactivées. |
| `VehicleCamera:onActiveCameraSuspensionSettingChanged(newState: boolean)` | 1212 | ✍ Réagit au réglage de caméra à suspension active en liant le noeud de position de la caméra sous le parent de suspension ou le parent d'origine. N'agit que s'il existe un noeud de suspension et que l'état a changé. |
| `VehicleCamera:onFovySettingChanged()` | 1228 | ✍ Recalcule le champ de vision Y depuis la valeur par défaut via `calculateFovY` et l'applique au noeud caméra. |
| `VehicleCamera:onCameraCollisionDetectionSettingChanged(newState: boolean)` | 1238 | ✍ Mémorise le nouvel état du réglage de détection de collision de la caméra. |
| `VehicleCamera.registerCameraXMLPaths(schema: any, basePath: any)` | 1285 | ✍ Enregistre le schéma XML de la caméra de véhicule : noeud, rotatable, limites (rotMinX/rotMaxX/transMin/transMax), indicateur intérieur, suivi de tête, boîte de focus d'ombre, sons extérieurs, noeud de rotation, pose, miroir, rotation XZ monde, indice de suspension, paramètres de lissage, noeuds de rayons et changements d'objets. |
| `VehicleCamera.registerCameraSavegameXMLPaths(schema: any, basePath: any)` | 1321 | ✍ Enregistre le schéma XML de sauvegarde d'une caméra : rotation, translation, zoom, champ de vision Y et clés des modes de débogage. |
| `VehicleCamera.consoleCommandLODDebug()` | 1334 | ✍ Commande console qui bascule le mode de débogage LOD sur la caméra de véhicule active et renvoie une chaîne d'état ; demande d'entrer d'abord dans un véhicule si aucune n'est active. |
| `VehicleCamera.consoleCommandCameraYDebug(height: any)` | 1345 | ✍ Commande console qui bascule la vue de débogage orthographique Y (hauteur optionnelle) sur la caméra de véhicule active et renvoie une chaîne d'état. |

## Messages

- s'abonne à `MessageType.SETTING_CHANGED` (l.55)
- s'abonne à `MessageType.SETTING_CHANGED` (l.58)
- s'abonne à `MessageType.SETTING_CHANGED` (l.59)

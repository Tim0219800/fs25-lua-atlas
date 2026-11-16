# vehicles/VehicleCharacter.lua

*[English version](../../../scripts/vehicles/VehicleCharacter.md)*

Source: `dataS/scripts/vehicles/VehicleCharacter.lua` — FS25 1.25.1.0

✍ Modèle de personnage visible (conducteur/passager) d'un siège de véhicule. Il lit un noeud de personnage et des réglages IK ou animation dans le XML du véhicule, charge un `HumanModel` depuis un `PlayerStyle`, le lie au véhicule, pilote les chaînes IK (ou un jeu d'animations, éventuellement un clip d'attente), masque le modèle quand la caméra est trop proche et limite les mises à jour selon la distance. Utilisé par les spécialisations de véhicule qui affichent des personnages ; ce n'est pas une spécialisation.

- **VehicleCharacter** (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `VehicleCharacter.new(vehicle: any, customMt: any)` | 17 | ✍ Crée le conteneur de personnage d'un véhicule : ni noeud ni modèle, mises à jour autorisées, cibles IK vides, animation désactivée et invisible. Accepte une métatable personnalisée. |
| `VehicleCharacter:load(xmlFile: any, xmlNode: any)` | 34 | ✍ Lit les réglages du personnage depuis le noeud XML du véhicule (`#node`, `#cameraMinDistance`, `#useAnimation`, options de colonne et de distance, cibles IK) et masque le noeud. Renvoie vrai si un noeud de personnage a été trouvé, faux sinon. |
| `VehicleCharacter:getParentComponent()` | 71 | ✍ Renvoie le composant du véhicule qui contient le noeud du personnage. |
| `VehicleCharacter:loadCharacter(playerStyle: any, asyncCallbackObject: any, asyncCallbackFunction: any, asyncCallbackArguments: any)` | 77 | ✍ Crée et charge de façon asynchrone un `HumanModel` pour le `PlayerStyle` donné, en supprimant l'ancien modèle. Avec un style nil, appelle aussitôt le rappel avec faux. La fin passe par `characterLoaded`, puis par le rappel fourni. |
| `VehicleCharacter:characterLoaded(loadingState: any, arguments: any)` | 100 | ✍ Rappel de fin de chargement du modèle. En cas de succès, lie le modèle au noeud du personnage, applique cibles IK et rotation de colonne, prépare le jeu d'animations ou le clip d'attente, puis charge le style en asynchrone. En cas d'échec, supprime le modèle et journalise une erreur. Appelle toujours le rappel utilisateur. |
| `VehicleCharacter:delete()` | 196 | ✍ Détruit le personnage en déchargeant le modèle. |
| `VehicleCharacter:unloadCharacter()` | 202 | ✍ Supprime le modèle du joueur et le lecteur d'animation conditionnelle s'ils existent, et rétablit le noeud de référence de distance (personnalisé ou noeud du personnage). |
| `VehicleCharacter:setDirty(setAllDirty: any)` | 219 | ✍ Marque les chaînes IK comme à recalculer : toutes si `setAllDirty` est vrai, sinon seulement celles dont la cible est elle-même marquée sale. Nécessite un modèle chargé. |
| `VehicleCharacter:updateIKChains()` | 231 | ✍ Recalcule immédiatement les chaînes IK du modèle du joueur. Provoque une erreur si aucun modèle n'est chargé. |
| `VehicleCharacter:setIKChainPoseByTarget(target: any, poseId: any)` | 237 | ✍ Trouve la chaîne IK liée à la cible donnée et lui applique l'identifiant de pose. Ne fait rien sans modèle ou sans chaîne correspondante. |
| `VehicleCharacter:setSpineDirty(acc: any)` | 250 | ✍ Incline la colonne selon l'accélération : applique une zone morte, convertit l'accélération en rotation entre les angles min et max, la lisse et marque l'IK comme sale. À noter : utilise `self.player.spineNode` alors que `self.player` n'est jamais défini dans ce fichier, il semble donc inutilisable tel quel. |
| `VehicleCharacter:updateVisibility()` | 265 | ✍ Affiche le personnage seulement si le style est chargé et que la caméra active est à au moins `cameraMinDistance` du noeud de référence (la tête par défaut) ; ignoré si l'une des entités manque. |
| `VehicleCharacter:setCharacterVisibility(isVisible: any)` | 277 | ✍ Règle la visibilité du noeud du personnage et du modèle chargé, et mémorise l'état dans `isVisible`. |
| `VehicleCharacter:setAllowCharacterUpdate(state: any)` | 290 | ✍ Active ou désactive la mise à jour régulière du drapeau sale de l'IK du personnage. |
| `VehicleCharacter:getAllowCharacterUpdate()` | 296 | ✍ Renvoie si la mise à jour du personnage est autorisée. |
| `VehicleCharacter:update(dt: any)` | 302 | ✍ Mise à jour par image pour un modèle chargé : si la plateforme l'autorise, que le véhicule est dans `maxUpdateDistance` et le personnage visible, rafraîchit l'IK ; démarre ou arrête aussi la piste d'animation d'attente selon cette distance. |
| `VehicleCharacter:getIKChainTargets()` | 335 | ✍ Renvoie la table des cibles de chaînes IK. |
| `VehicleCharacter:setIKChainTargets(targets: any, force: any)` | 341 | ✍ Remplace les cibles IK (si différentes ou forcé) et, avec un modèle chargé, les applique aux chaînes et marque tout comme sale. |
| `VehicleCharacter:getPlayerStyle()` | 356 | ✍ Renvoie le style du modèle de joueur chargé, ou nil s'il n'y en a pas. |
| `VehicleCharacter.registerCharacterXMLPaths(schema: any, basePath: any, name: any)` | 366 | ✍ Enregistre les entrées de schéma XML d'un personnage sous `basePath` : noeud, options de caméra et de distance, indicateurs d'animation, réglages de colonne, distances de mise à jour et de clipping, ainsi que les cibles de chaînes IK. |

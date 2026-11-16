# vehicles/specializations/AutoLoadForwarder.lua

*[English version](../../../../scripts/vehicles/specializations/AutoLoadForwarder.md)*

Source: `dataS/scripts/vehicles/specializations/AutoLoadForwarder.lua` — FS25 1.25.1.0

✍ Spécialisation pour les porteurs forestiers à grue automatique : elle saisit un arbre (grume) à portée, le transporte sur le noeud d'articulation de la grue, puis le dépose sur la prochaine place libre et le compte dans une unité de remplissage. Elle exige AutomaticArmControlForwarder, dont les fonctions d'alignement pilotent le bras, et utilise l'action controller du véhicule comme action de chargement automatique à un bouton. Le nom du fichier de la grume chargée est sauvegardé pour la recréer au chargement. La partie automatique ne tourne que si `Platform.gameplay.automaticVehicleControl` est vrai.


## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AutoLoadForwarder.prerequisitesPresent(specializations: table) → boolean` | 19 | ✍ Renvoie true seulement si le type de véhicule contient la spécialisation AutomaticArmControlForwarder. |
| `AutoLoadForwarder.initSpecialization()` | 25 | ✍ Enregistre les clés XML sous `vehicle.autoLoadForwarder` (noeuds de repos, de dépose et d'articulation de la grue, places de chargement avec unité de remplissage et décalage de dépose, animation de saisie) et la clé de sauvegarde du fichier i3d de l'arbre. |
| `AutoLoadForwarder.registerEvents(vehicleType: any)` | 48 | ✍ Déclare l'événement `onAutoLoadForwaderMountedTree` (orthographe du code source), levé à chaque montage d'un arbre sur la grue ou sur une place de chargement. |
| `AutoLoadForwarder.registerFunctions(vehicleType: any)` | 54 | ✍ Enregistre `mountTreeToCrane`, `addTreeToLoadPlaces`, `removeMountedObject` et `sortLoadedTreeObjects` sur le type de véhicule. |
| `AutoLoadForwarder.registerOverwrittenFunctions(vehicleType: any)` | 63 | ✍ Surcharge `getAreControlledActionsAllowed` et `addToPhysics`. |
| `AutoLoadForwarder.registerEventListeners(vehicleType: any)` | 70 | ✍ S'abonne à onLoad, onPostLoad, onDelete, onUpdate et onRootVehicleChanged. |
| `AutoLoadForwarder:onLoad(savegame: any)` | 80 | ✍ Lit les noeuds, la liste des places de chargement (seulement celles avec un noeud valide), l'index d'unité de remplissage, le décalage de dépose et les réglages de l'animation de saisie, et met en cache le texte d'avertissement « aucun arbre à portée ». |
| `AutoLoadForwarder:onPostLoad(savegame: any)` | 114 | ✍ Place l'animation de saisie à sa fin puis, si l'unité de remplissage contient des grumes et que la sauvegarde n'est pas réinitialisée, la vide et recrée un ForestryLog par unité depuis le fichier i3d sauvegardé, ajouté à une place de chargement. À noter : `savegame` est utilisé sans test de nil à cet endroit. |
| `AutoLoadForwarder:onDelete()` | 146 | ✍ Supprime chaque arbre encore monté sur une place de chargement. |
| `AutoLoadForwarder:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 159 | ✍ Si l'unité de remplissage n'est pas vide, sauvegarde le nom du fichier i3d du premier arbre trouvé sur une place de chargement, converti en nom de fichier réseau et encodé en HTML. |
| `AutoLoadForwarder:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 175 | ✍ Machine à états du chargement automatique : amène le bras vers l'arbre cible, le saisit, le porte à la prochaine place libre et le dépose, ou retourne au noeud de repos quand aucun arbre n'est à portée ou que l'unité est pleine. Actif seulement si la plateforme autorise le contrôle automatique du véhicule. |
| `AutoLoadForwarder:onRootVehicleChanged(rootVehicle: table)` | 277 | ✍ Enregistre ou déplace l'action `forwarderLoading` dans l'action controller du véhicule racine. Elle n'est disponible que si aucun arbre n'est saisi et que l'unité a de la place. La supprime s'il n'y a pas de contrôleur. |
| `AutoLoadForwarder.actionControllerEvent(self: any, direction: any)` | 302 | ✍ Callback de l'action controller : une direction négative demande le retour à la position de repos et rouvre la pince, sinon elle annule simplement le retour en attente. Dans les deux cas l'alignement automatique est réinitialisé. Renvoie toujours true. |
| `AutoLoadForwarder:getAreControlledActionsAllowed(superFunc: any) → boolean, string` | 323 | ✍ Quand on active l'action (direction 1), renvoie false avec l'avertissement « aucun arbre à portée » s'il n'y a pas d'arbre cible ; sinon délègue à la fonction parente. La désactivation est toujours permise. |
| `AutoLoadForwarder:addToPhysics(superFunc: any) → boolean` | 337 | ✍ Appelle la fonction parente puis remonte chaque grume sur sa place de chargement en mode cinématique pour éviter les collisions avec le véhicule, et lève `onAutoLoadForwaderMountedTree` pour chacune. Renvoie false si le parent a échoué. |
| `AutoLoadForwarder:mountTreeToCrane(treeId: any)` | 359 | ✍ Monte de façon cinématique l'arbre correspondant à un identifiant de noeud sur le noeud d'articulation de la grue, décalé de son attribut utilisateur `logRadius` (0,5 par défaut), et lève l'événement de montage. Renvoie true en cas de succès, false si aucun objet ne correspond. |
| `AutoLoadForwarder:addTreeToLoadPlaces(treeObject: any)` | 381 | ✍ Ajoute une unité à l'unité de remplissage et monte l'arbre sur la première place libre, en le retournant de 180 degrés s'il pointe dans l'autre sens. Si aucune place n'est libre, l'arbre est supprimé. |
| `AutoLoadForwarder:removeMountedObject(object: integer, isDeleting: boolean)` | 412 | ✍ Libère la place de chargement contenant l'objet donné, retire une unité de l'unité de remplissage, puis compacte les grumes restantes. L'argument `isDeleting` n'est pas utilisé. |
| `AutoLoadForwarder:sortLoadedTreeObjects()` | 428 | ✍ Déplace les grumes vers les premières places de chargement pour qu'aucune place libre ne reste entre des places occupées, en remontant chaque grume déplacée en mode cinématique. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEvent | `onAutoLoadForwaderMountedTree` | 49 |
| registerFunction | `mountTreeToCrane` | 55 |
| registerFunction | `addTreeToLoadPlaces` | 56 |
| registerFunction | `removeMountedObject` | 57 |
| registerFunction | `sortLoadedTreeObjects` | 58 |
| registerOverwrittenFunction | `getAreControlledActionsAllowed` | 64 |
| registerOverwrittenFunction | `addToPhysics` | 65 |
| registerEventListener | `onLoad` | 71 |
| registerEventListener | `onPostLoad` | 72 |
| registerEventListener | `onDelete` | 73 |
| registerEventListener | `onUpdate` | 74 |
| registerEventListener | `onRootVehicleChanged` | 75 |

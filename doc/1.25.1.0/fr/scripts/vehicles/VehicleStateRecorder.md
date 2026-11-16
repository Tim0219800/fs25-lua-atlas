# vehicles/VehicleStateRecorder.lua

*[English version](../../../scripts/vehicles/VehicleStateRecorder.md)*

Source: `dataS/scripts/vehicles/VehicleStateRecorder.lua` — FS25 1.25.1.0

✍ Outil de développement qui enregistre au fil du temps les transformations et la visibilité des nœuds d'un véhicule présents dans le mapping i3d, puis les écrit en XML dans un dossier `giantsTools` à côté de la config du véhicule. Il peut durer un temps fixé ou suivre une animation nommée en remplaçant temporairement `SpecializationUtil.raiseEvent`. Des commandes console le démarrent et l'arrêtent, et un second enregistrement d'animation simultané est refusé.

- **VehicleStateRecorder** (l.14)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `VehicleStateRecorder.new(vehicle: any, name: any, duration: any, animationName: any)` | 18 | ✍ Crée un enregistreur pour un véhicule avec nom et durée (en secondes) optionnels. Avec un nom d'animation, il s'accroche à `SpecializationUtil.raiseEvent` et démarre sur `onPlayAnimation` ; sinon il démarre aussitôt via `addUpdateable`. |
| `VehicleStateRecorder:update(dt: any)` | 72 | ✍ Mise à jour par image : s'arrête quand la durée est écoulée, sinon enregistre l'état courant du véhicule et affiche un libellé d'enregistrement à l'écran. |
| `VehicleStateRecorder:finish()` | 89 | ✍ Écrit tous les états de nœuds enregistrés dans un fichier XML (translation, rotation en degrés, visibilité, uniquement en cas de changement), puis retire l'updateable et restaure le `raiseEvent` d'origine. |
| `VehicleStateRecorder:recordVehicle()` | 154 | ✍ Enregistre l'état de chaque nœud de composant du véhicule et de sa hiérarchie d'enfants. |
| `VehicleStateRecorder:recordNode(node: any, indexPath: any, separator: any)` | 162 | ✍ Enregistre récursivement un nœud s'il figure dans les `i3dMappings` du véhicule ; un nouvel échantillon n'est stocké que si translation, rotation ou visibilité ont changé. Le premier échantillon mémorise aussi le nom du nœud et le nom de sa classe. |
| `VehicleStateRecorder.consoleCommand(unusedSelf: any, name: any, duration: any)` | 224 | ✍ Gestionnaire de commande console qui bascule un enregistrement chronométré sur le véhicule sélectionné du joueur local ; un second appel termine l'enregistrement en cours. |
| `VehicleStateRecorder.consoleCommandAnimation(unusedSelf: any, animationName: any)` | 239 | ✍ Gestionnaire de commande console qui bascule un enregistrement lié à une animation nommée sur le véhicule sélectionné ; un second appel termine l'enregistrement en cours. |

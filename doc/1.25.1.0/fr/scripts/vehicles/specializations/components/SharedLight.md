# vehicles/specializations/components/SharedLight.lua

*[English version](../../../../../scripts/vehicles/specializations/components/SharedLight.md)*

Source: `dataS/scripts/vehicles/specializations/components/SharedLight.lua` — FS25 1.25.1.0

✍ Modèle de lumière réutilisable chargé depuis un asset XML/i3d partagé (`data/shared/assets/lights`) et lié à un nœud du véhicule. Au chargement il répartit les lumières de l'asset (par défaut, haut, bas, frein, marche arrière, jour, clignotants gauche et droit) dans les tables `staticLights` du véhicule sous forme d'objets `StaticLight`, construit éventuellement un `StaticLightCompound` et applique les matériaux de base et de verre. Les indicateurs de rôle (recul, clignotant gauche/droit) et les préréglages de rotation viennent du XML du véhicule. Visuel côté client ; fournit une commande console de debug qui fait apparaître toutes les lumières partagées.

- **SharedLight** (l.14)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SharedLight.new(vehicle: any, staticLights: any, customMt: any)` | 18 | ✍ Crée une lumière partagée liée à un véhicule et aux tables de catégories `staticLights` du véhicule ; les indicateurs de rôle recul et clignotants démarrent à false. |
| `SharedLight:delete()` | 33 | ✍ Supprime le fichier XML en attente, le nœud de lumière et libère la requête i3d partagée. |
| `SharedLight:setCallback(callback: any, callbackTarget: any)` | 52 | ✍ Mémorise un callback (et une cible optionnelle) appelé avec l'indicateur de succès après le chargement. |
| `SharedLight:onFinished(success: any)` | 59 | ✍ Appelle le callback enregistré, avec ou sans cible, en lui passant l'indicateur de succès. |
| `SharedLight:setRotationNodes(rotationNodes: any)` | 71 | ✍ Mémorise une table associant noms de nœuds de rotation et vecteurs de rotation, appliquée au chargement de l'asset. |
| `SharedLight:setLightTypes(lightTypes: any, excludedLightTypes: any)` | 77 | ✍ Mémorise les types de lumière et types exclus transmis à la lumière composée. |
| `SharedLight:loadFromVehicleXML(key: any, baseDirectory: any, callback: any)` | 84 | ✍ Lit une entrée de lumière partagée dans le XML du véhicule (`#filename`, `#linkNode`, nœuds de rotation, types de lumière, indicateurs recul/clignotant, mappage de fonctions, attributs supplémentaires) et lance le chargement. Refuse les nœuds d'attache cachés ou de référence chargée à l'exécution. Le résultat passe par `callback(success, self ou nil)`. |
| `SharedLight:loadFromXML(linkNode: any, xmlFilename: any, baseDirectory: any)` | 146 | ✍ Charge le XML de lumière partagée et lance le chargement i3d partagé asynchrone. Si le XML manque, il consulte `FS22_RENAMED_LIGHTS` pour avertir d'un asset renommé. Renvoie false (après `onFinished(false)`) en cas d'échec. |
| `SharedLight:onI3DLoaded(i3dNode: any, failedReason: any, args: any)` | 201 | ✍ Callback asynchrone : charge les lumières de chaque catégorie dans les tables du véhicule (la catégorie par défaut est redirigée vers les listes de recul ou de clignotants selon les indicateurs de rôle), applique les rotations, construit le composé optionnel, applique les matériaux de base et de verre et lie le nœud sous le nœud d'attache. |
| `SharedLight.consoleCommandDebug(_: any, defaultLight: any, brakeLight: any, highBeam: any, workLightBack: any, workLightFront: any, turnLightLeft: any, turnLeftRight: any, reverseLight: any)` | 272 | ✍ Commande console de debug : charge tous les XML de lumières partagées du dossier de lumières du jeu en rangées devant le joueur avec un faux véhicule, active les types de lumière passés en chaînes `true` et journalise combien ont chargé. Elle fait aussi apparaître les gyrophares de debug. |
| `SharedLight.registerXMLPaths(schema: any, basePath: any)` | 445 | ✍ Vide ; n'enregistre aucun chemin XML. |
| `SharedLight.registerExternalXMLPaths(schema: any)` | 466 | ✍ Enregistre les chemins XML de l'asset de lumière partagée : chaque catégorie de lumière statique, les matériaux de base et de verre et la lumière statique composée. |

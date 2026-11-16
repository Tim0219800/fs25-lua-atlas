# handTools/HandToolSystem.lua

*[English version](../../../scripts/handTools/HandToolSystem.md)*

Source: `dataS/scripts/handTools/HandToolSystem.lua` — FS25 1.25.1.0

✍ Gestionnaire (fille de `AbstractManager`) qui suit tous les outils à main et holders du monde, par identifiant unique et par click box. Il sauvegarde les outils dans `handTools.xml`, les recharge via `HandToolLoadingData`, suit les chargements en attente pour le démarrage de la mission et publie `HANDTOOL_ADDED` et `HANDTOOL_REMOVED` sur le message center. Il enregistre les commandes console `gsHandToolReload` et, avec les commandes de test, `gsHandToolsPendingLoadings`.

- **HandToolSystem** hérite de `AbstractManager` (l.21)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `HandToolSystem.new() → HandToolSystem` | 50 | ✍ Crée le système avec des collections vides et enregistre ses commandes console ; les fonctions de traitement qu'elles nomment ne sont pas définies dans ce fichier (NON VÉRIFIÉ). À noter : `handToolsToLoad` n'est pas initialisé ici alors que `loadHandToolFromXML` l'incrémente. |
| `HandToolSystem:addHandTool(handTool: any)` | 127 | ✍ Ajoute un outil à main après vérification du type et de l'unicité de son identifiant ; en attribue un s'il n'en a pas. Publie `HANDTOOL_ADDED`. Renvoie true en cas de succès, false si erreur ou doublon. |
| `HandToolSystem:removeHandTool(handTool: any)` | 154 | ✍ Retire l'outil de la liste et de la table des identifiants uniques, puis publie `HANDTOOL_REMOVED`. Ne fait rien pour nil. |
| `HandToolSystem:getHandToolByUniqueId(uniqueId: any)` | 173 | ✍ Renvoie l'outil à main portant cet identifiant unique, ou nil. |
| `HandToolSystem:addHandToolHolder(handToolHolder: any)` | 191 | ✍ Ajoute un holder (type vérifié), lui attribue un identifiant unique si besoin et indexe ses click boxes. Renvoie false si l'identifiant est déjà utilisé. À noter : le holder est inséré dans la liste avant le test de doublon, donc un doublon refusé y reste (bug apparent). |
| `HandToolSystem:removeHandToolHolder(handToolHolder: any)` | 226 | ✍ Retire un holder de la liste, de la table des identifiants uniques et de celle des click boxes. |
| `HandToolSystem:getHandToolHolderByUniqueId(uniqueId: any)` | 251 | ✍ Renvoie le holder portant cet identifiant unique, ou nil. |
| `HandToolSystem:save(xmlFilename: any, usedModNames: any)` | 264 | ✍ Crée `xmlFilename` avec la racine `handTools` et le schéma de sauvegarde, y écrit les outils à sauvegarder, puis libère le fichier XML. |
| `HandToolSystem:saveToXML(handTools: any, xmlFile: any, usedModNames: any)` | 274 | ✍ Écrit chaque outil dont `getNeedsSaving()` est vrai sous `handTools.handTool(i)` et ne sauvegarde le fichier que si au moins un outil a été écrit. |
| `HandToolSystem:saveHandToolToXML(handTool: any, xmlFile: any, index: any, i: any, usedModNames: any)` | 293 | ✍ Écrit un outil : nom du mod (aussi noté dans `usedModNames`), nom de fichier de config converti pour le réseau et encodé HTML, puis les données propres de `saveToXMLFile`. |
| `HandToolSystem:loadHandToolFromXML(xmlFile: any, key: any)` | 356 | ✍ Lit le nom de fichier à `key`, cherche l'item de boutique et lance le chargement via `HandToolLoadingData` avec les données de sauvegarde ; le callback est `loadHandToolFinished`. Renvoie true si un chargement a démarré, false si l'item est inconnu. À noter : `allowedToLoad` est une constante à true. |
| `HandToolSystem:loadHandToolFinished(handTool: any, loadingState: any)` | 390 | ✍ Callback de chargement : collecte les outils chargés avec succès, retient le premier état non OK, décrémente le compteur et, à 0, appelle le callback asynchrone mémorisé avec la liste et l'état final, puis l'efface. |
| `HandToolSystem:addPendingHandToolLoad(handTool: any)` | 414 | ✍ Marque un outil à main comme en attente (chargement ou synchronisation en cours). |
| `HandToolSystem:removePendingHandToolLoad(handTool: any)` | 420 | ✍ Retire un outil à main de la liste des attentes. |
| `HandToolSystem:canStartMission()` | 431 | ✍ Renvoie true seulement si tous les outils à main enregistrés sont synchronisés et qu'aucun chargement n'est en attente. |

## Messages

- publie `MessageType.HANDTOOL_ADDED` (l.147)
- publie `MessageType.HANDTOOL_REMOVED` (l.168)

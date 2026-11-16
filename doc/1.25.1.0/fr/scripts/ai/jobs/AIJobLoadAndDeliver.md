# ai/jobs/AIJobLoadAndDeliver.lua

*[English version](../../../../scripts/ai/jobs/AIJobLoadAndDeliver.md)*

Source: `dataS/scripts/ai/jobs/AIJobLoadAndDeliver.lua` — FS25 1.25.1.0

✍ Job où un conducteur IA charge un type de remplissage choisi à une station de chargement, roule vers une station de déchargement et décharge, éventuellement en boucle. Les tâches sont trajet de chargement, `AITaskLoading`, trajet de déchargement et `AITaskDischarge` ; les paramètres sont véhicule, station de chargement, type de remplissage, station de déchargement et boucle. Les unités de remplissage et points de déchargement du véhicule et de ses éléments attelés sont collectés et traités un par un.

- **AIJobLoadAndDeliver** hérite de `AIJob` (l.18)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIJobLoadAndDeliver.new(isServer: any, customMt: any)` | 22 | ✍ Crée les quatre tâches, les cinq paramètres et leurs groupes d'interface (véhicule, station de chargement avec type de remplissage, station de déchargement, boucle). |
| `AIJobLoadAndDeliver:setValues()` | 73 | ✍ Collecte les unités de remplissage IA et points de déchargement du véhicule et des éléments attelés triés par décalage Z, règle les décalages de cible, puis pour le type choisi prend positions, directions et déclencheurs via `getAITargetPositionAndDirection` des deux stations. Sort tôt si véhicule ou station manque. |
| `AIJobLoadAndDeliver:validate(farmId: any)` | 175 | ✍ Valide le véhicule (il faut des points de déchargement et de chargement), le type de remplissage, la station de chargement et celle de déchargement pour ce type et cette ferme, en marquant les invalides. Renvoie le résultat et le premier texte d'erreur. |
| `AIJobLoadAndDeliver:applyCurrentState(vehicle: any, mission: any, farmId: any, isDirectStart: any)` | 217 | ✍ Active la boucle, reprend stations et boucle du dernier job de cette classe du véhicule, puis remplit les listes de stations de déchargement et de chargement sélectionnables (accessibles, compatibles IA, triées par nom) et met à jour les types de remplissage. |
| `AIJobLoadAndDeliver:updateFillTypes(loadingStation: any)` | 262 | ✍ Donne au paramètre de type de remplissage les types IA de la station de chargement avec le niveau de remplissage actuel de la ferme du joueur local. Utilise `g_localPlayer`, donc côté client. |
| `AIJobLoadAndDeliver:onParameterValueChanged(parameter: any)` | 276 | ✍ Quand le paramètre de station de chargement change, rafraîchit les types de remplissage sélectionnables. |
| `AIJobLoadAndDeliver:start(farmId: any)` | 285 | ✍ Démarrage de base, puis sur le serveur crée l'agent et appelle `vehicle:aiJobStarted`. |
| `AIJobLoadAndDeliver:stop(aiMessage: any)` | 298 | ✍ Sur le serveur supprime l'agent et appelle `vehicle:aiJobFinished`, exécute l'arrêt de base, puis vide les listes d'infos de points. |
| `AIJobLoadAndDeliver:startTask(task: any)` | 314 | ✍ Le démarrage du trajet de chargement remarque tous les points de déchargement comme à traiter, celui du trajet de déchargement remarque toutes les unités de chargement ; puis exécute `startTask` de base. |
| `AIJobLoadAndDeliver:getStartTaskIndex()` | 332 | ✍ Commence par le trajet de chargement si une unité de chargement est vide, sinon directement par le trajet de déchargement. |
| `AIJobLoadAndDeliver:canContinueWork()` | 377 | ✍ Échoue avec le `AIMessageError*` correspondant si le véhicule ou une station a été supprimé ou si la station de déchargement n'a plus de capacité. Pendant le chargement, si la station n'a plus le type et qu'aucune unité chargée ne le contient, se termine par `AIMessageSuccessSiloEmpty`. |
| `AIJobLoadAndDeliver:getNextTaskIndex(isSkipTask: any)` | 421 | ✍ Après le trajet de chargement ou le chargement, choisit la prochaine unité vide à traiter et reste en chargement ; après le trajet de déchargement ou le déchargement, choisit le prochain point contenant le type choisi et passe au déchargement ; sinon se rabat sur l'index de base. |
| `AIJobLoadAndDeliver:getIsAvailableForVehicle(vehicle: any)` | 464 | ✍ Exige `createAgent`, `setAITarget`, la capacité IA et la prise en charge du job, puis des points de déchargement et des unités de remplissage IA sur le véhicule ou ses éléments attelés. À noter : renvoie true dès qu'un élément attelé a des points de déchargement, avant de vérifier les unités de remplissage (oubli apparent). |
| `AIJobLoadAndDeliver:getTitle()` | 538 | ✍ Renvoie le nom du véhicule du paramètre véhicule, ou une chaîne vide s'il n'y en a pas. |
| `AIJobLoadAndDeliver:getDescription()` | 549 | ✍ Ajoute à la description de base un texte localisé pour la tâche courante : trajet de chargement, chargement, trajet de déchargement ou déchargement. |
| `AIJobLoadAndDeliver:getIsLooping()` | 568 | ✍ Renvoie la valeur du paramètre de boucle. |
| `AIJobLoadAndDeliver:getIsStartable(connection: any)` | 574 | ✍ Contrôle côté serveur avant démarrage : refuse si la limite d'IA est atteinte, si le véhicule a disparu, si le joueur n'a pas la permission `hireAssistant` ou si le véhicule est utilisé. Renvoie true plus `AIJob.START_SUCCESS`, sinon false plus un état `AIJobLoadAndDeliver.START_ERROR_*`. |
| `AIJobLoadAndDeliver.getIsStartErrorText(state: any)` | 597 | ✍ Convertit un état de démarrage renvoyé par `getIsStartable` en texte localisé : limite atteinte, véhicule supprimé, pas de permission, véhicule utilisé, sinon le texte de succès. Les constantes `AIJobLoadAndDeliver.START_ERROR_*` ne sont pas définies dans ce fichier (NON VÉRIFIÉ). |

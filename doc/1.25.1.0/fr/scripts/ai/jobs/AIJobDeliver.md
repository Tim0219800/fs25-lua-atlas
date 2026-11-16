# ai/jobs/AIJobDeliver.lua

*[English version](../../../../scripts/ai/jobs/AIJobDeliver.md)*

Source: `dataS/scripts/ai/jobs/AIJobDeliver.lua` — FS25 1.25.1.0

✍ Job où un conducteur IA attend que sa remorque soit remplie, roule vers une station de déchargement et décharge, éventuellement en boucle. Les tâches sont `AITaskDriveTo` (position de chargement), `AITaskWaitForFilling`, `AITaskDriveTo` (déchargement) et `AITaskDischarge` ; les paramètres sont véhicule, station de déchargement, boucle et position/angle de chargement. Les points de déchargement du véhicule et de ses éléments attelés sont collectés et triés par décalage Z.

- **AIJobDeliver** hérite de `AIJob` (l.18)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIJobDeliver.new(isServer: any, customMt: any)` | 22 | ✍ Crée les quatre tâches, les paramètres véhicule, station de déchargement, boucle et position-angle (pas de 5 degrés) et leurs groupes d'interface. |
| `AIJobDeliver:setValues()` | 69 | ✍ Reconstruit les données des tâches à partir des paramètres : fixe le véhicule sur toutes les tâches, collecte les points de déchargement (triés par décalage Z) et les types acceptés par la station, règle les décalages de cible et la position et direction de chargement. Sort tôt si véhicule, station ou points de déchargement manquent. |
| `AIJobDeliver:validate(farmId: any)` | 139 | ✍ Valide le véhicule (il doit avoir des points de déchargement), la station de déchargement et la position de chargement, en marquant chaque paramètre invalide. Renvoie le résultat global et le premier texte d'erreur. |
| `AIJobDeliver:applyCurrentState(vehicle: any, mission: any, farmId: any, isDirectStart: any)` | 172 | ✍ Initialise à partir du véhicule : active la boucle, reprend station, boucle et position du dernier `AIJobDeliver` du véhicule s'il existe, sinon utilise sa position et son cap. Liste les stations de déchargement accessibles qui gèrent des types IA, triées par nom. |
| `AIJobDeliver:start(farmId: any)` | 216 | ✍ Démarrage de base, puis sur le serveur crée l'agent IA du véhicule et appelle `vehicle:aiJobStarted`. |
| `AIJobDeliver:stop(aiMessage: any)` | 229 | ✍ Sur le serveur supprime l'agent et appelle `vehicle:aiJobFinished`, puis exécute l'arrêt de base et vide la liste des points de déchargement. |
| `AIJobDeliver:startTask(task: any)` | 244 | ✍ Quand la tâche d'attente de remplissage démarre, remarque tous les points de déchargement comme à traiter, puis exécute `startTask` de base. |
| `AIJobDeliver:getStartTaskIndex()` | 257 | ✍ Choisit la tâche d'entrée : si le véhicule est à moins de 1 m de la position cible il commence par l'attente (sautée si aucune unité n'est vide) ; sinon il commence par rouler vers le chargement, en sautant conduite et attente si rien n'est vide. |
| `AIJobDeliver:getNextTaskIndex(isSkipTask: any)` | 292 | ✍ Après l'attente ou le déchargement, cherche des points de déchargement à traiter avec contenu : répète le déchargement pour le même déclencheur, ou prépare le trajet vers la position de déchargement du type suivant. Les points dont le type n'est pas géré par la station sont écartés ; sinon se rabat sur l'index de base. |
| `AIJobDeliver:canContinueWork()` | 349 | ✍ Échoue avec `AIMessageErrorVehicleDeleted` ou `AIMessageErrorUnloadingStationDeleted` si l'un n'existe plus. Pendant l'attente, échoue avec `AIMessageErrorUnloadingStationFull` si aucun type chargé n'a de capacité libre dans la station. |
| `AIJobDeliver:getHasLoadedValidFillType()` | 386 | ✍ Vrai si une unité de remplissage de déchargement contient plus de 1 unité d'un type que la station de déchargement accepte pour l'IA. |
| `AIJobDeliver:getCanSkipTask()` | 405 | ✍ Vrai seulement pendant l'attente de remplissage non terminée avec un type valide déjà chargé, ce qui permet au joueur d'arrêter d'attendre. |
| `AIJobDeliver:skipCurrentTask()` | 417 | ✍ Ignore la tâche d'attente de remplissage si elle est courante ; les autres tâches ne sont pas ignorables ici. |
| `AIJobDeliver:getIsAvailableForVehicle(vehicle: any)` | 425 | ✍ Exige `createAgent`, `setAITarget`, la capacité de démarrer l'IA et la prise en charge de cette classe de job, plus au moins un point de déchargement IA sur le véhicule ou un de ses éléments attelés. |
| `AIJobDeliver:getTitle()` | 456 | ✍ Renvoie le nom du véhicule du paramètre véhicule, ou une chaîne vide s'il n'y en a pas. |
| `AIJobDeliver:getIsLooping()` | 467 | ✍ Renvoie la valeur du paramètre de boucle. |
| `AIJobDeliver:getIsStartable(connection: any)` | 473 | ✍ Contrôle côté serveur avant démarrage : refuse si la limite d'IA est atteinte, si le véhicule a disparu, si le joueur n'a pas la permission `hireAssistant` ou si le véhicule est utilisé. Renvoie true plus `AIJob.START_SUCCESS`, sinon false plus un état `AIJobDeliver.START_ERROR_*`. |
| `AIJobDeliver:getDescription()` | 496 | ✍ Ajoute à la description de base un texte localisé pour la tâche courante : trajet vers le chargement, attente de remplissage, trajet vers le déchargement ou déchargement. |
| `AIJobDeliver.getIsStartErrorText(state: any)` | 515 | ✍ Convertit un état de démarrage renvoyé par `getIsStartable` en texte localisé : limite atteinte, véhicule supprimé, pas de permission, véhicule utilisé, sinon le texte de succès. Les constantes `AIJobDeliver.START_ERROR_*` ne sont pas définies dans ce fichier (NON VÉRIFIÉ). |

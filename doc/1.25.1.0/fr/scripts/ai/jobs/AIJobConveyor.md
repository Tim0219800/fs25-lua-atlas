# ai/jobs/AIJobConveyor.lua

*[English version](../../../../scripts/ai/jobs/AIJobConveyor.md)*

Source: `dataS/scripts/ai/jobs/AIJobConveyor.lua` — FS25 1.25.1.0

✍ Job qui fait fonctionner un véhicule convoyeur (`spec_aiConveyorBelt`) avec une seule tâche `AITaskConveyor` et un paramètre véhicule. Le véhicule lui-même notifie les clients du démarrage et de l'arrêt ; le coût par ms est bien plus faible que pour les jobs de conduite.

- **AIJobConveyor** hérite de `AIJob` (l.18)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIJobConveyor.new(isServer: any, customMt: any)` | 22 | ✍ Crée le job avec une `AITaskConveyor`, un paramètre véhicule nommé "vehicle" et son groupe de paramètres. |
| `AIJobConveyor:getPricePerMs()` | 43 | ✍ Renvoie 0.00005 par milliseconde. |
| `AIJobConveyor:start(farmId: any)` | 49 | ✍ Appelle le démarrage de base et, sur le serveur, appelle `vehicle:aiJobStarted` pour le véhicule du job, ce qui notifie les clients. Aucun agent n'est créé. |
| `AIJobConveyor:stop(aiMessage: any)` | 61 | ✍ Sur le serveur appelle `vehicle:aiJobFinished()` avant l'arrêt de base. |
| `AIJobConveyor:applyCurrentState(vehicle: any, mission: any, farmId: any, isDirectStart: any)` | 73 | ✍ Mémorise le véhicule donné dans le paramètre véhicule après l'initialisation de base. |
| `AIJobConveyor:getIsAvailableForVehicle(vehicle: any)` | 81 | ✍ Vrai si le véhicule possède `spec_aiConveyorBelt`, peut démarrer l'IA et déclare cette classe de job comme prise en charge via `getIsAIJobSupported`. |
| `AIJobConveyor:getTitle()` | 87 | ✍ Renvoie le nom du véhicule du paramètre véhicule, ou une chaîne vide s'il n'y en a pas. |
| `AIJobConveyor:setValues()` | 98 | ✍ Réinitialise les tâches et transmet le véhicule du paramètre à la tâche de convoyeur. |
| `AIJobConveyor:validate(farmId: any)` | 106 | ✍ Marque tous les paramètres comme valides, puis valide le paramètre véhicule sans exiger de cible IA, et le marque invalide en cas d'échec. Renvoie le résultat et le texte d'erreur. |
| `AIJobConveyor:getIsStartable(connection: any)` | 119 | ✍ Contrôle côté serveur avant démarrage : refuse si la limite d'IA est atteinte, si le véhicule a disparu, si le joueur n'a pas la permission `hireAssistant` ou si le véhicule est utilisé. Renvoie true plus `AIJob.START_SUCCESS`, sinon false plus un état `AIJobConveyor.START_ERROR_*`. |
| `AIJobConveyor.getIsStartErrorText(state: any)` | 142 | ✍ Convertit un état de démarrage renvoyé par `getIsStartable` en texte localisé : limite atteinte, véhicule supprimé, pas de permission, véhicule utilisé, sinon le texte de succès. Les constantes `AIJobConveyor.START_ERROR_*` ne sont pas définies dans ce fichier (NON VÉRIFIÉ). |

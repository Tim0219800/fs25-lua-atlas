# ai/jobs/AIJobGoTo.lua

*[English version](../../../../scripts/ai/jobs/AIJobGoTo.md)*

Source: `dataS/scripts/ai/jobs/AIJobGoTo.lua` — FS25 1.25.1.0

✍ Job de conduite le plus simple : l'IA conduit un véhicule vers une position et un cap choisis avec une seule `AITaskDriveTo`. Les paramètres sont le véhicule et une position/angle sans pas d'angle.

- **AIJobGoTo** hérite de `AIJob` (l.18)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIJobGoTo.new(isServer: any, customMt: any)` | 22 | ✍ Crée la tâche de trajet, les paramètres véhicule et position-angle et leurs groupes. |
| `AIJobGoTo:start(farmId: any)` | 48 | ✍ Démarrage de base, puis pour un véhicule non nil crée l'agent sur le serveur et appelle `vehicle:aiJobStarted` (côté serveur comme client). |
| `AIJobGoTo:stop(aiMessage: any)` | 62 | ✍ Pour un véhicule non nil supprime l'agent sur le serveur et appelle `vehicle:aiJobFinished`, puis exécute l'arrêt de base. |
| `AIJobGoTo:getTarget()` | 81 | ✍ Renvoie les x, z cibles de la tâche de trajet et l'angle de cap issu de sa direction (nil si aucune direction). |
| `AIJobGoTo:getIsAvailableForVehicle(vehicle: any)` | 92 | ✍ Exige `createAgent`, `setAITarget`, la capacité de démarrer l'IA et la prise en charge de cette classe de job. |
| `AIJobGoTo:getTitle()` | 106 | ✍ Renvoie le nom du véhicule du paramètre véhicule, ou une chaîne vide s'il n'y en a pas. |
| `AIJobGoTo:applyCurrentState(vehicle: any, mission: any, farmId: any, isDirectStart: any)` | 117 | ✍ Prend position et angle du dernier job de déplacement du véhicule (sauf démarrage direct), sinon de la pose du véhicule, avec le pas d'angle désactivé. |
| `AIJobGoTo:setValues()` | 147 | ✍ Réinitialise les tâches et transmet le véhicule ainsi que position et direction du paramètre à la tâche de trajet. |
| `AIJobGoTo:validate(farmId: any)` | 161 | ✍ Valide les paramètres véhicule et position, en marquant chacun invalide ; renvoie le résultat et le premier texte d'erreur. |
| `AIJobGoTo:getDescription()` | 182 | ✍ Ajoute le texte localisé « aller à la cible » à la description de base tant que la tâche de trajet est courante. |
| `AIJobGoTo:getIsStartable(connection: any)` | 195 | ✍ Contrôle côté serveur avant démarrage : refuse si la limite d'IA est atteinte, si le véhicule a disparu, si le joueur n'a pas la permission `hireAssistant` ou si le véhicule est utilisé. Renvoie true plus `AIJob.START_SUCCESS`, sinon false plus un état `AIJobGoTo.START_ERROR_*`. |
| `AIJobGoTo.getIsStartErrorText(state: any)` | 218 | ✍ Convertit un état de démarrage renvoyé par `getIsStartable` en texte localisé : limite atteinte, véhicule supprimé, pas de permission, véhicule utilisé, sinon le texte de succès. Les constantes `AIJobGoTo.START_ERROR_*` ne sont pas définies dans ce fichier (NON VÉRIFIÉ). |

# ai/jobs/AIJobFieldWork.lua

*[English version](../../../../scripts/ai/jobs/AIJobFieldWork.md)*

Source: `dataS/scripts/ai/jobs/AIJobFieldWork.lua` — FS25 1.25.1.0

✍ Job où un conducteur IA rejoint une position de départ puis travaille un champ avec les outils attelés : une `AITaskDriveTo` suivie d'une `AITaskFieldWork`. Les paramètres sont le véhicule et une position/angle. Les réglages du mode IA sont transmis avec le job, et le véhicule est notifié du démarrage et de l'arrêt (création de l'agent sur le serveur).

- **AIJobFieldWork** hérite de `AIJob` (l.18)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIJobFieldWork.new(isServer: any, customMt: any)` | 22 | ✍ Crée les tâches de trajet et de travail du champ, les paramètres véhicule et position-angle (sans pas) et leurs groupes. |
| `AIJobFieldWork:readStream(streamId: any, connection: any)` | 53 | ✍ Lecture de base, puis si un drapeau est levé lit les réglages du mode IA via `AIModeSelection.readAIModeSettingsFromStream` dans `pendingData` et active `pendingVehicle`, à appliquer quand le véhicule sera disponible. |
| `AIJobFieldWork:writeStream(streamId: any, connection: any)` | 64 | ✍ Écriture de base, puis un drapeau indiquant si un véhicule existe et, le cas échéant, les réglages de mode IA du véhicule via `writeAIModeSettingsToStream`. |
| `AIJobFieldWork:getStartTaskIndex()` | 90 | ✍ Renvoie 2 (travail du champ) pour un démarrage direct ou si le véhicule est à moins de 3 m de la position cible, sinon 1 (rouler d'abord). |
| `AIJobFieldWork:start(farmId: any)` | 109 | ✍ Démarrage de base, puis sur le serveur crée l'agent et appelle `vehicle:aiJobStarted`. |
| `AIJobFieldWork:stop(aiMessage: any)` | 122 | ✍ Sur le serveur supprime l'agent et appelle `vehicle:aiJobFinished`, puis exécute l'arrêt de base. |
| `AIJobFieldWork:applyCurrentState(vehicle: any, mission: any, farmId: any, isDirectStart: any)` | 134 | ✍ Prend position et angle du dernier job de travail du champ du véhicule (sauf démarrage direct), sinon de la pose du véhicule, et règle le pas d'angle au plus grand entre l'angle d'accrochage du véhicule et un angle issu du terrain, d'au moins 45 degrés. |
| `AIJobFieldWork:getIsAvailableForVehicle(vehicle: any)` | 167 | ✍ Vrai si le véhicule peut démarrer un travail des champs (`getCanStartFieldWork`) et déclare cette classe de job comme prise en charge. |
| `AIJobFieldWork:getTarget()` | 177 | ✍ Renvoie les x, z cibles de la tâche de trajet et l'angle de cap déduit de sa direction (0 si aucune). |
| `AIJobFieldWork:getTitle()` | 188 | ✍ Renvoie le nom du véhicule du paramètre véhicule, ou une chaîne vide s'il n'y en a pas. |
| `AIJobFieldWork:setValues()` | 199 | ✍ Réinitialise les tâches, fixe le véhicule sur les deux tâches et convertit le paramètre position-angle en position et direction cibles de la tâche de trajet. |
| `AIJobFieldWork:validate(farmId: any)` | 215 | ✍ Marque les paramètres comme valides, puis valide le paramètre véhicule et le marque invalide en cas d'échec. Renvoie le résultat et le texte d'erreur. |
| `AIJobFieldWork:getDescription()` | 228 | ✍ Ajoute à la description de base un texte localisé pour la tâche courante : trajet vers le champ ou travail du champ. |
| `AIJobFieldWork:getIsStartable(connection: any)` | 243 | ✍ Contrôle côté serveur avant démarrage : refuse si la limite d'IA est atteinte, si le véhicule a disparu, si le joueur n'a pas la permission `hireAssistant` ou si le véhicule est utilisé. Renvoie true plus `AIJob.START_SUCCESS`, sinon false plus un état `AIJobFieldWork.START_ERROR_*`. |
| `AIJobFieldWork.getIsStartErrorText(state: any)` | 266 | ✍ Convertit un état de démarrage renvoyé par `getIsStartable` en texte localisé : limite atteinte, véhicule supprimé, pas de permission, véhicule utilisé, sinon le texte de succès. Les constantes `AIJobFieldWork.START_ERROR_*` ne sont pas définies dans ce fichier (NON VÉRIFIÉ). |
| `AIJobFieldWork:getPricePerMs()` | 282 | ✍ Renvoie 0.0005 par milliseconde. |

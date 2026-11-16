# vehicles/specializations/AIModeSelection.lua

*[English version](../../../../scripts/vehicles/specializations/AIModeSelection.md)*

Source: `dataS/scripts/vehicles/specializations/AIModeSelection.lua` — FS25 1.25.1.0

✍ Spécialisation qui permet au joueur de faire passer un véhicule entre le mode assistant IA classique (WORKER) et le mode d'aide à la conduite (STEERING_ASSIST). Elle exige AIDrivable et AIAutomaticSteering. Elle conserve le mode courant, les réglages de parcours de champ et les réglages utilisateur, les sauvegarde, les synchronise à la connexion et gère l'entrée TOGGLE_AI (appui court : démarrer, appui long : ouvrir le dialogue de réglages IA). Les constantes MODE et NUM_BITS sont définies hors de ce dump (NON VÉRIFIÉ).

- **AIModeSelection** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIModeSelection.prerequisitesPresent(specializations: table) → boolean` | 35 | ✍ Renvoie vrai seulement si le type de véhicule possède aussi les spécialisations AIDrivable et AIAutomaticSteering. |
| `AIModeSelection.initSpecialization()` | 42 | ✍ Déclare les clés de sauvegarde du mode IA courant et des réglages utilisateur IA sous vehicles.vehicle(?).aiModeSelection. |
| `AIModeSelection.registerEvents(vehicleType: any)` | 50 | ✍ Enregistre les événements de véhicule onAIModeChanged et onAIModeSettingsChanged. |
| `AIModeSelection.registerFunctions(vehicleType: any)` | 57 | ✍ Enregistre sur le type de véhicule l'accesseur et le mutateur du mode, le gestionnaire de changement de réglages, les accesseurs des réglages de parcours de champ et les aides de lecture/écriture de flux. |
| `AIModeSelection.registerOverwrittenFunctions(vehicleType: any)` | 70 | ✍ Vide : cette spécialisation ne surcharge aucune fonction de base du véhicule. |
| `AIModeSelection.registerEventListeners(vehicleType: any)` | 75 | ✍ Abonne la spécialisation à onLoad, onDelete, onReadStream, onWriteStream, onUpdateTick, onDraw, onStateChange et onRegisterActionEvents. |
| `AIModeSelection:onLoad(savegame: table)` | 89 | ✍ Met le mode par défaut à WORKER, crée l'extension de HUD et charge depuis la sauvegarde le nom du mode et les réglages utilisateur (ignoré en cas de réinitialisation des véhicules). |
| `AIModeSelection:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 122 | ✍ Écrit dans le XML de sauvegarde le nom du mode courant et, s'ils existent, les réglages utilisateur. |
| `AIModeSelection:onReadStream(streamId: integer, connection: Connection)` | 135 | ✍ Côté client à la connexion : lit le mode courant (stocké à partir de zéro, donc +1) et éventuellement les attributs du parcours de champ, conservés pour être appliqués plus tard dans onUpdateTick. |
| `AIModeSelection:onWriteStream(streamId: integer, connection: Connection)` | 148 | ✍ Côté serveur à la connexion : écrit le mode courant et, s'ils existent, les réglages de parcours de champ. Symétrique de onReadStream. |
| `AIModeSelection:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 159 | ✍ Sur les clients, rafraîchit les événements d'action. Sauf rechargement de véhicule en cours, finalise les réglages utilisateur chargés et construit les réglages à partir des attributs de parcours reçus du serveur. |
| `AIModeSelection:onDraw(isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 186 | ✍ Ajoute à chaque image dessinée l'extension de HUD du mode IA de ce véhicule au panneau d'aide du HUD. |
| `AIModeSelection:onStateChange(state: any, data: any)` | 198 | ✍ Lors d'un attachement ou détachement (hors rechargement de véhicule), efface les réglages de parcours et utilisateur en cache afin de les régénérer pour la nouvelle combinaison de véhicules. |
| `AIModeSelection:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 208 | ✍ Client uniquement : quand le véhicule est actif pour la saisie, enregistre l'action TOGGLE_AI avec une priorité de texte élevée et met à jour l'état de l'événement d'action. |
| `AIModeSelection.actionEventToggleAIState(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any, isMouse: any, deviceCategory: any, binding: any, isReset: any)` | 224 | ✍ Gère TOGGLE_AI. Un appui maintenu au-delà de MODE_CHANGE_DURATION ouvre le dialogue de réglages IA. Un appui court en mode WORKER bascule l'assistant (permission hireAssistant requise), en STEERING_ASSIST active l'aide à la conduite si permise, sinon affiche un avertissement. |
| `AIModeSelection:setAIModeSelection(aiMode: any, noEventSend: any)` | 294 | ✍ Définit le mode IA, ou passe au suivant si aiMode vaut nil. En cas de changement, déclenche onAIModeChanged, rafraîchit les événements d'action et envoie un AISetModeEvent (sauf noEventSend). |
| `AIModeSelection:getAIModeSelection()` | 318 | ✍ Renvoie la valeur du mode IA courant. |
| `AIModeSelection:aiModeSettingsChanged(aiMode: any, fieldCourseSettings: any)` | 324 | ✍ Rappel du dialogue de réglages : mémorise les nouveaux réglages de parcours, envoie un AIModeSelectionSettingsEvent, applique le mode choisi et déclenche onAIModeSettingsChanged. |
| `AIModeSelection:initializeLoadedAIModeUserSettings()` | 337 | ✍ Transforme les réglages chargés depuis la sauvegarde en réglages utilisateur actifs : génère les réglages de parcours depuis le véhicule racine s'ils manquent, puis les réinitialise et les applique pour le mode courant. |
| `AIModeSelection:getAIModeFieldCourseSettings()` | 355 | ✍ Renvoie l'objet de réglages de parcours de champ stocké, ou nil s'il n'a pas encore été généré. |
| `AIModeSelection:setAIModeFieldCourseSettings(fieldCourseSettings: any)` | 361 | ✍ Remplace les réglages de parcours de champ, crée des réglages utilisateur par défaut si besoin, les réapplique pour le mode courant et déclenche onAIModeSettingsChanged. N'envoie aucun événement réseau lui-même. |
| `AIModeSelection.readAIModeSettingsFromStream(streamId: any, connection: any)` | 379 | ✍ Aide statique : lit un indicateur puis, s'il est vrai, les attributs de parcours de champ du flux ; renvoie une table d'attributs ou nil. |
| `AIModeSelection:applyReadAIModeSettingsFromStream(data: any)` | 391 | ✍ Applique les données issues de readAIModeSettingsFromStream : génère les réglages de parcours pour ce véhicule, applique les attributs et écarte les réglages utilisateur chargés en attente. Sans effet pour nil. |
| `AIModeSelection:writeAIModeSettingsToStream(streamId: any, connection: any)` | 403 | ✍ Finalise d'abord les réglages utilisateur chargés, puis écrit dans le flux un indicateur et les réglages de parcours s'ils existent. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEvent | `onAIModeChanged` | 51 |
| registerEvent | `onAIModeSettingsChanged` | 52 |
| registerFunction | `setAIModeSelection` | 58 |
| registerFunction | `getAIModeSelection` | 59 |
| registerFunction | `aiModeSettingsChanged` | 60 |
| registerFunction | `initializeLoadedAIModeUserSettings` | 61 |
| registerFunction | `getAIModeFieldCourseSettings` | 62 |
| registerFunction | `setAIModeFieldCourseSettings` | 63 |
| registerFunction | `applyReadAIModeSettingsFromStream` | 64 |
| registerFunction | `writeAIModeSettingsToStream` | 65 |
| registerEventListener | `onLoad` | 76 |
| registerEventListener | `onDelete` | 77 |
| registerEventListener | `onReadStream` | 78 |
| registerEventListener | `onWriteStream` | 79 |
| registerEventListener | `onUpdateTick` | 80 |
| registerEventListener | `onDraw` | 81 |
| registerEventListener | `onStateChange` | 82 |
| registerEventListener | `onRegisterActionEvents` | 83 |

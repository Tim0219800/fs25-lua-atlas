# vehicles/specializations/VariableWorkWidth.lua

*[English version](../../../../scripts/vehicles/specializations/VariableWorkWidth.md)*

Source: `dataS/scripts/vehicles/specializations/VariableWorkWidth.lua` — FS25 1.25.1.0

✍ Spécialisation permettant au joueur (ou à l'IA) de réduire ou d'élargir la largeur de travail d'un outil en activant des sections à gauche et à droite. Les sections peuvent désactiver zones de travail et effets, et des nœuds de section sont déplacés ou tournés selon la largeur choisie. Elle ajoute un type de configuration `variableWorkWidth`, sauvegarde l'état gauche/droite, le synchronise via `VariableWorkWidthStateEvent` et affiche une extension de HUD. À noter : des écouteurs `onDraw` et `onDelete` sont enregistrés mais aucune fonction correspondante n'est définie dans ce fichier (NON VÉRIFIÉ : fournies ailleurs ?).

- **VariableWorkWidth** (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `VariableWorkWidth.prerequisitesPresent(specializations: any)` | 22 | ✍ Renvoie toujours true : aucun prérequis. |
| `VariableWorkWidth.initSpecialization()` | 28 | ✍ Ajoute le type de configuration `variableWorkWidth`, enregistre les chemins XML (sections, nœuds de section, zone de travail de référence, états par défaut et IA, `section#index` des zones de travail) et les attributs de sauvegarde `leftSide` et `rightSide`. |
| `VariableWorkWidth.registerSectionPaths(schema: any, basePath: any)` | 57 | ✍ Enregistre les chemins XML des sections (côté, centre, largeur, nœud de largeur max, effets) et des nœuds de section (translation ou rotation min/max, indice de zone de travail) sous le chemin de base donné. |
| `VariableWorkWidth.registerEvents(vehicleType: any)` | 77 | ✍ Enregistre l'événement `onVariableWorkWidthSectionChanged`, déclenché à chaque recalcul des sections. |
| `VariableWorkWidth.registerFunctions(vehicleType: any)` | 83 | ✍ Ajoute au type de véhicule les fonctions publiques (setSectionsActive, updateSections, getVariableWorkWidth, getEffectByNode, etc.). |
| `VariableWorkWidth.registerOverwrittenFunctions(vehicleType: any)` | 96 | ✍ Surcharge `loadWorkAreaFromXML` et `getIsWorkAreaActive` pour lier les zones de travail à une section. |
| `VariableWorkWidth.registerEventListeners(vehicleType: any)` | 103 | ✍ S'abonne à onPostLoad, aux flux de lecture/écriture, à l'enregistrement des actions, aux événements de démarrage IA, à onDraw et onDelete. |
| `VariableWorkWidth:onPostLoad(savegame: any)` | 116 | ✍ Charge sections et nœuds de section depuis la configuration choisie (ou la clé de base), relie les effets, calcule la largeur relative et absolue de chaque section d'après son nœud de largeur max, trie chaque côté par largeur, lit les états par défaut/IA, applique la sauvegarde et crée l'extension de HUD. Retire les écouteurs inutiles sans sections ou sur serveur. |
| `VariableWorkWidth:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 294 | ✍ Écrit les états de section `leftSide` et `rightSide` dans la sauvegarde quand le véhicule a des sections. |
| `VariableWorkWidth:onReadStream(streamId: integer, connection: Connection)` | 306 | ✍ Connexion d'un client : lit les états gauche et droit (nombre de bits fixe `SEND_NUM_BITS`) et les applique sans envoyer d'événement. |
| `VariableWorkWidth:onWriteStream(streamId: integer, connection: Connection)` | 316 | ✍ Côté serveur lors d'une connexion : écrit les états gauche et droit dans le flux. |
| `VariableWorkWidth:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 331 | ✍ Enregistre les actions VARIABLE_WORK_WIDTH_LEFT, _RIGHT et _TOGGLE quand la fonction est active, et note si l'une est assignée pour afficher l'aide de saisie. |
| `VariableWorkWidth.actionEventWorkWidthLeft(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 355 | ✍ Rappel d'entrée : modifie l'état du côté gauche selon la valeur d'entrée (soustraction). |
| `VariableWorkWidth.actionEventWorkWidthRight(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 362 | ✍ Rappel d'entrée : modifie l'état du côté droit selon la valeur d'entrée (soustraction). |
| `VariableWorkWidth.actionEventWorkWidthToggle(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 369 | ✍ Rappel d'entrée : abaisse les deux côtés d'un cran sous le plus petit état actuel, puis revient au maximum quand il passe sous l'état minimal. |
| `VariableWorkWidth:onAIFieldWorkerStart()` | 383 | ✍ Serveur uniquement : au démarrage de l'IA, si `aiKeepCurrentWidth` est faux, applique les états gauche/droit configurés pour l'IA. |
| `VariableWorkWidth:onAIImplementStart()` | 394 | ✍ Serveur uniquement : comme au démarrage du travailleur IA, applique les états IA au démarrage de l'outil sous contrôle IA. |
| `VariableWorkWidth:setVariableWorkWidthActive(isActive: any)` | 405 | ✍ Active ou désactive la fonction. Sur le serveur, la désactivation remet les deux côtés au maximum. Demande une mise à jour des actions. |
| `VariableWorkWidth:setSectionsActive(leftSide: any, rightSide: any, noEventSend: any)` | 420 | ✍ Définit les états gauche et droit (bornés entre 0 et le maximum du côté). En cas de changement, recalcule les sections et envoie `VariableWorkWidthStateEvent` sauf `noEventSend`. |
| `VariableWorkWidth:setSectionNodePercentage(sectionNodes: any, percentage: any)` | 437 | ✍ Déplace/tourne chaque nœud de section par interpolation linéaire entre ses valeurs min et max (translation, translation X, rotation) au pourcentage 0..1 donné, puis met à jour la largeur de la zone de travail liée. |
| `VariableWorkWidth:updateSections()` | 464 | ✍ Met à jour les drapeaux actifs des deux côtés, positionne les nœuds de section selon la largeur de la section courante (0 si le côté est éteint) et déclenche `onVariableWorkWidthSectionChanged`. |
| `VariableWorkWidth:updateSectionStates(sections: any, state: any)` | 481 | ✍ Marque actives les sections jusqu'à l'état donné et arrête les effets en cours des sections devenues inactives. |
| `VariableWorkWidth:getEffectByNode(node: integer)` | 501 | ✍ Crochet vide ne renvoyant rien ; les autres spécialisations qui possèdent des effets sont censées le surcharger (NON VÉRIFIÉ d'après ce seul fichier). |
| `VariableWorkWidth:getVariableWorkWidth(isLeft: boolean) → number, number, boolean` | 511 | ✍ Pour le côté gauche ou droit, renvoie la largeur absolue courante, la largeur max et si des sections existent. Sans sections : 1, 1, false. |
| `VariableWorkWidth:getVariableWorkWidthUsage() → number` | 533 | ✍ Renvoie nil par défaut, donc aucune consommation affichée ; d'autres spécialisations peuvent la surcharger. |
| `VariableWorkWidth:loadWorkAreaFromXML(superFunc: any, workArea: any, xmlFile: any, key: any)` | 539 | ✍ Surcharge : lit le `section#index` facultatif de la zone de travail, puis appelle l'implémentation précédente. |
| `VariableWorkWidth:getIsWorkAreaActive(superFunc: any, workArea: any)` | 547 | ✍ Surcharge : une zone de travail liée à une section inactive est inactive ; sinon le résultat précédent s'applique. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEvent | `onVariableWorkWidthSectionChanged` | 78 |
| registerFunction | `setVariableWorkWidthActive` | 84 |
| registerFunction | `setSectionsActive` | 85 |
| registerFunction | `setSectionNodePercentage` | 86 |
| registerFunction | `updateSections` | 87 |
| registerFunction | `updateSectionStates` | 88 |
| registerFunction | `getEffectByNode` | 89 |
| registerFunction | `getVariableWorkWidth` | 90 |
| registerFunction | `getVariableWorkWidthUsage` | 91 |
| registerOverwrittenFunction | `loadWorkAreaFromXML` | 97 |
| registerOverwrittenFunction | `getIsWorkAreaActive` | 98 |
| registerEventListener | `onPostLoad` | 104 |
| registerEventListener | `onReadStream` | 105 |
| registerEventListener | `onWriteStream` | 106 |
| registerEventListener | `onRegisterActionEvents` | 107 |
| registerEventListener | `onAIFieldWorkerStart` | 108 |
| registerEventListener | `onAIImplementStart` | 109 |
| registerEventListener | `onDraw` | 110 |
| registerEventListener | `onDelete` | 111 |

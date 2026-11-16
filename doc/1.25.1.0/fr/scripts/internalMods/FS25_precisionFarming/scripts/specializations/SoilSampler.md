# internalMods/FS25_precisionFarming/scripts/specializations/SoilSampler.lua

*[English version](../../../../../../scripts/internalMods/FS25_precisionFarming/scripts/specializations/SoilSampler.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/specializations/SoilSampler.lua` — FS25 1.25.1.0

✍ Spécialisation de véhicule de Precision Farming pour les outils de prélèvement de sol (exige PrecisionFarmingStatistic). Le joueur prélève des échantillons à un noeud de prélèvement avec un rayon, ce qui lance une animation et une analyse de la carte de couverture, puis envoie les échantillons collectés au laboratoire. Elle gère animations, actions d'entrée, minicarte, sauvegarde/synchronisation réseau du nombre d'échantillons et utilise SoilSamplerStartEvent et SoilSamplerSendEvent.

- **SoilSampler** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SoilSampler.prerequisitesPresent(specializations: table) → boolean` | 22 | ✍ Vrai uniquement si le véhicule possède la spécialisation PrecisionFarmingStatistic. |
| `SoilSampler.initSpecialization()` | 28 | ✍ Enregistre les clés XML vehicle.soilSampler (node, radius 10 par défaut, noms d'actions d'entrée, animations, limites de pliage, animation des échantillons, noeuds visuels) et l'attribut de sauvegarde numCollectedSamples. |
| `SoilSampler:onLoad(savegame: any)` | 88 | ✍ Lit les réglages XML, résout les actions d'entrée (prélever vaut IMPLEMENT_EXTRA par défaut, envoyer IMPLEMENT_EXTRA3), cache les noeuds d'échantillons visuels, charge les textes et met en cache la carte des sols, la carte de couverture et les statistiques de parcelle de g_precisionFarming. À noter : le repli de l'action d'envoi après un échec de recherche est IMPLEMENT_EXTRA, pas EXTRA3. |
| `SoilSampler:onPostLoad(savegame: any)` | 154 | ✍ Restaure le nombre d'échantillons collectés depuis la sauvegarde sauf si les véhicules sont réinitialisés, en mettant à jour les visuels. |
| `SoilSampler:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 164 | ✍ Sauvegarde le nombre d'échantillons collectés dans l'attribut numCollectedSamples. |
| `SoilSampler:onReadStream(streamId: integer, connection: Connection)` | 173 | ✍ Côté client à la connexion : lit le nombre d'échantillons (SEND_NUM_BITS bits) et l'applique avec mise à jour visuelle. |
| `SoilSampler:onWriteStream(streamId: integer, connection: Connection)` | 184 | ✍ Côté serveur à la connexion : écrit le nombre d'échantillons sur SEND_NUM_BITS bits. |
| `SoilSampler:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 194 | ✍ Pendant le prélèvement, met à jour les échantillons visuels côté client et, à la fin de l'animation, la réinitialise, coupe l'état d'échantillonnage de la minicarte, exécute processSoilSampling et lève la limite de vitesse. Affiche le nombre d'échantillons en texte HUD. À noter : visualSampleUpdated est mis à false dans la branche qui le teste déjà à false, donc la mise à jour visuelle se répète à chaque update jusqu'à la fin de l'animation. |
| `SoilSampler:onFoldStateChanged(direction: any, moveToMiddle: any)` | 230 | ✍ Quand actif pour l'entrée, demande à la carte des sols d'afficher la minicarte si l'outil se déplie (direction 1) et de la masquer sinon. |
| `SoilSampler:onLeaveRootVehicle()` | 239 | ✍ Si le noeud de ce préleveur est le noeud de liaison de la minicarte, masque la minicarte et efface son noeud de liaison et son état d'échantillonnage. |
| `SoilSampler:onPreDetach()` | 250 | ✍ Même nettoyage de minicarte que onLeaveRootVehicle, effectué juste avant le détachement de l'outil. |
| `SoilSampler:startSoilSampling(noEventSend: any)` | 261 | ✍ Lance un prélèvement : côté serveur abaisse l'outil via son attache, enregistre 'numSoilSamples' et 'soilSampleCosts' si sur un champ et met la limite de vitesse à 0. Joue l'animation, incrémente le compteur, met à jour visuels et état d'action et envoie SoilSamplerStartEvent. |
| `SoilSampler:setNumCollectedSoilSamples(num: any, updateVisuals: any)` | 320 | ✍ Définit le nombre collecté (ou ajoute un si num est nil). Avec updateVisuals, affiche les noeuds d'échantillons correspondants et règle le temps de l'animation des échantillons. |
| `SoilSampler:getNormalizedSampleIndex()` | 337 | ✍ Convertit le nombre d'échantillons en indice de 0 à N sur les N noeuds visuels, en bouclant pour qu'un support plein affiche N et non 0. |
| `SoilSampler:getCanStartSoilSampling()` | 353 | ✍ Renvoie un booléen et un texte d'avertissement optionnel. Refuse si le noeud de prélèvement n'est pas sur une parcelle accessible à la ferme, si le moteur (propre ou du véhicule racine) est coupé, si le pliage est hors des limites ou si un prélèvement est déjà en cours. |
| `SoilSampler:processSoilSampling()` | 394 | ✍ Serveur uniquement : construit un cercle de densité au noeud de prélèvement avec le rayon voulu et fait analyser la zone par la carte de couverture pour la ferme propriétaire. |
| `SoilSampler:sendTakenSoilSamples(noEventSend: any)` | 407 | ✍ Serveur : demande à la carte des sols d'analyser les échantillons collectés pour la ferme propriétaire. Client : masque les échantillons visuels et joue l'animation en sens inverse. Remet le compteur à 0 et envoie SoilSamplerSendEvent. |
| `SoilSampler:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 432 | ✍ Côté client : enregistre les actions d'entrée prélever et envoyer avec priorité haute et textes, rafraîchit leur état et configure le noeud de liaison de la minicarte et la taille de la zone (deux fois le rayon). |
| `SoilSampler.updateActionEventState(self: any)` | 456 | ✍ Active l'action d'envoi seulement si au moins un échantillon a été collecté. |
| `SoilSampler.actionEventStartSample(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 466 | ✍ Rappel d'entrée : lance le prélèvement si autorisé, sinon affiche l'avertissement bloquant pendant 2000 ms. |
| `SoilSampler.actionEventSendSamples(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 477 | ✍ Rappel d'entrée : s'il y a des échantillons et qu'aucun n'est en cours, ouvre un dialogue d'information dont la confirmation appelle onSendSoilSamplesDialog. |
| `SoilSampler.onSendSoilSamplesDialog(self: any)` | 486 | ✍ Rappel du dialogue : demande à la carte des sols d'envoyer tous les échantillons de la ferme propriétaire, de n'importe quel préleveur, car les résultats sont suivis par ferme et non par véhicule. |
| `SoilSampler:doCheckSpeedLimit(superFunc: any) → boolean` | 497 | ✍ Surcharge. Renvoie true si le parent le fait ou si un prélèvement est en cours, de sorte que la limite de vitesse s'applique pendant le prélèvement. |
| `SoilSampler:getIsFoldAllowed(superFunc: any, direction: any, onAiTurnOn: any)` | 503 | ✍ Surcharge. Interdit le pliage pendant un prélèvement ; sinon s'en remet au parent. |

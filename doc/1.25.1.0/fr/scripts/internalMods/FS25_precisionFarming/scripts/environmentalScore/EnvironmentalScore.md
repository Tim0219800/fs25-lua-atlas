# internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScore.lua

*[English version](../../../../../../scripts/internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScore.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScore.lua` — FS25 1.25.1.0

✍ Gestionnaire central du score environnemental de Precision Farming. Il possède un objet de score par critère (herbicide, azote, pH, échantillonnage du sol, travail du sol), les charge depuis le XML de la carte (entrées scoreValues.scoreValue avec id, name, className, maxScore), sauvegarde et synchronise leurs données par parcelle, dessine la fenêtre de score dans la carte et sur les hotspots de parcelle, et accroche CoverMap et SellingStation pour suivre les récoltes et ajouter un bonus ou une pénalité aux revenus de vente.

- **EnvironmentalScore** (l.30)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `EnvironmentalScore.new(pfModule: any, customMt: any)` | 34 | ✍ Constructeur. Crée les cinq objets de score, enregistre deux types de mouvement d'argent (récompense et pénalité), prépare les overlays et dimensions de l'interface, et s'abonne à PERIOD_CHANGED et au réglage daltonien. |
| `EnvironmentalScore:delete()` | 107 | ✍ Supprime les quatre overlays et désabonne l'objet de toutes les souscriptions du message center. |
| `EnvironmentalScore:loadFromXML(xmlFile: any, key: any, baseDirectory: any, configFileName: any, mapFilename: any)` | 118 | ✍ Lit la liste scoreValues du XML de la carte. Chaque entrée exige un id, un name et un className correspondant à un des objets de score ; les entrées valides reçoivent un maxScore (10 par défaut) et un score initial égal à la moitié. Avertit si un champ manque. |
| `EnvironmentalScore:loadFromItemsXML(xmlFile: any, key: any)` | 167 | ✍ Chargement de sauvegarde : transmet à chaque objet de score et restaure la table harvestedStates (id de parcelle vers état) depuis la section environmentalScore. |
| `EnvironmentalScore:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 188 | ✍ Écriture de sauvegarde : chaque objet de score écrit ses données sous la clé environmentalScore, puis chaque id de parcelle est écrit avec son état de récolte. |
| `EnvironmentalScore:readStream(streamId: integer, connection: Connection, farmId: any)` | 210 | ✍ Lecture réseau côté client ; délègue simplement à readStream de chaque objet de score, dans l'ordre. |
| `EnvironmentalScore:writeStream(streamId: integer, connection: Connection, farmId: any)` | 223 | ✍ Écriture réseau côté serveur pour une ferme ; délègue à writeStream de chaque objet de score, dans le même ordre que readStream. |
| `EnvironmentalScore:update(dt: any)` | 234 | ✍ Mise à jour à chaque frame. Anime la fenêtre de score de la carte (elle s'agrandit au survol ou si forcée), rafraîchit l'interface à intervalle régulier et affiche une notification de gain d'argent différée une fois les ventes stabilisées pendant environ une seconde. |
| `EnvironmentalScore:toggleWindowSize(state: any)` | 288 | ✍ Définit l'état d'agrandissement forcé de la fenêtre de score ; sans argument, il inverse la valeur actuelle. |
| `EnvironmentalScore:setMapFrame(mapFrame: any)` | 298 | ✍ Mémorise le cadre de carte, retient la taille de base de la fenêtre, applique la tranche de dégradé selon le mode daltonien aux deux barres et rafraîchit les glyphes de saisie. |
| `EnvironmentalScore:onEnvScoreDetailsButton()` | 312 | ✍ Callback de saisie du bouton de détails ; bascule la taille de la fenêtre de score. |
| `EnvironmentalScore:updateInputGlyphs()` | 318 | ✍ Met à jour le glyphe SWITCH_IMPLEMENT et, uniquement en mode d'aide manette, enregistre l'action qui bascule la fenêtre ; sinon retire les actions de cet objet. |
| `EnvironmentalScore:onMapFrameOpen(mapFrame: any)` | 333 | ✍ Appelé à l'ouverture du cadre de carte. Un client pur demande au serveur le score de sa ferme via RequestEnvironmentalScoreEvent, et la fenêtre est masquée pour les spectateurs. |
| `EnvironmentalScore:onHarvestScoreReset(farmlandId: any)` | 346 | ✍ Prévient chaque objet de score qui le gère que la période de notation de récolte d'une parcelle est terminée, afin qu'il se réinitialise à la prochaine utilisation. |
| `EnvironmentalScore:getFarmlandScore(farmlandId: any)` | 357 | ✍ Retourne le score cumulé d'une parcelle : le score de 0 à 1 de chaque critère multiplié par son maxScore. |
| `EnvironmentalScore:getTotalScoreFromValue(scoreValue: any, farmId: any)` | 368 | ✍ Retourne le score d'un critère pour une ferme, moyenné sur ses parcelles pondérées par la surface de champ. Retombe sur la moitié de maxScore s'il n'y a aucune parcelle valide. |
| `EnvironmentalScore:getTotalScore(farmId: any)` | 402 | ✍ Retourne le score total de la ferme (somme des critères, pondérée par la surface des parcelles possédées). Donne 50 pour les spectateurs ou sans surface de champ. |
| `EnvironmentalScore:updateUI()` | 447 | ✍ Rafraîchit les widgets du cadre de carte : nombre du score total, barre de dégradé et indicateur, barres et valeurs par critère, et texte d'information sur le prix de vente. À noter : appelle getSellPriceFactor, absent de ce dump, donc son comportement est NON VÉRIFIÉ. |
| `EnvironmentalScore:onDraw(element: any, ingameMap: any)` | 483 | ✍ Hook de dessin de la carte en jeu. Pour chaque hotspot de parcelle visible, il calcule la position sur la carte et dessine la boîte de score du champ, sauf pour les spectateurs. |
| `EnvironmentalScore:onDrawFieldNumber(element: any, ingameMap: any, x: any, y: any, farmland: any)` | 503 | ✍ Ne dessine la boîte de score que pour les parcelles ayant une surface de champ non négligeable et appartenant à la ferme du joueur local. |
| `EnvironmentalScore:drawFarmlandScore(x: any, y: any, dataKey: any, farmlandId: any, zoom: any)` | 514 | ✍ Affiche le panneau de score d'une parcelle : il s'estompe selon le zoom de la carte, grandit au survol et dessine l'icône, le score chiffré, la barre de dégradé avec indicateur et, une fois déployé, une petite barre par critère. |
| `EnvironmentalScore:onPeriodChanged(currentPeriod: any)` | 599 | ✍ À chaque changement de période, les parcelles récoltées une période plus tôt (état 2) sont réinitialisées et notifiées, et celles récoltées à l'instant (état 1) passent à l'état 2. |
| `EnvironmentalScore:setColorBlindMode()` | 614 | ✍ Réagit au réglage daltonien : change la tranche de dégradé des overlays et des barres du cadre de carte, puis rafraîchit l'interface. |
| `EnvironmentalScore:overwriteGameFunctions(pfModule: any)` | 629 | ✍ Installe des hooks via pfModule. CoverMap.preUpdateCoverArea marque la parcelle comme récoltée (état 1) ; SellingStation.sellFillType ajoute un bonus ou une pénalité au prix de vente et l'affiche en notification différée. Transmet aussi aux objets de score. |

## Messages

- s'abonne à `MessageType.PERIOD_CHANGED` (l.99)
- s'abonne à `MessageType.SETTING_CHANGED` (l.100)

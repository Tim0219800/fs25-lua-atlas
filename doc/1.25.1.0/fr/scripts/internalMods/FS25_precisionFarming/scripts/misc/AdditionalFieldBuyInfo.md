# internalMods/FS25_precisionFarming/scripts/misc/AdditionalFieldBuyInfo.lua

*[English version](../../../../../../scripts/internalMods/FS25_precisionFarming/scripts/misc/AdditionalFieldBuyInfo.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/misc/AdditionalFieldBuyInfo.lua` — FS25 1.25.1.0

✍ Aide de Precision Farming qui ajoute la répartition des types de sol et le potentiel de rendement au panneau d'achat de parcelle de la carte en jeu. Le serveur calcule les parts de sol par parcelle à partir de la carte des sols et du masque de champs, les envoie aux clients à la demande, et la classe multiplie le prix de la parcelle par le potentiel de rendement. Elle se branche sur FarmlandManager, FieldManager, Farmland et Placeable via overwriteGameFunctions.

- **AdditionalFieldBuyInfo** (l.14)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AdditionalFieldBuyInfo.new(pfModule: any, customMt: any)` | 18 | ✍ Crée l'instance avec des tables de répartition de sol vides (4 types de sol), des valeurs de potentiel de rendement et une référence au module Precision Farming. |
| `AdditionalFieldBuyInfo:loadFromXML(xmlFile: any, key: any, baseDirectory: any, configFileName: any, mapFilename: any)` | 59 | ✍ Lit le réglage daltonien et s'abonne aux messages de changement de ce réglage et de fin de chargement des placeables de la sauvegarde. Renvoie toujours true. |
| `AdditionalFieldBuyInfo:loadFromItemsXML(xmlFile: any, key: any)` | 69 | ✍ Crochet vide, rien n'est chargé depuis le XML des items. |
| `AdditionalFieldBuyInfo:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 74 | ✍ Crochet vide, rien n'est sauvegardé. |
| `AdditionalFieldBuyInfo:delete()` | 79 | ✍ Désabonne cet objet de tous les abonnements du centre de messages. |
| `AdditionalFieldBuyInfo:readInfoFromStream(farmlandId: any, streamId: any, connection: any)` | 85 | ✍ Côté client : lit un indicateur de validité, puis numéro de champ, surface, parts de sol (8 bits chacune) et potentiel de rendement (8 bits, échelle 1,25) d'une parcelle, et rafraîchit l'interface. Si l'indicateur est faux, la fenêtre d'info est masquée. |
| `AdditionalFieldBuyInfo:writeInfoToStream(farmlandId: any, streamId: any, connection: any)` | 113 | ✍ Côté serveur : écrit l'équivalent de readInfoFromStream pour une parcelle (indicateur de validité, numéro de champ, surface, parts de sol, potentiel de rendement). N'écrit les données que si la parcelle a une surface de champ et une répartition de sol. |
| `AdditionalFieldBuyInfo:setColorBlindMode(isActive: any)` | 132 | ✍ Met à jour l'indicateur daltonien mémorisé et redessine les barres de sol si la valeur a changé. |
| `AdditionalFieldBuyInfo:setMapFrame(mapFrame: any)` | 167 | ✍ Mémorise le cadre de carte, met en cache la largeur maximale des barres de sol au premier appel et masque la fenêtre d'info d'achat de champ. |
| `AdditionalFieldBuyInfo:updateSoilBars()` | 177 | ✍ Applique les noms des types de sol et les couleurs des barres (palette normale ou daltonienne) dans le cadre de carte d'après les types de sol de la carte des sols, si elle existe. |
| `AdditionalFieldBuyInfo:updateUIValues()` | 190 | ✍ Redimensionne la boîte de contexte de la parcelle et remplit les barres de pourcentage de sol, la barre de potentiel de rendement et les textes. Masque la fenêtre si la surface du champ est inférieure à 0,01, puis appelle updateContextBox. |
| `AdditionalFieldBuyInfo:onFarmlandSelectionChanged(selectedFarmland: any)` | 253 | ✍ Réagit à la sélection d'une parcelle sur la carte. Sur le serveur, elle lit les données de sol mémorisées ; sur un client, elle envoie un RequestFieldBuyInfoEvent au serveur. Sans sélection, elle réinitialise les valeurs affichées. |
| `AdditionalFieldBuyInfo:onShowContextBox(farmland: any, contextBox: any)` | 298 | ✍ Mémorise la dernière boîte de contexte de parcelle affichée pour pouvoir la mettre à jour plus tard. |
| `AdditionalFieldBuyInfo:updateContextBox()` | 304 | ✍ Réécrit le texte de valeur de la parcelle (prix et prix par ha) et le texte de taille (surface de la parcelle et du champ) dans la boîte de contexte mémorisée, puis appelle updatePrecisionFarmingContextActions du cadre de carte s'il existe. |
| `AdditionalFieldBuyInfo:getFarmlandFieldInfo(farmlandId: any)` | 332 | ✍ Renvoie le numéro du premier champ appartenant à la parcelle (0 s'il n'y en a pas) et la valeur totalFieldArea de la parcelle (0 si absente). |
| `AdditionalFieldBuyInfo:updateFieldSoilDistributionData()` | 358 | ✍ Parcourt la carte des sols pixel par pixel, compte par parcelle les pixels de champ et les types de sol, puis en déduit les parts de sol, le potentiel de rendement (borné entre 0 et 1,25) et la surface en ha, et met à jour les prix. Boucle coûteuse, journalise le potentiel de rendement global de la carte et la durée. |
| `AdditionalFieldBuyInfo:onAllPlaceablesLoaded()` | 439 | ✍ Marque les placeables comme chargés et, si un calcul de sols différé est en attente, l'exécute lorsqu'aucune tâche de mise à jour de champ n'est en file et que tous les champs autorisés sans propriétaire sont initialisés. |
| `AdditionalFieldBuyInfo:overwriteGameFunctions(pfModule: any)` | 463 | ✍ Enregistre des surcharges de fonctions du jeu : Placeable.setLoadingStep (client seulement), FarmlandManager.loadFarmlandData, FieldManager.onFinishFieldUpdateTask et Farmland.updatePrice (prix multiplié par le potentiel de rendement). Elles déclenchent ou différent le calcul de la répartition des sols. |

## Messages

- s'abonne à `MessageType.SETTING_CHANGED` (l.61)
- s'abonne à `MessageType.LOADED_ALL_SAVEGAME_PLACEABLES` (l.62)

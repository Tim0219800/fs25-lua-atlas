# internalMods/FS25_precisionFarming/scripts/statistics/FarmlandStatistic.lua

*[English version](../../../../../../scripts/internalMods/FS25_precisionFarming/scripts/statistics/FarmlandStatistic.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/statistics/FarmlandStatistic.lua` — FS25 1.25.1.0

✍ Conteneur de statistiques par parcelle de Precision Farming. Il possède deux objets FarmlandStatisticCounter, l'un pour la période en cours et l'autre pour toute la partie, et gère la sauvegarde/chargement XML, la synchronisation réseau, la remise à zéro et les incréments.

- **FarmlandStatistic** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FarmlandStatistic.new(farmlandId: any, customMt: any)` | 16 | ✍ Constructeur. Mémorise l'id de parcelle, un indicateur hasChanged et crée de nouveaux compteurs de période et total. |
| `FarmlandStatistic:loadFromItemsXML(xmlFile: any, key: any)` | 30 | ✍ Charge les deux compteurs depuis le XML d'items si #farmlandId correspond à cette statistique ; sinon journalise un avertissement et ne charge rien. |
| `FarmlandStatistic:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 41 | ✍ Écrit l'id de parcelle et les deux compteurs (periodCounter, totalCounter) sous la clé XML donnée. |
| `FarmlandStatistic:onReadStream(streamId: integer, connection: Connection)` | 51 | ✍ Côté client à la connexion : lit le compteur de période puis le total depuis le flux. L'ordre doit correspondre à onWriteStream. |
| `FarmlandStatistic:onWriteStream(streamId: integer, connection: Connection)` | 61 | ✍ Côté serveur à la connexion : écrit le compteur de période puis le total dans le flux. |
| `FarmlandStatistic:reset(clearTotal: any)` | 68 | ✍ Remet à zéro le compteur de période ; remet aussi le total à zéro si clearTotal est vrai. |
| `FarmlandStatistic:getValue(total: any, name: any)` | 78 | ✍ Renvoie la valeur nommée du compteur total si total est vrai, sinon du compteur de période. Renvoie 0 pour un nom inconnu. |
| `FarmlandStatistic:updateStatistic(name: any, value: any)` | 93 | ✍ Ajoute une valeur au champ nommé des deux compteurs (seulement s'il existe) et active hasChanged. |

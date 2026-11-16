# internalMods/FS25_precisionFarming/scripts/statistics/FarmlandStatisticCounter.lua

*[English version](../../../../../../scripts/internalMods/FS25_precisionFarming/scripts/statistics/FarmlandStatisticCounter.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/statistics/FarmlandStatisticCounter.lua` — FS25 1.25.1.0

✍ Objet de données de Precision Farming contenant les compteurs numériques d'une parcelle (échantillons de sol, chaux, engrais, fumier, semences, herbicide, rendement, carburant, coûts de véhicules et d'aides, subventions, avec variantes 'Regular'). Il peut être remis à zéro, chargé/sauvegardé en attributs XML et transmis par le réseau.

- **FarmlandStatisticCounter** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FarmlandStatisticCounter.new(customMt: any)` | 16 | ✍ Constructeur. Crée l'objet et initialise tous les compteurs à 0 via reset. |
| `FarmlandStatisticCounter:loadFromItemsXML(xmlFile: any, key: any)` | 26 | ✍ Lit chaque compteur dans les attributs XML de la clé, en gardant la valeur actuelle par défaut si un attribut manque. |
| `FarmlandStatisticCounter:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 66 | ✍ Écrit chaque compteur en attribut (entier pour numSoilSamples, flottant pour les autres). Le paramètre usedModNames n'est pas utilisé ici. |
| `FarmlandStatisticCounter:reset()` | 106 | ✍ Remet à 0 les 24 compteurs (échantillons, coûts, intrants utilisés, rendements, carburant, coûts véhicules/aides, subventions). |
| `FarmlandStatisticCounter:onReadStream(streamId: integer, connection: Connection)` | 148 | ✍ Lit tous les compteurs du flux : numSoilSamples en entier non signé 16 bits, le reste en float32. L'ordre doit rester identique à onWriteStream. |
| `FarmlandStatisticCounter:onWriteStream(streamId: integer, connection: Connection)` | 190 | ✍ Écrit tous les compteurs dans le flux (16 bits non signé pour numSoilSamples, float32 pour le reste). À noter : le champ 16 bits plafonne à 65535 échantillons. |

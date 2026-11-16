# internalMods/FS25_precisionFarming/scripts/specializations/ExtendedCombine.lua

*[English version](../../../../../../scripts/internalMods/FS25_precisionFarming/scripts/specializations/ExtendedCombine.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/specializations/ExtendedCombine.lua` — FS25 1.25.1.0

✍ Spécialisation de Precision Farming ajoutée aux moissonneuses (nécessite Combine et PrecisionFarmingStatistic). Elle affiche la carte de rendement sur la minicarte pendant la récolte sur un champ, ajoute une extension d'aide du HUD et synchronise du serveur vers les clients le poids, le pourcentage et le potentiel du dernier rendement. Le commentaire de classe de la source parle d'un basculement du zoom de la minicarte.

- **ExtendedCombine** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ExtendedCombine.prerequisitesPresent(specializations: table) → boolean` | 27 | ✍ Renvoie true si le type de véhicule possède à la fois Combine et PrecisionFarmingStatistic. |
| `ExtendedCombine:onDelete()` | 63 | ✍ Supprime l'extension du HUD si elle a été créée. |
| `ExtendedCombine:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 72 | ✍ Côté client : si le serveur a envoyé l'indicateur, lit le poids du dernier rendement (en dixièmes), le pourcentage de rendement et le pourcentage de potentiel de rendement. |
| `ExtendedCombine:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 86 | ✍ Côté serveur : quand l'indicateur de modification des valeurs d'usage est levé, écrit les trois valeurs de rendement, chacune plafonnée à sa plage de bits maximale. |
| `ExtendedCombine:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 100 | ✍ Quand le véhicule est actif pour les entrées (hors IA), ajoute son extension au panneau d'aide du HUD. |
| `ExtendedCombine:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 112 | ✍ Client uniquement : tant que le véhicule est actif pour les entrées (hors IA), rafraîchit l'état d'affichage de la carte de rendement sur la minicarte. |
| `ExtendedCombine:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 122 | ✍ Client uniquement : rafraîchit l'état de la minicarte en le forçant à faux quand le véhicule n'est pas actif pour les entrées. |
| `ExtendedCombine.updateMinimapActiveState(self: any, forcedState: any)` | 134 | ✍ Indique à la carte de rendement si la minicarte doit l'afficher : vrai quand la moissonneuse est sur un champ avec une coupe attelée et sans mission, sauf état forcé. Ne fait rien s'il n'y a pas de carte de rendement. |
| `ExtendedCombine:setLastYieldValues(lastYieldWeight: any, lastYieldPercentage: any, lastYieldPotential: any)` | 150 | ✍ Mémorise le poids, le pourcentage et le potentiel du dernier rendement et lève l'indicateur de modification pour la synchronisation réseau seulement si l'une des valeurs a changé. |

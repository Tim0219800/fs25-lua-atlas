# misc/AbstractManager.lua

*[English version](../../../scripts/misc/AbstractManager.md)*

Source: `dataS/scripts/misc/AbstractManager.lua` — FS25 1.25.1.0

✍ Classe de base abstraite des gestionnaires liés à la carte (BaleManager, ConsumableManager et d'autres en héritent). Elle définit le cycle de vie : le constructeur appelle initDataStructures, puis load et loadMapData au démarrage, et unloadMapData remet l'état à zéro à la suppression de la mission.

- **AbstractManager** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AbstractManager.new(customMt: any) → table` | 17 | ✍ Crée l'instance du gestionnaire avec la métatable fournie (ou celle par défaut), appelle initDataStructures et marque les données de carte comme non chargées. Affiche la pile d'appels si l'argument n'est pas une table. |
| `AbstractManager:initDataStructures()` | 31 | ✍ Hook vide que les sous-classes surchargent pour créer leurs tables ; appelé par le constructeur puis de nouveau par unloadMapData. |
| `AbstractManager:load() → boolean` | 37 | ✍ Hook de chargement initial, renvoie true par défaut. Les sous-classes le surchargent pour lire leur propre configuration. |
| `AbstractManager:loadMapData() → boolean` | 44 | ✍ Active l'indicateur loadedMapData et renvoie true. Dans une version de développement, journalise une erreur et la pile d'appels si les données de carte étaient déjà chargées sans déchargement préalable. Les sous-classes l'étendent pour lire le XML de la carte. |
| `AbstractManager:unloadMapData()` | 55 | ✍ Remet loadedMapData à false et rappelle initDataStructures, ce qui efface toutes les données du gestionnaire à la fin de la mission. |

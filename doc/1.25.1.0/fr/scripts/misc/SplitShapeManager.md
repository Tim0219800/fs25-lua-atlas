# misc/SplitShapeManager.lua

*[English version](../../../scripts/misc/SplitShapeManager.md)*

Source: `dataS/scripts/misc/SplitShapeManager.lua` — FS25 1.25.1.0

✍ Gestionnaire (sous-classe d'AbstractManager) qui tient le registre des types de bois fendus : un descripteur par essence avec titre, prix au litre, rendement en plaquettes et règles pour les abatteuses. Les 45 essences de base sont codées en dur dans loadMapData et non lues depuis un XML. Conserve aussi une table activeYarders, seulement initialisée ici.

- **SplitShapeManager** hérite de `AbstractManager` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SplitShapeManager.new(customMt: table?) → SplitShapeManager` | 18 | ✍ Constructeur : crée le gestionnaire à partir d'AbstractManager, avec la métatable fournie ou celle par défaut. |
| `SplitShapeManager:initDataStructures()` | 26 | ✍ Réinitialise les tables de recherche typesByIndex et typesByName ainsi que la liste activeYarders. |
| `SplitShapeManager:loadMapData() → boolean` | 36 | ✍ Appelle le chargeur parent puis enregistre tous les types de bois intégrés (indices 1 à 45) via addSplitType, avec prix, rendements en plaquettes et indicateurs d'abatteuse codés en dur. En version de développement, ajoute aussi la commande console gsSplitTypesExport qui appelle exportToXML (absente de ce fichier, NON VÉRIFIÉ). Retourne true. |
| `SplitShapeManager:addSplitType(name: string, l10nKey: string, splitTypeIndex: integer, pricePerLiter: number, woodChipsPerLiter: number, allowsWoodHarvester: boolean, customEnvironment: string?, volumeToLiter: number?, woodHarvesterAreaThreshold: any)` | 108 | ✍ Enregistre un descripteur de type de bois (nom en majuscules, titre traduit, prix, plaquettes par litre, autorisation abatteuse, seuil de surface abatteuse par défaut 4.5, volumeToLiter par défaut 1000). Journalise une erreur et n'ajoute rien si l'indice ou le nom est déjà pris. |
| `SplitShapeManager:getSplitTypeByIndex(index: integer) → table?` | 142 | ✍ Retourne le descripteur de type de bois correspondant à l'indice fourni par le moteur, ou nil si aucun n'est enregistré. |
| `SplitShapeManager:getSplitTypeNameByIndex(index: integer) → string` | 155 | ✍ Retourne le nom en majuscules du type de bois pour l'indice donné, ou la chaîne "<NO_SPLIT_TYPE>" si l'indice est inconnu. |

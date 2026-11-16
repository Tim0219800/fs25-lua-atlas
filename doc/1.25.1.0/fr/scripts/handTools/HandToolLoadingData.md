# handTools/HandToolLoadingData.lua

*[English version](../../../scripts/handTools/HandToolLoadingData.md)*

Source: `dataS/scripts/handTools/HandToolLoadingData.lua` — FS25 1.25.1.0

✍ Conteneur de tout ce qu'il faut pour charger un outil à main : item de boutique ou nom de fichier XML, ferme propriétaire, données de sauvegarde, enregistrement, indicateurs de dépôt et de sauvegarde. Il résout le type et la classe de l'outil via `g_handToolTypeManager`, puis délègue à `loadHandTool`, absente de ce fichier (NON VÉRIFIÉ, probablement ajoutée ailleurs).

- **HandToolLoadingData** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `HandToolLoadingData.new(customMt: any) → table` | 17 | ✍ Crée un objet de données de chargement avec des valeurs par défaut : invalide, propriétaire `AccessHandler.EVERYONE`, sauvegardé, déposable, enregistré, non forcé au serveur. |
| `HandToolLoadingData:setFilename(filename: string)` | 39 | ✍ Définit le fichier XML d'outil à charger s'il existe ; sinon journalise une erreur avec la pile d'appels. Ne modifie pas `isValid`. |
| `HandToolLoadingData:setStoreItem(storeItem: table)` | 51 | ✍ Définit l'item de boutique et reprend son nom de fichier XML ; ne valide les données que si un item est fourni, sinon journalise une erreur. |
| `HandToolLoadingData:setOwnerFarmId(ownerFarmId: integer)` | 66 | ✍ Définit l'identifiant de ferme propriétaire de l'outil chargé. |
| `HandToolLoadingData:setIsRegistered(isRegistered: boolean)` | 73 | ✍ Définit si l'outil est enregistré après le chargement. |
| `HandToolLoadingData:setSavegameData(savegameData: table)` | 95 | ✍ Définit les données de sauvegarde (table avec `xmlFile` et `key`) utilisées lors d'un chargement depuis une sauvegarde. |
| `HandToolLoadingData:load(callback: function?, callbackTarget: table?, callbackArguments: table?)` | 104 | ✍ Mémorise le callback, résout type et classe depuis le XML ; en cas d'échec appelle le callback avec nil et `HandToolLoadingState.ERROR`, sinon appelle `loadHandTool` (chargement probablement asynchrone, NON VÉRIFIÉ). Signature du callback : cible, handTool, état, arguments. |

# guidedTour/GuidedTourManager.lua

*[English version](../../../scripts/guidedTour/GuidedTourManager.md)*

Source: `dataS/scripts/guidedTour/GuidedTourManager.lua` — FS25 1.25.1.0

✍ Manager des visites guidées, sous-classe de `AbstractManager`. Il charge les définitions de visites listées dans le XML de la map (`map.guidedTours.guidedTour` avec `#filename` et `#name`), les construit via `GuidedTourUtil.createFromXML` et sauvegarde/restaure la visite active dans la sauvegarde. `GuidedTourUtil`, `GuidedTourHelp` et `onMissionStarted` ne sont pas dans ce fichier (NON VÉRIFIÉ).

- **GuidedTourManager** hérite de `AbstractManager` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `GuidedTourManager.new(customMt: any) → table` | 32 | ✍ Crée le manager via `AbstractManager.new` avec la métatable donnée ou par défaut. |
| `GuidedTourManager:initDataStructures()` | 40 | ✍ Réinitialise la liste des visites, les tables de recherche par nom pour visites, véhicules et placeables, ainsi que les registres de classes de buts, d'actions et de progression. |
| `GuidedTourManager:loadMapData(xmlFile: any, missionInfo: any, baseDirectory: any) → boolean` | 58 | ✍ Charge la section `guidedTours` de la map via `XMLUtil.loadDataFromMapXML` ; en cas de succès appelle `GuidedTourHelp.init()`. Retourne le succès du chargement. |
| `GuidedTourManager:loadGuidedTours(xmlFileHandle: any, missionInfo: any, baseDirectory: any, isBaseType: any) → boolean` | 73 | ✍ Parcourt les entrées de visites guidées en ignorant celles sans fichier ni nom ou avec un nom en double (insensible à la casse, stocké en majuscules). Chaque visite reçoit son nom et son index. S'abonne une fois à `CURRENT_MISSION_START` et retourne toujours true. |
| `GuidedTourManager:saveToXMLFile(xmlFilename: string) → boolean` | 122 | ✍ Écrit le nom de la visite active et son état sauvegardé dans le fichier XML donné. Retourne false si le fichier ne peut pas être créé, sinon true (même sans visite active). |
| `GuidedTourManager:loadFromXMLFile(xmlFilename: string) → boolean` | 145 | ✍ Lit le nom de visite sauvegardé et, si la visite existe et charge son état, la stocke dans `pendingStartTour` ; sinon un avertissement est journalisé. Retourne false seulement si le fichier est absent ou illisible. |

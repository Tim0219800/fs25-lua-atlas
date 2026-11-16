# vehicles/VehicleLoadingData.lua

*[English version](../../../scripts/vehicles/VehicleLoadingData.md)*

Source: `dataS/scripts/vehicles/VehicleLoadingData.lua` — FS25 1.25.1.0

✍ Rassemble tout ce qu'il faut pour charger un véhicule (ou un lot de véhicules) depuis un article de boutique : configurations, propriétaire, état de propriété, position/rotation d'apparition, données de sauvegarde, indicateurs (enregistré, sauvegardé, ajouté à la physique, forçage serveur). `load` lance le chargement via `g_currentMission.vehicleSystem` et `g_vehicleTypeManager`. À noter : le dump du SDK omet des parties de cette classe (par exemple `loadVehicle`, `resetVehiclePosition`, `getPositionAndRotation` sont appelées mais absentes), le détail du chargement est donc NON VÉRIFIÉ.

- **VehicleLoadingData** (l.21)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `VehicleLoadingData.new(customMt: any) → VehicleLoadingData` | 26 | ✍ Crée un objet de données de chargement avec des valeurs par défaut : invalide tant qu'aucun article n'est défini, état possédé, propriétaire `AccessHandler.EVERYONE`, enregistré, sauvegardé, ajouté à la physique, centré sur la position d'apparition, position et rotation nulles. |
| `VehicleLoadingData:setFilename(filename: string)` | 71 | ✍ Trouve l'article de boutique par nom de fichier XML dans `g_storeManager` et le définit ; journalise une erreur avec pile d'appels s'il n'existe pas. |
| `VehicleLoadingData:setStoreItem(storeItem: table)` | 84 | ✍ Définit l'article de boutique, reprend sa rotation Y et construit la liste de véhicules : une entrée par élément du lot (avec décalages) pour un lot, sinon l'article lui-même. `isValid` devient vrai si la liste n'est pas vide. |
| `VehicleLoadingData:setPropertyState(propertyState: integer)` | 107 | ✍ Définit l'état de propriété du véhicule (valeur de `VehiclePropertyState`, possédé par défaut). |
| `VehicleLoadingData:setOwnerFarmId(ownerFarmId: integer)` | 114 | ✍ Définit l'identifiant de la ferme propriétaire du véhicule chargé. |
| `VehicleLoadingData:setSaleItem(saleItem: table)` | 121 | ✍ Mémorise l'article en vente et fusionne ses configurations achetées dans la table de cet objet. |
| `VehicleLoadingData:setSavegameData(savegameData: table)` | 140 | ✍ Mémorise les données de sauvegarde (attend `xmlFile`, `key` et optionnellement `resetVehicles`, `keepPosition`, `useNewPosition`). Si un article est défini, charge les configurations depuis la sauvegarde, plus les anciennes entrées `boughtConfiguration` (avertissement si invalides). |
| `VehicleLoadingData:setConfigurations(configurations: table)` | 172 | ✍ Définit la table de configurations (identifiant par nom de configuration) ; nil la remet à vide. |
| `VehicleLoadingData:setBoughtConfigurations(boughtConfigurations: table)` | 183 | ✍ Définit la table des configurations achetées ; nil la remet à vide. |
| `VehicleLoadingData:setConfigurationData(configurationData: table)` | 194 | ✍ Définit la table de données de configuration supplémentaires ; nil la remet à vide. |
| `VehicleLoadingData:getConfigurations(configFileName: string) → table, table, table` | 208 | ✍ Renvoie des copies profondes des configurations, des configurations achetées et des données de configuration pour un fichier de config. Pour un élément de lot autre que le principal, retire les configs qu'il n'offre pas, complète par les défauts et applique les configurations dépendantes. |
| `VehicleLoadingData:setIsRegistered(isRegistered: boolean)` | 264 | ✍ Définit si le véhicule est enregistré dans le jeu après chargement. |
| `VehicleLoadingData:setForceServer(forceServer: boolean)` | 271 | ✍ Définit si le véhicule est créé avec un comportement serveur (par exemple physique dynamique) même sur un client. |
| `VehicleLoadingData:setIsSaved(isSaved: boolean)` | 278 | ✍ Définit si le véhicule est écrit dans la sauvegarde. |
| `VehicleLoadingData:setAddToPhysics(addToPhysics: boolean)` | 285 | ✍ Définit si le véhicule est ajouté au monde physique au chargement. |
| `VehicleLoadingData:setCustomParameter(name: string, value: any)` | 293 | ✍ Mémorise une valeur personnalisée nommée que le véhicule chargé peut lire ensuite. |
| `VehicleLoadingData:getCustomParameter(name: string) → any` | 301 | ✍ Renvoie le paramètre personnalisé mémorisé sous le nom donné, ou nil. |
| `VehicleLoadingData:setPosition(x: number, y: number, z: number, terrainOffset: number)` | 311 | ✍ Définit la position d'apparition dans le monde. Si `y` est nil, utilise la hauteur du terrain en x/z plus un décalage optionnel. |
| `VehicleLoadingData:setRotation(rx: number, ry: number, rz: number)` | 324 | ✍ Définit la rotation d'apparition dans le monde (rx, ry, rz). |
| `VehicleLoadingData:setSpawnNode(node: integer)` | 331 | ✍ Copie la translation et la rotation monde d'un noeud de scène comme pose d'apparition. |
| `VehicleLoadingData:setIgnoreShopOffset(ignoreShopOffset: boolean)` | 339 | ✍ Définit si le décalage de boutique (translation/rotation) du XML est ignoré lors du placement. |
| `VehicleLoadingData:setComponentPositionData(vehicle: table)` | 346 | ✍ Enregistre la translation et la rotation monde de chaque composant d'un véhicule existant pour les réappliquer au véhicule nouvellement chargé. |
| `VehicleLoadingData:applyPositionData(vehicle: table) → boolean` | 358 | ✍ Place un véhicule chargé : renvoie faux si l'emplacement d'apparition était invalide. Utilise les données de composants enregistrées, sinon les positions de composants de la sauvegarde (repli sur `resetVehiclePosition` si invalides, absentes ou réinitialisées), sinon la position par défaut de la boutique. Renvoie vrai en cas de succès. |
| `VehicleLoadingData:setLoadingPlace(places: table, usedPlaces: table, spawnOffset: number?, ignoreMinSpawnItemSize: boolean?)` | 507 | ✍ Choisit un emplacement libre parmi les places d'apparition de la boutique pour l'article (taille via `StoreItemUtil`, avec dimensions minimales et décalages) et définit position et rotation. Renvoie faux et marque l'emplacement invalide si rien ne convient ; l'article doit être défini avant. |
| `VehicleLoadingData:load(callback: function?, callbackTarget: table?, callbackArguments: table?)` | 560 | ✍ Lance le chargement de tous les véhicules de l'article : enregistre un chargement en attente sur `vehicleSystem`, résout le type/la classe de chaque véhicule et abandonne avec `VehicleLoadingState.ERROR` (en appelant le rappel) si l'un manque. Sinon appelle `loadVehicle` pour chacun (absent de ce dump, NON VÉRIFIÉ). |

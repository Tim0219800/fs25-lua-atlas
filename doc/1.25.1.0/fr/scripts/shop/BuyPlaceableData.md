# shop/BuyPlaceableData.lua

*[English version](../../../scripts/shop/BuyPlaceableData.md)*

Source: `dataS/scripts/shop/BuyPlaceableData.lua` — FS25 1.25.1.0

✍ Conteneur de données pour l'achat d'un placeable : article de boutique, configurations, propriétaire, prix, options de nivellement du terrain, position et rotation. Il est sérialisé pour le multijoueur (readStream/writeStream, avec g_placeableConfigurationManager) et exécute l'achat via PlaceableLoadingData. Le callback onLoaded utilisé par buy n'est pas défini dans ce fichier (NON VÉRIFIÉ).

- **BuyPlaceableData** (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `BuyPlaceableData.new(customMt: table?) → BuyPlaceableData` | 19 | ✍ Crée des données d'achat vides : pas d'article, tables de configuration vides, propriétaire EVERYONE, prix et coûts de déplacement à zéro, pas de modification du terrain, réalignement activé, position et rotation à zéro. |
| `BuyPlaceableData:isValid() → boolean` | 41 | ✍ Retourne true quand un article de boutique est défini ; sur les versions console, son fichier XML doit aussi exister. |
| `BuyPlaceableData:setStoreItem(storeItem: table)` | 56 | ✍ Définit l'article de boutique à acheter. |
| `BuyPlaceableData:setIsFreeOfCharge(isFreeOfCharge: boolean)` | 79 | ✍ Définit si le placeable est offert gratuitement, par exemple comme récompense. |
| `BuyPlaceableData:setConfigurations(configurations: table, boughtConfigurations: table)` | 87 | ✍ Enregistre les configurations choisies et achetées (nil conserve les actuelles) et marque comme acheté chaque indice de configuration choisi. |
| `BuyPlaceableData:setConfigurationData(configurationData: table)` | 103 | ✍ Enregistre les données supplémentaires par configuration ; nil conserve la valeur actuelle. |
| `BuyPlaceableData:setOwnerFarmId(ownerFarmId: integer)` | 110 | ✍ Définit l'id de la ferme qui sera propriétaire du placeable. |
| `BuyPlaceableData:setPrice(price: integer)` | 117 | ✍ Définit directement le prix d'achat, en remplaçant tout prix calculé. |
| `BuyPlaceableData:updatePrice()` | 123 | ✍ Recalcule le prix à partir du prix d'achat du gestionnaire d'économie pour l'article de boutique et ses configurations actuelles. |
| `BuyPlaceableData:setDisplacementCosts(displacementCosts: integer)` | 130 | ✍ Définit les coûts de déplacement (terrassement), envoyés avec les données d'achat. Ils ne sont pas ajoutés au prix dans ce fichier. |
| `BuyPlaceableData:setModifyTerrain(modifyTerrain: boolean)` | 137 | ✍ Définit si le terrain est modifié (nivelé) lors de la pose du placeable. |
| `BuyPlaceableData:setRealignToTerrainAfterLeveling(realignToTerrain: boolean)` | 144 | ✍ Définit si le placeable est réaligné sur le terrain après nivellement ; la valeur par défaut est true. |
| `BuyPlaceableData:readStream(streamId: integer, connection: table)` | 152 | ✍ Lit depuis un flux réseau l'article de boutique (par nom de fichier XML en minuscules), la position, la rotation, les configurations, la ferme propriétaire, le drapeau de gratuité, les coûts de déplacement et les drapeaux de terrain. Le prix n'est pas transmis. |
| `BuyPlaceableData:writeStream(streamId: integer, connection: table)` | 176 | ✍ Écrit dans un flux réseau les mêmes champs que readStream, dans le même ordre. |
| `BuyPlaceableData:buy(callback: function?, callbackTarget: table?, callbackArguments: table?)` | 200 | ✍ Lance l'achat en chargeant le placeable avec un PlaceableLoadingData configuré avec l'article, les configurations, le propriétaire, la position et la rotation. Le callback optionnel est encapsulé et appelé via self.onLoaded, non défini ici (NON VÉRIFIÉ). |

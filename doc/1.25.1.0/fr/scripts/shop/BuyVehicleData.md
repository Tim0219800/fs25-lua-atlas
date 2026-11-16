# shop/BuyVehicleData.lua

*[English version](../../../scripts/shop/BuyVehicleData.md)*

Source: `dataS/scripts/shop/BuyVehicleData.lua` — FS25 1.25.1.0

✍ Conteneur de données pour l'achat d'un véhicule ou la modification de la configuration d'un véhicule existant : article de boutique, configurations, drapeau de location, propriétaire, plaque d'immatriculation, article en vente et prix. Il est sérialisé pour le multijoueur (avec g_vehicleConfigurationManager) et exécute l'achat via VehicleLoadingData sur des emplacements de boutique donnés. Le callback onBought utilisé par buy n'est pas défini dans ce fichier (NON VÉRIFIÉ).

- **BuyVehicleData** (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `BuyVehicleData.new(customMt: table?) → BuyVehicleData` | 19 | ✍ Crée des données d'achat vides : pas d'article, tables de configuration vides, non loué, propriétaire EVERYONE, pas de plaque ni d'article en vente, prix 0. |
| `BuyVehicleData:isValid() → boolean` | 39 | ✍ Retourne true quand un article de boutique est défini ; sur les versions console, son fichier XML doit aussi exister. |
| `BuyVehicleData:setStoreItem(storeItem: table)` | 54 | ✍ Définit l'article de boutique à acheter. |
| `BuyVehicleData:setIsFreeOfCharge(isFreeOfCharge: boolean)` | 61 | ✍ Définit si le véhicule est offert gratuitement, par exemple comme récompense. |
| `BuyVehicleData:setConfigurations(configurations: table, boughtConfigurations: table)` | 69 | ✍ Enregistre les configurations choisies et achetées (nil conserve les actuelles) et marque comme acheté chaque indice de configuration choisi. |
| `BuyVehicleData:setConfigurationData(configurationData: table)` | 85 | ✍ Enregistre les données supplémentaires par configuration ; nil conserve la valeur actuelle. |
| `BuyVehicleData:setLeaseVehicle(leaseVehicle: boolean)` | 92 | ✍ Définit si le véhicule est loué plutôt qu'acheté ; cela modifie le prix dans updatePrice et l'état de propriété dans buy. |
| `BuyVehicleData:setOwnerFarmId(ownerFarmId: integer)` | 99 | ✍ Définit l'id de la ferme qui sera propriétaire du véhicule. |
| `BuyVehicleData:setLicensePlateData(licensePlateData: table)` | 106 | ✍ Définit les données de plaque d'immatriculation transmises avec l'achat. |
| `BuyVehicleData:setSaleItem(saleItem: table)` | 113 | ✍ Définit l'entrée de vente de véhicule d'occasion quand l'achat provient de la liste des ventes ; elle influence aussi le prix et est transmise aux données de chargement. |
| `BuyVehicleData:setPrice(price: integer)` | 120 | ✍ Définit directement le prix d'achat, en remplaçant tout prix calculé. |
| `BuyVehicleData:updatePrice()` | 126 | ✍ Recalcule le prix via le gestionnaire d'économie pour l'article, les configurations et l'article en vente ; pour une location, il convertit ce prix en prix de location initial. |
| `BuyVehicleData:getIsLimitedObjectPurchase() → boolean, boolean` | 138 | ✍ Ouvre le XML de l'article de boutique et retourne deux booléens : achat de balles et achat de palettes, d'après l'attribut `vehicle.multipleItemPurchase#isVehicle`. Les deux sont false si l'élément est absent. |
| `BuyVehicleData:readStream(streamId: integer, connection: table)` | 152 | ✍ Lit depuis un flux réseau l'article, le drapeau de gratuité, les configurations, le drapeau de location, la ferme propriétaire, les données de plaque et un id de vente (0 signifie aucune, sinon recherche via vehicleSaleSystem). Le prix n'est pas transmis. |
| `BuyVehicleData:writeStream(streamId: integer, connection: table)` | 175 | ✍ Écrit dans un flux réseau les mêmes champs que readStream, dans le même ordre ; l'article en vente est envoyé sous forme d'id ou 0. |
| `BuyVehicleData:buy(storePlaces: table, usedStorePlaces: table, callback: function?, callbackTarget: table?, callbackArguments: table?)` | 201 | ✍ Lance l'achat en chargeant le ou les véhicules avec un VehicleLoadingData configuré avec l'article, les configurations, les emplacements de boutique, l'état possédé ou loué, le propriétaire et l'article en vente. Le callback est encapsulé et appelé via self.onBought, non défini ici (NON VÉRIFIÉ). |

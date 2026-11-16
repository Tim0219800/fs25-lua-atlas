# shop/BuyHandToolData.lua

*[English version](../../../scripts/shop/BuyHandToolData.md)*

Source: `dataS/scripts/shop/BuyHandToolData.lua` — FS25 1.25.1.0

✍ Conteneur de données pour l'achat d'un outil à main : article de boutique, drapeau de gratuité, ferme propriétaire et prix. Il peut être envoyé sur le réseau (readStream/writeStream) et exécute l'achat via HandToolLoadingData. Le callback onBought utilisé par buy n'est pas défini dans ce fichier (NON VÉRIFIÉ), et `holder` n'est ici que lu, jamais défini.

- **BuyHandToolData** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `BuyHandToolData.new(customMt: any) → table` | 17 | ✍ Crée des données d'achat vides : pas d'article, non gratuit, propriétaire AccessHandler.EVERYONE, prix 0 et pas de porteur. |
| `BuyHandToolData:isValid() → boolean` | 32 | ✍ Retourne true quand un article de boutique est défini ; sur les versions console, le fichier XML de l'article doit aussi exister. |
| `BuyHandToolData:setStoreItem(storeItem: table)` | 51 | ✍ Définit l'article de boutique à acheter. |
| `BuyHandToolData:setIsFreeOfCharge(isFreeOfCharge: boolean)` | 58 | ✍ Définit si l'outil est offert gratuitement, par exemple comme récompense. |
| `BuyHandToolData:setOwnerFarmId(ownerFarmId: integer)` | 65 | ✍ Définit l'id de la ferme qui sera propriétaire de l'outil. |
| `BuyHandToolData:setPrice(price: integer)` | 72 | ✍ Définit directement le prix d'achat, en remplaçant tout prix calculé. |
| `BuyHandToolData:updatePrice()` | 78 | ✍ Recalcule le prix à partir du prix d'achat du gestionnaire d'économie pour l'article de boutique. |
| `BuyHandToolData:readStream(streamId: integer, connection: table)` | 86 | ✍ Lit l'article de boutique (par nom de fichier XML en minuscules), le drapeau de gratuité et l'id de la ferme propriétaire depuis un flux réseau. Le prix n'est pas transmis. |
| `BuyHandToolData:writeStream(streamId: integer, connection: table)` | 97 | ✍ Écrit le nom de fichier XML de l'article, le drapeau de gratuité et l'id de la ferme propriétaire dans un flux réseau, en miroir de readStream. |
| `BuyHandToolData:buy(callback: function?, callbackTarget: table?, callbackArguments: table?)` | 108 | ✍ Lance l'achat en chargeant l'outil à main avec un HandToolLoadingData construit à partir de ces données. Le callback optionnel est encapsulé et appelé via self.onBought après chargement, non défini ici (NON VÉRIFIÉ). |

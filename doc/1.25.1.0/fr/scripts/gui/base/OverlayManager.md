# gui/base/OverlayManager.lua

*[English version](../../../../scripts/gui/base/OverlayManager.md)*

Source: `dataS/scripts/gui/base/OverlayManager.lua` — FS25 1.25.1.0

✍ Charge les fichiers XML de configuration de textures (image, taille, liste de tranches avec rectangles UV) et crée des objets `Overlay` à partir de tranches nommées, identifiées par « prefix.sliceId ». Les mods peuvent fournir un nom d'environnement personnalisé préfixé au préfixe. La table `textureConfigs` est initialisée ailleurs (NON VÉRIFIÉ) ; l'instance globale est `g_overlayManager`.

- **OverlayManager** (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `OverlayManager:addTextureConfigFile(filename: string, prefix: string, customEnv: string?)` | 34 | ✍ Lit le XML (nom et taille dans texture.meta, entrées texture.slices.slice avec id et uvs) et enregistre les tranches sous le préfixe, avec avertissement et arrêt si des données manquent. Un préfixe en double est refusé sauf pendant un rechargement du GUI. À noter : les retours d'erreur précoces sautent `xmlFile:delete()`. |
| `OverlayManager:createOverlay(identifier: string, posX: number?, posY: number?, width: number?, height: number?, customEnv: string?) → Overlay?` | 153 | ✍ Sépare « prefix.sliceId », trouve la tranche et renvoie un nouvel `Overlay` avec son image et ses UV, à la position donnée (0 par défaut) et à la taille donnée (taille de la tranche par défaut). Renvoie nil avec un avertissement si inconnue. |
| `OverlayManager:getSliceInfoById(identifier: string, customEnv: string?) → table?` | 198 | ✍ Renvoie la table de tranche mémorisée (id, taille, UV, fichier, taille d'image) pour « prefix.sliceId », ou nil avec un avertissement si l'identifiant ou la configuration est invalide. Un identifiant nil renvoie nil sans message. |
| `OverlayManager:getConfigMetaData(configPrefix: string, customEnv: string?) → table?` | 238 | ✍ Renvoie une table {filename, imageSize} pour un préfixe de configuration chargé, ou nil avec un avertissement si le préfixe est nil ou non chargé. |

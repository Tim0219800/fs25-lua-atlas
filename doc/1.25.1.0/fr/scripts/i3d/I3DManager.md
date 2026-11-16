# i3d/I3DManager.lua

*[English version](../../../scripts/i3d/I3DManager.md)*

Source: `dataS/scripts/i3d/I3DManager.lua` — FS25 1.25.1.0

✍ Manager accessible via `g_i3DManager` qui enveloppe les fonctions moteur de chargement de fichiers i3d : synchrone ou asynchrone, partagé (cache à comptage de références) ou non. Il propose aussi l'épinglage et le vidage du cache, des délais de chargement artificiels pour les tests et trois commandes console (`gsI3DLoadingDelaySet`, `gsI3DCacheShow`, `gsI3DPrintActiveLoadings`). Les fonctions moteur appelées (`loadSharedI3DFile`, `streamI3DFile`, ...) ne sont pas dans le dump, leur fonctionnement interne est NON VÉRIFIÉ.

- **I3DManager** (l.15)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `I3DManager.new(customMt: table?) → I3DManager` | 21 | ✍ Crée le manager et enregistre les trois commandes console : délai de chargement, affichage du cache et liste des chargements actifs. |
| `I3DManager:init()` | 33 | ✍ Lit le paramètre de démarrage `i3dLoadingDelay` (millisecondes) et, s'il est positif, l'applique comme délai de chargement et ajoute un texte à l'écran. Avec le paramètre `scriptDebug` il appelle `setupDebugLoading`, absent de ce fichier (NON VÉRIFIÉ). |
| `I3DManager:loadSharedI3DFile(filename: string, callOnCreate: boolean?, addToPhysics: boolean?) → integer, integer, integer` | 88 | ✍ Charge un i3d de façon synchrone via le cache partagé. `callOnCreate` et `addToPhysics` valent false par défaut. Retourne le node racine, l'id de requête de chargement partagé (à passer à `releaseSharedI3DFile`) et une raison d'échec. |
| `I3DManager:loadSharedI3DFileAsync(filename: string, callOnCreate: boolean?, addToPhysics: boolean?, asyncCallbackFunction: function, asyncCallbackObject: table, asyncCallbackArguments: table?) → integer` | 107 | ✍ Lance un chargement partagé asynchrone ; le callback est appelé avec (cible, node, failedReason, arguments) à la fin. Vérifie par assert que le nom de fichier et un callback fonction sont fournis. Retourne l'id de requête de chargement partagé. |
| `I3DManager:loadSharedI3DFileAsyncFinished(nodeId: integer, failedReason: integer, arguments: table)` | 132 | ✍ Callback interne appelé par le moteur pour le chargement partagé asynchrone : extrait les données de callback stockées et appelle le callback utilisateur avec node, raison d'échec et arguments. |
| `I3DManager:loadI3DFile(filename: string, callOnCreate: boolean?, addToPhysics: boolean?) → integer` | 148 | ✍ Chargement synchrone et non partagé d'un fichier i3d (sans cache). Les deux options valent false par défaut. Retourne le node, qui vaut 0 en cas d'échec. |
| `I3DManager:loadI3DFileAsync(filename: string, callOnCreate: boolean?, addToPhysics: boolean?, asyncCallbackFunction: function, asyncCallbackObject: table?, asyncCallbackArguments: any) → integer` | 166 | ✍ Lance un chargement asynchrone non partagé ; le callback reçoit (cible, node, failedReason, arguments). Retourne un id de requête utilisable avec `cancelStreamI3DFile`. Assert si le nom de fichier ou le callback manque. |
| `I3DManager:loadSharedI3DFileFinished(nodeId: integer, failedReason: integer, arguments: any)` | 190 | ✍ Callback interne du moteur pour `loadI3DFileAsync` (malgré son nom, il sert au chemin non partagé) : transmet node, raison d'échec et arguments au callback utilisateur stocké. |
| `I3DManager:cancelStreamI3DFile(loadingRequestId: integer)` | 203 | ✍ Annule un chargement asynchrone en attente via son id de requête. Journalise une erreur avec pile d'appels si l'id est nil. |
| `I3DManager:releaseSharedI3DFile(sharedLoadRequestId: integer, warnIfInvalid: boolean?)` | 216 | ✍ Libère une référence d'un i3d partagé ; le fichier quitte le cache quand il n'y a plus de références. Journalise une erreur et la pile d'appels si l'id est nil. |
| `I3DManager:pinSharedI3DFileInCache(filename: string)` | 235 | ✍ Épingle un nom de fichier dans le cache partagé, mais seulement si son compteur de références est négatif selon le moteur (sens exact de cette valeur NON VÉRIFIÉ). Journalise une erreur si le nom est nil. |
| `I3DManager:unpinSharedI3DFileInCache(filename: string)` | 250 | ✍ Retire l'épinglage du cache pour un nom de fichier. Journalise une erreur et la pile d'appels si le nom est nil. |
| `I3DManager:clearEntireSharedI3DFileCache(verbose: boolean?)` | 263 | ✍ Vide tout le cache d'i3d partagés. Avec `verbose` à true, il liste d'abord chaque fichier en cache et son nombre de références dans des avertissements de développement. |
| `I3DManager:setLoadingDelay(minDelaySeconds: number?, maxDelaySeconds: number?, minDelayCachedSeconds: number?, maxDelayCachedSeconds: number?)` | 284 | ✍ Définit des délais min/max artificiels (secondes) pour les chargements asynchrones, séparément pour les fichiers partagés en cache ou non, à des fins de test. Les valeurs absentes reprennent les précédentes ; journalise le résultat. |
| `I3DManager:consoleCommandSetLoadingDelay(minDelaySec: number?, maxDelaySec: number?, minDelayCachedSec: number?, maxDelayCachedSec: number?)` | 302 | ✍ Gestionnaire de la commande console `gsI3DLoadingDelaySet` : analyse jusqu'à quatre arguments numériques (0 ou les précédents par défaut) et appelle `setLoadingDelay`. |
| `I3DManager:consoleCommandShowCache()` | 313 | ✍ Gestionnaire de la commande console `gsI3DCacheShow` : active ou désactive l'affichage du cache en ajoutant ou retirant le manager des éléments dessinés de `g_debugManager`, et affiche le nouvel état. |
| `I3DManager:consoleCommandPrintActiveLoadings()` | 329 | ✍ Gestionnaire de la commande console `gsI3DPrintActiveLoadings` : affiche progression, temps écoulé, fichier et callback de chaque chargement asynchrone en cours, partagé ou non, ou « none ». |

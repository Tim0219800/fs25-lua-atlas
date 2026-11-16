# vehicles/specializations/components/BeaconLight.lua

*[English version](../../../../../scripts/vehicles/specializations/components/BeaconLight.md)*

Source: `dataS/scripts/vehicles/specializations/components/BeaconLight.lua` — FS25 1.25.1.0

✍ Gyrophare tournant ou clignotant pour véhicules. Il est chargé soit depuis un asset XML/i3d de gyrophare partagé (avec variation et type de montage au choix), soit depuis des entrées `staticLight` en ligne dans le XML du véhicule. Il pilote un nœud rotatif, une source de lumière réelle et des lumières statiques par shader dont l'intensité peut dépendre de la distance à la caméra ; la lumière réelle suit le réglage `REAL_BEACON_LIGHTS`. Objet visuel côté client ; le véhicule appelle `setIsActive`. Les données d'appareil viennent de `BeaconLightManager` (défini ailleurs, NON VÉRIFIÉ).

- **BeaconLight** (l.14)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `BeaconLight.new(vehicle: any, customMt: any)` | 18 | ✍ Crée un gyrophare pour un véhicule (peut être nil pour le debug) avec vitesse 1, intensité 1, échelle de portée de la lumière réelle 1, inactif. |
| `BeaconLight:delete()` | 43 | ✍ Supprime le nœud du gyrophare, libère la requête i3d partagée et retire l'objet des updateables de la mission. |
| `BeaconLight:setCallback(callback: any, callbackTarget: any)` | 59 | ✍ Mémorise un callback (et une cible optionnelle) appelé avec l'indicateur de succès une fois le chargement terminé. |
| `BeaconLight.loadFromVehicleXML(targetTable: any, xmlFile: any, key: any, vehicle: any)` | 66 | ✍ Crée un gyrophare depuis une clé XML de véhicule et, en cas de succès, l'ajoute à `targetTable`. Avec `#filename` il charge l'asset partagé à `#node` (en refusant les nœuds de référence chargés à l'exécution) ; sans, il lit des entrées `staticLight` en ligne. Renvoie l'objet ou nil. |
| `BeaconLight:setXMLSettings(speed: any, intensity: any, mountType: any, variationName: any)` | 157 | ✍ Mémorise vitesse, intensité, type de montage et nom de variation issus du XML ; une vitesse ou intensité nil conserve la valeur actuelle. |
| `BeaconLight:setRealLight(useRealLights: any, customRealLight: any, realLightRangeScale: any)` | 167 | ✍ Définit si une lumière réelle est utilisée, un nœud de lumière externe optionnel remplaçant celui de l'asset, et l'échelle de portée appliquée. |
| `BeaconLight:loadFromXML(linkNode: any, xmlFilename: any, baseDirectory: any)` | 175 | ✍ Charge le XML de l'asset de gyrophare et lance le chargement i3d partagé asynchrone, lié ensuite à `linkNode`. Renvoie false et appelle `onFinished(false)` si le XML ou le nom i3d manque. |
| `BeaconLight:onI3DLoaded(i3dNode: any, failedReason: any, args: any)` | 213 | ✍ Callback asynchrone : choisit la variation et le type de montage demandés, supprime les nœuds inutilisés, charge les réglages de variation, lie la racine sous le nœud d'attache avec le décalage y du montage. À noter : le succès est `nœud présent ET lumières statiques`, donc un asset sans lumière statique compte comme échec. |
| `BeaconLight:onFinished(success: any)` | 289 | ✍ Initialise les paramètres shader des lumières statiques, randomise l'angle de départ du rotateur, prépare ou retire la lumière réelle (échelle de portée, priorité d'ombre 0.25, masquée), puis appelle le callback. |
| `BeaconLight:loadVariationFromXML(xmlFile: any, key: any)` | 347 | ✍ Lit rotateur, lumière réelle, lumières statiques, appareil (via `BeaconLightManager`) et un matériau optionnel depuis une clé XML (base ou variation) et applique le matériau au nœud. |
| `BeaconLight:update(dt: any)` | 414 | ✍ Fait tourner le rotateur, anime la couleur de la lumière réelle pour les motifs multi-clignotements, et rafraîchit l'intensité dépendante de la distance et la visibilité à distance minimale des lumières statiques quand la distance caméra a changé de plus de 1. |
| `BeaconLight:setIsActive(isActive: any)` | 465 | ✍ Allume ou éteint le gyrophare : enregistre ou retire les mises à jour par frame si nécessaire, bascule la lumière réelle (seulement si le réglage de lumières réelles est actif) et fixe l'intensité shader de chaque lumière statique. |
| `BeaconLight:onLightsRealBeaconLightChanged()` | 534 | ✍ Réagit à un changement du réglage de lumières réelles de gyrophare en mettant à jour la visibilité du nœud de lumière réelle. |
| `BeaconLight.spawnDebugBeacons(rootNode: any)` | 548 | ✍ Aide de debug : parcourt le dossier `data/shared/assets/beaconLights`, fait apparaître chaque type de montage et variation de chaque XML en grille sous `rootNode`, les étiquette et journalise combien ont chargé ou échoué. |
| `BeaconLight.registerXMLPaths(schema: any)` | 632 | ✍ Enregistre les chemins XML de l'asset de gyrophare : réglages de base et par variation, plus les mappings i3d. |
| `BeaconLight.registerVariationPaths(schema: any, basePath: any)` | 651 | ✍ Enregistre les chemins XML de matériau et d'appareil pour une clé de variation de gyrophare. |
| `BeaconLight.registerVehicleXMLPaths(schema: any, basePath: any)` | 677 | ✍ Enregistre les chemins XML côté véhicule pour un gyrophare (fichier, nœud, vitesse, lumière réelle, intensité, type de montage, variation, lumières statiques en ligne). |

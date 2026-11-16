# vehicles/specializations/components/RealLight.lua

*[English version](../../../../../scripts/vehicles/specializations/components/RealLight.md)*

Source: `dataS/scripts/vehicles/specializations/components/RealLight.lua` — FS25 1.25.1.0

✍ Enveloppe autour d'une ou plusieurs sources de lumière du moteur, utilisée par la spécialisation Lights du véhicule (`spec_lights`). Elle lit un nœud de lumière depuis le XML, gère types de lumière et types exclus, profil IES, diffusion lumineuse et ombres (dont un spot auxiliaire pour ombres fusionnées) selon le réglage `LIGHTS_PROFILE`, et allume ou éteint la lumière avec une échelle de couleur par charge. Visuel côté client ; elle appelle des méthodes du véhicule comme `getIsLightActive` et `getRealLightFromNode` définies ailleurs (NON VÉRIFIÉ).

- **RealLight** (l.23)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `RealLight.new(vehicle: any, customMt: any)` | 27 | ✍ Crée un objet de lumière réelle pour un véhicule, sans fonction de charge. |
| `RealLight:loadFromXML(xmlFile: any, baseKey: any, components: any, i3dMappings: any, loadLightTypes: any)` | 39 | ✍ Charge une lumière réelle depuis le XML : vérifie que le nœud est une source de lumière, collecte les sources enfants, lit échelle d'intensité, types de lumière, profil IES, diffusion et ombres (crée un spot d'ombre fusionnée si plusieurs sources et ombres). Renvoie false avec un avertissement si le nœud manque ou n'est pas une lumière. |
| `RealLight:merge(otherLight: any)` | 162 | ✍ Ajoute les types de lumière et types exclus de cette lumière à une autre lumière sur le même nœud et renvoie cette autre lumière. |
| `RealLight:updateIESProfile(iesEnabled: any)` | 179 | ✍ Active ou désactive les profils IES sur les sources dont le nom correspond à `RealLight.DEFAULT_LIGHT_PROFILE`, et règle l'échelle d'intensité courante d'après le profil. À noter : la ligne d'échelle s'exécute aussi après la branche de désactivation et écrase donc la réinitialisation qui y est faite. |
| `RealLight:updateLightScattering()` | 212 | ✍ Active ou désactive la diffusion lumineuse du moteur par source selon `useLightScattering`, les types de lumière, le profil de lumières (élevé ou très élevé) et une portée supérieure à 7.5 ; plafonne l'angle de cône de diffusion à `SCATTERING_MAX_ANGLE`. |
| `RealLight:updateMergedShadows()` | 260 | ✍ Applique les shadow maps (512) selon le profil de lumières : seulement en ultra, fusionne les ombres de plusieurs sources ou règle une ombre unique avec priorité, en ignorant les composants du véhicule ; sinon désactive les shadow maps. |
| `RealLight:finalize()` | 308 | ✍ Termine le chargement en appelant `updateMergedShadows`. |
| `RealLight:onLightsProfileChanged(lightsProfile: any)` | 314 | ✍ Ré-applique profil IES, diffusion lumineuse et ombres après un changement du profil de qualité des lumières. |
| `RealLight:setLightTypesMask(lightsTypesMask: any)` | 323 | ✍ Détermine à partir d'un masque de bits de types de lumière actifs si cette lumière est allumée (en tenant compte des types exclus et du test d'activité du véhicule) et une échelle de charge, éventuellement via la fonction de charge, puis appelle `setState`. |
| `RealLight:setIsBlinking(isBlinking: any)` | 365 | ✍ Fonction vide ; les lumières réelles ignorent l'état de clignotement. |
| `RealLight:setState(isActive: any, chargeScale: any)` | 370 | ✍ Règle l'échelle de couleur de la lumière d'après la charge (ou 1/0 selon l'état) et affiche ou masque le nœud de lumière. |
| `RealLight:setCharge(alpha: any)` | 377 | ✍ Multiplie la couleur par défaut par la charge et l'échelle d'intensité courante et l'applique à chaque source de lumière. |
| `RealLight:setChargeFunction(func: any, funcTarget: any)` | 387 | ✍ Enregistre une fonction (et sa cible) renvoyant l'échelle de charge utilisée par `setLightTypesMask`. |
| `RealLight.getAreShadowsMergable(lightSources: any)` | 393 | ✍ Vérifie par paires si les bords de cône des sources données restent dans un demi-espace, c'est-à-dire si leurs ombres peuvent être fusionnées. Renvoie un booléen. |
| `RealLight.getConeAngleContribution(lightSource1: integer, lightSource2: integer, coneAngle: number, yRotation: number) → number` | 438 | ✍ Aide qui renvoie l'angle atteint par un bord de cône de `lightSource2` vu depuis `lightSource1` (angle du bord plus demi-cône). |
| `RealLight.getMergedConeAngleSize(lightSources: any)` | 459 | ✍ Renvoie le plus grand angle de cône nécessaire pour couvrir toutes les sources données, en considérant les deux bords de chaque cône par paires. |
| `RealLight.loadLightsFromXML(lights: any, xmlFile: any, baseKey: any, vehicle: any, components: any, i3dMappings: any, loadLightTypes: any)` | 480 | ✍ Charge chaque lumière réelle sous une clé XML de base dans `lights` (créée si nil), en fusionnant avec une lumière existante du même nœud via `vehicle:getRealLightFromNode`. Renvoie la liste. |
| `RealLight.registerXMLPaths(schema: any, basePath: any)` | 502 | ✍ Enregistre les chemins XML d'une lumière réelle (nœud, intensité, types, profil IES, diffusion, ombres). |
| `RealLight.consoleCommandDebugIES(_: any, enabled: any)` | 518 | ✍ Commande console : bascule ou définit l'usage des profils IES et le ré-applique aux lumières réelles du véhicule courant et de ses enfants. À noter : `IES_DEBUG_ENABLED` est stocké ici ; son éventuelle lecture ailleurs est NON VÉRIFIÉE. |

# vehicles/specializations/components/StaticLight.lua

*[English version](../../../../../scripts/vehicles/specializations/components/StaticLight.md)*

Source: `dataS/scripts/vehicles/specializations/components/StaticLight.lua` — FS25 1.25.1.0

✍ Lumière à base de maillage (lueur émissive pilotée par paramètres shader, sans source de lumière du moteur) pour véhicules. Elle pilote les paramètres shader `lightControl` ou `lightIds0..3` d'un nœud de forme, ou bascule sa visibilité, selon le masque de types de lumière actifs et une fonction de charge optionnelle. Plusieurs entrées sur un même nœud peuvent être fusionnées. Utilisée par `Lights` (`spec_lights`) et par `SharedLight` ; visuel côté client.

- **StaticLight** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `StaticLight.new(vehicle: any, customMt: any)` | 16 | ✍ Crée une lumière statique pour un véhicule (peut être nil) sans fonction de charge. |
| `StaticLight:loadFromXML(xmlFile: any, baseKey: any, components: any, i3dMappings: any, loadLightTypes: any, sharedLight: any)` | 28 | ✍ Charge une lumière statique : exige un nœud de forme (pas une source de lumière ; dans la racine de la lumière partagée si fournie), détecte `lightControl` ou un slot UV via `lightIds`, lit l'intensité (5 par défaut), la bascule de visibilité et les types de lumière (hérités de la lumière partagée le cas échéant). Renvoie false avec avertissement si le nœud est invalide ou si les paramètres shader manquent, sinon éteint la lumière et renvoie true. |
| `StaticLight:merge(otherLight: any)` | 144 | ✍ Fusionne les types et types exclus de cette lumière dans une autre lumière du même nœud et la renvoie ; se renvoie elle-même sans changement si les slots UV diffèrent. |
| `StaticLight:setLightTypesMask(lightsTypesMask: any)` | 168 | ✍ Évalue le masque de bits des types actifs par rapport aux types et types exclus de cette lumière (et au test d'activité du véhicule) et appelle `setState` ; ne fait rien sans types ou sans véhicule. |
| `StaticLight:setIsBlinking(isBlinking: any)` | 215 | ✍ Marque la lumière comme clignotante dans le `lightTypeBitMask` du shader (masque entier, ou seulement ce slot UV si son indice est 12 ou moins) ; sans effet avec `lightControl`. |
| `StaticLight:setState(isActive: any, chargeScale: any)` | 242 | ✍ Applique l'état : bascule la visibilité du nœud, ou écrit l'intensité multipliée par la charge dans `lightControl` ou le canal `lightIds` concerné (tous les canaux sans slot UV). |
| `StaticLight:setChargeFunction(func: any, funcTarget: any)` | 273 | ✍ Enregistre une fonction (et sa cible) renvoyant l'échelle de charge utilisée par `setLightTypesMask`. |
| `StaticLight.loadLightsFromXML(lights: any, xmlFile: any, baseKey: any, vehicle: any, components: any, i3dMappings: any, loadLightTypes: any, sharedLight: any)` | 279 | ✍ Charge toutes les lumières statiques sous une clé XML de base dans `lights` (créée si nil), en fusionnant avec une lumière existante sur le même nœud via `vehicle:getStaticLightFromNode`. Renvoie la liste. |
| `StaticLight.registerXMLPaths(schema: any, basePath: any)` | 303 | ✍ Enregistre les chemins XML d'une lumière statique (node ou shaderNode, slot UV, intensité, bascule de visibilité, types de lumière). |

# vehicles/specializations/components/StaticLightCompound.lua

*[English version](../../../../../scripts/vehicles/specializations/components/StaticLightCompound.md)*

Source: `dataS/scripts/vehicles/specializations/components/StaticLightCompound.lua` — FS25 1.25.1.0

✍ Groupe de nœuds de forme dont le shader expose 16 slots de lumière (`lightIds0..3`), servant à piloter une lampe multifonction complète (phare, clignotant, feu de jour...) avec un seul objet. Il associe les fonctions de lumière à des slots UV (modifiable depuis le XML ou une `SharedLight`), calcule l'état, le type et le décalage UV de chaque slot d'après le masque de types actifs et les écrit dans les paramètres shader de chaque nœud. Des méthodes comme `getStateValueByFunction` sont appelées mais non définies ici (NON VÉRIFIÉ). Visuel côté client.

- **StaticLightCompound** (l.15)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `StaticLightCompound.new(vehicle: any, customMt: any)` | 19 | ✍ Crée une lumière statique composée vide pour un véhicule. |
| `StaticLightCompound.loadFunctionMappingData(xmlFile: any, baseKey: any)` | 29 | ✍ Lit les entrées `.function` sous une clé XML (nom de fonction, slot UV 1-16, décalage UV, échelle d'intensité, type de lumière) dans une liste, avec avertissement pour les noms inconnus ou les slots hors plage. |
| `StaticLightCompound:loadFromXML(xmlFile: any, baseKey: any, components: any, i3dMappings: any, vehicle: any, sharedLight: any)` | 61 | ✍ Charge le composé : lit les options, construit le mappage fonction vers slot UV (mappage XML puis surcharges de la lumière partagée, les slots inutilisés reçoivent une entrée par défaut), valide chaque nœud (forme, paramètre `lightIds`, dans la racine de la lumière partagée) et initialise les 16 tableaux d'état. Renvoie false s'il ne reste aucun nœud valide. |
| `StaticLightCompound:setLightTypes(lightTypes: any, excludedLightTypes: any)` | 213 | ✍ Mémorise les types de lumière principaux et types exclus lorsque les tables fournies ne sont pas vides. |
| `StaticLightCompound:setOverwriteSettings(turnLightLeft: any, turnLightRight: any, reverseLight: any)` | 225 | ✍ Mémorise les indicateurs de rôle clignotant gauche/droit et recul et ajoute les types de lumière supplémentaires correspondants de `spec_lights` aux types de lumière du composé. |
| `StaticLightCompound:setLightTypesMask(lightsTypesMask: any, vehicle: any)` | 259 | ✍ Recalcule les états des slots d'après le masque de types actifs (slot 1 d'après les types propres du composé, les autres via le mappage de fonctions et les échelles d'intensité) et écrit `lightIds`, `lightTypeBitMask` et `lightUvOffsetBitMask` sur chaque nœud, ou des zéros pour les nœuds dont la lumière est inactive pour le véhicule. L'argument `vehicle` est obligatoire. |
| `StaticLightCompound.registerXMLPaths(schema: any, basePath: any)` | 449 | ✍ Enregistre les chemins XML d'une lumière statique composée (options, mappages de fonctions, nœuds). |

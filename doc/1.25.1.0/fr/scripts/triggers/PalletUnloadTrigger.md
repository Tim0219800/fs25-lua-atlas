# triggers/PalletUnloadTrigger.lua

*[English version](../../../scripts/triggers/PalletUnloadTrigger.md)*

Source: `dataS/scripts/triggers/PalletUnloadTrigger.lua` — FS25 1.25.1.0

✍ Sous-classe de UnloadTrigger qui détecte les palettes (objets avec isPallet) entrant dans un trigger de collision véhicule et soit les décharge automatiquement côté serveur, soit laisse le joueur déclencher le déchargement. Elle suit les palettes portant un type supporté et, si autoUnload est désactivé, les véhicules proches et le joueur. Le dump présente un trou à l'emplacement de méthodes comme unloadPallets et updateActivatableObject, dont le code n'est donc pas visible ici (NON VÉRIFIÉ).

- **PalletUnloadTrigger** hérite de `UnloadTrigger` (l.15)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PalletUnloadTrigger.registerXMLPaths(schema: any, basePath: any)` | 23 | ✍ Enregistre les chemins XML du parent UnloadTrigger ainsi que triggerNode, autoUnload (true par défaut) et autoUnloadStrapped (false par défaut). |
| `PalletUnloadTrigger.new(isServer: boolean, isClient: boolean, customMt: table?) → table` | 36 | ✍ Crée le trigger au-dessus d'UnloadTrigger.new avec son activable, des tables vides de palettes et de véhicules, actif, autoUnload activé et autoUnloadStrapped désactivé. |
| `PalletUnloadTrigger:load(components: table, xmlFile: table, xmlNode: string, target: table, extraAttributes: table, i3dMappings: table) → boolean` | 61 | ✍ Appelle le load du parent, puis lit triggerNode et retourne false s'il manque ou si son masque de collision n'a pas le bit VEHICLE (erreur XML journalisée). Enregistre le callback physique `palletTriggerCallback` et lit autoUnload et autoUnloadStrapped. |
| `PalletUnloadTrigger:delete()` | 90 | ✍ Retire le trigger physique, supprime les écouteurs de suppression des palettes suivies, vide les tables de palettes et de véhicules, puis appelle le delete du parent. |
| `PalletUnloadTrigger:palletTriggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean, otherShapeId: integer)` | 205 | ✍ Callback physique. Une palette ayant une unité non vide d'un type supporté est ajoutée à l'entrée (retirée à la sortie) ; avec autoUnload le serveur appelle alors unloadPallets. Sans autoUnload il compte les véhicules à portée et suit le joueur local, puis rafraîchit l'activable. |

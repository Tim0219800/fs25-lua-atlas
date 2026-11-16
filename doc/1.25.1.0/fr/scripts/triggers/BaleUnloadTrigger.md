# triggers/BaleUnloadTrigger.lua

*[English version](../../../scripts/triggers/BaleUnloadTrigger.md)*

Source: `dataS/scripts/triggers/BaleUnloadTrigger.lua` — FS25 1.25.1.0

✍ Sous-classe de déclencheur de déchargement (parent UnloadTrigger) qui accepte les balles. Les balles entrant dans son nœud de déclenchement sont suivies côté serveur et vidées progressivement dans l'unité de remplissage du déclencheur, à un débit configurable en litres par seconde, jusqu'à être vides, puis supprimées. Elle s'enregistre aussi auprès des véhicules BaleLoader qui entrent dans le déclencheur pour qu'ils puissent décharger automatiquement leurs balles. UnloadTrigger lui-même n'est pas dans ce fichier (détails NON VÉRIFIÉS).

- **BaleUnloadTrigger** hérite de `UnloadTrigger` (l.14)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `BaleUnloadTrigger.registerXMLPaths(schema: any, basePath: any)` | 22 | ✍ Déclare les chemins XML du parent plus #triggerNode, #deleteLitersPerSecond (4000 par défaut) et les clés de configuration de types de remplissage de FillTypeManager.registerConfigXMLFilltypes. |
| `BaleUnloadTrigger.new(isServer: boolean, isClient: boolean, customMt: table?) → table` | 35 | ✍ Constructeur. Construit l'UnloadTrigger parent avec la métatable de cette classe et initialise le nœud de déclenchement et une liste vide des balles actuellement à l'intérieur. |
| `BaleUnloadTrigger:load(components: table, xmlFile: table, xmlNode: string, target: table, extraAttributes: table, i3dMappings: table) → boolean` | 52 | ✍ Charge le parent, puis le nœud de déclenchement, qui doit avoir le drapeau de collision objet dynamique (et le drapeau véhicule quand le largage automatique de balles est activé sur la plateforme), sinon une erreur XML est journalisée et false est retourné. Sur le serveur, enregistre le callback du déclencheur ; lit le débit de suppression. Retourne true en cas de succès. |
| `BaleUnloadTrigger:delete()` | 86 | ✍ Serveur uniquement : retire l'enregistrement du déclencheur, efface le nœud de déclenchement et la liste de balles, puis appelle le delete du parent. |
| `BaleUnloadTrigger:update(dt: number)` | 116 | ✍ Serveur uniquement. Pour chaque balle suivie qui peut être vendue et n'est pas montée, transfère jusqu'au débit multiplié par dt de son contenu vers l'unité de remplissage du déclencheur et baisse son niveau. Quand elle est presque vide, met à jour les statistiques de balles de coton et le succès, supprime la balle et la retire de la liste. Reste actif tant qu'il reste des balles ; les balles invalides sont retirées. |
| `BaleUnloadTrigger:baleTriggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean, otherShapeId: integer)` | 172 | ✍ Callback du déclencheur (déclencheurs activés uniquement). Une Bale qui entre est ajoutée à la liste suivie si le déclencheur de déchargement la gère, et retirée quand elle sort. Un Vehicle avec la spécialisation BaleLoader est enregistré ou désenregistré via addBaleUnloadTrigger et removeBaleUnloadTrigger à l'entrée et à la sortie. |

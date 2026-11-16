# vehicles/specializations/StrawBlower.lua

*[English version](../../../../scripts/vehicles/specializations/StrawBlower.md)*

Source: `dataS/scripts/vehicles/specializations/StrawBlower.lua` — FS25 1.25.1.0

✍ Spécialisation des souffleuses à paille, qui dissipent une balle en la traitant comme un niveau de remplissage temporaire. Elle exige FillUnit et Trailer. Un trigger côté serveur détecte les balles ; la capacité de l'unité de remplissage est ajustée au contenu de la balle, puis la balle est supprimée une fois vidée. Côté client, elle joue les sons start/work/stop et les animations selon l'état de déchargement.

- **StrawBlower** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `StrawBlower.prerequisitesPresent(specializations: table) → boolean` | 17 | ✍ Renvoie true uniquement si le type de véhicule possède aussi les spécialisations FillUnit et Trailer. |
| `StrawBlower.initSpecialization()` | 24 | ✍ Enregistre les chemins du schéma XML : node du trigger de balles, index de l'unité de remplissage (1 par défaut), animation nodes et échantillons sonores start, stop et work sous vehicle.strawBlower. |
| `StrawBlower.registerFunctions(vehicleType: any)` | 43 | ✍ Enregistre les fonctions de véhicule strawBlowerBaleTriggerCallback et onDeleteStrawBlowerObject. |
| `StrawBlower.registerOverwrittenFunctions(vehicleType: any)` | 50 | ✍ Surcharge getDrawFirstFillText, getAllowDynamicMountFillLevelInfo et addFillUnitFillLevel sur le type de véhicule. |
| `StrawBlower.registerEventListeners(vehicleType: any)` | 58 | ✍ S'abonne à onLoad, onDelete, onUpdateTick, onFillUnitFillLevelChanged et onDischargeStateChanged. |
| `StrawBlower:onLoad(savegame: table)` | 69 | ✍ Serveur : crée le trigger de balles depuis le XML. Client : charge animations et sons. Marque l'unité de remplissage comme synchronisée en valeur absolue et non sauvegardée, remet son niveau à zéro au chargement d'une sauvegarde et retire l'écouteur d'update sur les clients. |
| `StrawBlower:onDelete()` | 112 | ✍ Retire le trigger, libère chaque balle suivie (réveille sa physique, autorise de nouveau le ramassage, retire l'écouteur de suppression), vide la table et supprime sons et animations. |
| `StrawBlower:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 141 | ✍ Serveur uniquement. Sans balle courante et si l'unité accepte le type d'outil BALE, prend la première balle dans le trigger, règle la capacité sur son niveau et remplit l'unité avec son contenu. |
| `StrawBlower:addFillUnitFillLevel(superFunc: any, farmId: any, fillUnitIndex: any, fillLevelDelta: any, fillTypeIndex: any, toolType: any, fillPositionData: any)` | 156 | ✍ Surcharge qui agrandit au besoin la capacité de l'unité de paille pour que la variation demandée tienne, puis appelle l'implémentation parente. |
| `StrawBlower:strawBlowerBaleTriggerCallback(triggerId: integer, otherActorId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean, otherShapeId: integer)` | 173 | ✍ Callback du trigger. À l'entrée, accepte une Bale accessible à la ferme active, ramassable et d'un type supporté : la compte et bloque son ramassage. À la sortie, décrémente le compteur et, à zéro, libère la balle et vide l'unité si elle était courante. |
| `StrawBlower:onDeleteStrawBlowerObject(object: any)` | 223 | ✍ Écouteur de suppression d'une balle suivie : l'oublie et, s'il s'agissait de la balle courante, la réinitialise et vide l'unité de remplissage. |
| `StrawBlower:getDrawFirstFillText(superFunc: any)` | 238 | ✍ Surcharge : renvoie aussi true quand l'unité de paille est vide, en plus du résultat parent. |
| `StrawBlower:getAllowDynamicMountFillLevelInfo(superFunc: any)` | 245 | ✍ Surcharge qui renvoie toujours false. |
| `StrawBlower:onFillUnitFillLevelChanged(fillUnitIndex: integer, fillLevelDelta: number, fillTypeIndex: integer, toolType: boolean, fillPositionData: table, appliedDelta: any)` | 256 | ✍ Serveur : quand l'unité atteint environ zéro, démonte et supprime la balle courante et remet la capacité à 1 ; sinon réduit le niveau de la balle pour suivre l'unité. Client : remet la capacité à 1 une fois vide. |
| `StrawBlower:onDischargeStateChanged(state: any)` | 291 | ✍ Client uniquement. Au début du déchargement, joue les sons start puis work et lance les animations ; à l'arrêt, les coupe et joue le son stop. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `strawBlowerBaleTriggerCallback` | 44 |
| registerFunction | `onDeleteStrawBlowerObject` | 45 |
| registerOverwrittenFunction | `getDrawFirstFillText` | 51 |
| registerOverwrittenFunction | `getAllowDynamicMountFillLevelInfo` | 52 |
| registerOverwrittenFunction | `addFillUnitFillLevel` | 53 |
| registerEventListener | `onLoad` | 59 |
| registerEventListener | `onDelete` | 60 |
| registerEventListener | `onUpdateTick` | 61 |
| registerEventListener | `onFillUnitFillLevelChanged` | 62 |
| registerEventListener | `onDischargeStateChanged` | 63 |

# handTools/specializations/HandToolTethered.lua

*[English version](../../../../scripts/handTools/specializations/HandToolTethered.md)*

Source: `dataS/scripts/handTools/specializations/HandToolTethered.lua` — FS25 1.25.1.0

✍ Spécialisation d'outil à main pour les outils reliés à leur support par un lien, comme la lance d'un nettoyeur haute pression. Elle exige HandToolStorable. L'outil est forcé à mustBeHeld = true et canBeSaved = false, avertit le joueur local quand il s'éloigne du support, et retourne au support si le joueur dépasse la portée maximale, monte dans un véhicule ou quitte la partie.

- **HandToolTethered** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `HandToolTethered.registerXMLPaths(xmlSchema: any)` | 15 | ✍ Déclare les clés XML handTool.tethered : #warningText (texte l10n), #actionRange (3 m par défaut) et #range (5 m par défaut, distance à laquelle l'outil revient au support). |
| `HandToolTethered.registerFunctions(handToolType: any)` | 24 | ✍ Enregistre showRangeWarning, returnToHolder et setAttachedHolder sur le type d'outil à main. |
| `HandToolTethered.registerOverwrittenFunctions(vehicleType: any)` | 32 | ✍ Surcharge setHolder sur le type. À noter : le paramètre s'appelle vehicleType dans le source alors qu'il reçoit un type d'outil à main. |
| `HandToolTethered.registerEventListeners(handToolType: any)` | 38 | ✍ Abonne aux événements onLoad, onDelete, onCarryingPlayerEnteredVehicle, onCarryingPlayerLeftGame et onPreUpdate. |
| `HandToolTethered.prerequisitesPresent(specializations: any)` | 48 | ✍ Retourne true uniquement si la spécialisation HandToolStorable est présente. |
| `HandToolTethered:onLoad(xmlFile: any, baseDirectory: any)` | 54 | ✍ Lit le texte d'avertissement et les deux portées, force mustBeHeld à true et canBeSaved à false (avec un avertissement dans le log si le type avait d'autres valeurs) et crée un identifiant MD5 pour l'avertissement clignotant. |
| `HandToolTethered:onDelete()` | 85 | ✍ Efface la référence spawnedHandTool du support attaché, s'il y en a un, pour qu'il ne pointe plus vers cet outil. |
| `HandToolTethered:onPreUpdate(dt: any)` | 94 | ✍ Tant que l'outil est tenu par un joueur, mesure la distance entre le joueur et le nœud du support. Au-delà de la portée maximale, appelle returnToHolder ; au-delà de la portée d'action, pour le joueur local uniquement, affiche l'avertissement. |
| `HandToolTethered:setAttachedHolder(holder: any)` | 126 | ✍ Mémorise le support auquel l'outil est relié. Ne peut être défini qu'une fois ; un second appel produit un avertissement développeur et est ignoré. |
| `HandToolTethered:onCarryingPlayerLeftGame()` | 138 | ✍ Gestionnaire d'événement : renvoie l'outil à son support quand le joueur qui le porte quitte la partie. |
| `HandToolTethered:onCarryingPlayerEnteredVehicle()` | 144 | ✍ Gestionnaire d'événement : renvoie l'outil à son support quand le joueur qui le porte monte dans un véhicule. |
| `HandToolTethered:setHolder(superFunc: any, holder: any, noEventSend: any)` | 150 | ✍ Surcharge de setHolder. Un support nil est remplacé par le support attaché (et ignoré s'il n'y en a pas), donc un outil relié ne reste jamais sans support. Appelle ensuite l'implémentation parente. |
| `HandToolTethered:returnToHolder(noEventSend: any)` | 165 | ✍ Remet l'outil dans son support attaché via setHolder ; ne fait rien si aucun support n'est attaché. Le drapeau noEventSend est transmis. |
| `HandToolTethered:showRangeWarning(holderPlayerDistance: any)` | 176 | ✍ Affiche un avertissement clignotant à l'écran avec la distance restante avant le retour de l'outil. Ignoré si une interface est visible ou si le texte est vide. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `showRangeWarning` | 25 |
| registerFunction | `returnToHolder` | 26 |
| registerFunction | `setAttachedHolder` | 27 |
| registerOverwrittenFunction | `setHolder` | 33 |
| registerEventListener | `onLoad` | 39 |
| registerEventListener | `onDelete` | 40 |
| registerEventListener | `onCarryingPlayerEnteredVehicle` | 41 |
| registerEventListener | `onCarryingPlayerLeftGame` | 42 |
| registerEventListener | `onPreUpdate` | 43 |

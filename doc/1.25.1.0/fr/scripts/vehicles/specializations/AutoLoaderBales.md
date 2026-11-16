# vehicles/specializations/AutoLoaderBales.lua

*[English version](../../../../scripts/vehicles/specializations/AutoLoaderBales.md)*

Source: `dataS/scripts/vehicles/specializations/AutoLoaderBales.lua` — FS25 1.25.1.0

✍ Spécialisation qui ramasse automatiquement les balles entrant dans un trigger et les monte sur un noeud d'apparition ou les y dépose comme objets physiques. Elle vise des outils comme les pailleuses ou les mélangeuses, sur les plateformes qui activent le chargement automatique. Les types de balles sont définis dans le XML par leur taille (ronde ou carrée) et des types de remplissage optionnels. La détection et le montage se font uniquement côté serveur, et les balles montées sont sauvegardées avec le véhicule.

- **AutoLoaderBales** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AutoLoaderBales.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Renvoie toujours true : aucune spécialisation prérequise. |
| `AutoLoaderBales.initSpecialization()` | 24 | ✍ Enregistre les clés XML sous `vehicle.autoLoaderBales` (trigger de ramassage, types de balles avec types de remplissage, dimensions et réglages de la place d'apparition) et les chemins de sauvegarde des balles. |
| `AutoLoaderBales.registerFunctions(vehicleType: any)` | 50 | ✍ Enregistre `autoLoaderBalesTriggerCallback`, `getAutoLoadBaleTypeFromBale`, `doAutoLoadBale` et `getIsBaleAutoLoadable`. |
| `AutoLoaderBales.registerOverwrittenFunctions(vehicleType: any)` | 59 | ✍ Vide : cette spécialisation ne surcharge aucune fonction de véhicule. |
| `AutoLoaderBales.registerEventListeners(vehicleType: any)` | 64 | ✍ S'abonne à onLoad, onLoadFinished, onDelete et onUpdate. |
| `AutoLoaderBales:onLoad(savegame: table)` | 74 | ✍ Initialise les tables de balles. Sur le serveur, ajoute le trigger de ramassage et lit chaque type de balle ; un type exige un noeud d'apparition et soit diamètre et largeur, soit largeur, hauteur et longueur, sinon un avertissement est journalisé et il est ignoré. |
| `AutoLoaderBales:onLoadFinished(savegame: table)` | 123 | ✍ Quand une sauvegarde non réinitialisée est fournie, recrée chaque balle sauvegardée, applique ses attributs et la charge dans un type de balle correspondant ; les balles sans type correspondant sont supprimées. |
| `AutoLoaderBales:onDelete()` | 148 | ✍ Retire le trigger et les écouteurs de suppression, démonte chaque balle montée et la marque comme à sauvegarder pour qu'elle persiste dans le monde. |
| `AutoLoaderBales:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 177 | ✍ Sauvegarde chaque balle montée via la routine de sauvegarde propre à la balle, sous des clés `bale` indexées. |
| `AutoLoaderBales:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 193 | ✍ À chaque mise à jour, après un court délai de ramassage (compté en mises à jour, non en temps), choisit la balle chargeable la plus haute dans le trigger dont le type a encore de la place et la charge, puis fixe le délai à 10 mises à jour. |
| `AutoLoaderBales.onDeleteAutoLoaderBalesObject(self: any, object: any)` | 227 | ✍ Écouteur de suppression des balles montées : oublie la balle, décrémente le compteur et efface le type de balle chargé quand il n'en reste plus. |
| `AutoLoaderBales.onBaleDeleted(self: any, object: any)` | 243 | ✍ Écouteur de suppression des balles dans le trigger : retire la balle de la table des balles dans le trigger. |
| `AutoLoaderBales:autoLoaderBalesTriggerCallback(triggerId: integer, otherActorId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean, otherShapeId: integer)` | 256 | ✍ Callback de trigger qui tient un compteur par balle des formes dans le trigger, seulement pour les balles accessibles à la ferme active et autorisant le ramassage. Tout événement autre que l'entrée, y compris le maintien, décrémente le compteur. |
| `AutoLoaderBales:getAutoLoadBaleTypeFromBale(bale: any)` | 287 | ✍ Renvoie le premier type de balle compatible avec la balle (le même que celui déjà chargé le cas échéant, type de remplissage autorisé, taille correspondante), ou nil si aucun ne convient. |
| `AutoLoaderBales:doAutoLoadBale(baleType: any, bale: any)` | 315 | ✍ Si le type monte les balles, monte la balle de façon cinématique sur le noeud d'apparition, décalée selon le nombre déjà monté, et l'enregistre. Sinon elle téléporte la balle au noeud d'apparition et lui donne la vitesse du composant parent. |
| `AutoLoaderBales:getIsBaleAutoLoadable(bale: any)` | 348 | ✍ Renvoie true si la balle n'est actuellement montée sur aucun objet. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `autoLoaderBalesTriggerCallback` | 51 |
| registerFunction | `getAutoLoadBaleTypeFromBale` | 52 |
| registerFunction | `doAutoLoadBale` | 53 |
| registerFunction | `getIsBaleAutoLoadable` | 54 |
| registerEventListener | `onLoad` | 65 |
| registerEventListener | `onLoadFinished` | 66 |
| registerEventListener | `onDelete` | 67 |
| registerEventListener | `onUpdate` | 68 |

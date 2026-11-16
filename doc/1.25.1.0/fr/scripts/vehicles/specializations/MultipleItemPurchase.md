# vehicles/specializations/MultipleItemPurchase.lua

*[English version](../../../../scripts/vehicles/specializations/MultipleItemPurchase.md)*

Source: `dataS/scripts/vehicles/specializations/MultipleItemPurchase.lua` — FS25 1.25.1.0

✍ Spécialisation d'un véhicule racine temporaire servant à acheter plusieurs balles ou véhicules d'un coup. Elle exige FillUnit. Elle ajoute une configuration multipleItemPurchaseAmount, fait apparaître les objets aux positions définies en XML pendant le chargement et, hors configuration de boutique, se supprime à la première mise à jour serveur en laissant les objets créés.

- **MultipleItemPurchase** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `MultipleItemPurchase.initSpecialization()` | 15 | ✍ Enregistre le type de configuration multipleItemPurchaseAmount et les chemins XML sous vehicle.multipleItemPurchase (fichier de l'objet, isVehicle, type de remplissage de la balle, balle enrubannée, variante, décalages selon la quantité, positions et rotations). |
| `MultipleItemPurchase.prerequisitesPresent(specializations: any)` | 38 | ✍ Retourne true seulement si le type de véhicule possède la spécialisation FillUnit. |
| `MultipleItemPurchase.registerFunctions(vehicleType: any)` | 44 | ✍ Ajoute loadItemAtPosition et onFinishLoadingVehicle comme fonctions de véhicule. |
| `MultipleItemPurchase.registerOverwrittenFunctions(vehicleType: any)` | 51 | ✍ Surcharge getTotalMass, getFillUnitCapacity, setVisibility, addToPhysics et removeFromPhysics. |
| `MultipleItemPurchase.registerEventListeners(vehicleType: any)` | 61 | ✍ S'abonne aux événements de chargement, fin de pré-chargement, suppression et mise à jour. |
| `MultipleItemPurchase:onLoad(savegame: table)` | 71 | ✍ Lit les réglages de l'objet et construit la liste des positions en appliquant le décalage correspondant à la configuration de quantité. Retire des composants les bits de collision véhicule et objet dynamique, et supprime l'écouteur de mise à jour sur les clients. |
| `MultipleItemPurchase:onPreLoadFinished(savegame: table)` | 139 | ✍ Fait apparaître un objet par position, jusqu'au nombre choisi dans la configuration de quantité. |
| `MultipleItemPurchase:loadItemAtPosition(position: any)` | 150 | ✍ Serveur (ou config boutique) uniquement : crée une balle depuis le XML de config (type, ferme, variante, enrubannage et couleur de base optionnels ; enregistrée sauf en config boutique) ou lance le chargement d'un véhicule avec les configurations correspondantes. Les objets sont gardés hors de la physique. |
| `MultipleItemPurchase:onFinishLoadingVehicle(vehicles: any, vehicleLoadState: any, loadingTask: any)` | 213 | ✍ Callback de chargement : si ce véhicule est déjà en cours de suppression, supprime les véhicules chargés ; sinon les retire de la physique, les masque et les mémorise. Termine ensuite la tâche de chargement. |
| `MultipleItemPurchase:onDelete()` | 243 | ✍ Supprime les balles et véhicules chargés uniquement en configuration de boutique, générateur d'icônes ou chargement de debug de véhicules ; lors d'un achat normal, les objets sont conservés. |
| `MultipleItemPurchase:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 262 | ✍ Serveur uniquement : hors configuration de boutique, le véhicule se supprime lui-même, ce qui en fait un porteur jetable. |
| `MultipleItemPurchase:getTotalMass(superFunc: any, onlyGivenVehicle: any)` | 270 | ✍ En configuration de boutique, retourne la somme des masses des balles et véhicules chargés ; sinon 0. Le parent n'est pas appelé. |
| `MultipleItemPurchase:getFillUnitCapacity(superFunc: any, fillUnitIndex: any)` | 290 | ✍ En configuration de boutique, retourne la somme des niveaux des balles chargées plus la capacité de la première unité des véhicules chargés ; sinon 0. Le parent n'est pas appelé. |
| `MultipleItemPurchase:setVisibility(superFunc: any, state: any)` | 312 | ✍ Transmet l'état de visibilité aux véhicules chargés, puis au parent. |
| `MultipleItemPurchase:addToPhysics(superFunc: any)` | 323 | ✍ Ajoute le véhicule à la physique via le parent ; en cas de succès, ajoute aussi les balles et véhicules chargés. Retourne false si le parent échoue. |
| `MultipleItemPurchase:removeFromPhysics(superFunc: any)` | 341 | ✍ Retire de la physique les balles et véhicules chargés, puis appelle le parent et retourne son résultat. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `loadItemAtPosition` | 45 |
| registerFunction | `onFinishLoadingVehicle` | 46 |
| registerOverwrittenFunction | `getTotalMass` | 52 |
| registerOverwrittenFunction | `getFillUnitCapacity` | 53 |
| registerOverwrittenFunction | `setVisibility` | 54 |
| registerOverwrittenFunction | `addToPhysics` | 55 |
| registerOverwrittenFunction | `removeFromPhysics` | 56 |
| registerEventListener | `onLoad` | 62 |
| registerEventListener | `onPreLoadFinished` | 63 |
| registerEventListener | `onDelete` | 64 |
| registerEventListener | `onUpdate` | 65 |

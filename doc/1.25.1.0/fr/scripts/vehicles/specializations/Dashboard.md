# vehicles/specializations/Dashboard.lua

*[English version](../../../../scripts/vehicles/specializations/Dashboard.md)*

Source: `dataS/scripts/vehicles/specializations/Dashboard.lua` — FS25 1.25.1.0

✍ Moteur côté client des instruments de cabine (jauges, voyants, écrans, bascules de visibilité). Les autres spécialisations enregistrent des objets DashboardValueType via l'événement onRegisterDashboardValueTypes ; le XML sous vehicle.dashboard associe ensuite un type de valeur à un type d'affichage. Les dashboards sont répartis en listes de groupe, critiques (à chaque image), tick et pilotées par événement (par type de valeur), avec limitation selon la distance. Il charge aussi des compounds externes (XML et i3d séparés) liés à un nœud, activables selon la configuration du véhicule. La classe DashboardValueType et les tables Dashboard.TYPES, TYPE_DATA et COLORS sont définies ailleurs : NON VÉRIFIÉ.

- **Dashboard** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Dashboard.prerequisitesPresent(specializations: any)` | 53 | ✍ Renvoie toujours true : la spécialisation n'a aucun prérequis. |
| `Dashboard.initSpecialization()` | 59 | ✍ Enregistre le schéma XML : dashboards par défaut, noms de groupes, distances de mise à jour, tickIntervall et compounds. Construit aussi le schéma séparé dashboardCompounds utilisé par les fichiers XML de compounds. |
| `Dashboard.registerEvents(vehicleType: any)` | 99 | ✍ Déclare l'événement onRegisterDashboardValueTypes, que les autres spécialisations écoutent pour enregistrer leurs types de valeur. |
| `Dashboard.registerFunctions(vehicleType: any)` | 105 | ✍ Enregistre les fonctions publiques du véhicule de la spécialisation (updateDashboards, registerDashboardValueType, chargeurs de groupes et de compounds, getDashboardValue, etc.). |
| `Dashboard.registerEventListeners(vehicleType: any)` | 123 | ✍ S'abonne à onLoad, onPreInitComponentPlacement, onDelete, onUpdate, onUpdateTick et onUpdateEnd. |
| `Dashboard:onLoad(savegame: any)` | 134 | ✍ Initialise les listes de dashboards vides, lit depuis le XML les groupes de vehicle.dashboard.groups, l'intervalle de tick et les deux distances maximales de mise à jour. |
| `Dashboard:onPreInitComponentPlacement(savegame: any)` | 187 | ✍ Client uniquement : déclenche onRegisterDashboardValueTypes, charge les dashboards par défaut, le XML propre à chaque type de valeur et les compounds. Sur un serveur ou sans dashboard, retire les écouteurs onUpdate et onUpdateTick. S'exécute ici pour connaître tous les types enregistrés au post-chargement. |
| `Dashboard:onDelete()` | 219 | ✍ Libère tous les fichiers i3d partagés demandés pour les compounds de dashboard. |
| `Dashboard:registerDashboardValueType(dashboardValueType: any)` | 232 | ✍ Ajoute un objet de type de valeur à la liste du véhicule. Si les types de dashboard sont déjà chargés, le type de valeur charge immédiatement ses propres réglages XML. |
| `Dashboard:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 243 | ✍ Par image côté client : contrôle un groupe de dashboard par image (tourniquet) et force un rafraîchissement complet si son état actif change. Met à jour les dashboards critiques si le véhicule est dans la distance critique ou marqué sale. |
| `Dashboard:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 281 | ✍ Tick côté client : met à jour les dashboards de faible priorité dans la distance maximale (ou si sales), en respectant tickIntervall s'il est défini. Rafraîchit aussi les dashboards pilotés par événement dont le type de valeur est marqué sale. |
| `Dashboard:onUpdateEnd(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 314 | ✍ Client uniquement : force le rafraîchissement des dashboards de tick et critiques, que leur valeur ait changé ou non. |
| `Dashboard:updateDashboardValueType(valueTypeName: any)` | 324 | ✍ Marque le type de valeur nommé comme sale pour que ses dashboards soient rafraîchis au prochain tick si le véhicule est à portée. Appelée par les autres spécialisations quand la valeur source change. |
| `Dashboard:updateDashboards(dashboards: any, dt: any, force: any)` | 330 | ✍ Boucle de mise à jour centrale pour une liste de dashboards. Lit la valeur du type de valeur, applique changement d'état, plage active, échelle, décalage, mapping, valeur de repos, interpolation et bornes min/max, puis appelle la fonction d'état si la valeur a changé ou si force est vrai. |
| `Dashboard:loadDashboardGroupFromXML(xmlFile: any, key: any, group: any)` | 462 | ✍ Lit un nom de groupe dans le XML, le place dans la table du groupe et le met inactif. Renvoie false avec un avertissement si le nom manque ou est déjà utilisé. |
| `Dashboard:getIsDashboardGroupActive(group: any)` | 481 | ✍ Implémentation par défaut, toujours true. D'autres spécialisations la surchargent pour piloter la visibilité des groupes. |
| `Dashboard:getDashboardGroupByName(name: any)` | 487 | ✍ Renvoie la table du groupe de dashboard enregistré sous ce nom, ou nil. |
| `Dashboard:loadDashboardCompoundFromXML(xmlFile: any, key: any, compound: any)` | 493 | ✍ Lit une entrée de compound (nœud de liaison, fichier, nom, ids de config et dépendances de configuration), trouve le compound nommé dans le XML externe et lance un chargement i3d partagé avec onDashboardCompoundLoaded en rappel. Renvoie true seulement si ce chargement a démarré. |
| `Dashboard:onDashboardCompoundLoaded(i3dNode: any, failedReason: any, args: any)` | 592 | ✍ Rappel du chargement i3d du compound : construit les mappings i3d depuis les enfants chargés, charge les dashboards du compound, puis supprime le nœud racine i3d temporaire et le fichier XML du compound. À noter : le nœud du compound est lié avant la suppression de la racine. |
| `Dashboard:loadDashboardCompoundFromExternalXML(dashboardXMLFile: any, compound: any, compoundKey: any, components: any)` | 616 | ✍ Lie le nœud du compound sous son nœud de liaison à l'origine, charge ses dashboards, puis pour chaque configuration applique les changements d'objets et charge ses dashboards seulement si son id est activé. Renvoie false avec un avertissement si le nœud manque. |
| `Dashboard:loadDashboardsFromXML(xmlFile: any, key: any, dashboardValueType: any, components: any, i3dMappings: any, parentNode: any)` | 654 | ✍ Client uniquement : parcourt les entrées dashboard d'une clé, résout le type de valeur par son nom (avertit si inconnu ou ambigu), charge chacune et la range dans la liste critique, par type de valeur, tick ou groupe. Renvoie toujours true. |
| `Dashboard:loadDashboardFromXML(xmlFile: any, key: any, dashboard: any, valueType: any, components: any, i3dMappings: any, parentNode: any)` | 718 | ✍ Charge la définition d'un dashboard : type d'affichage, interpolation, changement d'état, repos/décalage/échelle, plage active, courbe de mapping, groupes et fonction d'état. Appelle ensuite le loadFunc du type d'affichage et le loadFunction du type de valeur ; renvoie false si une étape échoue. |
| `Dashboard:defaultDashboardStateFunc(dashboard: any, newValue: any, minValue: any, maxValue: any, isActive: any)` | 829 | ✍ Fonction d'état par défaut : transmet la nouvelle valeur et ses limites à l'updateFunc du type d'affichage du dashboard. |
| `Dashboard:setDashboardsDirty()` | 836 | ✍ Marque les dashboards critiques et de tick comme sales et réveille le véhicule avec raiseActive, pour un rafraîchissement à la prochaine mise à jour. |
| `Dashboard:getDashboardValue(valueObject: any, valueFunc: any, dashboard: any)` | 845 | ✍ Résout une source de valeur : un nombre ou booléen est renvoyé tel quel, une fonction est appelée avec l'objet et le dashboard, et une chaîne est cherchée comme méthode ou champ de l'objet. Renvoie nil sinon. |
| `Dashboard.getDashboardColor(xmlFile: any, colorStr: any, customEnvironment: any)` | 864 | ✍ Convertit une chaîne de couleur en table RGBA : d'abord une entrée nommée de Dashboard.COLORS, puis une couleur de modèle de matériau du gestionnaire de matériaux, puis un vecteur numérique (alpha 1 par défaut). Avertit et renvoie nil sinon. |
| `Dashboard.warningAttributes(self: any, xmlFile: any, key: any, dashboard: any, isActive: any)` | 894 | ✍ Lit warningThresholdMin et warningThresholdMax depuis le XML dans le dashboard (par défaut -inf et +inf) et renvoie true. |
| `Dashboard.registerDisplayType(typeIndex: any, isCritical: any, schemaFunc: any, loadFunc: any, updateFunc: any)` | 903 | ✍ Stocke les données d'un type d'affichage (indicateur critique, schéma, fonctions de chargement et de mise à jour) dans Dashboard.TYPE_DATA sous l'index donné. Utilisée par les définitions de types d'affichage. |
| `Dashboard.registerDashboardXMLPaths(schema: XMLSchema, basePath: string, availableValueTypes: array)` | 1855 | ✍ Enregistre tous les attributs XML communs d'un dashboard sous un chemin de base, puis les entrées de schéma propres à chaque type d'affichage, et marque le chemin pour enregistrement différé. La liste optionnelle limite les noms de types de valeur autorisés. |
| `Dashboard.addDelayedRegistrationFunc(schema: any, func: any)` | 1890 | ✍ Ajoute une fonction d'enregistrement différé du schéma pour « Dashboard » au schéma du véhicule et à celui des compounds (créé au besoin). |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEvent | `onRegisterDashboardValueTypes` | 100 |
| registerFunction | `registerDashboardValueType` | 106 |
| registerFunction | `updateDashboards` | 107 |
| registerFunction | `updateDashboardValueType` | 108 |
| registerFunction | `loadDashboardGroupFromXML` | 109 |
| registerFunction | `getIsDashboardGroupActive` | 110 |
| registerFunction | `getDashboardGroupByName` | 111 |
| registerFunction | `loadDashboardCompoundFromXML` | 112 |
| registerFunction | `onDashboardCompoundLoaded` | 113 |
| registerFunction | `loadDashboardCompoundFromExternalXML` | 114 |
| registerFunction | `loadDashboardsFromXML` | 115 |
| registerFunction | `loadDashboardFromXML` | 116 |
| registerFunction | `setDashboardsDirty` | 117 |
| registerFunction | `getDashboardValue` | 118 |
| registerEventListener | `onLoad` | 124 |
| registerEventListener | `onPreInitComponentPlacement` | 125 |
| registerEventListener | `onDelete` | 126 |
| registerEventListener | `onUpdate` | 127 |
| registerEventListener | `onUpdateTick` | 128 |
| registerEventListener | `onUpdateEnd` | 129 |

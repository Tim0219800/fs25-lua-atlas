# internalMods/FS25_precisionFarming/scripts/specializations/ExtendedSprayerEffects.lua

*[English version](../../../../../../scripts/internalMods/FS25_precisionFarming/scripts/specializations/ExtendedSprayerEffects.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/specializations/ExtendedSprayerEffects.lua` — FS25 1.25.1.0

✍ Spécialisation de véhicule de Precision Farming qui remplace l'effet de pulvérisation standard d'un pulvérisateur par un effet de plan à shader par buse (exige Sprayer et ExtendedSprayer). Les buses viennent du XML du véhicule, d'une configuration ou des données de liaison de g_precisionFarming. ExtendedSprayer et WeedSpotSpray surchargent la fonction d'état par buse. Elle gère en option la modulation de largeur d'impulsion, les fondus d'effets et les sons de pulvérisation par côté.

- **ExtendedSprayerEffects** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ExtendedSprayerEffects.prerequisitesPresent(specializations: table) → boolean` | 24 | ✍ Vrai uniquement si le véhicule possède les spécialisations Sprayer et ExtendedSprayer. |
| `ExtendedSprayerEffects.initSpecialization()` | 30 | ✍ Enregistre les clés XML vehicle.sprayer.nozzles(?) (#foldingConfigurationIndex, 1 par défaut) et ses enfants nozzle(?) (#node, #translation, #rotation). |
| `ExtendedSprayerEffects.registerFunctions(vehicleType: any)` | 45 | ✍ Ajoute les fonctions de véhicule pour ajouter, initialiser, mettre à jour et compter les effets de buses (addExtendedSprayerNozzleEffect(s), initExtendedSprayerNozzleEffect, updateExtendedSprayerNozzleEffect(s)(State), getNumExtendedSprayerNozzleEffectsActive). |
| `ExtendedSprayerEffects.registerOverwrittenFunctions(vehicleType: any)` | 57 | ✍ Surcharge getAreEffectsVisible. |
| `ExtendedSprayerEffects.registerEventListeners(vehicleType: any)` | 63 | ✍ S'abonne à onLoad, onPostLoad, onPreInitComponentPlacement, onUpdate et onDelete. |
| `ExtendedSprayerEffects:onLoad(savegame: any)` | 73 | ✍ Détecte la modulation de largeur d'impulsion (configuration supérieure à 1) et le contrôle individuel des buses (PWM ou pulvérisation ciblée), puis ajoute les buses depuis les données de liaison de g_precisionFarming et depuis le XML, en ne gardant que celles qui correspondent à la configuration de pliage choisie. À noter : nozzleNodesToDelete est une table indexée par noeud parcourue de 1 à #, la boucle de nettoyage ne supprime donc rien. |
| `ExtendedSprayerEffects:onPostLoad(savegame: any)` | 129 | ✍ Initialise chaque effet de buse (trouve sa section de largeur de travail) et regroupe les effets par indice de section. |
| `ExtendedSprayerEffects:onPreInitComponentPlacement(savegame: any)` | 144 | ✍ Sans effets personnalisés, retire l'écouteur onUpdate. Avec eux, désactive le dessin et les actions de VariableWorkWidth, supprime les sons de pulvérisation standard, crée un noeud central par section et des noeuds de son gauche/droite moyennés sur les buses, et attribue des échantillons de son clonés par côté. |
| `ExtendedSprayerEffects:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 242 | ✍ À chaque update, rafraîchit l'état des buses, par buse en contrôle individuel ou par section sinon. Si un état a changé, exécute updateExtendedSprayerNozzleEffects et garde le véhicule actif. |
| `ExtendedSprayerEffects:onDelete()` | 271 | ✍ Supprime les échantillons sonores de pulvérisation gauche et droit. |
| `ExtendedSprayerEffects:addExtendedSprayerNozzleEffects(linkData: any)` | 280 | ✍ Ajoute un effet de buse pour chaque entrée de linkData.effectNodes dont le nom de noeud existe dans les mappings i3d, en clonant un noeud d'effet de g_precisionFarming. |
| `ExtendedSprayerEffects:addExtendedSprayerNozzleEffect(effectData: any, effectNode: any, linkNode: any, effectNodeData: any)` | 305 | ✍ Remplit les données d'effet (état éteint, valeurs de fondu, paramètres de shader comme la pulsation et un décalage UV aléatoire), lie le noeud d'effet sous le noeud de liaison avec un décalage optionnel et mémorise son décalage latéral. Renvoie toujours true ; surchargée par WeedSpotSpray. |
| `ExtendedSprayerEffects:initExtendedSprayerNozzleEffect(effectData: any)` | 340 | ✍ Attribue à l'effet un indice de section selon son décalage latéral et les sections gauche/droite de VariableWorkWidth, ou 0 si aucune ne convient. Ne fait rien sans sections VariableWorkWidth. |
| `ExtendedSprayerEffects:updateExtendedSprayerNozzleEffectsState(sprayerEffects: any, useFullSection: any, dt: any, isTurnedOn: any, lastSpeed: any)` | 377 | ✍ Met à jour l'indicateur actif et l'échelle de débit de chaque effet via updateExtendedSprayerNozzleEffectState. Avec useFullSection, une buse active allume toute la section. Lance le fondu d'entrée ou de sortie lors des changements et joue ou arrête le son de pulvérisation du côté. |
| `ExtendedSprayerEffects:updateExtendedSprayerNozzleEffectState(effectData: any, dt: any, isTurnedOn: any, lastSpeed: any)` | 464 | ✍ Règle par défaut par buse renvoyant isActive et amountScale. Inactive si sa section de largeur de travail est coupée. Avec PWM, l'échelle est la vitesse propre de la buse sur la limite de vitesse (max 1) ; sinon éteinte sous la vitesse 0,1. Surchargée par ExtendedSprayer et WeedSpotSpray. |
| `ExtendedSprayerEffects:updateExtendedSprayerNozzleEffects(dt: any)` | 491 | ✍ Fait avancer le fondu de chaque effet qui s'allume ou s'éteint avec dt et le temps de fondu de 250 ms, écrit le paramètre de shader fadeProgress et, avec PWM, règle la pause d'impulsion selon l'échelle de débit. |
| `ExtendedSprayerEffects:getNumExtendedSprayerNozzleEffectsActive()` | 524 | ✍ Renvoie le nombre d'effets de buses actifs et la fraction active de tous les effets personnalisés. Sans effets personnalisés, renvoie 1, 1. |
| `ExtendedSprayerEffects:getAreEffectsVisible(superFunc: any)` | 542 | ✍ Surcharge. Renvoie false quand des effets de buses personnalisés existent, pour que les effets standard restent cachés ; sinon s'en remet au parent. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `addExtendedSprayerNozzleEffects` | 46 |
| registerFunction | `addExtendedSprayerNozzleEffect` | 47 |
| registerFunction | `initExtendedSprayerNozzleEffect` | 48 |
| registerFunction | `updateExtendedSprayerNozzleEffectsState` | 49 |
| registerFunction | `updateExtendedSprayerNozzleEffectState` | 50 |
| registerFunction | `updateExtendedSprayerNozzleEffects` | 51 |
| registerFunction | `getNumExtendedSprayerNozzleEffectsActive` | 52 |
| registerOverwrittenFunction | `getAreEffectsVisible` | 58 |
| registerEventListener | `onLoad` | 64 |
| registerEventListener | `onPostLoad` | 65 |
| registerEventListener | `onPreInitComponentPlacement` | 66 |
| registerEventListener | `onUpdate` | 67 |
| registerEventListener | `onDelete` | 68 |

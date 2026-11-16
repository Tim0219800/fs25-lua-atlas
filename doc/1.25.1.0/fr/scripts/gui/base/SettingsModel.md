# gui/base/SettingsModel.lua

*[English version](../../../../scripts/gui/base/SettingsModel.md)*

Source: `dataS/scripts/gui/base/SettingsModel.lua` — FS25 1.25.1.0

✍ Modèle derrière les écrans de réglages (graphismes, audio, commandes, jeu). Pour chaque réglage, il garde une valeur initiale, une valeur sauvegardée (appliquée) et une valeur modifiée (GUI), avec des fonctions de lecture et d'écriture vers GameSettings ou le moteur. Les modifications restent transitoires jusqu'à applyChanges, puis saveChanges les persiste dans les réglages de jeu, le fichier de scalabilité matérielle du moteur et le fichier des bindings d'entrée. Il construit aussi les listes de textes d'options des contrôles et gère l'état des zones mortes et sensibilités par périphérique. Beaucoup d'assistants add<Nom>Setting appelés par addManagedSettings, ainsi que les constantes SETTING / SETTING_CLASS, ne sont pas dans ce dump (NON VÉRIFIÉ) ; les fonctions moteur appelées (getShadowQuality, setMSAA...) sont des bindings du moteur.

- **SettingsModel** (l.14)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SettingsModel.new() → table` | 152 | ✍ Crée le modèle : tables de réglages vides, listes de textes d'options vides avec constantes de pas (luminosité 0,5 à 2,0, netteté 0 à 2...), une table de noms de qualité traduits via l10n, puis appelle initialize. Ne prend aucun paramètre. Nécessite g_i18n. |
| `SettingsModel:initialize()` | 276 | ✍ Construit les listes de valeurs et de textes d'options, puis enregistre tous les réglages gérés. |
| `SettingsModel:addManagedSettings()` | 283 | ✍ Enregistre chaque réglage avec son lecteur et son écrivain. Les versions non console ajoutent d'abord la classe de performance (elle écraserait les valeurs par défaut des autres), puis les réglages de qualité moteur (atmosphère, DRS, DLSS, FSR, XeSS, MSAA, AA post-traitement...) dont les callbacks de changement désactivent les upscalers ou modes d'anticrénelage incompatibles. Viennent ensuite audio, caméra, jeu, HDR et indicateurs GameSettings directs, certains ajoutés seulement sur mobile ou si la limite d'images est réglable. Note : le callback Valar utilise g_settingsModel au lieu de self. |
| `SettingsModel:addSetting(gameSettingsKey: string, readerFunction: function, writerFunction: function, restartRequired: boolean, textFunction: any, rawToValueFunc: any, valueToRawFunc: any, onChangeFunc: any)` | 530 | ✍ Enregistre un réglage sous sa clé : lit sa valeur actuelle via readerFunction et stocke les valeurs initiale, sauvegardée et modifiée avec l'indicateur restartRequired, plus des fonctions optionnelles de texte, brut-vers-valeur, valeur-vers-brut et de changement. L'ajoute aussi à sortedSettings, qui fixe l'ordre d'application. |
| `SettingsModel:setValue(settingKey: string, value: any)` | 551 | ✍ Définit la valeur modifiée (GUI) d'un réglage sans l'écrire dans le moteur, et appelle sa fonction de changement avec la valeur, la valeur brute et un indicateur de différence. Une clé inconnue journalise un avertissement ; une valeur nil est ignorée. |
| `SettingsModel:getValue(settingKey: string, trueValue: any) → any` | 591 | ✍ Renvoie la valeur modifiée d'un réglage, ou 0 si la clé n'est pas enregistrée. Avec trueValue, appelle le lecteur et renvoie la valeur réelle actuelle. |
| `SettingsModel:refresh()` | 625 | ✍ Relit chaque réglage via son lecteur et fixe initial, modifié et sauvegardé à cette valeur, ce qui écarte les modifications en attente. |
| `SettingsModel:refreshChangedValue()` | 637 | ✍ Relit chaque réglage dans modifié et sauvegardé mais garde initial, de sorte que reset() revient toujours aux anciennes valeurs. |
| `SettingsModel:reset()` | 647 | ✍ Restaure chaque réglage à sa valeur initiale en appelant l'écrivain pour ceux qui diffèrent, puis appelle setUserConfirmScreenMode(true) (moteur) et annule les changements de périphériques en attente. |
| `SettingsModel:hasChanges() → boolean` | 682 | ✍ Renvoie true si un réglage diffère de sa valeur initiale ou si des changements de périphériques sont en attente. |
| `SettingsModel:needsRestartToApplyChanges() → boolean, boolean` | 696 | ✍ Renvoie deux booléens : s'il existe un réglage modifié marqué restartRequired et, si oui, si un redémarrage complet du processus est nécessaire (voir needsProcessRestartToApplyChanges). Sinon renvoie false, false. |
| `SettingsModel:needsProcessRestartToApplyChanges() → boolean` | 709 | ✍ Renvoie true si le réglage de résolution ou de mode plein écran existe et a été modifié. Utilise le global g_settingsModel et non self. |
| `SettingsModel:applyChanges(settingClassesToSave: boolean)` | 727 | ✍ Écrit via son écrivain chaque réglage dont la valeur modifiée diffère de la sauvegardée, puis fait de la valeur modifiée la nouvelle valeur initiale. Sauvegarde aussi sauf si settingClassesToSave vaut 0 ; l'argument est un masque de bits de drapeaux SETTING_CLASS, pas un booléen. |
| `SettingsModel:saveChanges(settingClassesToSave: any)` | 750 | ✍ Persiste les réglages appliqués selon le masque de classes : réglages de jeu via g_gameSettings:save(), changements de périphériques toujours, et scalabilité matérielle via saveHardwareScalability (plus executeSettingsChange sur console ou mobile). N'applique pas les changements en attente. |
| `SettingsModel:applyPerformanceClass(value: any)` | 767 | ✍ Écrit la valeur de classe de performance via son écrivain, la marque modifiée et sauvegardée, puis rafraîchit toutes les valeurs modifiées depuis le moteur car le préréglage change d'autres réglages. |
| `SettingsModel:applyCustomSettings()` | 779 | ✍ Écrit chaque réglage modifié mais non sauvegardé, sauf la classe de performance, via son écrivain et le marque sauvegardé ; ne touche pas aux valeurs initiales et ne persiste rien. |
| `SettingsModel:createControlDisplayValues()` | 798 | ✍ Remplit toutes les listes d'options : volume, FOV, échelle d'interface et de résolution, sensibilités de caméra et de direction, unités, niveaux d'ombres et de qualité, limites d'images, plages HDR, pas de pourcentage et de traces de pneus, modes d'écran avec rapport d'aspect, langues, modes de mise à l'échelle disponibles sur ce matériel, et pas de zone morte et de sensibilité des périphériques. Dépend de requêtes moteur et plateforme (valeurs NON VÉRIFIÉES). |
| `SettingsModel:getDeadzoneTexts()` | 1080 | ✍ Renvoie la liste des libellés de zone morte en pourcentage (0 % à 30 %). |
| `SettingsModel:getSensitivityTexts()` | 1086 | ✍ Renvoie la liste des libellés de sensibilité en pourcentage (50 % à 200 %). |
| `SettingsModel:getHeadTrackingSensitivityTexts()` | 1092 | ✍ Renvoie la liste des libellés de sensibilité du suivi de tête (0 % à 100 %). |
| `SettingsModel:getDeviceHasAxisDeadzone(axisIndex: any)` | 1098 | ✍ Renvoie true si le périphérique courant a une entrée de zone morte pour l'axe donné. |
| `SettingsModel:getDeviceHasAxisSensitivity(axisIndex: any)` | 1105 | ✍ Renvoie true si le périphérique courant a une entrée de sensibilité pour l'axe donné. |
| `SettingsModel:getNumDevices()` | 1112 | ✍ Renvoie le nombre de périphériques d'entrée suivis dans les réglages de périphériques. |
| `SettingsModel:nextDevice()` | 1118 | ✍ Passe à l'index de périphérique suivant, en revenant à 1 après le dernier. |
| `SettingsModel:getCurrentDeviceName()` | 1127 | ✍ Renvoie le nom du périphérique courant, ou une chaîne vide s'il n'y en a pas. |
| `SettingsModel:initDeviceSettings()` | 1138 | ✍ Reconstruit l'état par périphérique depuis g_inputBinding.devicesByInternalId : pour chaque axe de manette du périphérique, la zone morte et la sensibilité en index des listes de valeurs, l'échelle de la souris pour les périphériques clavier/souris, et la sensibilité du suivi de tête. Place le périphérique courant à 1 si un périphérique existe. |
| `SettingsModel:hasDeviceChanges()` | 1179 | ✍ Renvoie true si la zone morte ou la sensibilité d'un axe, la sensibilité de la souris ou celle du suivi de tête diffère de sa valeur sauvegardée. |
| `SettingsModel:saveDeviceChanges()` | 1211 | ✍ Applique aux périphériques la zone morte et la sensibilité actuelles de chaque axe, et les sensibilités de souris et de suivi de tête pour les périphériques clavier/souris, les marque sauvegardées, et si quelque chose a été appliqué, réapplique les zones mortes des manettes et écrit le fichier XML des bindings. À noter : les valeurs d'axe sont toujours écrites, et le suivi de tête seulement pour les périphériques clavier/souris. |
| `SettingsModel:resetDeviceChanges()` | 1253 | ✍ Remet les valeurs actuelles de zone morte, sensibilité, souris et suivi de tête de chaque périphérique à leurs valeurs sauvegardées. |
| `SettingsModel:setDeviceDeadzoneValue(axisIndex: any, value: any)` | 1270 | ✍ Définit l'index de zone morte en attente pour un axe du périphérique courant ; sans effet s'il n'y a pas de périphérique courant. |
| `SettingsModel:setDeviceSensitivityValue(axisIndex: any, value: any)` | 1288 | ✍ Définit l'index de sensibilité en attente pour un axe du périphérique courant ; sans effet s'il n'y a pas de périphérique courant. |
| `SettingsModel:getCurrentDeviceSensitivityValue(axisIndex: any)` | 1297 | ✍ Renvoie la valeur réelle de sensibilité (pas l'index) d'un axe du périphérique courant, ou nil s'il n'y a pas de périphérique courant. |
| `SettingsModel:setMouseSensitivity(value: any)` | 1309 | ✍ Définit l'index de sensibilité de souris en attente sur le périphérique courant s'il existe. |
| `SettingsModel:setHeadTrackingSensitivity(value: any)` | 1318 | ✍ Définit l'index de sensibilité du suivi de tête en attente sur le périphérique courant s'il existe. |
| `SettingsModel:getDeviceAxisDeadzoneValue(axisIndex: any)` | 1327 | ✍ Renvoie l'index de zone morte en attente d'un axe du périphérique courant. Pas de contrôle nil : erreur s'il n'y a pas de périphérique ou d'axe courant. |
| `SettingsModel:getDeviceAxisSensitivityValue(axisIndex: any)` | 1334 | ✍ Renvoie l'index de sensibilité en attente d'un axe du périphérique courant. Pas de contrôle nil, comme pour la zone morte. |
| `SettingsModel:getMouseSensitivityValue(axisIndex: any)` | 1341 | ✍ Renvoie l'index de sensibilité de souris en attente du périphérique courant ; le paramètre axisIndex est inutilisé. |
| `SettingsModel:getHeadTrackingSensitivityValue(axisIndex: any)` | 1348 | ✍ Renvoie l'index de sensibilité du suivi de tête en attente du périphérique courant ; le paramètre axisIndex est inutilisé. |
| `SettingsModel:getIsDeviceMouse()` | 1355 | ✍ Renvoie true si le périphérique courant est de catégorie clavier et souris. |
| `SettingsModel:getResolutionTexts()` | 1378 | ✍ Renvoie les libellés de modes d'écran (taille et rapport d'aspect) construits depuis la liste des modes d'écran du moteur. |
| `SettingsModel:getFullscreenModeTexts()` | 1384 | ✍ Renvoie les libellés des modes fenêtré, plein écran fenêtré et plein écran exclusif. |
| `SettingsModel:getMPLanguageTexts()` | 1390 | ✍ Renvoie les noms de langues proposés en multijoueur, tels que listés par le moteur. |
| `SettingsModel:getFrameLimitTexts()` | 1396 | ✍ Renvoie les libellés des limites d'images construits depuis g_gameSettings.frameLimitValues. |
| `SettingsModel:getInputHelpModeTexts()` | 1402 | ✍ Renvoie les libellés du mode d'aide à la saisie : auto, clavier, manette. |
| `SettingsModel:getDirectionChangeModeTexts()` | 1408 | ✍ Renvoie les libellés du changement de sens automatique et manuel, indexés par les constantes de mode de VehicleMotor. |
| `SettingsModel:getGearShiftModeTexts()` | 1414 | ✍ Renvoie les libellés des modes de passage de vitesse indexés par les constantes de VehicleMotor ; l'entrée manuel avec embrayage est absente sur console. |
| `SettingsModel:getHudSpeedGaugeTexts()` | 1420 | ✍ Renvoie les libellés du compteur affichant le régime ou la vitesse, indexés par les constantes de SpeedMeterDisplay. |
| `SettingsModel:getLanguageTexts()` | 1426 | ✍ Renvoie la table globale des noms de langues disponibles, g_availableLanguageNamesTable (définie ailleurs). |
| `SettingsModel:getIsLanguageDisabled()` | 1432 | ✍ Renvoie true quand au plus une langue est disponible ou que la version est Steam, c'est-à-dire que le sélecteur de langue est verrouillé. |
| `SettingsModel:getPerformanceClassTexts()` | 1438 | ✍ Renvoie les six libellés de préréglage (très bas à ultra), la classe de performance actuelle et si elle est personnalisée. Hors mobile, l'emplacement courant est renommé personnalisé ou auto d'après getPerformanceClass et getAutoPerformanceClass (moteur). |
| `SettingsModel:getHDRPeakBrightnessTexts()` | 1464 | ✍ Renvoie les libellés de luminosité maximale HDR (50 à 1000 par pas de 10). |
| `SettingsModel:getHDRContrastTexts()` | 1470 | ✍ Renvoie les libellés de contraste HDR (0,80 à 2,00 par pas de 0,01). |
| `SettingsModel:getOverlayBrightnessTexts()` | 1476 | ✍ Renvoie les libellés de luminosité des overlays (50 à 1000 par pas de 10). |
| `SettingsModel:getPostProcessAAToolTip()` | 1482 | ✍ Renvoie l'infobulle de l'anticrénelage de post-traitement, complétée par les phrases TAA et DLAA quand le moteur les prend en charge. |
| `SettingsModel:getDRSTargetFPSTexts()` | 1488 | ✍ Renvoie les libellés de FPS cible de la résolution dynamique, construits depuis les valeurs de limite d'images. |
| `SettingsModel:getShadingRateQualityTexts()` | 1504 | ✍ Renvoie les libellés à quatre niveaux, bas à très élevé, de la qualité du taux d'ombrage. |
| `SettingsModel:getShadowQualityTexts()` | 1510 | ✍ Renvoie les libellés de qualité des ombres : désactivé, moyen, élevé, très élevé. |
| `SettingsModel:getShadowDistanceQualityTexts()` | 1516 | ✍ Renvoie les libellés de distance des ombres : bas, moyen, élevé. |
| `SettingsModel:getSoftShadowsTexts()` | 1522 | ✍ Renvoie les libellés désactivé/activé des ombres douces. |
| `SettingsModel:getSSAOQualityTexts()` | 1528 | ✍ Renvoie les libellés à quatre niveaux de la qualité de l'occlusion ambiante. |
| `SettingsModel:getShaderQualityTexts()` | 1534 | ✍ Renvoie les libellés à quatre niveaux, bas à très élevé, partagés avec d'autres réglages. |
| `SettingsModel:getTextureResolutionTexts()` | 1540 | ✍ Renvoie les libellés bas/élevé de la résolution des textures. |
| `SettingsModel:getShadowMapFilteringTexts()` | 1546 | ✍ Renvoie les libellés bas/élevé du filtrage des cartes d'ombres. |
| `SettingsModel:getTerraingQualityTexts()` | 1552 | ✍ Renvoie les libellés à quatre niveaux de la qualité du terrain. Le nom contient une faute (Terraing) mais c'est le vrai nom. |
| `SettingsModel:getLightsProfileTexts()` | 1558 | ✍ Renvoie les libellés à cinq niveaux, bas à ultra, du profil d'éclairage. |
| `SettingsModel:getShadowMapLightsTexts()` | 1564 | ✍ Renvoie les libellés 1 à 10 pour le nombre maximal de lumières projetant des ombres. |
| `SettingsModel:getObjectDrawDistanceTexts()` | 1570 | ✍ Renvoie les libellés de pourcentage partagés (50 % à 200 % par 5 %) utilisés pour la distance d'affichage des objets. |
| `SettingsModel:getFoliageDrawDistanceTexts()` | 1576 | ✍ Renvoie les mêmes libellés de pourcentage partagés, utilisés pour la distance d'affichage du feuillage. |
| `SettingsModel:getLODDistanceTexts()` | 1582 | ✍ Renvoie les mêmes libellés de pourcentage partagés, utilisés pour la distance de LOD. |
| `SettingsModel:getTerrainLODDistanceTexts()` | 1588 | ✍ Renvoie les mêmes libellés de pourcentage partagés, utilisés pour la distance de LOD du terrain. |
| `SettingsModel:getFoliageLODDistanceTexts()` | 1594 | ✍ Renvoie les mêmes libellés de pourcentage partagés, utilisés pour la distance de LOD du feuillage. |
| `SettingsModel:getVolumeMeshTessalationTexts()` | 1600 | ✍ Renvoie les mêmes libellés de pourcentage partagés, utilisés pour la tessellation des volumes (nom mal orthographié Tessalation). |
| `SettingsModel:getMaxTireTracksTexts()` | 1606 | ✍ Renvoie les libellés de pourcentage des traces de pneus (0 % à 400 % par pas de 50 %). |
| `SettingsModel:getMaxMirrorsTexts()` | 1612 | ✍ Renvoie les libellés 0 à 7 pour le nombre maximal de rétroviseurs. |
| `SettingsModel:getBrightnessTexts()` | 1618 | ✍ Renvoie les libellés de luminosité de 0,5 à 2,0 par pas de 0,1. |
| `SettingsModel:getFovYTexts()` | 1624 | ✍ Renvoie les libellés du champ de vision vertical, un par degré entre le FOV minimal et maximal de la plateforme. |
| `SettingsModel:getUiScaleTexts()` | 1630 | ✍ Renvoie les 16 libellés d'échelle d'interface de 50 % à 125 % par pas de 5 %. |
| `SettingsModel:getAudioVolumeTexts()` | 1636 | ✍ Renvoie les libellés de volume : désactivé, puis 10 % à 100 %. |
| `SettingsModel:getVoiceInputSensitivityTexts()` | 1642 | ✍ Renvoie les libellés du seuil d'entrée vocale : auto, puis 0 % à 100 % par pas de 10 %. |
| `SettingsModel:getForceFeedbackTexts()` | 1648 | ✍ Renvoie la liste de libellés de volume (désactivé à 100 %), réutilisée pour la force du retour de force. |
| `SettingsModel:getRecordingVolumeTexts()` | 1655 | ✍ Renvoie les libellés de volume d'enregistrement du micro : auto, puis 50 % à 150 %. |
| `SettingsModel:getVoiceModeTexts()` | 1661 | ✍ Renvoie les libellés du mode vocal : désactivé, activité vocale, et appuyer pour parler si la plateforme le prend en charge. |
| `SettingsModel:getCameraSensitivityTexts()` | 1667 | ✍ Renvoie les libellés de sensibilité de la caméra, 50 % à 300 % par pas de 25 %. |
| `SettingsModel:getVehicleArmSensitivityTexts()` | 1673 | ✍ Renvoie les libellés de sensibilité des bras de véhicule, 50 % à 300 % par pas de 25 %. |
| `SettingsModel:getRealBeaconLightBrightnessTexts()` | 1679 | ✍ Renvoie les libellés de luminosité des gyrophares : désactivé, puis 10 % à 100 %. |
| `SettingsModel:getSteeringBackSpeedTexts()` | 1685 | ✍ Renvoie les libellés de vitesse de retour de la direction construits depuis Platform.gameplay.steeringBackSpeedSettings. |
| `SettingsModel:getMoneyUnitTexts()` | 1696 | ✍ Renvoie les libellés de devise : euro, dollar, livre. |
| `SettingsModel:getDistanceUnitTexts()` | 1702 | ✍ Renvoie les libellés d'unité de distance : km, miles. |
| `SettingsModel:getTemperatureUnitTexts()` | 1708 | ✍ Renvoie les libellés d'unité de température : Celsius, Fahrenheit. |
| `SettingsModel:getAreaUnitTexts()` | 1714 | ✍ Renvoie les libellés d'unité de surface : hectare, acre. |
| `SettingsModel:getRadioModeTexts()` | 1720 | ✍ Renvoie les libellés du mode radio : toujours, ou seulement dans les véhicules. |
| `SettingsModel:getResolutionScaleTexts()` | 1726 | ✍ Renvoie les libellés d'échelle de résolution 2D, 50 % à 200 % par pas de 10 %. |
| `SettingsModel:getResolutionScale3dTexts()` | 1732 | ✍ Renvoie les libellés d'échelle de résolution 3D, 50 % à 200 % par pas de 10 %. |
| `SettingsModel:addShadingRateQualitySetting()` | 1923 | ✍ Enregistre le réglage de qualité du taux d'ombrage ; l'index GUI vaut la valeur moteur plus 1 et l'écriture soustrait 1 (jamais sous 0), via getShadingRateQuality / setShadingRateQuality (moteur). |
| `SettingsModel:addSSAOQualitySetting()` | 1937 | ✍ Enregistre le réglage de qualité de l'occlusion ambiante, transmis tel quel à getSSAOQuality et setSSAOQuality (moteur). |
| `SettingsModel:addCloudShadowsQualitySetting()` | 1953 | ✍ Enregistre les ombres de nuages comme booléen : true quand la qualité moteur vaut 1, réécrit en 1 ou 0. |
| `SettingsModel:addTextureResolutionSetting()` | 1967 | ✍ Enregistre le réglage de résolution des textures, en convertissant entre la valeur moteur et un index GUI avec SettingsModel.getTextureResolutionIndex / ByIndex (absents de ce dump). |
| `SettingsModel:addShadowQualitySetting()` | 1981 | ✍ Enregistre la qualité des ombres, qui combine la valeur de qualité d'ombres du moteur et son indicateur de boîte de focus en un seul index GUI via des assistants de SettingsModel (absents de ce dump). |
| `SettingsModel:addShadowDistanceQualitySetting()` | 1995 | ✍ Enregistre la qualité de distance des ombres ; l'index GUI vaut la valeur moteur plus 1. |
| `SettingsModel:addSoftShadowsSetting()` | 2009 | ✍ Enregistre les ombres douces via la qualité de filtre d'ombres du moteur, avec un index GUI égal à la valeur moteur plus 1. |
| `SettingsModel:addShaderQualitySetting()` | 2023 | ✍ Enregistre la qualité des shaders, convertie avec SettingsModel.getShaderQualityIndex / ByIndex (absents de ce dump). |
| `SettingsModel:addShadowMapFilteringSetting()` | 2037 | ✍ Enregistre la taille du filtre de carte d'ombres, convertie avec SettingsModel.getShadowMapFilterIndex / ByIndex (absents de ce dump). |
| `SettingsModel:addShadowMaxLightsSetting()` | 2051 | ✍ Enregistre le nombre maximal de lumières projetant des ombres, transmis tel quel à getMaxNumShadowLights et setMaxNumShadowLights (moteur). |
| `SettingsModel:addTerrainQualitySetting()` | 2065 | ✍ Enregistre la qualité du terrain, convertie avec des assistants de SettingsModel (absents de ce dump). Le commentaire de la source dit qu'un redémarrage est requis pour le bon cache de shaders, pourtant restartRequired n'est pas défini. |
| `SettingsModel:addObjectDrawDistanceSetting()` | 2079 | ✍ Enregistre la distance d'affichage des objets comme index dans les valeurs de pourcentage partagées, via getViewDistanceCoeff / setViewDistanceCoeff (moteur). |
| `SettingsModel:addFoliageDrawDistanceSetting()` | 2093 | ✍ Enregistre la distance d'affichage du feuillage comme index dans les valeurs de pourcentage, via getFoliageViewDistanceCoeff / setFoliageViewDistanceCoeff (moteur). |
| `SettingsModel:addFoliageShadowSetting()` | 2107 | ✍ Enregistre l'indicateur d'ombres du feuillage via getAllowFoliageShadows / setAllowFoliageShadows (moteur). |
| `SettingsModel:addLODDistanceSetting()` | 2121 | ✍ Enregistre la distance de LOD comme index dans les valeurs de pourcentage, via getLODDistanceCoeff / setLODDistanceCoeff (moteur). |
| `SettingsModel:addTerrainLODDistanceSetting()` | 2135 | ✍ Enregistre la distance de LOD du terrain comme index dans les valeurs de pourcentage, via getTerrainLODDistanceCoeff / setTerrainLODDistanceCoeff (moteur). |
| `SettingsModel:addFoliageLODDistanceSetting()` | 2149 | ✍ Enregistre la distance de LOD du feuillage comme index dans les valeurs de pourcentage, via getFoliageLODDistanceCoeff / setFoliageLODDistanceCoeff (moteur). |
| `SettingsModel:addVolumeMeshTessellationSetting()` | 2163 | ✍ Enregistre la tessellation des volumes comme index dans les valeurs de pourcentage, via SettingsModel.getVolumeMeshTessellationCoeff / set... (absents de ce dump). |
| `SettingsModel:addMaxTireTracksSetting()` | 2177 | ✍ Enregistre le réglage maximal de traces de pneus comme index dans les valeurs de traces, via getTyreTracksSegmentsCoeff / setTyreTracksSegmentsCoeff (moteur). |

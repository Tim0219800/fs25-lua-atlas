# vehicles/ai/AIDriveStrategyFieldCourse.lua

*[English version](../../../../scripts/vehicles/ai/AIDriveStrategyFieldCourse.md)*

Source: `dataS/scripts/vehicles/ai/AIDriveStrategyFieldCourse.lua` — FS25 1.25.1.0

✍ Stratégie de conduite IA centrale pour le travail des champs (sous-classe d'AIDriveStrategy). Elle détecte ou restaure un parcours de champ (FieldCourse, AIFieldCourse via g_fieldCourseManager), suit ses segments, déclenche les événements de travail de champ du véhicule pour les virages, abaisse ou relève les outils d'après des contrôles de sol, gère la marche arrière avec les inverseurs d'outils et utilise AICollisionTriggerHandler pour le blocage et le ralentissement. Le serveur diffuse AIVehicleIsBlockedEvent et le parcours peut être sauvegardé et rechargé.

- **AIDriveStrategyFieldCourse** hérite de `AIDriveStrategy` (l.10)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIDriveStrategyFieldCourse.new(reconstructionData: any, customMt: any)` | 14 | ✍ Constructeur. Crée le gestionnaire de collision, réinitialise l'état de blocage et de collision statique, la distance de collision et le suivi de poursuite du travail, et conserve les données de reconstruction reçues. |
| `AIDriveStrategyFieldCourse:delete()` | 34 | ✍ Appelle la suppression parente, puis termine la ligne de travail de chaque outil IA attelé et déclenche le changement d'état AI_END_LINE sur son véhicule racine. |
| `AIDriveStrategyFieldCourse:setAIVehicle(vehicle: any)` | 47 | ✍ Initialise les noeuds de direction et d'inverseur, la direction de conduite et les réglages de parcours (repris du véhicule ou générés par FieldCourseSettings.generate). Restaure un parcours sauvegardé via les données de reconstruction ou lance la détection du champ, et installe les callbacks de collision (celui du blocage diffuse un événement depuis le serveur). |
| `AIDriveStrategyFieldCourse:onFieldCourseLoadedCallback(fieldCourse: any)` | 143 | ✍ Callback appelé quand un parcours est prêt ou chargé depuis une sauvegarde. Arrête la mission avec une erreur s'il n'y a pas de parcours, si c'est un parcours de vigne ou s'il n'a aucun segment ; sinon l'enveloppe dans un AIFieldCourse, fixe la position de départ, le test de validité de zone et le callback du segment initial, puis le finalise. |
| `AIDriveStrategyFieldCourse:update(dt: any)` | 218 | ✍ À chaque frame : met à jour le gestionnaire de collision et le parcours, signale début, progression et fin de virage au véhicule, décide pour chaque outil s'il est abaissé (contrôle de la surface au sol ou toujours actif), déclenche les événements de début et fin de ligne, et saute un sous-segment après 5 s de blocage. À noter : drawDebugTriangle est appelé à chaque frame, même hors mode debug. |
| `AIDriveStrategyFieldCourse:getDriveData(dt: any, vX: any, vY: any, vZ: any)` | 394 | ✍ Renvoie x, z de la cible, le sens, la vitesse max et la distance d'arrêt. Arrête la mission avec une erreur si la détection n'a jamais démarré ou si le champ n'appartient pas à la ferme, attend si le travail ne peut pas continuer, s'arrête si bloqué, sinon demande les données au parcours, corrige la cible pour les outils à inverseur et plafonne la vitesse selon la distance de collision. |
| `AIDriveStrategyFieldCourse:fillReconstructionData(data: any)` | 537 | ✍ Stocke l'AIFieldCourse courant dans la table fournie sous forme d'AIFieldCourseReconstructionData, afin de pouvoir reconstruire la stratégie (par exemple après un chargement). |
| `AIDriveStrategyFieldCourse.saveToXML(data: any, xmlFile: any, key: any)` | 546 | ✍ Statique. Si les données contiennent une reconstruction de parcours de champ, l'enregistre dans le fichier XML sous la clé suffixée par .strategyFieldCourse. |
| `AIDriveStrategyFieldCourse.loadFromXML(data: any, xmlFile: any, key: any)` | 554 | ✍ Statique. Charge un AIFieldCourseReconstructionData depuis la clé .strategyFieldCourse et le place dans la table de données, ou le met à nil si le chargement échoue. |
| `AIDriveStrategyFieldCourse.registerSavegameXMLPaths(schema: any, basePath: any)` | 563 | ✍ Statique. Enregistre les chemins XML de sauvegarde d'AIFieldCourseReconstructionData sous le chemin de base suffixé par .strategyFieldCourse. |

# vehicles/ai/AIDriveStrategy.lua

*[English version](../../../../scripts/vehicles/ai/AIDriveStrategy.md)*

Source: `dataS/scripts/vehicles/ai/AIDriveStrategy.lua` — FS25 1.25.1.0

✍ Classe de base des stratégies de conduite de l'IA. Elle mémorise le véhicule piloté et définit des crochets vides (`update`, `getDriveData`, `updateDriving`) que les stratégies concrètes surchargent. `getDriveData` doit retourner cinq valeurs, toutes nil ici, ce qui signifie aucune consigne.

- **AIDriveStrategy** (l.8)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIDriveStrategy.new(reconstructionData: any, customMt: any)` | 12 | ✍ Constructeur ; crée la table de la stratégie avec la métatable donnée (l'argument de données de reconstruction est inutilisé ici). |
| `AIDriveStrategy:delete()` | 20 | ✍ Crochet de nettoyage vide pour les sous-classes. |
| `AIDriveStrategy:setAIVehicle(vehicle: any)` | 25 | ✍ Mémorise le véhicule IA contrôlé par cette stratégie. |
| `AIDriveStrategy:update(dt: any)` | 31 | ✍ Crochet vide appelé à chaque image, pour les sous-classes. |
| `AIDriveStrategy:getDriveData(dt: any, vX: any, vY: any, vZ: any)` | 36 | ✍ Requête de données de conduite par défaut, retourne cinq nil (aucune consigne de direction, vitesse ou arrêt). Les sous-classes la surchargent pour fournir leurs consignes. |
| `AIDriveStrategy:updateDriving(dt: any)` | 42 | ✍ Crochet vide appelé pendant la conduite, pour les sous-classes. |
| `AIDriveStrategy:debugPrint(text: any, ...: any)` | 47 | ✍ Affiche une ligne de debug formatée préfixée AI DEBUG, uniquement quand l'état de debug des véhicules est le mode IA. |

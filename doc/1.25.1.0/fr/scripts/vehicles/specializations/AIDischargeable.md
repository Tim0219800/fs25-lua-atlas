# vehicles/specializations/AIDischargeable.lua

*[English version](../../../../scripts/vehicles/specializations/AIDischargeable.md)*

Source: `dataS/scripts/vehicles/specializations/AIDischargeable.lua` — FS25 1.25.1.0

✍ Spécialisation des véhicules qui déchargent une matière sous contrôle de l'IA. Dans ce dump, presque tout le fichier est vide : seules deux fonctions subsistent, le reste du comportement (champs de spec_aiDischargeable, fonction stoppedAIDischarge, enregistrements) est NON VÉRIFIÉ. Le code visible désactive le déchargement automatique pendant le travail de l'IA et réagit au retour de l'état de déchargement à OFF.

- **AIDischargeable** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIDischargeable:getDischargeNodeAutomaticDischarge(superFunc: any, dischargeNode: any)` | 135 | ✍ Surcharge : renvoie faux quand l'IA est active et que la plateforme autorise le déchargement automatique, car l'IA déclenche elle-même le déchargement au point de décharge ; sinon délègue à la fonction parente. |
| `AIDischargeable:onDischargeStateChanged(state: any)` | 146 | ✍ Gestionnaire d'événement : quand un déchargement IA est en cours avec un nœud de décharge courant et que l'état repasse à DISCHARGE_STATE_OFF, appelle stoppedAIDischarge (définie hors du dump visible, NON VÉRIFIÉ). |

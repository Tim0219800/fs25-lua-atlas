# vehicles/specializations/BalerStationary.lua

*[English version](../../../../scripts/vehicles/specializations/BalerStationary.md)*

Source: `dataS/scripts/vehicles/specializations/BalerStationary.lua` — FS25 1.25.1.0

✍ Spécialisation minimale pour les presses stationnaires. Dans ce dump, le fichier ne définit que les prérequis et l'enregistrement des événements : la table BalerStationary n'est jamais créée ici et les écouteurs onLoad, onDelete et onDraw enregistrés n'ont aucun corps de fonction. NON VÉRIFIÉ : le reste du comportement (fichier probablement tronqué par le dump du SDK).


## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `BalerStationary.prerequisitesPresent(specializations: table) → boolean` | 20 | ✍ Renvoie true uniquement si le type de véhicule possède à la fois les spécialisations Baler, BaleWrapper et FoldableSteps. |
| `BalerStationary.registerEventListeners(vehicleType: table)` | 29 | ✍ Enregistre onLoad, onDelete et onDraw pour cette spécialisation. À noter : le dump ne contient aucune définition BalerStationary:onLoad/onDelete/onDraw correspondante, leur comportement est donc NON VÉRIFIÉ. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEventListener | `onLoad` | 30 |
| registerEventListener | `onDelete` | 31 |
| registerEventListener | `onDraw` | 32 |

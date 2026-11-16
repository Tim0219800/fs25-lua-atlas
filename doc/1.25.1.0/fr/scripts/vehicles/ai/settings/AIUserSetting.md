# vehicles/ai/settings/AIUserSetting.lua

*[English version](../../../../../scripts/vehicles/ai/settings/AIUserSetting.md)*

Source: `dataS/scripts/vehicles/ai/settings/AIUserSetting.lua` — FS25 1.25.1.0

✍ Classe de base pour les réglages IA modifiables par l'utilisateur. Elle ne contient que quelques champs par défaut (texte d'unité, suffixe par défaut, indicateur de vigne) que les classes de réglages concrètes sont censées étendre.

- **AIUserSetting** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIUserSetting.new(customMt: any)` | 16 | ✍ Constructeur. Crée l'objet avec unitText et defaultPostFix à nil et isVineyardSetting à false. |

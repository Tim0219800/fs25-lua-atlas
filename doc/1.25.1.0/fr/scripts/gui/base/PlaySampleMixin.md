# gui/base/PlaySampleMixin.lua

*[English version](../../../../scripts/gui/base/PlaySampleMixin.md)*

Source: `dataS/scripts/gui/base/PlaySampleMixin.lua` — FS25 1.25.1.0

✍ Mixin GuiMixin permettant à un GuiElement de demander des sons d'interface via un callback remplaçable ; la coupure est possible par élément. Les noms d'échantillons doivent venir de `GuiSoundPlayer.SOUND_SAMPLES` (défini ailleurs, NON VÉRIFIÉ). Côté client uniquement.

- **PlaySampleMixin** hérite de `GuiMixin` (l.19)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaySampleMixin.new()` | 25 | ✍ Crée l'instance du mixin via `GuiMixin.new` avec sa propre métatable. |
| `PlaySampleMixin:addTo(guiElement: any)` | 31 | ✍ Attache le mixin à un GuiElement et ajoute `setPlaySampleCallback`, `playSample` et `disablePlaySample` ; le callback démarre sur `NO_CALLBACK`, vide. Renvoie si l'ajout a eu lieu. |
| `PlaySampleMixin.setPlaySampleCallback(guiElement: table, callback: function)` | 50 | ✍ Définit la fonction appelée avec un nom d'échantillon chaque fois que l'élément veut jouer un son d'interface. |
| `PlaySampleMixin.playSample(guiElement: table, sampleName: string)` | 58 | ✍ Appelle le callback de lecture avec le nom de l'échantillon sauf si le champ `soundDisabled` de l'élément est vrai. |
| `PlaySampleMixin.disablePlaySample(guiElement: any)` | 66 | ✍ Remplace le callback par `NO_CALLBACK` ; un `setPlaySampleCallback` ultérieur peut en définir un nouveau. |
| `PlaySampleMixin:clone(srcGuiElement: any, dstGuiElement: any)` | 72 | ✍ Copie le callback de lecture d'un élément source vers son clone. |

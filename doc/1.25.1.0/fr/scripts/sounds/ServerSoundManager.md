# sounds/ServerSoundManager.lua

*[English version](../../../scripts/sounds/ServerSoundManager.md)*

Source: `dataS/scripts/sounds/ServerSoundManager.lua` — FS25 1.25.1.0

✍ Sous-classe de SoundManager destinée au serveur dédié, où les sons ne sont pas joués. Le fichier redéfinit aussi SoundManager:cloneSample, ce qui remplace la méthode de la classe parente et non d'une sous-classe.

- **ServerSoundManager** hérite de `SoundManager` (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ServerSoundManager.new(customMt: any) → table` | 18 | ✍ Constructeur. À noter : appelle SoundManager.new avec la métatable fournie ou celle de ServerSoundManager et renvoie cet objet. |
| `SoundManager:cloneSample(sample: table, linkNode: integer, modifierTargetObject: any) → table` | 29 | ✍ À noter : définie sur SoundManager et non sur ServerSoundManager, elle remplace donc la méthode de base une fois ce fichier chargé. Clone la table de l'échantillon et ses modificateurs sans créer de source audio, l'enregistre et la renvoie. |

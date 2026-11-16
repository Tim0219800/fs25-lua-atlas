# gui/base/GuiSoundPlayer.lua

*[English version](../../../../scripts/gui/base/GuiSoundPlayer.md)*

Source: `dataS/scripts/gui/base/GuiSoundPlayer.lua` — FS25 1.25.1.0

✍ Charge les sons du menu et du HUD comme échantillons 2D non spatialisés dans le groupe audio GUI et les joue par nom. Chaque son dispose d'un petit lot d'échantillons clonés pour permettre le chevauchement, avec un délai minimal entre deux lectures. Des constantes comme SOUND_SAMPLES, NUM_SAMPLES_PER_SOUND et SAMPLE_REPLAY_TIMEOUT sont absentes du corps visible du dump ou définies ailleurs (NON VÉRIFIÉ).

- **GuiSoundPlayer** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `GuiSoundPlayer.new(soundManager: table) → GuiSoundPlayer` | 98 | ✍ Conserve la référence au SoundManager et charge tous les échantillons depuis GuiSoundPlayer.SOUND_SAMPLE_DEFINITIONS_PATH dans la table soundSamples. |
| `GuiSoundPlayer:loadSounds(sampleDefinitionXmlPath: any)` | 118 | ✍ Ouvre le XML de définitions et, pour chaque nom de son connu sauf NONE, charge un échantillon 2D puis le clone pour former un lot ; retourne une table nom vers liste d'échantillons. Journalise un avertissement si un échantillon échoue, et referme le fichier XML. |
| `GuiSoundPlayer:playSample(sampleName: string)` | 153 | ✍ Joue le premier échantillon libre du son nommé. Ne fait rien pour NONE, si le son a été joué il y a moins que le délai de relecture (basé sur g_time) ou si tout le lot est occupé ; avertit en mode dev pour un nom inconnu. |

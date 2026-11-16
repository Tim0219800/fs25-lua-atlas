# sounds/SoundMixer.lua

*[English version](../../../scripts/sounds/SoundMixer.md)*

Source: `dataS/scripts/sounds/SoundMixer.lua` — FS25 1.25.1.0

✍ Mixeur côté client qui règle le volume de chaque groupe audio selon l'état de jeu courant, avec fondu d'entrée et de sortie. Les volumes par état viennent d'un XML de mixage ; des facteurs par groupe et un volume maître s'y ajoutent. Il écoute GAME_STATE_CHANGED sur le centre de messages et expose une commande console de débogage.

- **SoundMixer** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SoundMixer.new(customMt: any) → table, integer` | 18 | ✍ Crée le mixeur, s'abonne aux changements d'état de jeu, met le facteur de chaque groupe audio à 1 et enregistre la commande console gsSoundMixerDebug. |
| `SoundMixer:loadFromXML(xmlFilepath: string)` | 43 | ✍ Lit depuis le XML les états de jeu avec volume et fondus par groupe audio. Met ensuite tous les volumes de groupe à 0 (appel moteur setAudioGroupVolume) ; update() les monte quand l'état est marqué modifié. États ou groupes inconnus : avertissement. À noter : fadeInDuration est lu depuis l'attribut #fadeOutDuration, donc fondu d'entrée = fondu de sortie. |
| `SoundMixer:delete()` | 113 | ✍ Se désabonne de tous les messages et retire la commande console de débogage. |
| `SoundMixer:update(dt: any)` | 121 | ✍ Si le mixeur est marqué modifié, rapproche le volume de chaque groupe de l'état courant de sa cible (volume de l'état fois facteur du groupe), à un rythme fondé sur dt et la durée de fondu. Prévient les écouteurs et efface le drapeau quand toutes les cibles sont atteintes. |
| `SoundMixer:setAudioGroupVolumeFactor(audioGroupIndex: any, factor: any)` | 208 | ✍ Définit un multiplicateur pour un groupe audio et marque le mixeur modifié pour que le volume glisse vers la nouvelle cible. Ignoré pour un groupe nil ou inconnu. |
| `SoundMixer:setMasterVolume(masterVolume: any)` | 221 | ✍ Mémorise le volume maître et le transmet à la fonction moteur setMasterVolume. |
| `SoundMixer:onGameStateChanged(gameStateId: any, oldGameState: any)` | 228 | ✍ Gestionnaire de message : marque le mixeur modifié si le nouvel état de jeu possède des réglages de mixage, ce qui lance les fondus dans update(). |
| `SoundMixer:addVolumeChangedListener(audioGroupIndex: any, func: any, target: any)` | 239 | ✍ Enregistre un rappel (func, target) appelé sous la forme func(target, audioGroupIndex, volume) à chaque changement de volume du groupe. Les doublons ne sont pas évités. |

## Messages

- s'abonne à `MessageType.GAME_STATE_CHANGED` (l.21)

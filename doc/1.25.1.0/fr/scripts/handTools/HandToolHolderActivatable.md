# handTools/HandToolHolderActivatable.lua

*[English version](../../../scripts/handTools/HandToolHolderActivatable.md)*

Source: `dataS/scripts/handTools/HandToolHolderActivatable.lua` — FS25 1.25.1.0

✍ Objet activable (invite d'interaction) associé à un `HandToolHolder`. Il permet au joueur local de prendre l'outil à main rangé ou de ranger celui qu'il tient, selon le côté vide. Il peut exiger que le holder soit celui visé par le targeter du joueur.

- **HandToolHolderActivatable** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `HandToolHolderActivatable.new(handToolHolder: any, takeText: any, storeText: any, needTargeting: any)` | 16 | ✍ Crée l'activable pour un holder avec ses textes de prise et de rangement (chaînes de format recevant la description du type d'outil) et un indicateur précisant si le ciblage est requis. |
| `HandToolHolderActivatable:getIsActivatable()` | 31 | ✍ Renvoie true quand le joueur local peut prendre l'outil du holder (mains vides, holder plein) ou ranger son outil tenu (holder vide) ; met à jour `activateText`. Avec le ciblage, le holder doit être celui visé. |
| `HandToolHolderActivatable:getDistance(positionX: any, positionY: any, positionZ: any)` | 78 | ✍ Renvoie 0 si le ciblage est requis et que l'invite est activable ; sinon la distance entre la position donnée et le noeud du holder. |
| `HandToolHolderActivatable:run()` | 93 | ✍ Exécute l'interaction : soit donne l'outil du holder au joueur local et le rend outil courant, soit range l'outil tenu dans ce holder. Joueur local uniquement. |

# gui/elements/ClearElement.lua

*[English version](../../../../scripts/gui/elements/ClearElement.md)*

Source: `dataS/scripts/gui/elements/ClearElement.lua` — FS25 1.25.1.0

✍ Élément GUI qui découpe un trou transparent dans ce qui a déjà été dessiné, en appelant la fonction moteur `clearOverlayArea` sur son rectangle avant de dessiner ses enfants. Dérivé de GuiElement ; utilise un overlay "clear" pour la rotation et un décalage optionnel. Il ne prend le focus que s'il a des enfants capables de le prendre. Interface côté client.

- **ClearElement** hérite de `GuiElement` (l.17)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ClearElement.new(target: any, custom_mt: any)` | 23 | ✍ Constructeur avec décalage et décalage focalisé nuls et une table d'overlay vide. À noter : la métatable de repli est `BitmapElement_mt`, absente de ce fichier ; elle est probablement nil si aucun custom_mt n'est fourni. |
| `ClearElement:delete()` | 34 | ✍ Libère l'overlay puis exécute la suppression du parent. |
| `ClearElement:loadFromXML(xmlFile: any, key: any)` | 42 | ✍ Charge l'overlay "clear" et les attributs `offset` et `focusedOffset` (valeurs normalisées à l'écran) depuis le nœud XML. |
| `ClearElement:loadProfile(profile: any, applyProfile: any)` | 52 | ✍ Comme le chargeur XML mais depuis un profil GUI ; focusedOffset prend par défaut la valeur de offset s'il est absent. |
| `ClearElement:copyAttributes(src: any)` | 62 | ✍ Copie l'overlay, offset et focusedOffset depuis un élément source. |
| `ClearElement:getOffset()` | 72 | ✍ Retourne le décalage x/y à utiliser pour le dessin. À noter : le test d'état finit par `or GuiOverlay.STATE_HIGHLIGHTED` sans comparaison, donc toujours vrai : le décalage focalisé est toujours retourné. |
| `ClearElement:setImageRotation(rotation: number)` | 86 | ✍ Définit la rotation de l'overlay de découpe, en radians. |
| `ClearElement:draw(clipX1: any, clipY1: any, clipX2: any, clipY2: any)` | 92 | ✍ Efface la zone d'écran de l'élément (position plus décalage, taille, rotation autour de son centre) avec `clearOverlayArea`, puis dessine les enfants via le parent. |
| `ClearElement:canReceiveFocus()` | 102 | ✍ Retourne false si l'élément est caché ou n'a pas d'enfant, et true seulement si chaque enfant peut recevoir le focus. |
| `ClearElement:getFocusTarget()` | 117 | ✍ Retourne le premier enfant comme cible du focus, ou l'élément lui-même s'il n'a pas d'enfant. |

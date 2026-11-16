# gui/elements/PlatformIconElement.lua

*[English version](../../../../scripts/gui/elements/PlatformIconElement.md)*

Source: `dataS/scripts/gui/elements/PlatformIconElement.lua` — FS25 1.25.1.0

✍ Élément bitmap qui affiche l'icône d'une plateforme de jeu (identifiée par un PlatformId) en sélectionnant une tranche d'image. Sur les versions PS5, Xbox Series et Microsoft Store, seule l'icône de la même plateforme est affichée ; les autres utilisent une tranche générique. Les tables PlatformId, SLICES et ALLOW_COLOR_CHANGE sont définies ailleurs (NON VÉRIFIÉ).

- **PlatformIconElement** hérite de `BitmapElement` (l.14)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlatformIconElement.new(target: any, custom_mt: any)` | 20 | ✍ Constructeur. Construit un BitmapElement et le retourne sans champ supplémentaire. |
| `PlatformIconElement:delete()` | 28 | ✍ Supprime l'élément en appelant le delete du parent ; aucun nettoyage supplémentaire. |
| `PlatformIconElement:copyAttributes(src: any)` | 34 | ✍ Copie le platformId depuis un élément source après la copie de base. |
| `PlatformIconElement:setPlatformId(platformId: any)` | 42 | ✍ Sélectionne la tranche d'icône pour un id de plateforme, en le remplaçant par 0 (générique) si la plateforme courante n'autorise que sa propre icône. Sauvegarde et neutralise la couleur sélectionnée pour les plateformes sans changement de couleur. À noter : le commentaire source parle de couche de terrain, ce qui semble un reste de copier-coller. |

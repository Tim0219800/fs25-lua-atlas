# misc/Color.lua

*[English version](../../../scripts/misc/Color.md)*

Source: `dataS/scripts/misc/Color.lua` — FS25 1.25.1.0

✍ Classe de couleur RGBA avec des canaux de 0 à 1. Elle convertit depuis et vers des entiers 32 bits, des chaînes hexadécimales, des vecteurs, des valeurs RGBA 0..255 et des présélections nommées (Color.PRESETS est utilisé mais défini hors de ce fichier, NON VÉRIFIÉ). Sa métatable ajoute l'indexation numérique (1 à 4), le swizzle comme color.rgb et la multiplication avec des nombres, tables ou autres couleurs.

- **Color** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Color_mt.__index(color: Color, key: string) → any` | 19 | ✍ Métaméthode d'indexation : cherche dans l'instance, puis dans la classe Color, puis associe les clés numériques 1 à 4 à r, g, b, a, et enfin tente un swizzle de la clé (par exemple une chaîne de lettres de canaux). |
| `Color_mt.__mul(left: (table\|number\|Color), right: (table\|number\|Color)) → Color` | 55 | ✍ Métaméthode de multiplication. Deux tables multiplient leurs canaux RGB (et l'alpha si les deux en ont), un nombre met à l'échelle les quatre canaux ; les résultats sont bornés à 0..1 et renvoyés dans une nouvelle Color. Les autres types déclenchent Assert.fail. |
| `Color.new(r: number, g: number, b: number, a: number?) → Color` | 101 | ✍ Constructeur prenant r, g, b, a dans 0..1 ; les canaux absents valent 0 et l'alpha 1 (noir opaque). Les contrôles de plage n'existent que dans les builds de debug. |
| `Color:copy() → Color` | 129 | ✍ Renvoie une nouvelle Color avec les mêmes quatre canaux. |
| `Color:copyTo(color: Color)` | 136 | ✍ Écrit les quatre canaux de cette couleur dans une Color existante, en l'écrasant. |
| `Color.parseFromString(inputString: string, ignoreAlpha: boolean?) → Color` | 145 | ✍ Analyse une chaîne en Color ou renvoie nil. Le code essaie dans cet ordre : hexadécimal (commence par #), entier packé, vecteur de 3 nombres ou plus séparés par des espaces, couleur de marque via g_vehicleMaterialManager s'il existe, puis nom de présélection. À noter : la doc du code indique un ordre différent. ignoreAlpha force l'alpha à 1. |
| `Color.fromPresetName(presetName: string) → Color` | 203 | ✍ Cherche une couleur prédéfinie par nom, sans tenir compte de la casse (nom mis en majuscules puis lu dans Color.PRESETS) ; nil pour un non-texte ou un nom inconnu. |
| `Color.fromPackedValue(packedValue: integer) → Color` | 218 | ✍ Décompose un entier 32 bits (ou une chaîne numérique) en Color, avec le rouge dans l'octet de poids faible et l'alpha dans le plus fort, chacun divisé par 255. Renvoie nil si ce n'est pas un nombre. |
| `Color:toPackedValue() → integer` | 243 | ✍ Compacte la couleur en entier 32 bits (rouge dans l'octet de poids faible, alpha dans le plus fort), chaque canal multiplié par 255 et arrondi à l'entier supérieur avec math.ceil. |
| `Color.fromHex(hexString: string) → Color` | 257 | ✍ Construit une Color à partir d'une chaîne hexadécimale avec ou sans # initial, interprétée selon la disposition packée (et non l'ordre RRGGBB habituel). Renvoie nil pour un non-texte ou un texte illisible. |
| `Color:toHex(includeHash: boolean) → string` | 283 | ✍ Renvoie la valeur packée sous forme de chaîne hexadécimale, avec # optionnel. À noter : le format est %x sans remplissage de zéros, la longueur peut donc varier. |
| `Color.fromVector(vector: table, minLength: integer?, maxLength: integer?) → Color` | 295 | ✍ Construit une Color à partir d'un tableau de canaux dans 0..1. Renvoie nil si l'argument n'est pas une table ou est plus court que minLength ; les entrées au-delà de maxLength sont remplacées par les valeurs par défaut (0, alpha 1). |
| `Color:unpack() → number, number, number, number` | 315 | ✍ Renvoie r, g, b, a comme quatre valeurs dans 0..1. |
| `Color:unpack3() → number, number, number` | 324 | ✍ Renvoie r, g, b comme trois valeurs dans 0..1. |
| `Color:toVector3() → table` | 331 | ✍ Renvoie un nouveau tableau {r, g, b}. |
| `Color:toVector4() → table` | 338 | ✍ Renvoie un nouveau tableau {r, g, b, a}. |
| `Color.fromRGBA(r: integer, g: integer, b: integer, a: integer?) → Color` | 349 | ✍ Construit une Color à partir d'entiers 0..255 en divisant par 255 ; r, g, b absents valent 0 et l'alpha 255. |
| `Color:unpackRGBA() → integer, integer, integer, integer` | 359 | ✍ Renvoie les quatre canaux sous forme d'entiers 0..255, multipliés par 255 et arrondis à l'entier supérieur avec math.ceil. |
| `Color.fromVectorRGBA(vector: table, minLength: integer?, maxLength: integer?) → Color` | 369 | ✍ Comme fromVector mais pour des valeurs 0..255 : renvoie nil pour une table invalide ou trop courte, ignore les entrées au-delà de maxLength, puis appelle fromRGBA. |
| `Color:toVectorRGB() → table` | 386 | ✍ Renvoie un nouveau tableau de trois entiers 0..255 (rouge, vert, bleu), arrondis à l'entier supérieur. |
| `Color:toVectorRGBA() → table` | 393 | ✍ Renvoie un nouveau tableau de quatre entiers 0..255 (rouge, vert, bleu, alpha), arrondis à l'entier supérieur. |
| `Color.blend(first: Color, second: Color, alpha: number) → Color` | 403 | ✍ Interpolation linéaire entre deux couleurs sur les quatre canaux via MathUtil.lerp ; alpha 0 donne la première, 1 la seconde. Renvoie une nouvelle Color. |
| `Color:swizzle(key: string) → table` | 414 | ✍ Construit un tableau à partir d'une clé de 1 à 4 lettres de canaux (par exemple rg) ; renvoie nil si la clé n'est pas un texte, a une mauvaise longueur ou contient une lettre qui n'est pas un champ de la couleur. |
| `Color.writeStreamRGB(streamId: integer, r: number, g: number, b: number)` | 449 | ✍ Écrit r, g, b dans un flux réseau sous forme de trois valeurs non signées de 10 bits (chacune bornée à 0..1 puis multipliée par 1023) ; l'alpha n'est pas envoyé. |

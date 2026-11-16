# gui/elements/FrameReferenceElement.lua

*[English version](../../../../scripts/gui/elements/FrameReferenceElement.md)*

Source: `dataS/scripts/gui/elements/FrameReferenceElement.lua` — FS25 1.25.1.0

✍ FrameReferenceElement est un GuiElement de substitution qui désigne un frame à afficher. Il mémorise le nom issu de l'attribut XML ref. La résolution et le retrait du substitut se font dans le code de chargement du GUI, absent de ce fichier : NON VÉRIFIÉ.

- **FrameReferenceElement** hérite de `GuiElement` (l.15)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FrameReferenceElement.new(target: any, custom_mt: any)` | 22 | ✍ Constructeur. Crée l'élément avec un referencedFrameName vide. |
| `FrameReferenceElement:loadFromXML(xmlFile: any, key: any)` | 32 | ✍ Charge les attributs de base et lit le nom du frame référencé dans l'attribut ref (chaîne vide si absent). |
| `FrameReferenceElement:copyAttributes(src: any)` | 40 | ✍ Copie les attributs de base et le nom du frame référencé depuis un élément source. |

# Journal des modifications

*[English version: CHANGELOG.md](CHANGELOG.md)*

## 1.25.1.0, mise à jour 2 (2026-11-16) : descriptions complètes et bilingues
- Descriptions rédigées pour **les 961 fichiers et 13 390 fonctions**, en anglais et en français (rédigées avec l'aide d'une IA à partir des sources du SDK, vérifiées automatiquement).
- Site français sous `doc/1.25.1.0/fr/` (toutes les pages, index, événements, messages, globales, fonctions moteur, relevé en jeu).
- Les stubs portent désormais les descriptions anglaises.
- Nouvel outil `outils/verifier_descriptions.py` : squelettes, contrôle des clés et des deux langues, contrôle anti-copie par rapport aux sources.
- `extraire.py` tire la version du jeu du dossier de sortie ; la CI vérifie que chaque description est bilingue.

## 1.25.1.0 (2026-11-15) : première version
- Extraction statique des 961 fichiers Lua du SDK : 13 390 fonctions, héritage, événements de spécialisation, `MessageType`, globales `g_*`.
- 819 signatures de fonctions moteur depuis `scriptBinding.xml`.
- Relevé en jeu : 4 308 globales, dont 2 651 absentes des sources du SDK (`Weather`, `Environment`, `FSBaseMission`, `EffectManager`…), noms seulement.
- Descriptions rédigées pour 35 fichiers (1 325 fonctions) : `WorkParticles`, `ParticleUtil`, roues (`Wheels`, `WheelEffects`, `WheelPhysics`…),
  `Washable`, `VehicleSystem`, `Enterable`, `Motorized`, `Lights`, `Dischargeable`, matériaux et particules, `Sprayer`, `Combine`, `Cutter`
  et les outils de travail du sol et de récolte.
- Stubs LuaLS, site mkdocs, CI de validation.

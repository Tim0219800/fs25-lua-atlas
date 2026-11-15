# Journal des modifications

## 1.25.1.0 (2026-11-15) : première version
- Extraction statique des 961 fichiers Lua du SDK : 13 390 fonctions, héritage, événements de spécialisation, `MessageType`, globales `g_*`.
- 819 signatures de fonctions moteur depuis `scriptBinding.xml`.
- Relevé en jeu : 4 308 globales, dont 2 651 absentes des sources du SDK (`Weather`, `Environment`, `FSBaseMission`, `EffectManager`…), noms seulement.
- Descriptions rédigées pour 35 fichiers (1 325 fonctions) : `WorkParticles`, `ParticleUtil`, roues (`Wheels`, `WheelEffects`, `WheelPhysics`…),
  `Washable`, `VehicleSystem`, `Enterable`, `Motorized`, `Lights`, `Dischargeable`, matériaux et particules, `Sprayer`, `Combine`, `Cutter`
  et les outils de travail du sol et de récolte.
- Stubs LuaLS, site mkdocs, CI de validation.

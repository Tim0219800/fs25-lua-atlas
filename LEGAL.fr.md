# Statut juridique

*[English version: LEGAL.md](LEGAL.md)*

> Analyse faite par l'auteur du dépôt le 2026-11-15. Ce n'est pas un avis juridique professionnel.

## Ce que disent les conditions de GIANTS Software
Source : [Conditions générales GIANTS](https://www.farming-simulator.com/termsAndConditions.php) (version « Issued: October 2016 », consultée le 2026-11-15).
- §3.2 : licence de base, non transférable, pour un usage privé.
- §3.4 : la modification, la décompilation, le désassemblage et l'ingénierie inverse des jeux sont interdits, tout comme leur diffusion à des tiers.
- §6.8 : il est interdit de prendre des parties des jeux.

Aucune FS25-EULA distincte n'a été trouvée en ligne. Les conditions du SDK ou du GDN (s'il y en a) n'ont pas été relues : NON VÉRIFIÉ.

## Pourquoi ce dépôt reste en dehors de ces interdictions
- **Pas de décompilation.** Les sources Lua lues sont celles que GIANTS fournit en clair dans le SDK du jeu
  (`sdk/debugger/gameSource.zip`, prévu pour déboguer les mods). Les archives `.gar` n'ont jamais été extraites
  et aucun outil tiers de décompilation n'a été utilisé.
- **Le relevé en jeu est un mod Lua ordinaire.** Il liste les noms des globales accessibles à n'importe quel mod,
  avec les fonctions de script standard, sans toucher aux fichiers du jeu ni à sa mémoire.
- **Aucune partie du jeu n'est publiée.** Le dépôt ne contient ni fichier source, ni corps de fonction, ni commentaire GIANTS,
  ni texte de `scriptBinding.xml`, ni ressource graphique ou sonore. Il ne contient que :
  - des noms, signatures, types et renvois `fichier:ligne`, c'est-à-dire des faits fonctionnels nécessaires
    pour écrire des mods compatibles, du même ordre que ce que publie la documentation officielle LUADOC du GDN ;
  - des textes rédigés pour l'atlas (descriptions ✍) et des outils originaux.
- Les données brutes d'extraction (`donnees/`) sont exclues du dépôt et des releases (`.gitignore`).

## Risque résiduel
GIANTS marque ses sources « Confidential ». Une lecture stricte pourrait considérer la liste des noms internes,
en particulier `stubs/*/releve/`, comme une information confidentielle. **Si GIANTS Software en fait la demande,
le contenu concerné sera retiré immédiatement.** Contact : ouvrir une issue sur ce dépôt.

## Marques
Farming Simulator, GIANTS et GIANTS Software sont des marques de GIANTS Software GmbH.
Projet non officiel, sans lien avec GIANTS Software GmbH et sans son approbation.

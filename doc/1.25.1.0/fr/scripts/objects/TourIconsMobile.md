# objects/TourIconsMobile.lua

*[English version](../../../scripts/objects/TourIconsMobile.md)*

Source: `dataS/scripts/objects/TourIconsMobile.lua` — FS25 1.25.1.0

✍ Visite guidée scriptée du tutoriel de style mobile, créée depuis un noeud de carte dont les enfants sont les triggers des étapes, chacun avec une icône. Elle affiche une icône à la fois avec un point d'intérêt sur la carte, attend des conditions scriptées sur les véhicules de visite de `g_currentMission.tourVehicles` (récolte, labour, semis, remorque, vente) et affiche des dialogues d'information localisés. L'update tourne dans la liste des updatables de la mission ; la visite se termine en publiant `GUIDED_TOUR_FINISHED` puis en se supprimant.

- **TourIconsMobile** (l.9)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `TourIconsMobile:onCreate(id: integer)` | 14 | ✍ Callback onCreate de l'i3d : crée l'objet de visite pour le noeud, l'ajoute aux updatables de la mission et le stocke dans `g_currentMission.tourIconsBase`. |
| `TourIconsMobile.new(id: integer) → table` | 24 | ✍ Constructeur : pour chaque enfant du noeud enregistre un trigger (callback `triggerCallback`, non défini dans ce fichier, NON VÉRIFIÉ) et masque son icône, puis initialise l'état de la visite et lit les valeurs maximales des cartes de densité de labour et de chaux. |
| `TourIconsMobile:delete()` | 65 | ✍ Retire l'objet des updatables de la mission, retire tous les triggers d'étape et supprime le noeud racine. |
| `TourIconsMobile:showTourDialog()` | 80 | ✍ Affiche un dialogue oui/non demandant s'il faut démarrer la visite, traité par `reactToDialog`. |
| `TourIconsMobile:reactToDialog(yes: boolean)` | 87 | ✍ Callback du dialogue : si oui, active la visite et la première icône et masque les icônes d'aide ordinaires ; si non, affiche un dialogue d'abandon et supprime l'objet de visite. |
| `TourIconsMobile:update(dt: number)` | 108 | ✍ Logique par frame : sur une nouvelle sauvegarde côté serveur, fait un fondu d'écran et autorise le dialogue de départ (la préparation des champs est commentée et émet un avertissement dev), retarde les messages en file tant qu'une interface est ouverte et, pour certains numéros d'étape, vérifie des conditions sur les véhicules de visite pour mettre en pause puis passer à l'icône suivante. |
| `TourIconsMobile:makeIconVisible(tourIconId: integer)` | 263 | ✍ Affiche l'icône donnée, crée ou déplace le point d'intérêt de la visite à sa position et ne le définit comme cible de carte que si l'icône est au-dessus du terrain. |
| `TourIconsMobile:activateNextIcon()` | 301 | ✍ Masque les icônes précédentes et vide leurs masques de trigger, affiche l'icône suivante ou termine la visite (retire le point d'intérêt, rétablit les icônes d'aide, publie `GUIDED_TOUR_FINISHED`, se supprime), coupe le régulateur de vitesse, affiche le texte d'instruction localisé de l'étape dans un dialogue ou le met en file, puis incrémente l'étape. |

## Messages

- publie `MessageType.GUIDED_TOUR_FINISHED` (l.328)

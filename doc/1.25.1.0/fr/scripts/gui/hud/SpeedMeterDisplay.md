# gui/hud/SpeedMeterDisplay.lua

*[English version](../../../../scripts/gui/hud/SpeedMeterDisplay.md)*

Source: `dataS/scripts/gui/hud/SpeedMeterDisplay.lua` — FS25 1.25.1.0

✍ Affichage HUD du compteur de vitesse du véhicule, basé sur HUDDisplay. Pour un véhicule motorisé il dessine la jauge de vitesse, la barre de carburant (ou charge électrique / méthane), la barre de dégâts, le sélecteur de rapports, les heures de travail, le régulateur et l'état IA/assistance à la conduite. Dessin côté client uniquement ; il lit les spécialisations du véhicule (motorized, sélection du mode IA, dégâts) et doit recevoir une mise à jour après setVehicle avant de dessiner.

- **SpeedMeterDisplay** hérite de `HUDDisplay` (l.29)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SpeedMeterDisplay.new()` | 33 | ✍ Crée l'affichage et ses overlays (fonds, jauge, heures de travail, régulateur, icônes IA et direction, carburant et réparation). Démarre sans véhicule et avec le drapeau de dessin sûr désactivé. |
| `SpeedMeterDisplay:storeScaledValues()` | 105 | ✍ Recalcule toutes les positions, tailles et décalages en pixels (jauge, barres, boîte de rapports, bloc IA, textes) pour l'échelle d'interface courante et applique les dimensions aux overlays. Rappelé lors d'un changement d'échelle. |
| `SpeedMeterDisplay:draw()` | 230 | ✍ Dessine tout le compteur pour le véhicule courant : fonds dimensionnés selon les barres actives, jauge, bloc de mode ou d'état IA, puis sections carburant, dégâts et rapports. Ne fait rien sans véhicule ou avant que le drapeau de dessin sûr soit levé. |
| `SpeedMeterDisplay:drawGearText(x: table, y: any)` | 604 | ✍ Dessine le sélecteur de rapports à trois emplacements en x, y via getGearInfoToDisplay du véhicule : rapports manuels avec voisins, ou R/N/D en automatique. Met en évidence le rapport courant, l'atténue pendant le changement et fait clignoter l'emplacement central en cas d'avertissement de point mort. |
| `SpeedMeterDisplay:setVehicle(vehicle: table)` | 706 | ✍ Définit le véhicule à afficher (conservé seulement s'il est motorisé), choisit l'icône de carburant pour la charge électrique ou le méthane, bascule la visibilité et efface le drapeau de dessin sûr pour attendre la prochaine mise à jour. |
| `SpeedMeterDisplay.getVehicleFuelLevelAndCapacity(vehicle: any)` | 734 | ✍ Cherche l'unité de remplissage consommant du diesel, puis de la charge électrique, puis du méthane, et renvoie niveau, capacité et type de carburant. À noter : sans unité correspondante l'indice est nil et il est transmis aux accesseurs d'unité de remplissage (comportement NON VÉRIFIÉ). |

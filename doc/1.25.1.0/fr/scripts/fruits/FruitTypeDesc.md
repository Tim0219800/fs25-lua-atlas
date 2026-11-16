# fruits/FruitTypeDesc.lua

*[English version](../../../scripts/fruits/FruitTypeDesc.md)*

Source: `dataS/scripts/fruits/FruitTypeDesc.lua` — FS25 1.25.1.0

✍ Classe de données décrivant un type de fruit (culture) : son type de remplissage, ses canaux de carte de densité, ses états de croissance ordonnés et les états spéciaux qui en découlent (prêt à récolter, fourrage, coupé, flétri, mulché, destruction, désherbage, repousse). Elle est créée et indexée par FruitTypeManager et remplie depuis un fichier XML de feuillage. Dans ce dump, le fichier ne contient que le constructeur et le chargeur XML ; les méthodes qu'il appelle (updatePlantSpacing, getGrowthStateByName, loadGrowth) n'y sont pas définies (origine NON VÉRIFIÉE).

- **FruitTypeDesc** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FruitTypeDesc.new(customMt: table?) → FruitTypeDesc` | 157 | ✍ Constructeur. Crée un type de fruit avec des valeurs par défaut : 4 canaux d'état, 1 canal de paille, tables d'états de croissance vides, aucun état spécial défini (états de récolte, fourrage, coupe, destruction et préparation à 0 ou -1) et pas de repousse. L'index est attribué plus tard par FruitTypeManager. |
| `FruitTypeDesc:loadFromFoliageXMLFile(xmlFilename: string) → boolean` | 225 | ✍ Charge un fichier XML de feuillage et remplit le type de fruit : nom (en majuscules, avec type de remplissage correspondant requis), couleurs de carte, canaux de densité, chaque indicateur de foliageState (récolte, fourrage, coupe, flétri, type de sol, désherbage, repousse, destruction, préparation, mulché, besoins en eau), réglages de récolte, croissance, sol, semis, andain et mulcheur, et transitions de récolte. Retourne false si le fichier, le nom ou le type de remplissage est manquant ou invalide. À noter : l'avertissement de nom invalide affiche self.name, encore nil à ce stade ; le test ultérieur de disasterDestructionState contre nil ne peut jamais être vrai car il vaut 0 par défaut. |

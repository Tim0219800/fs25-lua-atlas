# gui/AnimalScreen.lua

*[English version](../../../scripts/gui/AnimalScreen.md)*

Source: `dataS/scripts/gui/AnimalScreen.lua` — FS25 1.25.1.0

✍ Écran GUI plein écran côté client pour le marchand d'animaux, dérivé de ScreenElement. Il permet de passer de l'achat à la vente et enchaîne trois étapes de sélection (source, élevage cible, quantité). Il s'appuie sur un objet controller, le message center pour les changements d'argent et l'input binding pour ses événements d'action. L'essentiel du fichier est hors des entrées décrites.

- **AnimalScreen** hérite de `ScreenElement` (l.18)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AnimalScreen.new(custom_mt: table) → table` | 35 | ✍ Crée l'instance de l'écran, en mode achat avec la source sélectionnée, fermé, solde nul, sans animaux et sans état de sélection. Prépare aussi la table associant états du sélecteur de source et types d'animaux. |
| `AnimalScreen:delete()` | 133 | ✍ Supprime tous les éléments points clonés de la boîte de points source, supprime le modèle de point, puis appelle le delete du parent. |
| `AnimalScreen:onOpen()` | 146 | ✍ Passe l'état de jeu en boutique d'animaux, ouvre en mode achat et bascule en mode vente si la liste d'achat est vide. Si rien n'est vendable non plus, il ferme l'écran et affiche un dialogue d'information. Sinon il s'abonne à MONEY_CHANGED et enregistre les événements d'action. |
| `AnimalScreen:onClose(element: table)` | 195 | ✍ Réinitialise le controller, retire les événements d'action et le contexte d'entrée personnalisé, réinitialise l'état de jeu de la mission et affiche les variations d'argent en attente pour les achats et ventes d'animaux. Se désabonne des messages et marque l'écran comme fermé. |
| `AnimalScreen:setSelectionState(state: any, forceUpdate: any)` | 225 | ✍ Place l'écran sur l'étape source, cible ou quantité. Il saute les étapes inutilisables (aucun élevage, un seul élevage non défilant, boîte de quantité masquée), met à jour les cadres en surbrillance et reconstruit les liens de focus manette. Retourne false si l'étape cible est impossible. |
| `AnimalScreen:onClickBack()` | 721 | ✍ Gestionnaire du bouton retour. Ferme l'écran sur mobile ou si l'on est déjà à l'étape source ; sinon recule d'une étape en mode achat, ou de deux étapes en mode vente. |
| `AnimalScreen:onClickSelect()` | 737 | ✍ Gestionnaire du bouton de sélection. Avance d'une étape en mode achat ou de deux en mode vente, sauf si l'étape de quantité est déjà atteinte. Retourne toujours true. |
| `AnimalScreen:removeActionEvents()` | 886 | ✍ Retire tous les événements d'action d'entrée enregistrés par cet écran comme cible via g_inputBinding. |

## Messages

- s'abonne à `MessageType.MONEY_CHANGED` (l.165)

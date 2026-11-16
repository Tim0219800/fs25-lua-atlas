# ai/errors/AIMessageErrorBlockedByObject.lua

*[English version](../../../../scripts/ai/errors/AIMessageErrorBlockedByObject.md)*

Source: `dataS/scripts/ai/errors/AIMessageErrorBlockedByObject.lua` — FS25 1.25.1.0

✍ Message d'erreur IA pour un assistant bloqué par un objet sur son chemin. Étend `AIMessage` mais ne définit pas `getI18NText`, et `AIMessage.lua` non plus. À noter : appeler `getMessage` appellerait donc une méthode nil (bug apparent, sauf définition ailleurs ; NON VÉRIFIÉ).

- **AIMessageErrorBlockedByObject** hérite de `AIMessage` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIMessageErrorBlockedByObject.new(customMt: any)` | 16 | ✍ Constructeur du message d'erreur « bloqué par un objet ». Hérite de `AIMessage`, sans état ajouté. |

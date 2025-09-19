# 🤝 Guide de contribution

Merci de votre intérêt pour contribuer à **Corner Shop Story** ! Voici comment vous pouvez aider.

## 🎯 Façons de contribuer

### 🐛 Signaler des bugs
1. Vérifiez que le bug n'a pas déjà été signalé dans les [Issues](https://github.com/creach-t/corner-shop-story/issues)
2. Ouvrez une nouvelle issue avec :
   - Un titre clair
   - Les étapes pour reproduire
   - Le comportement attendu vs observé
   - Votre version de Godot et OS

### ✨ Proposer des features
1. Ouvrez une issue avec le tag `enhancement`
2. Décrivez clairement la fonctionnalité
3. Expliquez pourquoi elle serait utile
4. Proposez une implémentation si possible

### 💻 Contribuer du code

#### Setup
```bash
# Fork le repo sur GitHub
# Clone ton fork
git clone https://github.com/TON-USERNAME/corner-shop-story.git
cd corner-shop-story

# Ajoute le repo original comme remote
git remote add upstream https://github.com/creach-t/corner-shop-story.git
```

#### Workflow
1. **Crée une branche** pour ta feature
   ```bash
   git checkout -b feature/nom-de-ta-feature
   ```

2. **Code** avec style
   - Utilise GDScript style guide
   - Commente le code complexe
   - Garde les fonctions courtes et ciblées

3. **Teste** tes changements
   - Lance le jeu (F5)
   - Vérifie qu'il n'y a pas de régression
   - Teste les cas limites

4. **Commit** avec des messages clairs
   ```bash
   git commit -m "Add: nouvelle feature X"
   git commit -m "Fix: résolution du bug Y"
   git commit -m "Refactor: amélioration du code Z"
   ```

5. **Push** et crée une Pull Request
   ```bash
   git push origin feature/nom-de-ta-feature
   ```

### 🎨 Contribuer des assets

#### Art / Sprites
- Format : PNG avec transparence
- Résolution : Pixel art (multiples de 16px)
- Palette : Cohérente avec le style du jeu
- License : Compatible MIT

#### Audio
- Format : WAV ou OGG
- Qualité : 44.1kHz minimum
- License : Libre de droits

#### Polices
- Format : TTF ou OTF
- License : Open source ou libre utilisation

## 📝 Standards de code

### GDScript Style
```gdscript
# Classes en PascalCase
class_name CustomerManager

# Constantes en UPPER_SNAKE_CASE
const MAX_CUSTOMERS = 5

# Variables en snake_case
var customer_count: int = 0

# Fonctions en snake_case avec verbe
func add_customer(name: String) -> void:
    pass

# Types explicites quand c'est utile
var customers: Array[CustomerData] = []

# Commentaires clairs
## Description de la fonction (doc)
# Commentaire inline pour expliquer quelque chose de complexe
```

### Structure des fichiers
```
scripts/
├── autoload/          # Singletons/managers globaux
├── customer/          # Logique des clients
├── shop/             # Logique boutique
└── ui/               # Scripts UI

scenes/
├── main.tscn         # Scène principale
├── shop/             # Scènes de la boutique
└── ui/               # Composants UI réutilisables

assets/
├── sprites/          # Images
├── audio/            # Sons et musiques
└── fonts/           # Polices

data/
├── customers/        # JSON des clients
├── products/         # JSON des produits
└── dialogues/        # JSON des dialogues
```

## 🧪 Tests

Avant de soumettre une PR :

- [ ] Le jeu démarre sans erreur
- [ ] Aucune warning dans la console
- [ ] La feature fonctionne comme prévu
- [ ] Pas de régression sur les features existantes
- [ ] Le code suit les standards du projet

## 📋 Checklist PR

Avant de soumettre ta Pull Request :

- [ ] Les commits ont des messages clairs
- [ ] Le code est commenté si nécessaire
- [ ] Les nouveaux fichiers suivent la structure du projet
- [ ] La documentation est mise à jour si besoin
- [ ] Les assets ont les bonnes licenses

## 🌟 Idées de contribution

### Pour débutants
- Ajouter des dialogues pour les clients existants
- Créer de nouveaux produits (JSON + sprites)
- Améliorer l'UI (couleurs, polices)
- Corriger des typos dans la doc

### Niveau intermédiaire
- Ajouter des sons manquants
- Créer des animations de transition
- Implémenter des mini-jeux
- Ajouter des achievements

### Niveau avancé
- Système de sauvegarde cloud
- Multijoueur asynchrone
- Génération procédurale de dialogues
- Système de modding

## 🎨 Direction artistique

Le jeu vise un style :
- **Chaleureux et accueillant** (pas froid/dystopique)
- **Pixel art simple** (pas hyper détaillé)
- **Couleurs pastel** (palette douce)
- **UI minimaliste** (focus sur les personnages)

## 💬 Communication

- **Issues GitHub** : Pour bugs et features
- **Pull Requests** : Pour contributions code
- **Discussions** : Pour questions générales

## 📜 License

En contribuant, vous acceptez que votre contribution soit sous licence MIT.

## 🙏 Remerciements

Chaque contribution compte ! Que ce soit :
- Un simple rapport de bug
- Une correction de typo
- Une nouvelle feature majeure

Merci de rendre Corner Shop Story meilleur ! ❤️

---

**Des questions ?** Ouvrez une discussion ou une issue, on est là pour aider ! 😊
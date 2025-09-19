# 🏪 Corner Shop Story

> Un jeu 2D de simulation de vente orienté visual novel - Gérez votre petite boutique de quartier et découvrez les histoires de vos clients

## 📖 Concept

Dans **Corner Shop Story**, vous gérez une petite boutique de quartier. Chaque client est unique et possède sa propre histoire. Au fil des jours, tissez des liens avec vos habitués et découvrez leurs secrets, leurs joies et leurs peines.

## 🎮 MVP Features

### Core Gameplay
- **Système de vente simple** : Cliquez sur les produits et servez vos clients
- **Dialogues interactifs** : Choisissez vos réponses et influencez vos relations
- **Progression relationnelle** : Système d'affinité avec chaque client
- **Découverte narrative** : Débloquez de nouvelles conversations au fil du temps

### Contenu du MVP
- 🧑‍🤝‍🧑 **3 clients récurrents** avec personnalités uniques
- 🛒 **10 produits de base** à vendre
- 📅 **5 jours de jeu** pour tester le concept
- 💰 **Système d'argent** et de progression

## 🚀 Installation

### Prérequis
- [Godot 4.2+](https://godotengine.org/download)

### Lancement
1. Clonez le repository
   ```bash
   git clone https://github.com/creach-t/corner-shop-story.git
   cd corner-shop-story
   ```

2. Ouvrez le projet avec Godot
   - Lancez Godot
   - Cliquez sur "Import"
   - Sélectionnez le fichier `project.godot`

3. Appuyez sur F5 pour lancer le jeu

## 🎯 Roadmap MVP

- [x] Structure du projet
- [ ] Système de dialogue
- [ ] Interface boutique
- [ ] Système de vente
- [ ] 3 personnages avec dialogues
- [ ] Système d'affinité
- [ ] Progression sur 5 jours
- [ ] Sons et feedbacks

## 📁 Structure du Projet

```
corner-shop-story/
├── scenes/
│   ├── main.tscn              # Scène principale
│   ├── shop/                  # Scènes de la boutique
│   └── ui/                    # Interface utilisateur
├── scripts/
│   ├── autoload/             # Scripts globaux
│   ├── customer/             # Logique des clients
│   └── shop/                 # Logique de la boutique
├── assets/
│   ├── sprites/              # Images et sprites
│   ├── audio/                # Sons et musiques
│   └── fonts/                # Polices
└── data/
    ├── customers/            # Données des clients
    ├── products/             # Données des produits
    └── dialogues/            # Dialogues et conversations
```

## 🎨 Style Artistique

- **Pixel Art** simple et chaleureux
- **Palette de couleurs** douce et accueillante
- **UI minimaliste** pour mettre en avant les personnages

## 🛠️ Technologies

- **Engine** : Godot 4.2
- **Langage** : GDScript
- **Format de données** : JSON pour les dialogues et personnages

## 📝 License

MIT License - Voir le fichier LICENSE pour plus de détails

## 🤝 Contribution

Les contributions sont les bienvenues ! N'hésitez pas à ouvrir une issue ou une pull request.

---

**Fait avec ❤️ pour les amoureux des visual novels et des jeux cozy**
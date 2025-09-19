# 📅 Changelog

Toutes les modifications notables de ce projet seront documentées dans ce fichier.

Le format est basé sur [Keep a Changelog](https://keepachangelog.com/fr/1.0.0/),
et ce projet adhère au [Semantic Versioning](https://semver.org/lang/fr/).

## [Unreleased]

### Prévu
- Scène principale avec UI complète
- Système de vente fonctionnel
- Écran de fin de journée
- Sons de base
- Animations de transition

## [0.1.0] - 2025-09-19

### Ajouté
- 🎯 Structure initiale du projet Godot
- 📦 Configuration du projet avec autoload
- 🧑‍🤝‍🧑 Système de gestion des clients avec affinité
- 💬 Gestionnaire de dialogues avec choix multiples
- 💰 Système de jeu avec argent et progression
- 📊 Données des produits (10 produits de base)
- 📝 Dialogues hardcodés pour 3 clients (MVP)
- 🛒 Script de boutique principal
- 🎨 Scripts UI (DialogueBox, ProductButton)
- 📚 Documentation complète :
  - README.md avec présentation du projet
  - QUICK_START.md pour démarrage rapide
  - SCENE_SETUP.md pour configuration Godot
  - CONTRIBUTING.md pour les contributeurs
  - TODO.md pour tracker l'avancement
- 📜 Licence MIT
- 🔧 Fichiers de configuration (.gitignore)

### Structure du projet
```
corner-shop-story/
├── scripts/
│   ├── autoload/
│   │   ├── game_manager.gd       ✅
│   │   ├── customer_manager.gd   ✅
│   │   └── dialogue_manager.gd   ✅
│   ├── shop/
│   │   └── shop.gd               ✅
│   └── ui/
│       ├── dialogue_box.gd       ✅
│       └── product_button.gd     ✅
├── data/
│   └── products/
│       └── products.json         ✅
└── docs/
    ├── QUICK_START.md            ✅
    └── SCENE_SETUP.md            ✅
```

### Notes
- 🚧 MVP fonctionnel prêt pour la création de scènes
- 🎮 Le jeu nécessite la création manuelle des scènes dans Godot
- 📖 Documentation complète fournie pour faciliter le développement

---

## Comment lire ce changelog

### Types de changements
- **Ajouté** : Nouvelles fonctionnalités
- **Modifié** : Changements dans les fonctionnalités existantes
- **Déprécié** : Fonctionnalités qui seront retirées
- **Supprimé** : Fonctionnalités retirées
- **Corrigé** : Corrections de bugs
- **Sécurité** : Correctifs de vulnérabilités

### Versioning
- **MAJOR.MINOR.PATCH** (ex: 1.2.3)
- MAJOR : Changements incompatibles
- MINOR : Nouvelles fonctionnalités compatibles
- PATCH : Corrections de bugs compatibles
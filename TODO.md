# 📝 TODO List - Corner Shop Story MVP

## ✅ Terminé

- [x] Structure du projet
- [x] Configuration Godot
- [x] Scripts autoload (GameManager, CustomerManager, DialogueManager)
- [x] Script principal de la boutique
- [x] Scripts UI (DialogueBox, ProductButton)
- [x] Données des produits (JSON)
- [x] Données des dialogues (hardcodées pour MVP)
- [x] Documentation de setup

## 🔄 En cours

### Scènes Godot à créer

- [ ] Créer `scenes/main.tscn`
  - [ ] Node2D principal avec script shop.gd
  - [ ] CanvasLayer pour l'UI
  - [ ] DialogueBox avec Panel
  - [ ] ProductsContainer avec GridContainer
  - [ ] Labels pour argent et jour
  - [ ] Zone d'affichage des clients

### À implémenter

- [ ] **Système de vente**
  - [ ] Création dynamique des boutons produits
  - [ ] Connexion des signaux produit → boutique
  - [ ] Animation/feedback de vente

- [ ] **Amélioration UI**
  - [ ] Style de la DialogueBox
  - [ ] Affichage des cœurs d'affinité
  - [ ] Transition entre clients
  - [ ] Résumé de fin de journée

- [ ] **Polish et feedback**
  - [ ] Sons (à ajouter dans assets/audio/)
    - [ ] Son de caisse enregistreuse
    - [ ] Son de dialogue (bip court)
    - [ ] Musique d'ambiance douce
  - [ ] Particules de pièces lors des ventes
  - [ ] Animation d'entrée/sortie des clients

- [ ] **Gestion des données**
  - [ ] Test du système de sauvegarde
  - [ ] Vérification de la progression sur 5 jours
  - [ ] Écran de game over

## 🎯 Priorités pour rendre le MVP jouable

1. **CRITIQUE** - Créer la scène main.tscn avec l'UI de base
2. **CRITIQUE** - Implémenter le setup des boutons produits
3. **IMPORTANT** - Ajouter les transitions entre clients
4. **IMPORTANT** - Créer l'écran de fin de journée
5. **NICE TO HAVE** - Ajouter des sons basiques
6. **NICE TO HAVE** - Améliorer le style visuel

## 🐛 Bugs connus à résoudre

- [ ] Vérifier que les NodePaths fonctionnent correctement
- [ ] S'assurer que le système de sauvegarde ne plante pas
- [ ] Tester le système d'affinité avec valeurs négatives

## 🚀 Features post-MVP

### Version 0.2
- [ ] Ajouter des sprites vrais pour les clients
- [ ] Créer un vrai fond de boutique
- [ ] Système d'événements spéciaux
- [ ] Plus de dialogues par client (branches)

### Version 0.3
- [ ] Amélioration de la boutique (customisation)
- [ ] Nouveaux clients
- [ ] Système de quêtes
- [ ] Mini-jeux optionnels

### Version 1.0
- [ ] Histoire complète sur 30 jours
- [ ] 10+ clients uniques
- [ ] Multiple fins selon affinité
- [ ] Achievements/trophées

## 📊 Métriques de succès du MVP

- [ ] Le joueur peut compléter 5 jours
- [ ] Les dialogues s'affichent correctement
- [ ] L'affinité augmente/diminue selon les choix
- [ ] L'argent s'accumule
- [ ] Le jeu est stable (pas de crash)
- [ ] Le gameplay est satisfaisant (dopamine!)

## 💡 Idées en vrac

- Système de météo qui influence l'humeur des clients
- Produits en rupture de stock
- Promotions/soldes certains jours
- Radio dans la boutique (changement de musique)
- Photos des clients dans un album
- Journal intime du commerçant
- Système de réputation du quartier
- Clients qui se connaissent entre eux
- Événements aléatoires (livraison, contrôle sanitaire, etc.)

## 🔧 Optimisations techniques

- [ ] Charger les dialogues depuis JSON au lieu du hardcode
- [ ] Système de pool pour les boutons produits
- [ ] Précharger les assets au démarrage
- [ ] Compression des sauvegardes

## 📚 Documentation à créer

- [ ] Guide du joueur (comment jouer)
- [ ] Doc d'architecture technique
- [ ] Guide pour ajouter de nouveaux clients
- [ ] Guide pour ajouter de nouveaux produits
- [ ] Tutoriel de contribution

---

**Note** : Les éléments marqués 🔥 sont les plus importants pour le MVP fonctionnel.
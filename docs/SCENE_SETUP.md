# Guide de configuration des scènes Godot

Ce document explique comment créer les scènes nécessaires pour le MVP.

## 📋 Scènes à créer

### 1. Scène principale - `scenes/main.tscn`

**Structure de la scène :**
```
Main (Node2D) [attach: scripts/shop/shop.gd]
├── UI (CanvasLayer)
│   ├── DialogueBox (Panel) [attach: scripts/ui/dialogue_box.gd]
│   │   └── VBoxContainer
│   │       ├── DialogueText (RichTextLabel)
│   │       └── ChoicesContainer (VBoxContainer)
│   ├── CustomerSprite (Sprite2D)
│   ├── ProductsContainer (GridContainer)
│   ├── TopBar (HBoxContainer)
│   │   ├── DayLabel (Label)
│   │   └── MoneyLabel (Label)
│   └── AffinityIndicator (Label)
└── Shop (Node2D)
    └── Background (ColorRect)
```

### 2. Configuration de DialogueBox

**Panel Settings:**
- Anchor Preset: Center Bottom
- Size: 800x200
- Position: Centré en bas de l'écran

**DialogueText (RichTextLabel):**
- BBCode Enabled: true
- Fit Content: true
- Custom minimum size: 760x100

**ChoicesContainer (VBoxContainer):**
- Alignment: Center
- Separation: 10px

### 3. Configuration de ProductsContainer

**GridContainer:**
- Columns: 5
- H/V Separation: 10px
- Position: En bas à droite
- Size: 600x150

Les boutons de produits seront créés dynamiquement par le script.

### 4. Configuration de TopBar

**HBoxContainer:**
- Anchor Preset: Top Wide
- Size: Full width, 50px height

**DayLabel & MoneyLabel:**
- Theme Override Font Size: 20
- Horizontal Alignment: Left/Right

### 5. CustomerSprite

**Sprite2D:**
- Position: Centre haut de l'écran
- Scale: Selon vos assets
- Pour le MVP, utilisez un ColorRect coloré différemment selon le client

## 🎨 Assets temporaires pour le MVP

### Backgrounds
Créez un ColorRect avec une couleur agréable pour le fond de la boutique :
- Couleur suggérée: #F5E6D3 (beige chaleureux)

### Customer Sprites
Pour le MVP, utilisez des ColorRect de couleurs différentes :
- M. Dubois (old_man): #8B4513 (marron)
- Emma (student): #FF69B4 (rose)
- Mme Martin (mother): #4169E1 (bleu)

Taille suggérée: 100x150px

### DialogueBox Style
**Panel Theme Override:**
- Background: StyleBoxFlat
  - BG Color: #FFFFFF
  - Border Color: #333333
  - Border Width: 2px all sides
  - Corner Radius: 10px

## 🔧 Étapes de création

### Étape 1: Créer la scène principale
1. Dans Godot, créez une nouvelle scène
2. Racine: Node2D, nommez "Main"
3. Attachez le script `scripts/shop/shop.gd`
4. Sauvegardez comme `scenes/main.tscn`

### Étape 2: Créer l'UI
1. Ajoutez un CanvasLayer nommé "UI"
2. Créez tous les éléments UI listés ci-dessus
3. Attachez les scripts aux nœuds appropriés

### Étape 3: Configurer les NodePaths
Dans le script `shop.gd`, assurez-vous que les @onready variables pointent vers les bons nœuds.

### Étape 4: Tester
1. Appuyez sur F5
2. Le jeu devrait démarrer et afficher le premier client
3. Vous devriez pouvoir interagir avec les dialogues

## 🎯 Checklist de vérification

- [ ] La scène main.tscn existe et est définie comme scène principale
- [ ] Tous les scripts sont attachés aux bons nœuds
- [ ] Les NodePaths dans shop.gd correspondent aux nœuds de la scène
- [ ] Le fichier products.json se charge correctement
- [ ] Les dialogues s'affichent
- [ ] Les choix de dialogue fonctionnent
- [ ] L'argent s'incrémente lors des ventes
- [ ] Le passage d'un jour à l'autre fonctionne

## 🚀 Prochaines étapes

Une fois le MVP fonctionnel :
1. Ajouter de vrais sprites pour les clients
2. Créer un fond de boutique détaillé
3. Ajouter des sons (caisse, ambiance, etc.)
4. Ajouter des animations (clients qui entrent/sortent)
5. Créer des particules pour les ventes
6. Améliorer l'UI avec des thèmes custom

## 💡 Conseils

- Testez fréquemment en appuyant sur F5
- Utilisez le débogueur Godot pour voir les erreurs
- Commencez simple avec des rectangles colorés
- Ajoutez les détails visuels après que la logique fonctionne
- N'hésitez pas à ajuster les tailles et positions selon votre goût

## 🆘 Dépannage

**Erreur "Cannot access member 'dialogue_box' on a null instance"**
→ Vérifiez que le NodePath est correct dans @onready

**Les dialogues ne s'affichent pas**
→ Vérifiez que dialogue_box.visible est true et que le Panel n'est pas derrière d'autres éléments

**Les produits ne se chargent pas**
→ Vérifiez le chemin du fichier JSON et que la syntaxe est correcte

**Le jeu plante au démarrage**
→ Regardez la console de sortie pour les messages d'erreur

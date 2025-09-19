# 🚀 Guide de démarrage rapide

## Installation en 5 minutes

### 1. Prérequis
- [Téléchargez Godot 4.2+](https://godotengine.org/download)
- Clonez ce repository

### 2. Première ouverture

```bash
git clone https://github.com/creach-t/corner-shop-story.git
cd corner-shop-story
```

Lancez Godot, puis :
1. Cliquez sur **"Importer"**
2. Sélectionnez le fichier `project.godot`
3. Cliquez sur **"Importer et Éditer"**

### 3. Créer la scène principale

Le projet contient tous les scripts, mais vous devez créer la scène UI dans Godot :

#### Étape 1 : Créer le fichier de scène
1. Dans Godot, `Scène > Nouvelle scène`
2. Sélectionnez **Node2D** comme nœud racine
3. Renommez-le en **"Main"**
4. Sauvegardez la scène : `scenes/main.tscn`

#### Étape 2 : Attacher le script principal
1. Sélectionnez le nœud Main
2. Dans l'inspecteur, cliquez sur l'icône 📝 à côté de "Script"
3. Sélectionnez `scripts/shop/shop.gd`

#### Étape 3 : Créer l'interface de base

**Ajoutez un CanvasLayer pour l'UI :**
```
Main (Node2D)
└── UI (CanvasLayer) [AJOUTER CE NŒUD]
```

**Créez la DialogueBox :**
```
UI
└── DialogueBox (Panel)
    └── VBoxContainer
        ├── DialogueText (RichTextLabel)
        └── ChoicesContainer (VBoxContainer)
```

Configuration de DialogueBox :
- Attachez le script `scripts/ui/dialogue_box.gd`
- Layout > Anchors Preset : **Center Bottom**
- Rect > Size : `800 x 200`

Configuration de DialogueText :
- BBCode Enabled : ✅
- Fit Content : ✅
- Custom Minimum Size : `760 x 100`

**Ajoutez les labels d'information :**
```
UI
├── TopBar (HBoxContainer)
│   ├── DayLabel (Label)
│   └── MoneyLabel (Label)
└── AffinityIndicator (Label)
```

Configuration TopBar :
- Layout > Anchors Preset : **Top Wide**
- Rect > Size : `Full width x 50`

**Ajoutez le conteneur de produits :**
```
UI
└── ProductsContainer (GridContainer)
```

Configuration ProductsContainer :
- Columns : `5`
- Theme Overrides > Constants > H Separation : `10`
- Theme Overrides > Constants > V Separation : `10`

**Ajoutez le sprite du client :**
```
UI
└── CustomerSprite (ColorRect)
```

Configuration CustomerSprite :
- Size : `100 x 150`
- Position : Centre-haut de l'écran
- Color : Changer selon le client (géré par script)

**Ajoutez le fond :**
```
Main
└── Background (ColorRect)
```

Configuration Background :
- Layout > Anchors Preset : **Full Rect**
- Color : `#F5E6D3` (beige chaleureux)
- Z Index : `-1` (pour être derrière tout)

### 4. Vérifier les NodePaths

Dans le script `shop.gd`, vérifiez que les chemins correspondent :

```gdscript
@onready var dialogue_box = $UI/DialogueBox
@onready var customer_sprite = $UI/CustomerSprite
@onready var products_container = $UI/ProductsContainer
@onready var money_label = $UI/TopBar/MoneyLabel
@onready var day_label = $UI/TopBar/DayLabel
@onready var affinity_indicator = $UI/AffinityIndicator
```

### 5. Définir comme scène principale

1. `Projet > Paramètres du projet`
2. Onglet **"Général"**
3. Application > Run > Main Scene
4. Sélectionnez `scenes/main.tscn`

### 6. Lancer le jeu

**Appuyez sur F5** ou cliquez sur le bouton ▶️ Play

## 🎮 Comment jouer

1. **Dialogue** : Lisez ce que dit le client
2. **Choix** : Cliquez sur une réponse (augmente ou non l'affinité)
3. **Vente** : (À implémenter) Cliquez sur un produit pour le vendre
4. **Répétez** : Servez 3-5 clients par jour
5. **Progressez** : Jouez 5 jours pour voir toutes les histoires

## ⚡ Raccourcis utiles

- **F5** : Lancer le jeu
- **F6** : Lancer la scène actuelle
- **F8** : Pause/Reprise
- **Ctrl + S** : Sauvegarder la scène

## 🐛 Problèmes courants

### Le jeu ne démarre pas
→ Vérifiez que `scenes/main.tscn` est définie comme scène principale

### "Invalid get index 'dialogue_box'"
→ Les NodePaths ne correspondent pas. Vérifiez la structure de la scène

### Les dialogues ne s'affichent pas
→ DialogueBox est peut-être derrière d'autres éléments. Ajustez le Z-Index

### Erreur de chargement du JSON
→ Vérifiez que `data/products/products.json` existe

## 📖 Prochaines étapes

1. ✅ Créer l'UI de base (ce guide)
2. 🔧 Implémenter la génération des boutons produits
3. 🎨 Améliorer le style visuel
4. 🔊 Ajouter des sons
5. ✨ Ajouter des animations

## 💡 Conseils

- **Commencez simple** : Des rectangles colorés suffisent pour tester
- **Testez souvent** : F5 après chaque modification
- **Consultez la console** : Regardez les erreurs/warnings en bas
- **Utilisez le débogueur** : Très utile pour comprendre les problèmes

## 🆘 Besoin d'aide ?

1. Consultez le fichier `docs/SCENE_SETUP.md` pour plus de détails
2. Regardez la console de sortie pour les erreurs
3. Ouvrez une issue sur GitHub
4. Vérifiez le fichier `TODO.md` pour l'état d'avancement

---

**Bon développement ! 🎉**
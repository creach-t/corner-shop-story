extends Node2D

## Script principal de la boutique
## Gère le flux de jeu et l'interaction avec les clients

# Références UI
@onready var dialogue_box = $UI/DialogueBox
@onready var customer_sprite = $UI/CustomerSprite
@onready var products_container = $UI/ProductsContainer
@onready var money_label = $UI/MoneyLabel
@onready var day_label = $UI/DayLabel
@onready var affinity_indicator = $UI/AffinityIndicator

# État du jeu
var current_customer: CustomerManager.CustomerData = null
var current_customer_index: int = 0
var daily_customers: Array = []
var waiting_for_product: bool = false
var products: Array = []

func _ready() -> void:
	setup_ui()
	load_products()
	start_new_day()
	
	# Connexion des signaux
	GameManager.money_changed.connect(_on_money_changed)
	DialogueManager.dialogue_ended.connect(_on_dialogue_ended)

## Configuration de l'interface
func setup_ui() -> void:
	update_money_display()
	update_day_display()

## Charger les produits depuis le JSON
func load_products() -> void:
	var file = FileAccess.open("res://data/products/products.json", FileAccess.READ)
	if file:
		var json = JSON.new()
		var parse_result = json.parse(file.get_as_text())
		if parse_result == OK:
			products = json.data.products
			setup_product_buttons()
		file.close()

## Créer les boutons de produits
func setup_product_buttons() -> void:
	# Cette fonction sera implémentée avec l'UI
	# Pour le MVP, on peut avoir des boutons simples
	pass

## Démarrer une nouvelle journée
func start_new_day() -> void:
	daily_customers = CustomerManager.get_daily_customers()
	current_customer_index = 0
	
	if daily_customers.size() > 0:
		show_next_customer()
	else:
		end_day()

## Afficher le prochain client
func show_next_customer() -> void:
	if current_customer_index < daily_customers.size():
		current_customer = daily_customers[current_customer_index]
		CustomerManager.increment_visits(current_customer.id)
		
		# Afficher le client
		display_customer(current_customer)
		
		# Démarrer le dialogue
		var dialogue_type = DialogueManager.get_dialogue_type_for_customer(current_customer)
		var dialogue = DialogueManager.start_dialogue(current_customer.id, dialogue_type)
		
		if dialogue:
			show_dialogue(dialogue)
	else:
		end_day()

## Afficher un client
func display_customer(customer: CustomerManager.CustomerData) -> void:
	# Mettre à jour le sprite du client
	# Pour le MVP, on peut utiliser des couleurs différentes
	update_affinity_display(customer)

## Afficher un dialogue
func show_dialogue(dialogue: Dictionary) -> void:
	if dialogue_box:
		dialogue_box.show()
		dialogue_box.set_text(dialogue.get("text", ""))
		dialogue_box.set_choices(dialogue.get("choices", []))

## Quand un dialogue se termine
func _on_dialogue_ended() -> void:
	waiting_for_product = true
	# Demander au joueur de sélectionner un produit

## Vendre un produit
func sell_product(product_id: String) -> void:
	if not waiting_for_product:
		return
	
	# Trouver le produit
	for product in products:
		if product.id == product_id:
			# Ajouter l'argent
			GameManager.add_money(product.price)
			
			# Afficher un feedback
			show_sale_feedback(product)
			
			# Passer au client suivant
			waiting_for_product = false
			current_customer_index += 1
			
			# Petit délai avant le prochain client
			await get_tree().create_timer(1.0).timeout
			show_next_customer()
			break

## Afficher le feedback de vente
func show_sale_feedback(product: Dictionary) -> void:
	# Animation de vente réussie
	# Son de caisse
	# Particules d'argent
	print("Vendu : ", product.name, " pour ", product.price, "€")

## Terminer la journée
func end_day() -> void:
	# Afficher le résumé du jour
	var summary = GameManager.get_day_summary()
	show_day_summary(summary)
	
	# Sauvegarder
	GameManager.save_game_data()
	CustomerManager.save_customers_data()
	
	# Passer au jour suivant après un délai
	await get_tree().create_timer(3.0).timeout
	GameManager.next_day()
	
	if GameManager.current_day <= GameManager.total_days:
		start_new_day()
	else:
		show_game_over()

## Afficher le résumé du jour
func show_day_summary(summary: Dictionary) -> void:
	print("=== Fin du jour ", summary.day, " ===")
	print("Gains du jour : ", summary.earnings, "€")
	print("Clients servis : ", summary.customers_served)
	print("Argent total : ", summary.total_money, "€")

## Afficher le game over
func show_game_over() -> void:
	print("=== Fin du jeu ===")
	print("Vous avez terminé les 5 jours !")
	print("Argent total : ", GameManager.money, "€")

## Mettre à jour l'affichage de l'argent
func _on_money_changed(new_amount: float) -> void:
	update_money_display()

func update_money_display() -> void:
	if money_label:
		money_label.text = "Argent : %.2f€" % GameManager.money

## Mettre à jour l'affichage du jour
func update_day_display() -> void:
	if day_label:
		day_label.text = "Jour %d/%d" % [GameManager.current_day, GameManager.total_days]

## Mettre à jour l'affichage de l'affinité
func update_affinity_display(customer: CustomerManager.CustomerData) -> void:
	if affinity_indicator:
		affinity_indicator.text = "%s - %s" % [customer.name, CustomerManager.get_affinity_level(customer.id)]

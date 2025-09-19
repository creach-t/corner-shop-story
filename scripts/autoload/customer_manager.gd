extends Node

## Gestionnaire des clients
## Gère les clients, leur affinité, et leurs apparitions

# Signal
signal affinity_changed(customer_id, new_affinity)

# Structure de données pour un client
class CustomerData:
	var id: String
	var name: String
	var affinity: int = 0  # De 0 à 100
	var visits: int = 0
	var last_dialogue_index: int = 0
	var unlocked_dialogues: Array = []

# Dictionnaire des clients {id: CustomerData}
var customers: Dictionary = {}

# Liste des IDs de clients disponibles
var available_customer_ids: Array = ["old_man", "student", "mother"]

func _ready() -> void:
	load_customers_data()
	initialize_customers()

## Initialiser les clients
func initialize_customers() -> void:
	for customer_id in available_customer_ids:
		if not customers.has(customer_id):
			var customer = CustomerData.new()
			customer.id = customer_id
			customer.name = get_customer_name(customer_id)
			customers[customer_id] = customer

## Obtenir le nom d'un client
func get_customer_name(customer_id: String) -> String:
	var names = {
		"old_man": "M. Dubois",
		"student": "Emma",
		"mother": "Mme Martin"
	}
	return names.get(customer_id, "Client")

## Obtenir un client aléatoire pour la journée
func get_random_customer() -> CustomerData:
	var random_id = available_customer_ids[randi() % available_customer_ids.size()]
	return customers[random_id]

## Obtenir les clients du jour (3-5 clients)
func get_daily_customers() -> Array:
	var daily_customers = []
	var num_customers = randi() % 3 + 3  # Entre 3 et 5 clients
	
	for i in range(num_customers):
		var customer = get_random_customer()
		daily_customers.append(customer)
	
	return daily_customers

## Augmenter l'affinité avec un client
func increase_affinity(customer_id: String, amount: int = 10) -> void:
	if customers.has(customer_id):
		var customer = customers[customer_id]
		customer.affinity = min(100, customer.affinity + amount)
		emit_signal("affinity_changed", customer_id, customer.affinity)
		
		# Débloquer de nouveaux dialogues selon l'affinité
		check_dialogue_unlocks(customer)

## Diminuer l'affinité
func decrease_affinity(customer_id: String, amount: int = 5) -> void:
	if customers.has(customer_id):
		var customer = customers[customer_id]
		customer.affinity = max(0, customer.affinity - amount)
		emit_signal("affinity_changed", customer_id, customer.affinity)

## Incrémenter les visites
func increment_visits(customer_id: String) -> void:
	if customers.has(customer_id):
		customers[customer_id].visits += 1
		GameManager.game_data.customers_served += 1

## Vérifier les dialogues à débloquer
func check_dialogue_unlocks(customer: CustomerData) -> void:
	# Débloquer des dialogues selon le niveau d'affinité
	if customer.affinity >= 25 and not customer.unlocked_dialogues.has("level_1"):
		customer.unlocked_dialogues.append("level_1")
	if customer.affinity >= 50 and not customer.unlocked_dialogues.has("level_2"):
		customer.unlocked_dialogues.append("level_2")
	if customer.affinity >= 75 and not customer.unlocked_dialogues.has("level_3"):
		customer.unlocked_dialogues.append("level_3")

## Obtenir le niveau d'affinité (description)
func get_affinity_level(customer_id: String) -> String:
	if customers.has(customer_id):
		var affinity = customers[customer_id].affinity
		if affinity >= 75:
			return "Ami proche"
		elif affinity >= 50:
			return "Bon client"
		elif affinity >= 25:
			return "Client régulier"
		else:
			return "Nouveau client"
	return "Inconnu"

## Sauvegarder les données des clients
func save_customers_data() -> void:
	var save_data = {}
	for customer_id in customers:
		var customer = customers[customer_id]
		save_data[customer_id] = {
			"affinity": customer.affinity,
			"visits": customer.visits,
			"last_dialogue_index": customer.last_dialogue_index,
			"unlocked_dialogues": customer.unlocked_dialogues
		}
	
	var file = FileAccess.open("user://customers.json", FileAccess.WRITE)
	if file:
		file.store_string(JSON.stringify(save_data))
		file.close()

## Charger les données des clients
func load_customers_data() -> void:
	if FileAccess.file_exists("user://customers.json"):
		var file = FileAccess.open("user://customers.json", FileAccess.READ)
		if file:
			var json = JSON.new()
			var parse_result = json.parse(file.get_as_text())
			if parse_result == OK:
				var save_data = json.data
				for customer_id in save_data:
					if not customers.has(customer_id):
						customers[customer_id] = CustomerData.new()
						customers[customer_id].id = customer_id
						customers[customer_id].name = get_customer_name(customer_id)
					
					var data = save_data[customer_id]
					customers[customer_id].affinity = data.get("affinity", 0)
					customers[customer_id].visits = data.get("visits", 0)
					customers[customer_id].last_dialogue_index = data.get("last_dialogue_index", 0)
					customers[customer_id].unlocked_dialogues = data.get("unlocked_dialogues", [])
			file.close()

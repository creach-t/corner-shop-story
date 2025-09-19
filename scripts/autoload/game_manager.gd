extends Node

## Gestionnaire principal du jeu
## Gère l'état global, l'argent, le jour actuel, etc.

# Signaux
signal money_changed(new_amount)
signal day_changed(new_day)
signal game_over

# Variables d'état
var current_day: int = 1
var total_days: int = 5
var money: float = 0.0
var daily_earnings: float = 0.0

# Données de progression
var game_data: Dictionary = {
	"current_day": 1,
	"money": 0.0,
	"customers_served": 0,
	"total_sales": 0
}

func _ready() -> void:
	load_game_data()

## Ajoute de l'argent
func add_money(amount: float) -> void:
	money += amount
	daily_earnings += amount
	game_data.money = money
	game_data.total_sales += 1
	emit_signal("money_changed", money)
	
	# Son de caisse (à implémenter avec AudioStreamPlayer)
	play_cash_sound()

## Passe au jour suivant
func next_day() -> void:
	current_day += 1
	daily_earnings = 0.0
	game_data.current_day = current_day
	emit_signal("day_changed", current_day)
	
	if current_day > total_days:
		emit_signal("game_over")

## Obtenir le résumé du jour
func get_day_summary() -> Dictionary:
	return {
		"day": current_day,
		"earnings": daily_earnings,
		"customers_served": game_data.customers_served,
		"total_money": money
	}

## Sauvegarder les données
func save_game_data() -> void:
	var file = FileAccess.open("user://savegame.json", FileAccess.WRITE)
	if file:
		file.store_string(JSON.stringify(game_data))
		file.close()

## Charger les données
func load_game_data() -> void:
	if FileAccess.file_exists("user://savegame.json"):
		var file = FileAccess.open("user://savegame.json", FileAccess.READ)
		if file:
			var json = JSON.new()
			var parse_result = json.parse(file.get_as_text())
			if parse_result == OK:
				game_data = json.data
				current_day = game_data.get("current_day", 1)
				money = game_data.get("money", 0.0)
			file.close()

## Réinitialiser le jeu
func reset_game() -> void:
	current_day = 1
	money = 0.0
	daily_earnings = 0.0
	game_data = {
		"current_day": 1,
		"money": 0.0,
		"customers_served": 0,
		"total_sales": 0
	}
	save_game_data()

## Jouer le son de caisse
func play_cash_sound() -> void:
	# TODO: Implémenter avec AudioStreamPlayer
	pass

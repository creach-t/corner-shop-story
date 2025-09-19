extends Node

## Gestionnaire de dialogues
## Charge et gère les dialogues avec les clients

# Signaux
signal dialogue_started(customer_id)
signal dialogue_ended
signal choice_selected(choice_index)

# Dialogues chargés depuis JSON
var dialogues: Dictionary = {}
var current_dialogue: Dictionary = {}
var current_step: int = 0

func _ready() -> void:
	load_dialogues()

## Charger les dialogues depuis les fichiers JSON
func load_dialogues() -> void:
	# Pour le MVP, on utilise des dialogues hardcodés
	# Plus tard, on chargera depuis des fichiers JSON
	dialogues = {
		"old_man": {
			"greeting": [
				{
					"text": "Bonjour jeune ! Encore une belle journée n'est-ce pas ?",
					"choices": [
						{"text": "Bonjour M. Dubois ! Oui, magnifique !", "affinity": 10},
						{"text": "Bonjour. Que puis-je pour vous ?", "affinity": 5},
						{"text": "Il fait un peu froid...", "affinity": 0}
					]
				}
			],
			"level_1": [
				{
					"text": "Vous savez, cette boutique me rappelle celle de mon père...",
					"choices": [
						{"text": "Vraiment ? Racontez-moi !", "affinity": 15},
						{"text": "C'est intéressant.", "affinity": 5},
						{"text": "Je vois...", "affinity": 0}
					]
				},
				{
					"text": "Il tenait une épicerie juste au coin de la rue, il y a 50 ans.",
					"choices": [
						{"text": "Ça devait être merveilleux !", "affinity": 10},
						{"text": "Les temps ont changé.", "affinity": 5}
					]
				}
			],
			"level_2": [
				{
					"text": "J'aimerais vous montrer des photos de l'époque un jour...",
					"choices": [
						{"text": "Avec grand plaisir !", "affinity": 20},
						{"text": "Pourquoi pas.", "affinity": 5}
					]
				}
			]
		},
		"student": {
			"greeting": [
				{
					"text": "Salut ! Je suis pressée, j'ai un exam dans 30 minutes !",
					"choices": [
						{"text": "Pas de souci, je fais vite !", "affinity": 10},
						{"text": "Bon courage pour l'exam !", "affinity": 15},
						{"text": "Qu'est-ce que vous voulez ?", "affinity": 0}
					]
				}
			],
			"level_1": [
				{
					"text": "Ces exams me rendent dingue... Je dors 4h par nuit.",
					"choices": [
						{"text": "Courage, ça va payer !", "affinity": 15},
						{"text": "Prenez soin de vous quand même.", "affinity": 10},
						{"text": "C'est comme ça les études.", "affinity": 0}
					]
				}
			],
			"level_2": [
				{
					"text": "En vrai, je rêve de devenir architecte. Vous trouvez ça fou ?",
					"choices": [
						{"text": "Pas du tout ! Foncez !", "affinity": 20},
						{"text": "C'est un beau métier.", "affinity": 10},
						{"text": "C'est difficile comme voie.", "affinity": -5}
					]
				}
			]
		},
		"mother": {
			"greeting": [
				{
					"text": "Bonjour ! Les enfants réclament des bonbons encore...",
					"choices": [
						{"text": "Ah les enfants ! Combien en avez-vous ?", "affinity": 10},
						{"text": "Je comprends, voilà le rayon bonbons.", "affinity": 5},
						{"text": "Les bonbons, toujours les bonbons...", "affinity": 0}
					]
				}
			],
			"level_1": [
				{
					"text": "Trois enfants... Parfois c'est épuisant mais ils sont ma vie.",
					"choices": [
						{"text": "Vous êtes une super maman !", "affinity": 15},
						{"text": "Ça doit être intense.", "affinity": 5},
						{"text": "Je n'imagine même pas.", "affinity": 0}
					]
				}
			],
			"level_2": [
				{
					"text": "Mon aînée veut devenir docteur. Je suis si fière d'elle...",
					"choices": [
						{"text": "C'est merveilleux ! Elle a de qui tenir.", "affinity": 20},
						{"text": "Vous devez être fière.", "affinity": 10}
					]
				}
			]
		}
	}

## Démarrer un dialogue avec un client
func start_dialogue(customer_id: String, dialogue_type: String = "greeting") -> Dictionary:
	if dialogues.has(customer_id) and dialogues[customer_id].has(dialogue_type):
		current_dialogue = dialogues[customer_id][dialogue_type][0]
		current_step = 0
		emit_signal("dialogue_started", customer_id)
		return current_dialogue
	return {}

## Sélectionner un choix
func select_choice(customer_id: String, choice_index: int) -> void:
	if current_dialogue.has("choices") and choice_index < current_dialogue.choices.size():
		var choice = current_dialogue.choices[choice_index]
		var affinity_change = choice.get("affinity", 0)
		
		# Modifier l'affinité
		if affinity_change > 0:
			CustomerManager.increase_affinity(customer_id, affinity_change)
		elif affinity_change < 0:
			CustomerManager.decrease_affinity(customer_id, abs(affinity_change))
		
		emit_signal("choice_selected", choice_index)

## Obtenir le prochain dialogue
func get_next_dialogue(customer_id: String, dialogue_type: String) -> Dictionary:
	if dialogues.has(customer_id) and dialogues[customer_id].has(dialogue_type):
		var dialogue_array = dialogues[customer_id][dialogue_type]
		current_step += 1
		if current_step < dialogue_array.size():
			current_dialogue = dialogue_array[current_step]
			return current_dialogue
	return {}

## Obtenir le type de dialogue selon l'affinité
func get_dialogue_type_for_customer(customer: CustomerManager.CustomerData) -> String:
	# Retourner le type de dialogue approprié selon l'affinité
	if customer.affinity >= 75 and customer.unlocked_dialogues.has("level_3"):
		return "level_3"
	elif customer.affinity >= 50 and customer.unlocked_dialogues.has("level_2"):
		return "level_2"
	elif customer.affinity >= 25 and customer.unlocked_dialogues.has("level_1"):
		return "level_1"
	else:
		return "greeting"

## Terminer le dialogue
func end_dialogue() -> void:
	current_dialogue = {}
	current_step = 0
	emit_signal("dialogue_ended")

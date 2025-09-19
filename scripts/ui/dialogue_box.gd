extends Panel

## Boîte de dialogue pour afficher les conversations avec les clients

@onready var dialogue_text = $VBoxContainer/DialogueText
@onready var choices_container = $VBoxContainer/ChoicesContainer

var current_choices: Array = []
var customer_id: String = ""

## Afficher le texte du dialogue
func set_text(text: String) -> void:
	if dialogue_text:
		dialogue_text.text = text

## Afficher les choix de réponse
func set_choices(choices: Array) -> void:
	# Nettoyer les anciens boutons
	for child in choices_container.get_children():
		child.queue_free()
	
	current_choices = choices
	
	# Créer les nouveaux boutons de choix
	for i in range(choices.size()):
		var choice = choices[i]
		var button = Button.new()
		button.text = choice.text
		button.pressed.connect(_on_choice_selected.bind(i))
		choices_container.add_child(button)

## Définir le client actuel
func set_customer(id: String) -> void:
	customer_id = id

## Quand un choix est sélectionné
func _on_choice_selected(choice_index: int) -> void:
	if customer_id != "":
		DialogueManager.select_choice(customer_id, choice_index)
		
		# Vérifier s'il y a un dialogue suivant
		var dialogue_type = DialogueManager.get_dialogue_type_for_customer(
			CustomerManager.customers[customer_id]
		)
		var next_dialogue = DialogueManager.get_next_dialogue(customer_id, dialogue_type)
		
		if next_dialogue:
			set_text(next_dialogue.text)
			set_choices(next_dialogue.get("choices", []))
		else:
			# Fin du dialogue
			DialogueManager.end_dialogue()
			hide()

## Afficher la boîte
func show() -> void:
	visible = true

## Masquer la boîte
func hide() -> void:
	visible = false

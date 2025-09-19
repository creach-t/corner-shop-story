extends Button

## Bouton de produit dans la boutique

var product_data: Dictionary = {}

signal product_selected(product_id)

func setup(product: Dictionary) -> void:
	product_data = product
	text = "%s - %.2f€" % [product.name, product.price]
	
	# Style du bouton
	custom_minimum_size = Vector2(120, 40)

func _on_pressed() -> void:
	emit_signal("product_selected", product_data.id)

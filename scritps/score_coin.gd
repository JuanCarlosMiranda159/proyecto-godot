extends CanvasLayer

var coin_count = 0

func _ready():
	update_coin_count()

func update_coin_count():
	var label = $XboxContainer/Label
	if label:
		label.text = "Monedas: " + str(coin_count)
	else:
		print("Label node not found!")

func add_coin():
	coin_count += 1
	update_coin_count()

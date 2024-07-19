extends Node2D


func _ready():
	$AnimationPlayer.play("moneda")


func _on_area_2d_area_entered(area):
	if area.get_parent() is player:
		$AnimationPlayer.play("moneda")
		await get_tree().create_timer(0.5).timeout
		queue_free()
		

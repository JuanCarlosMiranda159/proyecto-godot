extends CharacterBody2D

const ENEMY= 120
const Gravedad = 98

func _ready():
	velocity.x = -ENEMY
	$AnimatedSprite2D.play("run")
	
func _physics_process(delta):
	velocity.y += Gravedad
	
	if is_on_wall():
		if !$AnimatedSprite2D.flip_h:
			velocity.x = ENEMY
		else:
			velocity.x = -ENEMY
	if velocity.x < 0:
		$AnimatedSprite2D.flip_h = false
	elif velocity.x > 0:
		$AnimatedSprite2D.flip_h = true
	
	
	
	move_and_slide()

func _on_hit_area_entered(area):
	pass

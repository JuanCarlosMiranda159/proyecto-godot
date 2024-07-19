extends CharacterBody2D


const BASE_SPEED = 500  # Velocidad base
const Gravedad = 98

var speed = BASE_SPEED  # Velocidad actual, inicializada con la velocidad base

func _ready():
	velocity.x = -speed
	$AnimatedSprite2D.play("run")

func _physics_process(delta):
	velocity.y += Gravedad
	
	if is_on_wall():
		if !$AnimatedSprite2D.flip_h:
			velocity.x = speed
		else:
			velocity.x = -speed
	
	if velocity.x < 0:
		$AnimatedSprite2D.flip_h = false
	elif velocity.x > 0:
		$AnimatedSprite2D.flip_h = true
	
	move_and_slide()



# Nueva función para ajustar la velocidad
func set_speed(new_speed):
	speed = new_speed
	if velocity.x < 0:
		velocity.x = -speed
	else:
		velocity.x = speed





func _on_area_2d_area_entered(area):
	pass # Replace with function body.

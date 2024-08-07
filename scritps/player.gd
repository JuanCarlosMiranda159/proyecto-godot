extends CharacterBody2D
class_name player

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	process_animations()

func process_animations():
	if velocity.x != 0:
		$AnimationPlayer.play("run")
		if velocity.x < 0:
			$Sprite2D.flip_h = true
		else:
			$Sprite2D.flip_h = false
	else:
		$AnimationPlayer.play("parado")
		





func _on_hit_body_entered(body):
	if body.name == "enemy":
		die()
	elif body.name == "enemy final":
		die()
func die():
	# Aquí puedes agregar la lógica para cuando el jugador muere, por ejemplo, reiniciar el nivel.
	print("El jugador ha muerto")
	# get_tree().reload_current_scene() # Descomenta esta línea para reiniciar la escena.
	get_tree().reload_current_scene() # Reinicia la escena actual




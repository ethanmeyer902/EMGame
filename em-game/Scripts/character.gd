extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(_delta: float) -> void:
	# Handle jump.
	# if Input.is_action_just_pressed("jump"): #JUMPING IS TEMPORARILY VOIDED
	# 	velocity.y = JUMP_VELOCITY

	# getting the direction the character is moving
	var direction_x := Input.get_axis("move_left", "move_right")
	var direction_y := Input.get_axis("move_up", "move_down")

	# movement
	if direction_x:
		velocity.x = direction_x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if direction_y:
		velocity.y = direction_y * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	# animation
	if direction_x != 0:
		$animated_sprite.play("move_side")
		$animated_sprite.flip_h = direction_x < 0
		
	elif direction_y > 0:
		$animated_sprite.play("move_down")
		$animated_sprite.flip_h = false
		
	elif direction_y < 0:
		$animated_sprite.play("move_up")
		$animated_sprite.flip_h = false
		
	else:
		$animated_sprite.play("idle")

	move_and_slide()

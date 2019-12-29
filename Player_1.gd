extends KinematicBody2D

const SPEED=500
const GRAVITY=10
const JUMP_POWER = -250
const FLOOR = Vector2(0, -1)

var velocity = Vector2()

var on_ground = false

# warning-ignore:unused_argument
func _physics_process(delta):
	
	if Input.is_action_pressed('right'):
        velocity.x = SPEED
	elif Input.is_action_pressed('left'):
		velocity.x = -SPEED
	else:
		velocity.x = 0
		
	if Input.is_action_just_pressed('up') and is_on_floor():	
        	velocity.y = JUMP_POWER
		
	velocity.y += GRAVITY
	
	if is_on_floor():
		on_ground = true
	else:
		on_ground = false
	
	velocity = move_and_slide(velocity, FLOOR)
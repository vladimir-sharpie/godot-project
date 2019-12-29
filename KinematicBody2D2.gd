extends KinematicBody2D

export (int) var speed = 200

var velocity = Vector2()

func get_input():
    velocity = Vector2()
    if Input.is_action_pressed('right2'):
        velocity.x += 1
    if Input.is_action_pressed('left2'):
        velocity.x -= 1
    if Input.is_action_pressed('down2'):
        velocity.y += 1
    if Input.is_action_pressed('up2'):
        velocity.y -= 1
    velocity = velocity.normalized() * speed

func _physics_process(delta):
    get_input()
    velocity = move_and_slide(velocity)
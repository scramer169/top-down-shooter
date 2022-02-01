extends KinematicBody2D

enum { MOVE, RELOAD }

onready var animationPlayer = $AnimationPlayer

var state = MOVE
var move_speed = 300

func _ready():
	pass 
		
func _physics_process(delta):
	match state:
		MOVE: move_state(delta)
		RELOAD: reload_state(delta)


func move_state(delta):
	
	var move_direction = Vector2.ZERO
	
	if Input.is_action_pressed("move_up"):
		move_direction.y -= 1
	if Input.is_action_pressed("move_down"):
		move_direction.y += 1
	if Input.is_action_pressed("move_left"):
		move_direction.x -= 1
	if Input.is_action_pressed("move_right"):
		move_direction.x += 1
	
	move_direction.normalized()
	
	move_and_slide(move_direction * move_speed)
	
	#animationPlayer.play("RESET")
	
	if Input.is_action_just_pressed("reload"):
		state = RELOAD
		return


func reload_state(delta):
	animationPlayer.play("reload")
	
func reload_end():
	state = MOVE
	

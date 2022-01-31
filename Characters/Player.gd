extends KinematicBody2D

enum { MOVE, RELOAD }

onready var animationPlayer = $AnimationPlayer

var state = MOVE

func _ready():
	pass 
		
func _physics_process(delta):
	match state:
		MOVE: move_state(delta)
		RELOAD: reload_state(delta)


func move_state(delta):
	animationPlayer.play("RESET")
	if Input.is_action_just_pressed("reload"):
		state = RELOAD
		return
	
func reload_state(delta):
	animationPlayer.play("reload")
	
func reload_end():
	state = MOVE

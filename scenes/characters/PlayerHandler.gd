extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var enable := false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _input(event):
	
	if not enable:
		return
	
	if Input.is_action_just_pressed("main_action"):
		
		print("Current location : ", get_parent().get_parent().position )
		
	
	

func control(delta) -> Vector2:
	
	var move_dir := Vector2()
	
	if Input.is_action_pressed("move_up"):
		move_dir += Vector2.UP
	
	if Input.is_action_pressed("move_down"):
		move_dir += Vector2.DOWN
	
	if Input.is_action_pressed("move_right"):
		move_dir += Vector2.RIGHT
	
	if Input.is_action_pressed("move_left"):
		move_dir += Vector2.LEFT
	
	return move_dir.normalized()

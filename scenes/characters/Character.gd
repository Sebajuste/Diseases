extends KinematicBody2D


export(String, "None", "AI", "Player") var handler := "None" setget set_handler

export var SPEED := 200

var velocity := Vector2()

func set_handler(value):
	handler = value
	$ControlHandlers.handler = handler

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var look_dir = velocity.normalized()
	
	if look_dir.length() > 0.0:
		var angle = Vector2.RIGHT.angle_to(look_dir)
		set_rotation(angle)
	
	#$Sprite.transform.
	
	
	pass

func _physics_process(delta):
	
	var move_dir = $ControlHandlers.get_current_handler().control(delta)
	
	velocity = move_dir * SPEED
	
	velocity = self.move_and_slide(velocity)
	
	

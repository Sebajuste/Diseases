extends Node


var navigation : Navigation2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func get_nav_path(start: Vector2, end: Vector2) -> PoolVector2Array:
	
	return navigation.get_simple_path(start, end)
	

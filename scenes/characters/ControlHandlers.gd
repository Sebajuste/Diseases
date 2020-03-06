extends Node


var handler: String = "None" setget set_handler

class HandlerNone:
	
	func control(delta) -> Vector2:
		return Vector2()

func set_handler(value):
	handler = value
	
	for child in get_children():
		child.enable = false
	
	match handler:
		"AI":
			$AIHandler.enable = true
		"Player":
			$PlayerHandler.enable = true

func get_current_handler():
	for child in get_children():
		if child.enable == true:
			return child
	return HandlerNone.new()

extends Node


const PATH_SENSIBILITY := 10.0


var enable := false

var moving := true

var target_position = Vector2()

var _nav_paths := PoolVector2Array()
var _next_move_pos = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func control(delta: float) -> Vector2:
	
	var current_pos: Vector2 = get_parent().get_parent().get_global_position()
	
	if target_position == null:
		return Vector2()
	
	# Update path if necessary
	if target_position != null and _nav_paths.empty():
		_nav_paths = NavigationManager.get_nav_path(current_pos, target_position)
		_nav_paths.append(target_position)
		print("get nav path: ", _nav_paths)
	
	# Update next position if necessary
	if _next_move_pos == null and not _nav_paths.empty():
		_next_move_pos = _nav_paths[0]
		_nav_paths.remove(0)
		print("Set new route location ", _next_move_pos, ", current pos : ", current_pos)
	
	if (target_position - current_pos).length() <= PATH_SENSIBILITY:
		target_position = null
		_next_move_pos = null
		print("Final location reached")
		return Vector2()
	
	# Move to next position
	if _next_move_pos != null:
		var move_dir = _next_move_pos - current_pos
		
		# print("move dir : ", move_dir.normalized() )
		
		# If next position is reached
		if (move_dir).length() <= PATH_SENSIBILITY:
			_next_move_pos = null
			print("Route location reached ", current_pos)
		
		return move_dir.normalized()
	
	return Vector2()


func _process_pass():
	
	
	pass


func _get_next_position() -> Vector2:
	
	var pos: Vector2 = get_parent().get_parent().get_global_position()
	
	if (pos - Vector2()).length() < 1:
		moving = false
	
	return Vector2()
	

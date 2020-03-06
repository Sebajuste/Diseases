extends Area2D



export var MONEY := 10
export var wait_time := 1.0


var bodies := []


# Called when the node enters the scene tree for the first time.
func _ready():
	
	$Timer.wait_time = wait_time
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	for body in bodies:
		if body.has_method("give_money"):
			body.give_money(MONEY)


func _on_WorkStation_body_entered(body):
	
	bodies.append(body)
	


func _on_WorkStation_body_exited(body):
	var index = bodies.find(body)
	if index != -1:
		bodies.remove(index)

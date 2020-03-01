extends Node2D

class_name Disease

export(float, 50, 500) var contagion_radius := 50.0
export var incubation_time := 0.0
export var incubation_contagion := false
export var symptomatic_time := 0.0
export var symptomatic_contagion := false

export var letality := 0.1

# Called when the node enters the scene tree for the first time.
func _ready():
	
	$Incubation.wait_time = incubation_time
	$Symptomatic.wait_time = symptomatic_time
	
	$Contagion/CollisionShape2D.shape.radius = contagion_radius
	
	print("Disease started")
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Contagion_area_entered(area):
	
	if get_parent() == area.get_parent():
		return
	
	var disease: Disease = DiseaseManager.create_disease( get_name() )
	
	if $Incubation.time_left > 0.0 and incubation_contagion:
		area.add_disease(disease)
	
	if $Symptomatic.time_left > 0.0 and symptomatic_contagion:
		area.add_disease(disease)
	
	pass # Replace with function body.


func _on_Incubation_timeout():
	
	$Symptomatic.start()
	
	pass # Replace with function body.


func _on_Symptomatic_timeout():
	
	print("Disease end")
	
	queue_free()
	

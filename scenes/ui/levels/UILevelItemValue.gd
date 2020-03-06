extends MarginContainer


export var label := "Label" setget set_label
export var value := 0 setget set_value

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func set_label(v):
	label = v
	$HBoxContainer/Label.text = v


func set_value(v):
	value = v
	$HBoxContainer/Value.text = str(v)

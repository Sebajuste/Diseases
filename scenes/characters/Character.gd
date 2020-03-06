extends KinematicBody2D

signal health_changed(new_value, old_value)
signal health_depleted()

signal money_changed(new_value, old_value)

export(String, "None", "AI", "Player") var handler := "None" setget set_handler

export var SPEED := 200
export var MAX_LIFE := 100
export var START_MONEY := 0
export var HUNGRY_DISCREASE := 2

var health := MAX_LIFE
var money := START_MONEY
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


func _physics_process(delta):
	var move_dir = $ControlHandlers.get_current_handler().control(delta)
	velocity = move_dir * SPEED
	velocity = self.move_and_slide(velocity)


func give_money(value):
	var old_money = money
	money += value
	emit_signal("money_changed", money, old_money)


func take_money(value):
	var old_money = money
	money -= value
	if money < 0:
		money = 0
	if old_money != money:
		emit_signal("money_changed", money, old_money)


func damage(value):
	health -= value
	if health <= 0:
		var old_health = health
		health = 0
		emit_signal("health_changed", health, old_health)
		dead()


func heal(value):
	var old_health = health
	health += value
	emit_signal("health_changed", health, old_health)


func dead():
	
	emit_signal("health_depleted")
	


func _on_HungerTimer_timeout():
	
	damage(HUNGRY_DISCREASE)
	

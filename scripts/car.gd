extends VehicleBody3D

const MAX_STEER = 0.8
const ENGINE_POWER = 300

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	steering = move_toward(steering, Input.get_axis("ui_right","ui_left") * MAX_STEER, delta * 2.5)
	engine_force = Input.get_axis("ui_up","ui_down") * ENGINE_POWER
	print(engine_force)
extends VehicleBody3D

const MAX_STEER = 0.8
const ENGINE_POWER = 200
var engine_accel = 0

@onready var pivot = $Pivot


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	steering = move_toward(steering, Input.get_axis("ui_right","ui_left") * MAX_STEER, delta)
	engine_force = Input.get_axis("ui_up","ui_down") * (ENGINE_POWER + engine_accel)
	pivot.global_position = pivot.global_position.lerp(global_position,delta * 20)
	
	if Input.is_action_pressed("ui_up"):
		engine_accel += 5
		if engine_accel == 300:
			engine_accel = 300
	else:
		engine_accel = 0
	
	if Input.is_action_pressed("ui_down"):
		$BackCamera3D.current = true
		$Pivot/FrontCamera3D.current = false
	else:
		$BackCamera3D.current = false
		$Pivot/FrontCamera3D.current = true

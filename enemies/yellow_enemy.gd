extends Enemy


func _ready() -> void:
	super()
	move_component.velocity.x = [-20.0, 20.0].pick_random()

class_name ShakeComponent
extends Node

@export var node: Node2D
@export var shake_amount: float = 2.0
@export var shake_duration: float = 0.4

# Store the current amount we are shaking the node (this value will decrease over time)
var shake: float = 0.0


func _physics_process(_delta: float) -> void:
	# Manipulate the position of the node by the shake amount every physics frame
	# Use randf_range to pick a random x and y value using the shake value
	node.position = Vector2(randf_range(-shake, shake), randf_range(-shake, shake))


# This is the function that activates this component
func tween_shake():
	# Set the shake to the shake amount (shake is the value used in the process function to
	# shake the node)
	shake = shake_amount

	var tween: Tween = create_tween()

	# Tween the shake value from current down to 0 over the shake duration
	tween.tween_property(self, "shake", 0.0, shake_duration).from_current()

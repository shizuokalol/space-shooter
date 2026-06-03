class_name PositionClampComponent
extends Node2D

@export var actor: Node2D
@export var margin: int = 8

var left_border: int = 0
var right_border: int = ProjectSettings.get_setting("display/window/size/viewport_width")


func _process(_delta: float) -> void:
	actor.global_position.x = clamp(
		actor.global_position.x,
		left_border + margin,
		right_border - margin,
	)

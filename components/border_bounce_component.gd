class_name BorderBounceComponent
extends Node

# The margin is used to allow actors to bounce before reaching the edge of the border
@export var margin: int = 8
@export var actor: Node2D
# We need to grab the move component of the actor in order to change its velocity when bouncing
@export var move_component: MoveComponent

var left_border: int = 0
var right_border: int = ProjectSettings.get_setting("display/window/size/viewport_width")


func _process(_delta: float) -> void:
	if actor.global_position.x < left_border + margin:
		# Prevent the actor for going past the border + the margin
		actor.global_position.x = left_border + margin
		move_component.velocity = move_component.velocity.bounce(Vector2.RIGHT)
	elif actor.global_position.x > right_border - margin:
		# Prevent the actor for going past the border + the margin
		actor.global_position.x = right_border - margin
		move_component.velocity = move_component.velocity.bounce(Vector2.LEFT)

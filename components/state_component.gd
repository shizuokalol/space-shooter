class_name StateComponent
extends Node

signal enabled()
signal disabled()
@warning_ignore("unused_signal")
signal state_finished()


func disable() -> void:
	disabled.emit()
	# We can set the process mode to disabled to disable the node and its children
	process_mode = Node.PROCESS_MODE_DISABLED


func enable() -> void:
	enabled.emit()
	# We can set the process mode to inherit to enable the node and its children
	# We use inheirt so this node will still pause if the game is paused or a parent is disabled
	process_mode = Node.PROCESS_MODE_INHERIT

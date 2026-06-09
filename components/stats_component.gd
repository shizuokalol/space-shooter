class_name StatsComponent
extends Node

signal health_changed()
signal no_health()

# Create the health variable and connect a setter
@export var health: int = 1:
	set(value):
		health = value

		health_changed.emit()

		if health == 0:
			no_health.emit()

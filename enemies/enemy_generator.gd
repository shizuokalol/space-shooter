extends Node2D

@export var green_enemy_scene: PackedScene = preload("uid://b5ircsi2hh42f")

var screen_width: int = ProjectSettings.get_setting("display/window/size/viewport_width")
var margin: int = 8

@onready var spawner_component: SpawnerComponent = $SpawnerComponent
@onready var green_enemy_spawn_timer: Timer = $GreenEnemySpawnTimer


func _ready() -> void:
	green_enemy_spawn_timer.timeout.connect(
		handle_spawn.bind(
			green_enemy_scene,
			green_enemy_spawn_timer,
		),
	)


func handle_spawn(enemy_scene: PackedScene, timer: Timer) -> void:
	spawner_component.scene = enemy_scene
	spawner_component.spawn(
		Vector2(
			randf_range(margin, screen_width - margin),
			-16.0,
		),
	)
	timer.start()

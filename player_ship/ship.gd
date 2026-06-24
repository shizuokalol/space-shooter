extends Node2D

@onready var left_muzzle: Marker2D = $LeftMuzzle
@onready var right_muzzle: Marker2D = $RightMuzzle
@onready var spawner_component: SpawnerComponent = $SpawnerComponent
@onready var fire_rate_rimer: Timer = $FireRateTimer
@onready var scale_component: ScaleComponent = $ScaleComponent
@onready var animated_sprite: AnimatedSprite2D = $Anchor/AnimatedSprite2D
@onready var flame_animated_sprite: AnimatedSprite2D = $Anchor/FlameAnimatedSprite
@onready var move_component: MoveComponent = $MoveComponent
@onready var audio_stream_player: VariablePitchAudioStreamPlayer = $VariablePitchAudioStreamPlayer


func _ready() -> void:
	fire_rate_rimer.timeout.connect(fire_lasers)


func _process(_delta: float) -> void:
	animate_ship()


func fire_lasers() -> void:
	audio_stream_player.play_with_variance()
	spawner_component.spawn(left_muzzle.global_position)
	spawner_component.spawn(right_muzzle.global_position)
	scale_component.tween_scale()


func animate_ship() -> void:
	if move_component.velocity.x < 0.0:
		animated_sprite.play("bank_left")
		flame_animated_sprite.play("bank_left")
	elif move_component.velocity.x > 0.0:
		animated_sprite.play("bank_right")
		flame_animated_sprite.play("bank_right")
	else:
		animated_sprite.play("center")
		flame_animated_sprite.play("center")

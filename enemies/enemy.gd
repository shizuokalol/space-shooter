extends Node2D

@onready var visible_on_screen_notifier: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D
@onready var stats_component: StatsComponent = $StatsComponent
@onready var move_component: MoveComponent = $MoveComponent
@onready var scale_component: ScaleComponent = $ScaleComponent
@onready var flash_component: FlashComponent = $FlashComponent
@onready var shake_component: ShakeComponent = $ShakeComponent


func _ready() -> void:
	visible_on_screen_notifier.screen_exited.connect(queue_free)

extends Node2D

@onready var visible_on_screen_notifier: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier
@onready var scale_component: ScaleComponent = $ScaleComponent
@onready var flash_component: FlashComponent = $FlashComponent


func _ready() -> void:
	visible_on_screen_notifier.screen_exited.connect(queue_free)
	scale_component.tween_scale()
	flash_component.flash()

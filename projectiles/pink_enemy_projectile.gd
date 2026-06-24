extends Node2D

@onready var hitbox_component: HitboxComponent = $Anchor/HitboxComponent
@onready var visible_on_screen_notifier: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D
@onready var scale_component: ScaleComponent = $ScaleComponent


func _ready() -> void:
	visible_on_screen_notifier.screen_exited.connect(queue_free)
	hitbox_component.hit_hurtbox.connect(queue_free.unbind(1))
	scale_component.tween_scale()

class_name HitboxComponent
extends Area2D

# Create a signal for when the hitbox hits a hurtbox
signal hit_hurtbox(hurtbox)

@export var damage: int = 1


func _ready():
	area_entered.connect(_on_hurtbox_entered)


func _on_hurtbox_entered(hurtbox: HurtboxComponent):
	# Make sure the area we are overlapping is a hurtbox
	if not hurtbox is HurtboxComponent:
		return
	if hurtbox.is_invincible:
		return
	hit_hurtbox.emit(hurtbox)
	hurtbox.hurt.emit(self)

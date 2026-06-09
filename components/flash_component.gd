class_name FlashComponent
extends Node

# The flash component uses a flash material. I chose to preload this into a constant
# But you could also export a material instead to allow the component to use a variety
# of different materials
const FLASH_MATERIAL: ShaderMaterial = preload("res://effects/white_flash_material.tres")

@export var sprite: CanvasItem
@export var flash_duration: float = 0.2

# We need to store the original sprite's material so we can reset it after the flash
var original_sprite_material: Material
var timer: Timer = Timer.new()


func _ready() -> void:
	# We have to add the timer as a child of this component in order to use it
	add_child(timer)
	original_sprite_material = sprite.material


func flash():
	sprite.material = FLASH_MATERIAL
	timer.start(flash_duration)
	await timer.timeout
	sprite.material = original_sprite_material

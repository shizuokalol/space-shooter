extends Parallax2D

@onready var space_layer: Parallax2D = $SpaceLayer
@onready var far_stars_layer: Parallax2D = $FarStarsLayer
@onready var close_stars_layer: Parallax2D = $CloseStarsLayer


func _process(delta: float) -> void:
	space_layer.scroll_offset.y += 2.0 * delta
	far_stars_layer.scroll_offset.y += 5.0 * delta
	close_stars_layer.scroll_offset.y += 20.0 * delta

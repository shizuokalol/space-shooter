extends Control

const SAVE_PATH = "user://save.cfg"
const TEST_SAVE_PATH = "res://save.cfg"

@export var game_stats: GameStats

@onready var score_value_label: Label = %ScoreValueLabel
@onready var highscore_value_label: Label = %HighscoreValueLabel


func _ready() -> void:
	load_highscore()

	if game_stats.score > game_stats.high_score:
		game_stats.high_score = game_stats.score
		save_highscore()

	score_value_label.text = str(game_stats.score)
	highscore_value_label.text = str(game_stats.high_score)


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		game_stats.score = 0
		get_tree().change_scene_to_file("res://menus/menu.tscn")


func save_highscore() -> void:
	var config: ConfigFile = ConfigFile.new()
	config.set_value("game", "highscore", game_stats.high_score)
	config.save(SAVE_PATH)


func load_highscore() -> void:
	var config: ConfigFile = ConfigFile.new()
	var error = config.load(SAVE_PATH)

	if error != OK:
		return

	game_stats.high_score = config.get_value("game", "highscore")

extends CanvasLayer


class_name UI

@onready var level_pass = $"../Music Pack/Level Pass"
@onready var game_over_sound = $"../Music Pack/Game Over"
@onready var lifes_label = %LifesLabel
@onready var game_lost_container = $GameLostContainer
@onready var level_won_container = $LevelWon
@onready var game_win = $"../Music Pack/Game Win"

func set_lifes(lifes: int):
	get_node("MarginContainer/HBoxContainer/LifesLabel").text = "Lifes: %d" % lifes
	
func game_over():
	game_over_sound.play()
	game_lost_container.show()

func _on_game_lost_button_pressed():
	get_tree().reload_current_scene()
	
func on_level_won():
	level_pass.play()
	level_won_container.show()


func _on_level_won_button_pressed():
	game_win.play()
	LevelDefinitions.current_level = 2
	get_tree().reload_current_scene()

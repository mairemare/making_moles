extends Control

func _ready() -> void:
	$AnimatedSprite2D.play("bubbles")

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/station_1.tscn")

func _on_creative_mode_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/creative_mode.tscn")
	
func _on_quit_pressed() -> void:
	get_tree().quit()

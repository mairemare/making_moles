extends Node2D




func _on_moles_to_grams_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/molestograms.tscn")
	
	
func _on_dissolve_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/dissolve.tscn")


func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")


func _on_dissolve_tut_pressed() -> void:
	$howtodissolve.visible = true
	$howtodissolve/back.visible = true


func _on_moles_to_grams_tut_pressed() -> void:
	$howconvert.visible = true
	$howconvert/backout.visible = true


func _on_back_pressed() -> void:
	$howtodissolve.visible = false
	$howtodissolve/back.visible = false
	
func _on_backout_pressed() -> void:
	$howconvert.visible = false
	$howconvert/backout.visible = false

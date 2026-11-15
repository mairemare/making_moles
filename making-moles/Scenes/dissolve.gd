extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Swirl.disabled = true
	$Shake.disabled = true
	if Global.grams == 0:
		$solid_beaker.icon = load("res://Assets/Beakers/empty beaker.png")
		$solid_beaker.disabled = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	$solid.text = str(Global.grams) + " grams"


func _on_solid_beaker_pressed() -> void:
	$volumetric_flask.texture = load("res://Assets/Volumetric Flask/solid_added.png")
	$solid_beaker.icon = load("res://Assets/Beakers/empty beaker.png")
	$solid_beaker.disabled = true
	$Swirl.disabled = false
	
func _on_water_beaker_pressed() -> void:
	$volumetric_flask.texture = load("res://Assets/Volumetric Flask/half_water.png")
	$water_beaker.icon = load("res://Assets/Beakers/half_fullbeaker.png")
	$water_beaker.disabled = true
	$solid_beaker.disabled = false
	
	if $Swirl.button_pressed == true:
		$volumetric_flask.texture = load("res://Assets/Volumetric Flask/full_water.png")
		$water_beaker.icon = load("res://Assets/Beakers/empty beaker.png")
		$water_beaker.disabled = true
		$Shake.disabled = false



func _on_swirl_pressed() -> void:
	$swirl_animation.visible = true
	$swirl_animation.play("swirl")
	$volumetric_flask.visible = false
	$volumetric_flask.texture = load("res://Assets/Volumetric Flask/after_swirl.png")
	if $swirl_animation.animation_finished:
		$swirl_animation.visible = false
		$water_beaker.disabled = false
		$volumetric_flask.visible = true
		$Swirl.disabled = true
		
func _on_shake_pressed() -> void:
	$volumetric_flask.visible = false
	$volumetric_flask.texture = load("res://Assets/Volumetric Flask/after_shake.png")
	$shake_animation.visible = true
	$shake_animation.play("shake")
	if $shake_animation.animation_finished:
		$shake_animation.visible = false
		$volumetric_flask.visible = true

extends Node2D

var water = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	#set up
	$water_beaker.disabled = false
	$solid_beaker.disabled = true
	$Swirl.disabled = true
	$Shake.disabled = true
	
	$steps.text = "Step 1: Pour water up to half the flask"
	
	#if theres no grams, no solute making
	if Global.grams == 0:
		$solid_beaker.icon = load("res://Assets/Beakers/empty beaker.png")
		$solid_beaker.disabled = true
		$water_beaker.disabled = true
		
		$steps.text = "Convert moles to grams first!"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	$solid.text = str(Global.grams) + " grams"

#step 2: put the amount of volume needed
func _on_water_beaker_pressed() -> void:
	
	if water == 0:
		#switch visuals
		$water_beaker.icon = load("res://Assets/Beakers/half_fullbeaker.png")
		$volumetric_flask.texture = load("res://Assets/Volumetric Flask/half_water.png")
		
		#next step
		$solid_beaker.disabled = false
		$water_beaker.disabled = true
		
		$steps.text = "Step 2: Add solid"
	
	if water == 1:
		#switch visuals
		$water_beaker.icon = load("res://Assets/Beakers/empty beaker.png")
		$volumetric_flask.texture = load("res://Assets/Volumetric Flask/full_water.png")
		
		#next step
		$Shake.disabled = false
		$water_beaker.disabled = true
		
		$steps.text = "Step 5: Shake the flask"

	
#step 3: put solid in
func _on_solid_beaker_pressed() -> void:
	#switch visuals
	$solid_beaker.icon = load("res://Assets/Beakers/empty beaker.png")
	$volumetric_flask.texture = load("res://Assets/Volumetric Flask/solid_added.png")
	
	$steps.text = "Step 3: Swirl the flask"
	
	#clear grams
	Global.grams = 0
	
	#next step
	$Swirl.disabled = false
	$solid_beaker.disabled = true

#step 4: swirl
func _on_swirl_pressed() -> void:
	#hide flask
	$volumetric_flask.visible = false
	
	#play animation
	$swirl_animation.visible = true
	$swirl_animation.play("swirl")
	
	#visuals
	$volumetric_flask.texture = load("res://Assets/Volumetric Flask/after_swirl.png")
	
	$Swirl.disabled = true
#after swirl
func _on_swirl_animation_animation_finished() -> void:
	$volumetric_flask.visible = true
	$swirl_animation.visible = false
	
	#next step
	$water_beaker.disabled = false
	
	$steps.text = "Step 4: Pour water up to calibration marker"
	
	#go back to step 2
	water = 1
	
	
#step 6: shake
func _on_shake_pressed() -> void:
	#hide flask
	$volumetric_flask.visible = false
	
	#play animation
	$shake_animation.visible = true
	$shake_animation.play("shake")
	
	#visuals
	$volumetric_flask.texture = load("res://Assets/Volumetric Flask/after_shake.png")
	
	$Shake.disabled = true
func _on_shake_animation_animation_finished() -> void:
	$volumetric_flask.visible = true
	$shake_animation.visible = false
	
	$steps.text = "Yay! You dissolved the solid"
	

func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/home.tscn")



func _on_reset_pressed() -> void:
	#set up
	$water_beaker.disabled = false
	$solid_beaker.disabled = true
	$Swirl.disabled = true
	$Shake.disabled = true
	
	$water_beaker.icon = load("res://Assets/Beakers/full_beaker.png")
	$volumetric_flask.texture = load("res://Assets/Volumetric Flask/empty_flask.png")
	
	$steps.text = "Step 1: Pour water up to half the flask"
	
	#if theres no grams, no solute making
	if Global.grams == 0:
		$solid_beaker.icon = load("res://Assets/Beakers/empty beaker.png")
		$solid_beaker.disabled = true
		$water_beaker.disabled = true
		
		$steps.text = "Convert moles to grams first!"
		
	water = 0

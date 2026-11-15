extends Node2D
@onready var moles: RichTextLabel = $moles
@onready var grams: RichTextLabel = $grams

var moles_added = 1
var answer = 0


# prevents buttons from adding or subtracting beyond 0 to 5 limit.
func _ready() -> void:
	$Subtract.disabled = true
	$Add.disabled = false
	$Record.disabled = true
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#says the amount of moles youre adding
	$moles.text = str(moles_added) + " moles"

	#controls buttons and beakers
	if moles_added >= 1 or moles_added <= 4 :
		
		# disbables false to add or subtract
		$Add.disabled = false
		$Subtract.disabled = false
		
		#change cursor to pointing
		$Add.mouse_default_cursor_shape = 2
		$Subtract.mouse_default_cursor_shape = 2
		
		# moles and stuff in beaker
		$gramsbeaker.texture = load("res://Assets/Beakers/lightbeaker.png")
		if moles_added == 1:
			$molesbeaker.texture = load("res://Assets/Moles/one_mole.png")
		if moles_added == 2:
			$molesbeaker.texture = load("res://Assets/Moles/two_moles.png")
		if moles_added == 3:
			$molesbeaker.texture = load("res://Assets/Moles/three_moles.png")
		if moles_added == 4:
			$molesbeaker.texture = load("res://Assets/Moles/four_moles.png")
	
	#disable add when it reaches max
	if moles_added == 5:
		$Add.disabled = true
		$Add.mouse_default_cursor_shape = 0
		$molesbeaker.texture = load("res://Assets/Moles/five_moles.png")
		$gramsbeaker.texture = load("res://Assets/Beakers/heavybeaker.png")
	
	#disable sub when it reaches min
	if moles_added == 0:
		$Subtract.disabled = true
		$Subtract.mouse_default_cursor_shape = 0
		$molesbeaker.texture = load("res://Assets/Beakers/empty beaker.png")
		$gramsbeaker.texture = load("res://Assets/Beakers/empty beaker.png")
	
	#equation for getting the answer (see option button script)
	answer = (Global.element) * (moles_added)
	$grams.text = str(answer) + " grams"
	
	
#adding and subtracting moles
func _on_add_pressed() -> void:
	moles_added += 1
		
func _on_subtract_pressed() -> void:
	moles_added -= 1
		
func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/home.tscn")

func _on_record_pressed() -> void:
	Global.grams = answer
	print(str(Global.grams))

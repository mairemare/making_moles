extends Node2D
@onready var moles: RichTextLabel = $moles
@onready var grams: RichTextLabel = $grams

var moles_added = 0
var answer = 0


# prevents buttons from adding or subtracting beyond 0 to 5 limit.
func _ready() -> void:
	$Subtract.disabled = true
	$Add.disabled = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#says the amount of moles youre adding
	$moles.text = str(moles_added) + " moles"

	#controls buttons and beakers
	if moles_added >= 1 or moles_added <= 4 :
		$Add.disabled = false
		$Subtract.disabled = false
		$gramsbeaker.texture = load("res://Assets/Beakers/lightbeaker.png")
		if moles_added == 1:
			$molesbeaker.texture = load("res://Assets/Moles/one_mole.png")
			
		if moles_added == 2:
			$molesbeaker.texture = load("res://Assets/Moles/two_moles.png")
		if moles_added == 3:
			$molesbeaker.texture = load("res://Assets/Moles/three_moles.png")
		if moles_added == 4:
			$molesbeaker.texture = load("res://Assets/Moles/four_moles.png")
	
	if moles_added == 5:
		$Add.disabled = true
		$molesbeaker.texture = load("res://Assets/Moles/five_moles.png")
		$gramsbeaker.texture = load("res://Assets/Beakers/heavybeaker.png")
		
	if moles_added == 0:
		$Subtract.disabled = true
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
		

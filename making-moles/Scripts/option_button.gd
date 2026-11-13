extends OptionButton
@onready var conversion: RichTextLabel = $"../conversion"

func _ready() -> void:
	select(0) #sets element selected as hydrogen on first load

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	# creates dictionary and assigns an id to an element
	Global.element = [Global.H, Global.C, Global.N, Global.O, Global.F, Global.Na, Global.Cl][get_selected_id() - 1]
	
	# says how much grams per mole of the element
	$"../conversion".text = str(Global.element) + " grams"
	

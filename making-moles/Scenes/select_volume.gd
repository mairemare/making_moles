extends OptionButton


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	select(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	Global.volume = [Global.onehunml, Global.fivehunml, Global.thouml][get_selected_id() - 1]

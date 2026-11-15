extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	$eyes.texture = load("res://Assets/rockey/open.png")
	await get_tree().create_timer(5).timeout
	$eyes.texture = load("res://Assets/rockey/closed.png")
	

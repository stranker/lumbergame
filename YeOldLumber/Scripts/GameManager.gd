extends Node

var wood_ui_pos : Vector2
var wood_count : int = 0
var gold_count : int = 0
var difficulty_level : int = 1
var game_camera : Camera
var middle_panel : Node = null

signal on_wood_change(wood_count)

func _ready():
	pass

func set_rect_on_screen(rect : Control, pos : Vector3):
	rect.rect_global_position = game_camera.unproject_position(pos) - Vector2(50,0)
	pass

func add_wood(val):
	wood_count += val
	emit_signal('on_wood_change', wood_count)
	pass
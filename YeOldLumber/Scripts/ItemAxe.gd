extends Node

export var item_name : String
export var item_price : int
export var item_info : String
export var item_damage : int
export var item_buyed : bool = false
export var item_equipped : bool = false
export var axe_texture_path : Texture
export var axe_model_path : Mesh
const item_type = GameManager.ITEM_TYPE.AXE

signal equipped(val)

func get_texture():
	return axe_texture_path

func get_model():
	return axe_model_path

func set_equiped(value):
	item_equipped = value
	emit_signal('equipped',item_equipped)

func get_info():
	var info = '[center]' + item_info + '. [color=#770985][b]DMG: ' + str(item_damage) + '[/b][/color][/center]'
	return info
extends Node

export var item_name : String
export var item_price : int
export var item_revenue : int
export var item_info : String
export var item_texture : Texture
export var item_buyed : bool
const item_type = GameManager.ITEM_TYPE.SELL


func get_texture():
	return item_texture
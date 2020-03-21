extends Node

export (Array, PackedScene) var axes_scene_list
export (Array, PackedScene) var sell_scene_list

var axe_list : Array
var sell_list : Array

var current_axe = null

signal item_buy(item)
signal equip_item(item)

func _ready():
	create_axes()
	#create_sell_items()
	pass

func create_axes():
	for axe_scene in axes_scene_list:
		var axe = axe_scene.instance()
		axe_list.append(axe)
	current_axe = axe_list[0]
	pass

func create_sell_items():
	for sell_scene in sell_scene_list:
		var sell_item = sell_scene.instance()
		sell_list.append(sell_item)
	pass

func on_buy_item(item):
	if GameManager.gold_count < item.item_price:
		return
	GameManager.gold_count -= item.item_price
	item.item_buyed = true
	emit_signal('item_buy', item)
	pass

func on_equip_item(item):
	current_axe.set_equiped(false)
	current_axe = item
	current_axe.set_equiped(true)
	emit_signal('equip_item', current_axe)
	pass
extends Node

var axes_list : Array
var sell_list : Array
enum ITEM_TYPE {AXE, SELL, LAST}

var current_axe : ItemAxe = null

signal item_buy(item)

class ItemAxe:
	signal equipped(val)
	var item_name : String
	var item_price : int
	var item_info : String
	var item_damage : int
	var item_texture : String
	var item_buyed : bool = false
	var item_equipped : bool = false
	const axe_texture_path : String = 'res://Assets/Sprites/Shop/'
	
	func init(i_n, i_p, i_i, i_d, i_t, i_b):
		item_name = str(i_n)
		item_price = int(i_p)
		item_info = str(i_i)
		item_damage = int(i_d)
		item_buyed = i_b
		item_texture = str(i_t)
	
	func get_texture():
		return axe_texture_path + item_texture
	
	func set_equiped(value):
		item_equipped = value
		emit_signal('equipped',item_equipped)

class ItemSell:
	var item_name : String
	var item_revenue : int
	var item_info : String
	var item_texture : String
	
	func init(i_n, i_r, i_i, i_t):
		item_name = str(i_n)
		item_revenue = int(i_r)
		item_info = str(i_i)
		item_texture = str(i_t)

func _ready():
	create_axes()
	pass

func create_axes():
	var small_axe = ItemAxe.new()
	var epic_axe = ItemAxe.new()
	var fish_axe = ItemAxe.new()
	small_axe.init("Small Axe", 0, "A simple small axe", 1,'small_axe.png', true)
	epic_axe.init("Epic Axe", 2000, "This axe was made by the ancient gods", 5, 'epic_axe.png', false)
	fish_axe.init("Fish Axe", 5000, "Just a fish", 10, 'fish_axe.png', false)
	axes_list.append(small_axe)
	axes_list.append(epic_axe)
	axes_list.append(fish_axe)
	small_axe.set_equiped(true)
	current_axe = small_axe
	pass

func buy_item(item_ref : ItemAxe):
	print('buy ' + item_ref.item_name)
	if GameManager.gold_count < item_ref.item_price:
		return
	GameManager.gold_count -= item_ref.item_price
	item_ref.item_buyed = true
	emit_signal('item_buy', item_ref)
	pass

func equip_item(item_ref : ItemAxe):
	print('equip ' + item_ref.item_name)
	current_axe.set_equiped(false)
	current_axe = item_ref
	current_axe.set_equiped(true)
	pass
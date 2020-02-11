extends Node

var wood_ui_pos : Vector2
var wood_count : int = 0
var gold_count : int = 0

signal update_currency

func sell_wooden():
	gold_count += wood_count
	wood_count = 0
	emit_signal('update_currency')
	pass
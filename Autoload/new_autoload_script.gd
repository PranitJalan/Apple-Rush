extends Node


signal _player_died
signal _tram

var apples := 0
var bananas := 0
var oranges := 0
var cherries := 0
var strawberries := 0
var current_pie := 0
var pies := 0
var spawn_position := Vector2(50, 60)
var collected: Array = []

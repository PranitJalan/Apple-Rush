extends Button
@onready var label: Label = $"../Label"

@export var cost := 0
@export var fruit := "banana"

func _process(delta: float) -> void:
	var total = cost*EVENT.current_pie
	label.text = "" + str(total) + "X"
	if total > EVENT[fruit]:
		disabled = true
	else:
		disabled = false





func _on_pressed() -> void:
	print("reached")
	var total = cost*EVENT.current_pie
	EVENT.pies += EVENT.current_pie
	EVENT[fruit] -= total
	print("baked " + fruit + str(total) + "into " + str(EVENT.pies))

extends Control

var dialogue = [
	"Hello, I take it as you've already found the first explorer.",
	"If you have not, I suggest you find him.",
	"There is only one way to escape this dungeon, you must find all of the past explorers.",
	"Only the three keys will allow you to escape this dangerous and forsaken place.",
	"We three explorers have died trying to find these keys to escape, but we have failed.",
	"It is up to you. Find my friends, collect the other two keys, and escape.",
	"Don't fail or your life will be meaningless.",
	"Beware of the great beast further ahead.",
	"Make our deaths count for something."
	]
	
var dialogue_index = 0	
var finished = false 

func _ready():
	load_dialogue()
	
func _process(delta):
		$next_indicator.visible = finished 
		if Input.is_action_just_pressed("ui_accept"):
			load_dialogue()
	
	
func load_dialogue():
	if dialogue_index < dialogue.size():
		finished = false
		$RichTextLabel.bbcode_text = dialogue[dialogue_index]
		$RichTextLabel.percent_visible = 0 
		$Tween.interpolate_property(
			$RichTextLabel, "percent_visible", 0, 1, 1,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
	else:
		queue_free()
	dialogue_index += 1 




func _on_Tween_tween_completed(object, key):
	finished = true 

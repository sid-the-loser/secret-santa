extends Control

@onready var to_label = $"TabContainer/Draw Names/ToLabel"
@onready var from_line_edit = $"TabContainer/Draw Names/FromLineEdit"
@onready var list_of_names = $"TabContainer/List of Names"

var from_names = []
var from_to_dict = {}

# TODO: work on making everything working in harmony with eachother!

func reset():
	to_label.set_text("")
	from_line_edit.set_text("")
	
	from_to_dict = {}
	


func _on_tutorial_button_button_down():
	OS.shell_open("https://youtu.be/dQw4w9WgXcQ")

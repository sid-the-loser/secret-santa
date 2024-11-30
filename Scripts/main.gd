extends Control

@onready var to_label = $"TabContainer/Draw Names/ToLabel"
@onready var from_line_edit = $"TabContainer/Draw Names/FromLineEdit"
@onready var list_of_names = $"TabContainer/List of Names"
@onready var reset_button_name = $"TabContainer/Draw Names/ResetButton".get_text()

var from_names = []
var from_to_dict = {}

# TODO: work on making everything working in harmony with eachother!

func clear_ouput():
	to_label.add_theme_color_override("font_color", Color.WHITE)
	to_label.set_text("")
	from_line_edit.set_text("")


func reset_and_regenerate():
	clear_ouput()
	
	from_to_dict = {}


func show_name():
	var _name = from_line_edit.get_text()
	
	if len(from_to_dict) == 0:
		to_label.add_theme_color_override("font_color", Color.RED)
		to_label.set_text("Generate the random draws by pressing: "+
			reset_button_name)
	elif len(_name) == 0:
		to_label.add_theme_color_override("font_color", Color.RED)
		to_label.set_text("Type something in the text-box above!")
	elif _name in from_to_dict:
		to_label.add_theme_color_override("font_color", Color.WHITE)
		to_label.set_text(from_to_dict[_name])
	else:
		to_label.add_theme_color_override("font_color", Color.RED)
		to_label.set_text("Please check if your name is in the list.")


func _on_tutorial_button_button_down():
	OS.shell_open("https://www.youtube.com/watch?v=dQw4w9WgXcQ")


func _on_support_button_button_down():
	OS.shell_open("https://ko-fi.com/sidtheloser")


func _on_reset_button_button_down():
	reset_and_regenerate()


func _on_clear_button_button_down():
	clear_ouput()


func _on_show_button_button_down():
	show_name()

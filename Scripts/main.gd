extends Control

@onready var to_label = $"TabContainer/Draw Names/ToLabel"
@onready var from_line_edit = $"TabContainer/Draw Names/FromLineEdit"
@onready var list_of_names = $"TabContainer/List of Names"
@onready var reset_button_name = $"TabContainer/Draw Names/ResetButton".get_text()

var from_names = []
var from_to_dict = {}


func proper_split(string):
	var split_string = string.split("\n")
	var resulting_list = []

	if len(split_string) > 0:
		for line in split_string:
			line = line.strip_edges()
			if len(line) > 0:
				resulting_list.append(line)

	return resulting_list

func clear_ouput():
	to_label.add_theme_color_override("font_color", Color.WHITE)
	to_label.set_text("")
	from_line_edit.set_text("")


func reset_and_regenerate():
	clear_ouput()
	
	from_to_dict = {}

	var names = proper_split(list_of_names.get_text())
	var len_names = len(names)
	var all_unique = true

	for _name in names:
		var _count = 0
		for _name2 in names:
			if _name == _name2:
				_count += 1
		
		if _count > 1:
			to_label.add_theme_color_override("font_color", Color.RED)
			to_label.set_text(_name + " was in the list more than once!"+
			"\nPlease make sure all the names in the list are unique!")
			all_unique = false
			break

	if not all_unique:
		pass

	elif len_names > 1:
		var random_assigning = []

		for i in range(len_names):
			var available_names = range(len_names) # a variable to keep track of available names

			for assigned in random_assigning: # removes if some numbers are already assigned in the random_assigning variable
				if assigned in available_names:
					available_names.remove_at(available_names.find(assigned))
			
			if i in available_names: # removes if the current name is in the available_names list variable
				available_names.remove_at(available_names.find(i))

			var _temp = randi_range(0, len(available_names)-1)
			print(len(available_names)-1)
			
			print(_temp)
			
			random_assigning.append(available_names[_temp])

			from_to_dict[names[i]] = names[random_assigning[-1]]


		to_label.add_theme_color_override("font_color", Color.GREEN)
		to_label.set_text(str(len_names) + 
		" names detected!\nNew name draws generated!")

	else:
		to_label.add_theme_color_override("font_color", Color.RED)
		to_label.set_text("Add some names to the list!" + 
		("\nYou aren't gifting yourself are you? :(" if len_names == 1 else ""))


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

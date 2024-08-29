class_name Module
extends Node

@export_multiline var description: String
@export var special_command: bool = false

var commands: Dictionary: # switch to using a dictionary { string : module }
	get:
		var cmds = {}
		for child in get_children():
			if child is Command:
				cmds[child.name] = child as Command
		return cmds

func command(cmd: String):
	if cmd == name:
		Console.print_line(description)
	else:
		var new_cmd = cmd.erase(0, name.length() + 1)
		if commands.has(new_cmd):
			commands[new_cmd].call_command()
		else:
			Console.print_error("invalid command", new_cmd)

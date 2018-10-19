import sys
import os

RED = "\033[31m"
YELLOW = "\033[33m"
RESET = "\033[0m"
FOLDER = "/Users/awajsbro/cm_shell/scripts/data_to_do"
FILE = "{}/task.txt".format(FOLDER)

HELP = """{} --add ["NEW TASK"] --remove [n° of task]{}""".format(YELLOW, RESET)

add = []
rm = []

print("\n{}\n{}\n{}".format(43 * "-", HELP, 43 * "="))
try :
	os.mkdir(FOLDER)
except FileExistsError :
	pass
try :
	file = open(FILE, "r")
	i = 0
	task = []
	for line in file :
		task.append(line)
		print("{} : {}".format(i, line), end="")
		i += 1
	if i == 0 :
		print("{}\tYou have nothing to do yet{}".format(RED, RESET))
	print("{}\n".format(43 * "-"))
except FileNotFoundError :
	pass
i = 0
for arg in sys.argv :
	if arg == "--add" :
		i = 1
	elif arg == "--remove" :
		i = -1
	elif i == 1 :
		add.append(arg + "\n")
	elif i == -1 :
		rm.append(arg)
rm = sorted(rm)
rm.reverse()
for index in rm :
	try :
		index = int(index)
		del task[index]
	except (IndexError, ValueError) :
		pass
try :
	add = task + add
except NameError :
	print("{}\tYou have nothing to do yet{}\n{}\n".format(RED, RESET, 43 * "-"))
if i != 0 :
	file = open(FILE, "w")
	file.write("".join(add))

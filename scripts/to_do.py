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

# creation du dossier si existe pas
try :
	os.mkdir(FOLDER)
except FileExistsError :
	pass

# ouverture du fichier
try :
	file = open(FILE, "r")
	task = []
	for line in file :
		task.append(line)
	file.close()
except FileNotFoundError :
	task = []

# prepartion des ajout et suppresion
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

# suppression des taches puis ajout des taches
for index in rm :
	try :
		index = int(index)
		del task[index]
	except (IndexError, ValueError) :
		pass
task = task + add

# reecriture du fichier si modification
if i != 0 :
	file = open(FILE, "w")
	file.write("".join(task))

# print des taches
i = 0
for line in task :
	print("{} : {}".format(i, line), end="")
	i += 1
if i == 0 :
	print("{}\tYou have nothing to do yet{}".format(RED, RESET))
print("{}\n".format(43 * "-"))

#!/bin/bash

path1=$(pwd)
path2="/sgoinfre/goinfre/Perso/awajsbro/project"
lib=$(test -d libft ; echo $?)

if [ "$path1" = "$path2" ]; then
	echo -e "\033[31;4;1m\n		serieux_t'en_a_pas_marre_de_suprimer_ta_lib_???\n\033[0m"
elif [ "$lib" = "1" ]; then
{
	echo -e "il n'y a pas de lib a mettre a jour, creer un dossier libft ? \033[31my/n\033[0m"
	read -rsn1 var
	if [ "$var" = "y" ] || [ "$var" = "Y" ]; then
		mkdir libft
		cp -R /Users/awajsbro/project/libft/* libft/
		rm libft/auteur
		echo -e "\n	\033[32mlibft creer\033[0m\n"
	elif [ "$var" = "N" ] || [ "$var" = "n" ]; then
		echo "bon bah fait moi signe lorsque tu sauras ce que tu veux"
	else
		clear
		echo -e "\033[1mt'es con ou tu sais pas lire...\nj'me casse pour la peine \n\n(ノಠ益ಠ)ノ︵ ┻━┻\n..........( ಠ益ಠ) \n ┬─┬ノ(° _ °ノ)...\n...( ° _ °) \033[0m"
	fi
}
else
	rm -rf libft/*
	cp -R /Users/awajsbro/project/libft/* libft/
	rm libft/auteur
	echo -e "\n	\033[32mlibft mise a jour\033[0m\n"
fi

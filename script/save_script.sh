#! /bin/bash

POS=$pwd
cd $1

FILE=$(find . -name '*'  ! -name '.*') 
REP=$(echo ${PWD##*/})
DATE=$(date)

## save locale home/sgoinfre ##
mkdir /tmp/save_$REP
if [ $(cp -r $FILE /tmp/save_$REP ; echo $?) = "0" ]; then
	if [ $(pwd | grep -q sgoinfre ; echo $?) = "0" ]; then
		rm -rf /User/awajsbro/save_$REP
		if [ $(cp -r /tmp/save_$REP /User/awajsbro/ ; echo $?) = "0" ]; then
			echo -e "\033[32m\n		save done\n\033[0m"
			rm -rf /tmp/save_$REP
		else
			echo -e "\033[31m\n		cp est casse\nrien n'a etait copier dans home\n\033[0m"
		fi
	else
		rm -rf /sgoinfre/goinfre/Perso/awajsbro/save_$REP
		if [ $(cp -r /tmp/save_$REP /sgoinfre/goinfre/Perso/awajsbro/ ; echo $?) = "0" ]; then
			echo -e "\033[32m\n		save done\n\033[0m"
			rm -rf /tmp/save_$REP
		else
			echo -e "\033[31m\n		cp est casse\n	rien n'a etait copier dans sgoinfre\n\033[0m"
		fi
	fi
else
	echo -e "\033[31m\n		cp est casse\n	rien n'a etait copier dans tmp\n\033[0m"
fi

## save git si exist ##
if [ $(test -d .git ; echo $?) = "0" ]; then
	git add *
	git status
	echo -e "\n tu veux push ca ?? \033[31my/n\033[0m"
	read -rsn1 GITABLE
	if [ "$GITABLE" = "y" ] || [ "$GITABLE" = "Y" ]; then
		git commit -m "git automatique $REP $DATE"
		git push
	else
		git reset
	fi
fi
cd $POS


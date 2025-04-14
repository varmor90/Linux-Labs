#!/bin/bash


echo " MODULE 6: SHELL SCRYPTING LAB"


echo ""
echo "[1] What shell am i using?"
echo "shell in use $SHELL"
echo "Current shell (via ps):"
ps -p $$


echo ""
echo"[2] What kernel is this system running?"
uname -r
uname -a


echo ""
echo "[3] Simple echo script with variables:"
NAME = "Dawid"
echo "Hello, $NAME! Today is $(date +%A), welcome to scripting LAB"

echo ""
echo "[4] if then condition:"
read -p "Enter a number:" NUM 
if [ "$NUM" -gt 10 ]; then
	echo "That's a big number!"
else 
	echo "Thats a small number!"
fi

echo ""
echo "[6] While loop example:"
COUNTER=1
while [ $COUNTER -le 3 ]; do
	echo "While loop interation: $COUNTER"
	((COUNTER++))
done


echo ""
echo "[7] until loop example"
COUNT=5
until [ $COUNT -eq 0 ]; do
	echo "Countdown: $COUNT"
	((COUNT--))
done


echo ""
echo "[8] Case statement:"
read -p "chose [start|stop|restart]: " OPTION
case $OPTION in
	start)
		echo "starting the service";;
	stop)
		echo "stopping the service";;
	restart)
		echo "restarting the service";;
	*)
		echo "Unknown option";;
esac

echo ""
echo "[9] Aliases"
alias ll='ls-l'
echo "Alias 'll' created for 'ls -l'. Try on the terminal"

echo""
echo [10] Shell history:
echo "last 5 commands"
history | tail -n 5

echo""
echo "LAB06 DONE"



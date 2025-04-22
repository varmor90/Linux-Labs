#!/bin/bash


echo "MODULE 9 : 04- fix 'cd' premission problems"

DIR="$HOME/locked_dir"

echo ""

echo "[1] Creating test director with restricted premissions"
mkdir -p "$DIR"
chmod 600 "$DIR"


echo "Trying to cd into $DIR"

cd "$DIR" 2>/dev/null

if [ $? -ne 0 ]; then
	echo "cd Failed - premission denied (no execute bit)"
else 
	echo "cd successful (unexpected)"
fi


echo ""
echo "[2] Listing premissions"
ls -ld "$DIR"

echo "" 
echo "[3] Fixing it by adding execute (x) premission for user"
chmod u+x "$DIR"
ls -ld "$DIR"

echo ""
echo "[4] retesting cd into $DIR"
cd "$DIR" && echo "cd successful "

echo ""
echo "[5] Cleanup"
cd ~
rm -r "$DIR"

echo ""
echo "DONE"





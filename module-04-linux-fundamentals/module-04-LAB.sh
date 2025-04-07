#!/bin/bash


echo "Module 4 Linux Foundamentals LAB"

LAB_DIR="./lab4-test"
mkdir -p "$LAB_DIR"
cd "$LAB_DIR" || exit



#[1] Creating test files 
echo "first line on file A" > fileA.txt
echo "second line" >> fileA.txt
echo "another file content" > fileB.txt

#[2]changing premision to read-only
chmod 444 fileA.txt
ls -l

#[3] restoring write permission
chmod u+w fileA.txt
ls -l

#[4] changing ownership 
sudo chown $USER fileB.txt
sudo chgrp $USER fileB.txt


#[5] help for grep + pipe example
man grep | head -n 5

#[6] using grep
grep "line" fileA.txt

#[7]cut first 4 char 
cut -c1-5 fileA.txt

#[8] creating archive and compressing 
tar czf archive.tar.gz fileA.txt fileB.txt
ls -lh archive.tar.gz


#[9] comparing files 
diff fileA.txt fileB.txt
cmp fileA.txt fileB.txt || echo "files differ(cmp)"


echo "LAB DONE"





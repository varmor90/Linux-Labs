#!/bin/bash

echo "Module 3 : Filesystem LAB"

#enviroment set up

echo "[1] Creating test folder"
mkdir -p ./lab3-test
cd ./lab3-test || exit


#Creating files and folders
echo "[2] Creating files and folders"
touch file1.txt file2.txt
mkdir dirA dirB

#Write content into files
echo "[3] Adding content"
echo "This is file1" > file1.txt
echo "This is file2" > file2.txt

# Display directory content"
echo "[4] Listing directory contents:"
ls -la

#Wildcards
echo "[5] Using wildcards to list files"
ls *.txt

#Show content and cut
echo "[6] Display file1.txt"
cat file1.txt

echo "[7] cut first 4 characters"
cut -c1-4 file1.txt


#Soft and Hard link
echo "[8] Creating links"
ln file1.txt hardlink_file1
ln -s file1.txt softlink_file1


#Display inodes
echo "[9] Listing inodes"
ls -li


#Test file searching

echo "[10] searching for .txt using find"
find . -name "*txt"

echo "[11] Using locate (may require sudo, and updatedp)"
sudo updatedb
locate file1.txt | head -n 5

echo "[12] Absolute and relative paths"
echo "Absolute path: $(readlink -f file1.txt)"
echo "Relative path: ./file1/txt"


echo " LAB COMPLETE"


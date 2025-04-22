#!/bin/bash


echo "MODULE 9: 01 UMASK defaul file premissions"

echo ""
echo "[1] Current umask value"
umask

echo ""
echo "[2] current user: $USER"
echo "Home directory : $HOME"

echo ""
echo "[3] Create a test file and directory with default umask"
TEST_DIR="$HOME/umask_test"
mkdir -p $TEST_DIR
cd $TEST_DIR
touch file_default.txt
mkdir dir_default

echo ""
echo "Premissions after creation"
ls -l

echo ""
echo "[4] Temporarily change umask to 077 (restrictive)"
umask 077
touch file_private.txt
mkdir dir_private

echo ""
echo "Premissions after umask 077"
ls -l

echo ""
echo "[5] Reset umask to default (usually 002 or 022)"
umask 022

echo ""
echo "[6] How to change umask permanently"
echo "	-for current user: add to ~/.bashrc or ~/.bash_profile"
echo "	 example :umask 027"
echo "	-for all users : edit /etc/profile or /etc/bashrc"

echo "[7] Cleanup test files"
rm -rf "$TEST_DIR"

echo ""
echo "DONE"




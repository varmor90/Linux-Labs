#!/bin/bash


echo " MODULE 7 -03 File Transfer & Downloads"

echo ""
echo "[1] Download a file using wget"
wget -O sample_wget.txt https://www.example.com || echo "curl failed (no internet?)"

echo ""
echo "[2] Download a file using curl"
curl -o sample_curl.txt https://www.example.com || echo "curl filed (no internet?)"

echo ""
echo "[3] Download JSON data from public API:"
curl -s https://api.github.com | head -n 15

echo ""
echo "[4] check if scp is available "
command -v scp && echo "scp is installed" || echo "scp not foudn"

echo ""
echo "[5] Example scp coomand (commented out)"
echo "scp /path/to/file username@remote:/target/path"


echo ""
echo "[6] Check if rsync is avaiable "
command -v rsync && echo "rsync is installed" || echo "rsync not found"

echo ""
echo "[7] Example rsync command (commented out)"
echo "rsync -avz /local/folder/ username@remote:/remote/folder/"

echo ""
echo "[8] checking if ftp is installed"
command -v ftp && echo "ftp is installed" || echo "ftp not found"

echo ""
echo "DONE"




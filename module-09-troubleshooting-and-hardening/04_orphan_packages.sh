#1/bin/bash

echo "MODULE 9: 04- remove unused / Orphan Packages"

echo ""
echo "[1] Checking if 'dnf-utils' is installed"
dnf list installed dnf-utils &>/dev/null

if [ $? -ne 0 ]; then
	echo "Installing dnf-utils"
	sudo dnf install -y dnf-utils
else
	echo "dnf-utils already installed"
fi

echo ""
echo "[2] Listing installed (orphans) packages"
dnf repoquery --extras 

echo ""
echo "[3] Removing orphaned or unnsecsessary packages"
sudo dnf autoremove -y

echo ""
echo "DONE"

echo "you can also run 'dnf clean all' to free up cache space"



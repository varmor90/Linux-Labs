#!/bin/bash

echo "MODULE 07 - 07 Apache Web Server and Sendmail"

echo ""
echo "[1] Installing Apache"
dnf install -y httpd

echo ""
echo "[2] enabling and starting Apache service"
systemctl enable httpd
systemctl start httpd 

echo ""
echo "[3] checking Apache status "
systemctl status httpd --no-pager


echo ""
echo "[4] Creating test index.html page"
echo "<h1> Hello from Apache on $(hostname)</h1>" > /var/www/html/index.html

echo ""
echo "[5] Veryfing page content"
cat /var/www/html/index.html

echo ""
echo "[6] Checking if port 80 is open and listening"
ss -tuln | grep ':80' || echo "port 80 not open?"

echo ""
echo "[7] Installing Sendmail (if not present)"
dnf install -y sendmail

echo ""
echo "[8]starting sendmail"
systemctl enable sendmail
systemctl start sendmail

echo "" 
echo "[9] checking sendmail status"
systemctl status sendmail --no-pager

echo ""
echo "[10] Sending test m,ail (to local root )"
echo "this is a test mail from $(hostname)" | mail -s "Test Mail from linux Lab" root

echo ""
echo "DONE"



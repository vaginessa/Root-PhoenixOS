#!/system/bin/sh
sleep 0.5
clear
echo "     ___      ____        "
echo "    / _ \___ / / /_______ "
echo "   / // / -_)_  _/ __/ -_)"
echo "  /____/\__/ /_/ \__/\__/ "
echo "                          "
echo " Root PhoenixOS"
echo " deace.inc@gmail.com"
echo " https://github.com/De4ce/Root-PhoenixOS"

su_path=/storage/emulated/0/de4ce/su

sleep 1.2

# memulai instalasi
echo
echo "  - Preparing..."
cd /storage/emulated/0

if [ -d "de4ce" ]; then
	rm -rf de4ce
fi

# membuat folder de4ce
mkdir de4ce
cd de4ce

# mengunduh supersu
sleep 0.5
echo "  - Downloading SuperSU, please wait..."
wget -q http://phoenix.de4ce.gq/su.zip
mkdir su

# extracting su.zip
echo "  - Extracting..."
unzip su.zip -d su &> /dev/null

# instal supersu
sleep 0.2
echo "  - Installing SuperSU..."

# x86 function
exe_x86 () {
cd /system/xbin
mv su su.bak
cp $su_path/x86/su.pie su
chmod 4751 su
su --install
su --daemon
}

# x64 funcion
exe_x64 () {
cd /system/xbin
mv su su.bak
cp $su_path/x64/su .
chmod 4751 su
su --install
su --daemon
}

ARCH=$(uname -m)
if [ "$ARCH" = "x86_64" ]; then
	exe_x64
else
	exe_x86
fi

# instal supersu.apk
pm install $su_path/common/Superuser.apk &> /dev/null

sleep 1
echo "  - SuperSU successfully installed."
exit

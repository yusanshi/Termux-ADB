#!/bin/bash

directory="$(pwd)"
prefix="/usr"
echo
echo -e "\e[93mThis script will install ADB & FastBoot Tools in Aidlearning."
echo
echo -e "\e[32m[*] \e[34mDownloading wrapper script..."
mkdir $prefix/tmp/adbtemp
downpath="$prefix/tmp/adbtemp"
wget https://github.com/MasterDevX/Termux-ADB/raw/master/bin/adb -P $downpath/ -q
echo -e "\e[32m[*] \e[34mDownloading binaries..."
wget https://github.com/MasterDevX/Termux-ADB/raw/master/bin/adb.bin -P $downpath/ -q
wget https://github.com/MasterDevX/Termux-ADB/raw/master/bin/fastboot -P $downpath/ -q
wget https://github.com/MasterDevX/Termux-ADB/raw/master/bin/fastboot-armeabi -P $downpath/ -q
echo -e "\e[32m[*] \e[34mCopying files to bin..."
cp $downpath/* $prefix/bin
echo -e "\e[32m[*] \e[34mSetting execution permissions..."
files="$(ls $downpath)"
cd $prefix/bin
chmod +x $files
echo -e "\e[32m[*] \e[34mCreating workspace directory..."
cd $HOME
if [ ! -d "adbfiles" ]; then
  mkdir adbfiles
fi
echo -e "\e[32m[*] \e[34mCleaning up..."
cd $directory
rm -rf $downpath
rm -rf InstallTools.sh
echo
echo -e "\e[32mTools were successfully installed!\e[39m"
echo

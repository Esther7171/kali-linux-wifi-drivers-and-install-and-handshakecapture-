#!/bin/bash
cd Wifi_hacking
tar -xjvf compat-wireless-2010-06-28.tar.bz2
cd compat-wireless-2010-06-28
sudo make unload
sudo make load
sudo apt update -y
cd /home/$USER/

# ------- for tp link --------
sudo apt install dkms git -y
sudo apt install -y build-essential libelf-dev linux-headers-$(uname -r) 2>/dev/null
sudo apt install -y linux-headers* 2>/dev/null
git clone https://github.com/aircrack-ng/rtl8812au.git
cd rtl8812au
sudo make -y dkms_install 2>/dev/null
lsusb

# -------- for others -------------

sudo apt-get install -y build-essential git dkms linux-headers-$(uname -r) 2>/dev/null
git clone https://github.com/kelebek333/rtl8188fu
cd rtl8188fu
sudo dkms install ./rtl8188fu

sudo cp ./rtl8188fu/firmware/rtl8188fufw.bin /lib/firmware/rtlwifi/
echo -e "\033[1;31m All Done\033[0m"
echo ""
echo -e "\033[1;31m Restarting Your system \033[0m"
sleep 1s
init 6

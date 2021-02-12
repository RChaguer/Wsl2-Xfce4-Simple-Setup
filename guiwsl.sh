#! /bin/bash

tput setaf 2 ; echo "update packages and upgrade";  tput setaf 1;
sudo apt update && sudo apt -y upgrade

tput setaf 2 ; echo "install xfce";  tput setaf 1;
sudo apt -y install xfce4  xfce4-goodies

tput setaf 2 ; echo "install xrdp";  tput setaf 1;
sudo apt-get install xrdp

tput setaf 2 ; echo "configure xrdp";  tput setaf 1;
sudo cp /etc/xrdp/xrdp.ini /etc/xrdp/xrdp.ini.bak

sudo sed -i 's/3389/3390/g' /etc/xrdp/xrdp.ini
sudo sed -i 's/max_bpp=32/#max_bpp=32\nmax_bpp=128/g' /etc/xrdp/xrdp.ini
sudo sed -i 's/xserverbpp=24/#xserverbpp=24\nxserverbpp=128/g' /etc/xrdp/xrdp.ini
echo xfce4-session > ~/.xsession

line1_to_comment="test -x"
line2_to_comment="exec"
com="#"
file_path=/etc/xrdp/startwm.sh

sudo sed -i "s/$line1_to_comment/$com$line1_to_comment/g"  $file_path;
sudo sed -i "s/$line2_to_comment/$com$line2_to_comment/g"  $file_path;

lines_possibly_to_add="\nunset DBUS_SESSION_BUS_ADDRESS\nunset XDG_RUNTIME_DIR\n. $HOME/.profile"
lines_to_add="\n\n#xfce\nstartxfce4"

printf  "$lines_to_add" | sudo tee -a $file_path > /dev/null

path=$(cd ~ && pwd)

cp interface.sh $path/.interface.sh
chmod 0755  $path/.interface.sh
sudo ln -s $path/.interface.sh /usr/local/bin/interface

tput setaf 2 ; echo "You can start the local rdp using : interface start";  tput setaf 0;

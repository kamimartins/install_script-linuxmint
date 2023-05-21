#!/bin/bash

### Read the apps from a text file ###
readarray -t LIST_APT_APPS < list_apt_apps.txt
readarray -t LIST_FLATPAK_APPS < list_flatpak_apps.txt
readarray -t URL_APPS_DEB < list_deb_apps.txt

# Download and installing packages using apt 
echo "======================================= INSTALLING PACKAGES USING APT. . . ======================================="
for NAME_APT_APP in ${LIST_APT_APPS[@]}; do
  if ! dpkg -l | grep -q $NAME_APT_APP; then # Install only if the app isn't be installed
    sudo apt install "$NAME_APT_APP" -y
  else
    echo "[APP ALREADY INSTALLED] - $NAME_APT_APP"
  fi
done


# Download and installing packages from Flathub
echo "======================================= INSTALLING FROM FLATHUB. . . ======================================="
for NAME_FLAT_APP in ${LIST_FLATPAK_APPS[@]}; do
    if ! flatpak list | grep -q $NAME_FLAT_APP; then 
     sudo flatpak install flathub "$NAME_FLAT_APP" -y
  else
    echo "[APP FLATPAK ALREADY INSTALLED] - $NAME_FLAT_APP"
  fi
done

# Download and installing deb packages
echo "======================================= INSTALLING DEB PACKAGES. . . ======================================="
DIR_DOWNLOADS = "$HOME/Downloads/"
# Set up path output deb packages 

for url in "${URL_APPS_DEB[@]}"; do
  wget "$url" -P "$DIR_DOWNLOADS"
done

sudo dpkg -i $DIR_DOWNLOADS/*.deb # Installing packages .deb downloaded



### # Finishing, updating and cleaning ###
echo "======================================= UPDATING. . . ======================================="
sudo apt update && sudo apt upgrade -y 
sudo flatpak update 
echo "======================================= AUTOCLEAN. . . ======================================="
sudo apt autoclean
sudo apt autoremove -y

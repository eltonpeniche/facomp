#!/bin/sh Instalar codelite
sudo apt-get install codelite
#Instalar codeblocks
sudo apt-get install codeblocks
#Instalar notepadqq
sudo add-apt-repository ppa:notepadqq-team/notepadqq
sudo apt-get update
sudo apt-get install notepadqq
#Instalar swi-prolog
sudo apt-get install swi-prolog
#Instalar netbeans
sudo apt-get install netbeans
#Instalar scilab
sudo apt-get install scilab
#Instalar wine
sudo apt-get install wine-development
sudo apt-get install wine-stable
#Instalar 7zip
sudo apt-get install p7zip-full
sudo apt-get install p7zip-rar
#Instalar adobe
sudo apt-get install libgtk2.0-0:i386 libnss3-1d:i386 libnspr4-0d:i386 lib32nss-mdns* libxml2:i386 libxslt1.1:i386 libstdc++6:i386
wget http://ardownload.adobe.com/pub/adobe/reader/unix/9.x/9.5.5/enu/AdbeRdr9.5.5-1_i386linux_enu.deb -O adobereader.deb
sudo dpkg -i adobereader.deb
#Instalar unity
sudo apt update
sudo apt install unity-session -y
sudo apt-get install unity
#Instalar android studio
sudo add-apt-repository ppa:maarten-fonville/android-studio
sudo apt-get update
sudo apt-get install android-studio
#Instalar anaconda-navigator
conda install -c anaconda anaconda-navigator
#Instalar mysql workbench
sudo apt-get update
lsb_release -rs
wget http://cdn.mysql.com/Downloads/MySQLGUITools/mysql-workbench-community_8.0.12-1ubuntu18.04_amd64.deb -O mysql-workbench-community.deb
sudo dpkg -i mysql-workbench-community.deb
sudo apt-get -f install

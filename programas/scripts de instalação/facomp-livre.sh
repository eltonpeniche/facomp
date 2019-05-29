#!/bin/sh

# Atualiza os repositórios
apt update
apt upgrade -y

# Escritório
apt install libreoffice -y

# Monitoramento
apt install htop -y
apt install net-tools -y

# Linguagens de Programação
apt install swi-prolog -y
apt install r-base -y
apt install openjdk-11-jdk -y
apt install php -y
apt install fpc -y

# IDEs
apt install qtcreator -y
apt install scilab -y
apt install scratch -y
apt install codelite -y
apt install codeblocks -y
apt install idle -y
snap install intellij-idea-educational --classic
snap install --classic code # NÂO TESTADO

apt install vim -y 

#netbens apache
wget -c https://www-eu.apache.org/dist/incubator/netbeans/incubating-netbeans/incubating-11.0/incubating-netbeans-11.0-bin.zip
unzip incubating-netbeans*.zip -d /opt/
ln -sf /opt/netbeans/bin/netbeans /usr/bin/netbeans
echo -e '[Desktop Entry]\n Version=1.0\n Name=netbeans\n Exec=/opt/netbeans/bin/netbeans\n Icon=/opt/netbeans/nb/netbeans.png\n Type=Application\n Categories=Application' | tee /usr/share/applications/netbeans.desktop

#Instalar android studio
add-apt-repository ppa:maarten-fonville/android-studio -y
apt update
apt install android-studio -y

#pycharm
add-apt-repository ppa:viktor-krivak/pycharm -y
apt update
apt install pycharm -y

# Servidores
apt install apache2 -y

# Banco de Dados
apt install mysql-server -y
apt install mysql-client -y
apt install mysql-workbench -y 

# Ferramentas de Desenvolvimento
apt install git -y
apt install vim -y


# Ferramentas para compressão de arquivos
apt install unrar -y
apt install p7zip-full -y

# Acessibilidade
apt install kmag -y

# LaTeX
apt install texlive texlive-pictures texlive-science texlive-publishers texlive-humanities texlive-fonts-extra texlive-fonts-recommended -y
apt install kile -y

# Inteligência Artificial
apt install weka -y

# Bioinformática
## Alguns softwares foram instalados do canal bioconda utilizando conda
## Adicionar bioconda>
## conda install -c conda-forge -c bioconda prokka spades idba prinseq
apt install artemis -y

#Ferramenta de emulação
apt-get install wine-stable -y

#google chrome
wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome*.deb
apt install -f -y && rm google-chrome*.deb

#sublime text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
apt update
apt install sublime-text -y

#Rstudio
wget -c https://download1.rstudio.org/desktop/bionic/amd64/rstudio-1.2.1335-amd64.deb
sudo dpkg -i rstudio-1.2.1335-amd64.deb 
sudo apt -y install -f

#programas requisitados pelo Prof. Filipe saraiva
sudo apt -y install cantor cantor-backend-python3 python3-numpy python3-scipy python3-matplotlib spyder3 jupyter-notebook
pip3 install spyder-notebook simpy fitter==1.0.9

pip3 install pygame

#unity
apt update
wget -c http://beta.unity3d.com/download/2b451a7da81d/unity-editor_amd64-2017.2.0xb6Linux.deb -O unity-editor.deb
dpkg -i unity-editor.deb
apt install -f -y

#virtualbox
wget -c https://download.virtualbox.org/virtualbox/6.0.4/virtualbox-6.0_6.0.4-128413~Ubuntu~bionic_amd64.deb
dpkg -i virtualbox*.deb
apt install -f -y && rm virtualbox*.deb







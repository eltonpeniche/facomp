#/bin/bash

echo "Desbloqueando travas"
sleep 5

sudo rm /var/lib/apt/lists/lock
sudo rm /var/lib/dpkg/lock
sudo apt-get update

echo -en "\e[3J"

echo "Instalando o programa curl"
sleep 5

sudo apt install curl -y

echo -en "\e[3J"

echo "Baixe o Anaconda Bash Script"
sleep 5

cd /tmp
curl -O https://repo.anaconda.com/archive/Anaconda3-5.2.0-Linux-x86_64.sh

echo -en "\e[3J"

echo "Verificar a integridade dos dados do instalador"
sleep 5

sha256sum Anaconda3-5.2.0-Linux-x86_64.sh

echo -en "\e[3J"

echo "Executar o Script Anaconda"
sleep 5

bash Anaconda3-5.2.0-Linux-x86_64.sh

echo -en "\e[3J"

echo "Ativar a instalação"
sleep 5

source ~/.bashrc

echo -en "\e[3J"

echo "Instalação de teste"
sleep 5

conda list

echo -en "\e[3J"

echo "Rodar o jupyter -> jupyter notebook"
sleep 20


#!/bin/bash

echo "Desbloqueando travas"
sleep 5

rm /var/lib/apt/lists/lock
rm /var/lib/dpkg/lock
apt update

echo -en "\e[3J"

echo "Instalando o programa curl"
sleep 5

apt install curl -y

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

echo 'export PATH=/usr/local/anaconda3/bin:$PATH' | sudo tee -a /etc/bash.bashrc

echo "Ativar a instalação"
sleep 5

source /etc/bash.bashrc

echo -en "\e[3J"

conda list

echo "Rodar o jupyter -> jupyter notebook"


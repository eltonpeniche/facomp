#!/bin/bash

#1-) Baixe o oracle no site Oficial:
#https://www.oracle.com/technetwork/database/database-technologies/express-edition/downloads/xe-prior-releases-5172097.html

#2-) Descompacte o arquivo baixado:
unzip oracle-xe-11.2.0-1.0.x86_64.rpm.zip

#3-) Instale os pacotes pré-requisitos:
sudo apt install -y alien libaio1 unixodbc rlwrap vim

#4-) Utilize o comando Alien para alterar o formato .RPM para o padrão .DEB do Ubuntu, entre no diretório “Disk1” da pasta que você descompactou o Oracle e digite:

cd Disk1/
sudo alien --scripts -d oracle-xe-11.2.0-1.0.x86_64.rpm
cd ..

#5-) Realize as seguintes alterações:
#a-) mova o Script “chkconfig”
sudo cp -r  chkconfig /sbin/chkconfig

#* Salve o arquivo e altere as permissões:
sudo chmod 755 /sbin/chkconfig


#b-) Defina o seguinte parâmetro:
sudo cp -r 60-oracle.conf /etc/sysctl.d/60-oracle.conf


#Realize restart no serviço e verifique se o fs.file-max está igual a 6815744.
sudo service procps restart 
sudo sysctl -q fs.file-max


#c-) Verifique a sua memória SWAP, você deve possuir no minímo 2 GB livres.
free -m

sudo ln -s /usr/bin/awk /bin/awk
sudo mkdir /var/lock/subsys
sudo touch /var/lock/subsys/listener
#6 -) Pronto, agora você pode instalar o Oracle.
#a-) Execute o arquivo que foi alterado no Passo 4.
cd Disk1/
sudo dpkg -i oracle-xe_11.2.0-2_amd64.deb


#7-) Altere as variáveis de ambiente:
#-) Para adicionar a variável de ambiente para todos os usuários, adicione o seguinte trecho no arquivo “sudo vi /etc/bash.bashrc”
#Copie e cole)

export ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe
export ORACLE_SID=XE
export NLS_LANG=`$ORACLE_HOME/bin/nls_lang.sh`
export ORACLE_BASE=/u01/app/oracle
export LD_LIBRARY_PATH=$ORACLE_HOME/lib:$LD_LIBRARY_PATH
export PATH=$ORACLE_HOME/bin:$PATH
alias sqlplus="rlwrap sqlplus"

echo "Variaveis de Ambiente do Oracle" | sudo tee -a /etc/bash.bashrc
echo "export ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe" | sudo tee -a /etc/bash.bashrc
echo "export ORACLE_SID=XE" | sudo tee -a /etc/bash.bashrc
echo 'export NLS_LANG=\`$ORACLE_HOME/bin/nls_lang.sh\`' | sudo tee -a /etc/bash.bashrc
echo "export ORACLE_BASE=/u01/app/oracle" | sudo tee -a /etc/bash.bashrc
echo 'export LD_LIBRARY_PATH=$ORACLE_HOME/lib:$LD_LIBRARY_PATH' | sudo tee -a /etc/bash.bashrc
echo 'export PATH=$ORACLE_HOME/bin:$PATH' | sudo tee -a /etc/bash.bashrc
echo 'alias sqlplus="rlwrap sqlplus"' | sudo tee -a /etc/bash.bashrc
echo "unset NLS_LANG" | sudo tee -a /etc/bash.bashrc


#b-) Inicie o Oracle

# Informe as configurações de acesso para o banco de dados:
#* Informe uma porta HTTP válida (Padrão é 8080).
#* Informe uma porta Oracle Database listener (Padrão é 1521).
#* Informe uma senha para os usuários administradores (Sys e System).
#* Confirme a senha dos administradores.
#* Informe se você quer que o banco de dados inicie automaticamente no restart do linux.
sudo /etc/init.d/oracle-xe configure

sudo service oracle-xe start



#8-) Pronto, configurações finalizadas.
#Para que você não precise utilizar a senha de administrador, você pode criar um usuário e conceder os acessos para ele:
#unset NLS_LANG
#sqlplus sys as sysdba
#*Utilize a senha criada no passo 6.
#create user aluno identified by aluno01;
#GRANT DBA TO aluno; 

# scp -r LABCOMP-SERVER:/home/bowser/Downloads/oracle11g ~/Documentos


# Para desinstalar
# sudo dpkg -P oracle-xe
# sudo rm -r /etc/default/oracle-xe
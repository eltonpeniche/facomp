#!/bin/bash

#FASTQC https://www.bioinformatics.babraham.ac.uk/projects/fastqc/
sudo apt install fastqc

#Spades http://cab.spbu.ru/software/spades/
sudo apt install spades

#Augustus http://augustus.gobics.de/binaries/
sudo apt install augustus

#ABySS http://www.bcgsc.ca/dowloads/abyss/
sudo apt-get install abyss

#Burrows-Wheeler Aligner (BWA) https://sourceforge.net/projects/bio-bwa/files/
sudo apt install bwa

#MrBayes v.3.2.5: https://nbisweden.github.io/MrBayes/download.html
sudo apt install mrbayes

#BLAST  https://blast.ncbi.nlm.nih.gov/Blast.cgi?CMD=Web&PAGE_TYPE=BlastDocs&DOC_TYPE=Download
sudo apt install blast2
#blastn -h

#ORTHOMCL https://orthomcl.org/common/downloads/
wget -c https://orthomcl.org/common/downloads/software/v2.0/orthomclSoftware-v2.0.9.tar.gz
tar -xzvf orthomclSoftware*.tar.gz && mv orthomclSoftware-v2.0.9 orthomcl  
sudo cp -r  orthomcl/ /usr/local/
sudo chmod 777 -R /usr/local/orthomcl/
sudo ln -s /usr/local/orthomcl/bin/* /usr/local/bin/

#PRINSEQ https://sourceforge.net/projects/prinseq/files/standalone/
wget https://ufpr.dl.sourceforge.net/project/prinseq/standalone/prinseq-lite-0.20.4.tar.gz
tar -xzvf prinseq-lite*.tar.gz && mv prinseq-lite-0.20.4 prinseq 
sudo cp -r  prinseq/ /usr/local/
sudo chmod 777 -R /usr/local/prinseq/
sudo ln -s /usr/local/prinseq/*.pl /usr/local/bin/

#Platanus: http://platanus.bio.titech.ac.jp/platanus-assembler/platanus-1-2-4ver="1.2.4"
sudo wget http://platanus.bio.titech.ac.jp/?ddownload=145 -O /usr/local/bin/platanus
sudo chmod +x /usr/local/bin/platanus

#Blast2GO: https://www.blast2go.com/blast2go-pro/download-b2g
wget http://resources.biobam.com/software/blast2go/nico/Blast2GO_unix_5_2_5.zip
unzip Blast2GO_unix_5_2_5.zip 
#./Blast2GO_unix_5_2_5.sh

#GeneMark-ES http://topaz.gatech.edu/GeneMark/gmes_instructions.html
#Instalar dependências
wget http://topaz.gatech.edu/GeneMark/tmp/GMtool_XA6Nm/gm_et_linux_64.tar.gz
wget http://topaz.gatech.edu/GeneMark/tmp/GMtool_XA6Nm/gm_key_64.gz
sudo cpan install YAML Hash::Merge Logger::Simple Parallel::ForkManager
sudo cp -r gm_et_linux_64  /usr/local/genemark_ES_ET
cd /usr/local/genemark_ES_ET/gmes_petap/ 
perl change_path_in_perl_scripts.pl "/usr/bin/env perl"
sudo cp /usr/local/genemark_ES_ET/gm_key_64 ~/.gm_key
sudo ln -s /usr/local/genemark_ES_ET/gmes_petap/*.pl /usr/local/bin/

#gmes_petap.pl



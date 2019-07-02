#!/bin/bash

desligarMaquinas(){
	clear
	echo -e "---------------DESLIGAR MÁQUINAS---------- \n"
	while true;do
            
            echo ""
            echo " Desligar Todas as Máquinas -----------(1)"
            echo " Desligar uma máquina -----------------(2)"
            echo " Voltar--------------------------------(0)"
            read -p "escolha uma opção entre 0 a 2:  " opcao
            	if [ $opcao -eq 1 ]; then
                    sudo ./shutdownCluster.sh
                elif [ $opcao -eq 2 ]; then
                    while true;do
                        clear
                        
                        echo -e "pressione 0 (zero) para Voltar"
                        read -p "Qual maquina você quer desligar ?(ex:01, 07, 12, 30): " opcao1
                        if [ $opcao1 -eq 0 ]; then
                            break
                        else
                            echo "Desligando o PC$opcao1"
                            ssh -t $USER@LABCOMP2-PC$opcao1 'sudo shutdown now'
                            
                        fi
                        
                    done
                elif [ $opcao -eq 0 ]; then
                    clear
                    break
                else
                    echo "OPÇÃO INVÁLIDA! TENTE NOVAMENTE..!!"
                fi

            
    done

	sleep 2
}

ligarMaquinas(){
    
    clear
	echo -e "---------------LIGAR MÁQUINAS---------- \n"
	while true;do
            
            echo ""
            echo " Ligar Todas as Máquinas -----------(1)"
            echo " Ligar uma máquina -----------------(2)"
            echo " Voltar--------------------------------(0)"
            read -p "escolha uma opção entre 0 a 2:  " opcao
            	if [ $opcao -eq 1 ]; then
                    sudo ./wakeUpCluster.sh
                elif [ $opcao -eq 2 ]; then
                    while true;do
                        
                        echo -e "pressione 0 (zero) para Voltar"
                        read -p "Qual maquina você quer Ligar ?(ex: 01, 07, 12, 30): " opcao1
                        if [ $opcao1 -eq 0 ]; then
                            break
                        else
                            echo "Ligando o PC$opcao1"
                            # Variável com o mac das máquinas
                            macs=(${macs[@]} `cat /usr/local/Cluster.config/mac_host.txt`)
                            len=${#macs[*]}
                            
                            for ((i=2;i<len;i+=2)) do
                                div=$(($opcao1 * 2))
                                if [ $div -eq $i ]; then
                                    wakeonlan ${macs[i]}
                                fi
                            done
                            
                        fi
                        
                    done
                elif [ $opcao -eq 0 ]; then
                    clear
                    break
                else
                    echo "OPÇÃO INVÁLIDA! TENTE NOVAMENTE..!!"
                fi

            
    done

	sleep 2    

}

reiniciarMaquinas(){
	clear
	echo -e "---------------REINICIAR MÁQUINAS---------- \n"
	while true;do
            
            echo ""
            echo " Reiniciar Todas as Máquinas -----------(1)"
            echo " Reiniciar uma máquina -----------------(2)"
            echo " Voltar--------------------------------(0)"
            read -p "escolha uma opção entre 0 a 2:  " opcao
            	if [ $opcao -eq 1 ]; then
                    sudo ./rebootCluster.sh
                elif [ $opcao -eq 2 ]; then
                    while true;do
                        clear
                        
                        echo -e "pressione 0 (zero) para Voltar"
                        read -p "Qual maquina você quer Reiniciar ?(ex: 01, 07, 12, 30): " opcao1
                        if [ $opcao1 -eq 0 ]; then
                            break
                        else
                            echo "Reiniciando o PC$opcao1"
                            ssh -t $USER@LABCOMP2-PC$opcao1 'sudo reboot'
                            
                        fi
                        
                    done
                elif [ $opcao -eq 0 ]; then
                    clear
                    break
                else
                    echo "OPÇÃO INVÁLIDA! TENTE NOVAMENTE..!!"
                fi

            
    done

	sleep 2
}

while true; do
	
	echo ""
	echo " Desligar Máquinas -------------------------(1)"
	echo " Ligar máquinas ----------------------------(2)"
	echo " Reiniciar Máquinas ------------------------(3)"
    echo " SAIR---------------------------------------(0)"
	read -p "escolha uma opção entre 0 a 3:  " opcao
	clear

	if [ $opcao -eq 1 ]; then
		desligarMaquinas
	elif [ $opcao -eq 2 ]; then
		ligarMaquinas
	elif [ $opcao -eq 3 ]; then
		reiniciarMaquinas
    elif [ $opcao -eq 0 ]; then
		break
	else
		echo "OPÇÃO INVÁLIDA! TENTE NOVAMENTE..!!"
	fi

done
 

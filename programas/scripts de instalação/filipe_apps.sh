#!/bin/bash

# Lista dos programas para instalar:
# - cantor
# - cantor-beckend-python3
# - python3-numpy
# - python3-scipy
# - python3-matplotlib
# - spyder3
# - jupyter-notebook
# - filter==1.0.9 (via pip3)
# - spyder-notebook (via pip3)
# - simpy (via pip3)

# Sugestão de script (vê se funciona)

sudo apt -y install cantor cantor-backend-python3 python3-numpy python3-scipy python3-matplotlib spyder3 jupyter-notebook
#pip3 install fitter==1.0.9
pip3 install spyder-notebook simpy fitter==1.0.9

# Teste das bibliotecas do python
#python3 testsbib.py



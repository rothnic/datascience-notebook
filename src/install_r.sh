# Constants
HOME=/home/condauser
PREFIX=/home/condauser/anaconda3

PY3PATH=$PREFIX/bin
CONDA3=$PY3PATH/conda

# install r in environment named 'r' and accept all
$CONDA3 install --yes -c r r r-rcurl r-devtools r-irkernel

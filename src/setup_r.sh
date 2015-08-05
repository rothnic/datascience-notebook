# Constants
HOME=/home/condauser
PREFIX=/home/condauser/anaconda3

PY3PATH=$PREFIX/bin
CONDA3=$PY3PATH/conda

# Add defalt repo for R
echo "## Default repo
local({r <- getOption('repos')
       r['CRAN'] <- 'http://cran.r-project.org'
       options(repos=r)
})" >> $HOME/.Rprofile

# create the R kernel
$PY3PATH/ipython kernelspec install --replace --name ir \
 --user /home/condauser/anaconda3/lib/R/library/IRkernel/kernelspec

# include a modified kernel that points to R within conda structure
cp /tmp/kernel.json /home/condauser/.ipython/kernels/ir/kernel.json

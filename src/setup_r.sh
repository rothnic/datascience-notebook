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

# create reference to R in environment and install r packages
R_PATH=$PREFIX/envs/r

# fix issue with compilation
mv $R_PATH/lib/libstdc++.so.6 $R_PATH/lib/libstdc++.so.6.orig
ln -s /usr/lib/libstdc++.so.6.0.14 $R_PATH/lib/libstdc++.so.6

$PY3PATH/ipython kernelspec install --replace --name ir \
 --user /home/condauser/anaconda3/envs/r/lib/R/library/IRkernel/kernelspec

$R_PATH/bin/R CMD BATCH /tmp/install_r_packages.R
tail -f ./install_r_packages.Rout

# works second time for some reason
$R_PATH/bin/R CMD BATCH /tmp/install_r_packages.R

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
#mv $R_PATH/lib/libstdc++.so.6 $R_PATH/lib/libstdc++.so.6.orig
#ln -s /usr/lib/libstdc++.so.6.0.14 $R_PATH/lib/libstdc++.so.6

# make sure R can find ipython
#ln -s $PY3PATH/ipython $R_PATH/bin/ipython

#$R_PATH/bin/R CMD BATCH /tmp/install_r_packages.R
#$R_PATH/bin/R CMD BATCH /tmp/install_r_packages.R
#tail -f ./install_r_packages.Rout

#$PY3PATH/ipython kernelspec install --replace --name ir \
# --user /home/condauser/anaconda3/envs/r/lib/R/library/IRkernel/kernelspec

cp /tmp/kernel.json /home/condauser/.ipython/kernels/ir/kernel.json
#chown condauser:condauser /home/condauser -R

# works second time for some reason
$PY3PATH/bin/R CMD BATCH /tmp/add_kernel.R

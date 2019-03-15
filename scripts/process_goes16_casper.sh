#!/bin/bash -l
#SBATCH --job-name=goes16_process
#SBATCH --account=NAML0001
#SBATCH --time=4:00:00
#SBATCH --partition=dav
#SBATCH --ntasks=36
#SBATCH --ntasks-per-node=36
#SBATCH -e goes16_process.log
#SBATCH -o goes16_process.log
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=dgagne
module purge
export HOME="/glade/u/home/dgagne"
module load gnu/7.3.0 openmpi-x/3.1.0 python/3.6.4 cuda netcdf
source /glade/work/dgagne/ncar_pylib_dl/bin/activate
cd $HOME/goes16ci
python setup.py install
cd $HOME/goes16ci/scripts
python -u process_goes16.py goes16_process_config.yml -n 36 -a 

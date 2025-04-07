#!/bin/sh

#SBATCH -N 1
#SBATCH -J lsq2
#SBATCH -t 00:30:00
#SBATCH -p pbatch
#SBATCH -A iap
#SBATCH --exclusive

nnodes=1
nMPI=36

max_iter=2000
exe="/p/lustre2/pham20/codes/ChIMES_2025_develop/chimes_lsq/contrib/dlars/src/dlars"
export OMP_NUM_THREADS=1
rm -rf x.txt Ax.txt
srun -N $nnodes -n $nMPI $exe A.txt b.txt dim.txt --lambda=0.0000001  --split_files --algorithm=lasso --normalize=n --iterations=${max_iter} --distributed_solver=y --weights=new_weight.dat >& dlars.01.log


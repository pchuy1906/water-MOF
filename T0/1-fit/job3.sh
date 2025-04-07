#!/bin/sh

#SBATCH -N 1
#SBATCH -J lsq2
#SBATCH -t 01:00:00
#SBATCH -p pbatch
#SBATCH -A pbronze
#SBATCH --exclusive

nnodes=1
nMPI=36

nrun=`ls dlars.*.log | wc | awk '{print $1}'`
mv dlars.01.log dlars.${nrun}.log

max_iter=2000
exe="/p/lustre2/pham20/codes/ChIMES/chimes_2023_04/contrib/dlars/src/dlars"
exe="/p/lustre2/pham20/codes/ChIMES_2025_develop/chimes_lsq/contrib/dlars/src/dlars"
export OMP_NUM_THREADS=1
rm -rf x.txt Ax.txt
srun -N $nnodes -n $nMPI $exe A.txt b.txt dim.txt --lambda=0.000001  --split_files --restart=restart --algorithm=lasso --normalize=n --iterations=${max_iter} --distributed_solver=y --weights=new_weight.dat >& dlars.01.log

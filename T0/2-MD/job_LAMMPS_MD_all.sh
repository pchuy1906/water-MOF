#!/bin/sh

#SBATCH -N 1
#SBATCH -J MD
#SBATCH -t 01:00:00
#SBATCH -p pbatch
#SBATCH -A iap
#SBATCH --exclusive

nnodes=1
nMPI=36

nframe=100
nstep=$(($nframe*5))
n1=$(($nframe/2))

exe="/p/lustre2/pham20/codes/ChIMES_2025_develop/chimes_lsq/imports/chimes_calculator/etc/lmp/exe/lmp_mpi_chimes"

cwd=`pwd`
for fold in $(ls -1vd sys_@@_*/run-1) ; do
    cd $fold

        if [ ! -e "log.lammps" ]; then

            sed 's/@nstep@/'"$nstep"'/g' _in.lammps > in.lammps

            echo "$nframe" > MACE/LIST_STRUCTURE
           #echo "$n1"    >> MACE/LIST_STRUCTURE

            srun -N $nnodes -n $nMPI   $exe  <  in.lammps   >   out.lammps
        fi

    cd $cwd
done

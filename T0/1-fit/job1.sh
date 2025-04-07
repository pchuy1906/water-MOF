#!/bin/sh

#SBATCH -N 1
#SBATCH -J lsq
#SBATCH -t 00:30:00
#SBATCH -p pbatch
#SBATCH -A pbronze
#SBATCH --exclusive

module load python/3.12.2

src_chimes_lsq="/p/lustre2/pham20/codes/ChIMES_2025_develop/chimes_lsq/"

nnodes=1
nMPI=36
exe="${src_chimes_lsq}/build/chimes_lsq"
date
srun -N $nnodes -n $nMPI $exe  fm_setup.in >& fm_setup.out
date

nAtomType=5
nCondensed=`grep FIRSTALL fm_setup.in  | awk '{print $NF}'`
#nCondensed=0
file_xyzf=`grep -A1 TRJFILE fm_setup.in | tail -1 | awk '{print $1}'`
wE=200
wS=500

python ~/tools/others/gen_weight_4_lsq_split.py \
--nAtomType    $nAtomType \
--nCondensed   $nCondensed \
--wE           $wE \
--wS           $wS 

paste b.txt  new_weight.dat   label.txt  | grep force > AAA_force_weight.dat

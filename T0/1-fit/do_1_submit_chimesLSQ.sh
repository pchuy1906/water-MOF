source ~/.BASHRC_activate_conda
conda activate lmp_python

file_xyz="../0-data/SCAN_condensed.xyz"
atom_types="Al C H N O"
polynomial_orders="12 8 0"
cutoff_distances="6 5 4"

python ~/tools/others/gen_fm_setup_ase.py  \
--file_xyz ${file_xyz}  \
--atom_types ${atom_types}  \
--polynomial_orders ${polynomial_orders}  \
--cutoff_distances ${cutoff_distances} \
--delta_penalty 0.16 \
&> OUTPUT_0

mv _fm_setup.in fm_setup.in

nnodes=1
nMPI=36

nall=2000
neach=2000
nrun=$(($nall/$neach))

sed -i 's/.*#SBATCH -N.*/#SBATCH -N '"$nnodes"'/' job*.sh
sed -i 's/.*nnodes=.*/nnodes='"$nnodes"'/'        job*.sh
sed -i 's/.*nMPI=.*/nMPI='"$nMPI"'/'              job*.sh
sed -i 's/.*max_iter=.*/max_iter='"$nall"'/'      job*.sh

#sed -i 's/pbatch/pdebug/g'                        job*.sh
 sed -i 's/pdebug/pbatch/g'                        job*.sh

sbatch job1.sh &> JOB_ID
JOBID=`tail -1 JOB_ID | awk '{print $NF}'`
sbatch --dependency=afterany:$JOBID job2.01.sh &> JOB_ID_1

for i in $(seq 2 2) ; do
    prev=$(($i-1))
    nstep=$(($i*$neach))
    JOBID=`tail -1 JOB_ID_${prev} | awk '{print $NF}'`
    nfile="TMP_${i}.sh"
    cp job3.sh $nfile
    #sbatch --dependency=afterany:$JOBID $nfile &> JOB_ID_$i
done

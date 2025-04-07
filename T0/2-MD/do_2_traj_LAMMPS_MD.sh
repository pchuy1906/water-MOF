sfold="run-1"

module load python/3.12.2

cwd=`pwd`

if [ "$#" -eq 0 ]; then
    list_run=`ls -1vd condensed_*/$sfold`
else
    for element in "$@" ; do
        list_run="${list_run} $element/$sfold"
    done
fi
    
echo ${list_run}

for fold in ${list_run} ; do
    cd $fold
        pwd
        python  ~/tools/others/dump_2_xyz.py  --file_dump dump_xyz_vxyz  --atom_types Al C H N O
        mv lammps.xyz traj.xyz
        ~/tools/LAMMPS/do_collect_LAMMPS_step.sh
    cd $cwd
done


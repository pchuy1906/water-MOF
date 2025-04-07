fjob="job_LAMMPS_MD_all.sh"

for i in $(ls -1vd condensed*) ; do
    nfjob="TMP_${i}.sh"
    cp $fjob $nfjob
    sed -i 's/sys_@@_/'"$i"'/g' $nfjob
    sbatch $nfjob &> JOB_ID_$i
done


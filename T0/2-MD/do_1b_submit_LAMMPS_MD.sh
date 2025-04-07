fjob="job_LAMMPS_MD_all.sh"
sfold="run-3"

for i in $(ls -1vd condensed*) ; do
    nfjob="TMP_${i}.sh"
    cp $fjob $nfjob
    sed -i 's/sys_@@_/'"$i"'/g' $nfjob

    sed -i 's/run-1/'"$sfold"'/g'   $nfjob
    sed -i 's/sed /#sed /g'         $nfjob

    sbatch $nfjob &> JOB_ID_$i
done


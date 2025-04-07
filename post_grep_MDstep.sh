for file in $(ls -1vd T*/2-MD/job_LAMMPS_MD_all.sh) ; do
    echo
    ls $file
    grep -e "nframe=" $file
done

prefix="condensed_NPT_1"
for fold in $( ls -1vd  T*/2-MD/${prefix}*/run-*/MACE/) ; do
    echo $fold
    ls $fold
done


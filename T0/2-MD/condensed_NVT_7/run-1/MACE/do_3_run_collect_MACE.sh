cwd=`pwd`
rm -rf MACE.xyzf

for fold in $(ls -1vd MACE_*) ; do
    cd $fold
        pwd
        python ~/tools/others/run_mace_mp_single_point.py &> OUTPUT
        cat input.xyzf >> $cwd/MACE.xyzf
    cd $cwd
done

srcpath="../../libs/"

for sys in $(seq 1 9) ; do

    file="$srcpath/data.lammps_$sys"

    for Temp in 300 ; do
        fname="condensed_NVT_${sys}"
        mkdir -p $fname/run-1
        cp $file                         $fname/run-1/data.lammps
        cp ../../scripts/_in.lammps_NVT  $fname/run-1/_in.lammps
        sed -i 's/@T@/'"$Temp"'/g'       $fname/run-1/_in.lammps
        cp -rf ../../scripts/MACE        $fname/run-1/MACE
    done
done

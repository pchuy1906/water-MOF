cwd=`pwd`


n=`ls -d T* | wc | awk '{print $1-1}'`
nnext=$(($n+1))
mkdir T${nnext}

mkdir T${nnext}/0-data

cat T${n}/2-MD/*/run-*/MACE/MACE.xyzf                                       >    T${nnext}/0-data/SCAN_condensed_add.xyz
cp -rf  T${n}/0-data/SCAN_condensed.xyz                                          T${nnext}/0-data/SCAN_condensed_current.xyz
cat T${n}/0-data/SCAN_condensed.xyz T${nnext}/0-data/SCAN_condensed_add.xyz >    T${nnext}/0-data/SCAN_condensed.xyz

#cat T${n}/2-MD/*/run-*/VASP/VASP*/input.xyzfe T${n}/3-*/input.xyzfe      >    T${nnext}/0-data/SCAN_gas_add.xyz
#cp -rf T${n}/0-data/SCAN_gas.xyz                                                 T${nnext}/0-data/SCAN_gas_current.xyz
#cat T${n}/0-data/SCAN_gas.xyz T${nnext}/0-data/SCAN_gas_add.xyz             >    T${nnext}/0-data/SCAN_gas.xyz

cp -rf T${n}/0-data/*.sh                                                         T${nnext}/0-data
cd T${nnext}/0-data
    #./do_1_substract_AE.sh
    ./do_2_check_conditions.sh
cd ../../

mkdir T${nnext}/1-fit
cp -rf T${n}/1-fit/*.sh         T${nnext}/1-fit

mkdir T${nnext}/2-MD
cp -rf T${n}/2-MD/*.sh        T${nnext}/2-MD/


mkdir -p libs
for i in $(seq 1 9) ; do
    cp  T$n/2-MD/condensed_*_$i/run-*/MACE/data.lammps_new    libs/data.lammps_$i
done

file="traj.xyz"
ntail=`head -1 $file | awk '{print $1+2}'`
tail -$ntail $file > last.xyz

rm -rf molecule*.xyz
python ~/tools/Whole_Molecules/python/Single_Linkage.py --file_xyz last.xyz --rcut 1.2 --print_molecules 1  --cell_option cell_3 &> OUTPUT_molecules

nmol=`sort -nk1 cluster.txt  | tail -1`
echo "number of cluster $nmol"

if [ "$#" -ne 1 ]; then
  echo "unknown options. EXIT THE PROGRAM"
  exit 1
fi

ioption=$1

path_NEB_VASP="../../neb_dimer_@postfix@/run-1/VASP/"
rm -rf ${path_NEB_VASP}/LIST_STRUCTURE
if [ "$ioption" -eq 1 ]; then
    ncount=0
    for i in $(seq 1 $nmol) ; do
        i1=$(($i+1))
        for j in $(seq $i1 $nmol) ; do
            #echo $i $j        
            python ~/tools/others/dist_molecule.py --molecule1 molecule-${i}.xyz --molecule2 molecule-${j}.xyz &> OUTPUT_DIST_MOLECULE
            dist=`grep dist OUTPUT_DIST_MOLECULE | awk '{print $NF}'`
            #echo $dist
            
            if [ $ncount -lt 5 ] ; then
                if [[ $(echo "$dist < 4.0" | bc) -eq 1 ]]; then
                    ncount=$(($ncount+1)) 
                    echo $ncount
                    cp TMP.xyz  ${path_NEB_VASP}/traj.xyz.${ncount}
                    echo $ncount >> ${path_NEB_VASP}/LIST_STRUCTURE
                fi
            else
                echo "DONE"
                exit 1
            fi
        done
    done

fi
rm -rf molecule*.xyz
